{{ $design->htmlHeader() }}
<html lang="{% $config->values['language']['lang'] %}">
  <head>
    <meta charset="{% $config->values['language']['charset'] %}" />
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <!-- Begin Title and Meta info -->
    <title>{if $page_title}{% $str->escape($str->upperFirst($page_title), true) %} - {site_name}{else}{site_name} - {slogan}{/if}</title>
    <meta name="description" content="{% $str->escape($str->upperFirst($meta_description), true) %}" />
    <meta name="keywords" content="{% $str->escape($meta_keywords, true) %}" />
    <meta name="robots" content="{meta_robots}" />
    <link rel="icon" href="{url_relative}favicon.ico" />
    <link rel="canonical" href="{current_url}" />
    <link rel="author" href="{url_root}humans.txt" />
    {if !$is_user_auth}{{ $design->regionalUrls() }}{/if}
    <meta name="author" content="{meta_author}" />
    <meta name="copyright" content="{meta_copyright}" />
    <meta name="category" content="{meta_category}" />
    <meta name="rating" content="{meta_rating}" />
    <meta name="distribution" content="{meta_distribution}" />
    {if $header}{header}{/if}

    <!-- Begin Sheet CSS -->
    {{ $design->externalCssFile(PH7_URL_STATIC. PH7_CSS . 'js/jquery/smoothness/jquery-ui.css') }}
    {{ $design->externalCssFile(PH7_URL_STATIC. PH7_CSS . 'font-awesome.css') }}
    {{ $design->staticFiles('css', PH7_STATIC . PH7_CSS . 'js/jquery/box/', 'box.css') }} {* We have to include box CSS alone because it includes images in its folder *}
    {{ $design->staticFiles('css', PH7_STATIC . PH7_CSS, 'bootstrap.css') }}
    {{ $design->staticFiles('css', PH7_LAYOUT . PH7_TPL . PH7_TPL_NAME . PH7_SH . PH7_CSS, 'common.css,style.css,layout.css,menu.css,like.css,color.css,form.css,js/jquery/rating.css,js/jquery/apprise.css,js/jquery/tipTip.css,material-kit.css,custom.css') }}
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Nunito|Material+Icons" />

    {* Custom CSS code *}
    {{ $design->externalCssFile(PH7_RELATIVE.'asset/css/color.css') }}
    {{ $design->externalCssFile(PH7_RELATIVE.'asset/css/style.css') }}

    {if $is_user_auth AND $is_im_enabled}
      {{ $design->staticFiles('css', PH7_LAYOUT . PH7_SYS . PH7_MOD . 'im/' . PH7_TPL . PH7_DEFAULT_THEME . PH7_SH . PH7_CSS, 'messenger.css') }}
    {/if}

    <!-- Other sheet CSS for modules etc. -->
    {{ $design->css() }}
    {designModel.files('css')}
    <!-- End CSS -->

    <!-- Begin Header JavaScript -->
    <script>var pH7Url={base:'{url_root}',relative:'{url_relative}',tpl:'{url_tpl}',stic:'{url_static}',tplImg:'{url_tpl_img}',tplJs:'{url_tpl_js}',tplMod:'{url_tpl_mod}',data:'{url_data}'};</script>
    {if $is_admin_auth}<script>pH7Url.admin_mod = '{url_admin_mod}';</script>{/if}
    {{ $design->externalJsFile(PH7_URL_STATIC . PH7_JS . 'jquery/jquery.js') }}
    <!-- End Header JavaScript -->

    {* Begin AjPh *}
    {if $browser->isFullAjaxSite()}
      {{ $design->staticFiles('css', PH7_LAYOUT . PH7_TPL . PH7_TPL_NAME . PH7_SH . PH7_CSS, 'js/ajph.css') }}
      {{ $design->staticFiles('js', PH7_STATIC . PH7_JS, 'ajph.js') }}
    {/if}
    {* End AjPh *}

    {{ XmlDesignCore::sitemapHeaderLink() }}
    {{ XmlDesignCore::rssHeaderLinks() }}

    {designModel.analyticsApi()}
  </head>
  <body class="sidebar-collapse">

    <!-- Begin Header -->
      {* If we aren't on the the splash page, then display the menu *}
      {if !$is_guest_homepage}
        {main_include 'top_menu.inc.tpl'}
      {/if}

      <noscript>
        <div class="noscript err_msg">
          {lang}JavaScript is disabled on your Web browser!<br /> Please enable JavaScript via the options of your Web browser in order to use this website.{/lang}
        </div>
      </noscript>

      {if $is_guest_homepage}
        <div class="container">
          <div class="row topheader">
              <div role="banner" class="col-md-4 pull-left">
                  <h1 class="title">
                    <a href="{{ $design->homePageUrl() }}" title="{slogan}"><i class="fa fa-heart heartlogo"></i> {site_name}</a>
                  </h1>
              </div>
            <div class="col-md-8 forma pull-right">
            {{ LoginSplashForm::display() }}
            </div>
          </div>
        </div>
      {/if}

      {* Heading groups *}
      {main_include 'headings.inc.tpl'}

      {* Don't display the top middle banner on the the splash page *}
      {if !$is_guest_homepage}
          <div role="banner" class="center ad_468_60">
              {designModel.ad(468, 60)}
          </div>
      {/if}

      <div class="clear"></div>
    <!-- End Header -->

    <!-- Begin Popups -->
    <div id="box">
      <p></p>
    </div>
    <!-- End Popups -->

    <div id="ajph">
      <div id="sub_ajph">
        {if !empty($manual_include)}
          {manual_include $manual_include}
        {elseif !empty($pOH_not_found)}
          {main_include 'error.inc.tpl'}
        {else}
          {auto_include}
        {/if}
      </div>
    <div role="main" id="content">
      {* Alert Message *}
      {{ $design->flashMsg() }}
      <div class="msg"></div>

      {* Loading JS Lang *}
      {* The file must be before the content of the site to avoid that the "pH7LangCore"  object is undefined *}
      {{ $lang_file =  Framework\Translate\Lang::getJsFile(PH7_PATH_STATIC . PH7_JS . PH7_LANG) }}
      {{ $design->staticFiles('js', PH7_STATIC . PH7_JS, PH7_LANG . $lang_file) }}


      </div>
    </div>
    <div role="banner" class="center ad_468_60">
        {designModel.ad(468, 60)}
    </div>
    <!-- End Content -->
    <div class="push"></div>
    <!-- Begin Footer -->
    <footer class="footer footer-default">
      <div class="container">
      <div role="banner" class="center ad_728_90">
          {designModel.ad(728, 90)}
      </div>

      {* To avoid scammers *}
      {if $is_user_auth AND $current_url != $url_root}
        <div class="warning_block center">
          <p>
            <strong>{lang 'Attention!'}</strong>
            {lang 'Some of the women (or men) profiles you see on dating sites might be scams to collect money.'}<br />
            {lang 'People who are really interested in you will never ask for money.'}<br />
            {lang "Be careful, don't send the money to anybody!"}
          </p>
        </div>
      {/if}

<div class="col-sm-12">
  <div class="col-sm-12 col-md-12 col-lg-6">
            <ul>
              <li>
                <a href="https://www.creative-tim.com">
                  Home Page
                </a>
              </li>
              <li>
                <a href="https://creative-tim.com/presentation">
                  About Us
                </a>
              </li>
              <li>
                <a href="http://blog.creative-tim.com">
                  Join us!
                </a>
              </li>
              <li>
                <a href="https://www.creative-tim.com/license">
                  Terms & Conditions
                </a>
              </li>
            </ul>
          </div>

    <div class="col-sm-12 col-md-12 col-lg-6">
          <div class="copyright">
            &copy;
            <script>
                document.write(new Date().getFullYear())
            </script>
            <a href="https://sharethemoments.net" target="_blank"><i class="fa fa-heart heartlogo"></i>ShareTheMoments</a>.
          </div>
    </div>
        </div>
      </div>
      </footer>

    <div class="clear"></div>

    <!-- End Footer -->
    <!-- Begin Footer JavaScript -->
    {{ $design->staticFiles('js', PH7_LAYOUT . PH7_TPL . PH7_TPL_NAME . PH7_SH . PH7_CSS, 'js/core/jquery.min.js,js/core/popper.min.js,js/core/bootstrap-material-design.min.js,js/material-kit.js') }}

    {{ $design->staticFiles('js', PH7_STATIC . PH7_JS, 'jquery/box.js,jquery/tipTip.js,common.js,str.js,holder.js') }}

    {{ $design->staticFiles('js', PH7_LAYOUT . PH7_TPL . PH7_TPL_NAME . PH7_SH . PH7_JS, 'global.js') }}



    {* SetUserActivity and User Chat *}
    {if $is_user_auth}
      {{ $design->staticFiles('js', PH7_STATIC . PH7_JS, 'setUserActivity.js,jquery/sound.js') }}

      {if $is_im_enabled}
        {{ $lang_file = Framework\Translate\Lang::getJsFile(PH7_PATH_TPL_SYS_MOD . 'im/' . PH7_TPL . PH7_DEFAULT_THEME . PH7_DS . PH7_JS . PH7_LANG) }}
        {{ $design->staticFiles('js', PH7_LAYOUT . PH7_SYS . PH7_MOD . 'im/' . PH7_TPL . PH7_DEFAULT_THEME . PH7_SH . PH7_JS, PH7_LANG . $lang_file . ',jquery.cookie.js,Messenger.js') }}
      {/if}
    {/if}

    {* Cookie info bar *}
    {if $is_cookie_consent_bar}
      {{ $design->staticFiles('js', PH7_STATIC . PH7_JS, 'cookie_consent/eu-states.js') }}
    {/if}

    {* JS code Injection *}
    {{ $design->externalJsFile(PH7_RELATIVE.'asset/js/script.js') }}

    <!-- Other JavaScript files for modules etc. -->
    {{ $design->js() }}
    {designModel.files('js')}

    {if $is_user_auth}
      {main_include 'favicon_alert.inc.tpl'}
    {/if}

    <!-- Common Dialogs -->
    {{ $design->message() }}
    {{ $design->error() }}
    {if $is_disclaimer AND !$is_admin_auth AND $registry->module !== PH7_ADMIN_MOD}
      {main_include 'disclaimer.inc.tpl'}
    {/if}
    <!-- End Footer JavaScript -->

{{ $design->htmlFooter() }}
