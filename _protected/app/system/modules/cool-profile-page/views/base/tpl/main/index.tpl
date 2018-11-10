{{ $total_pics = count(glob(PH7_PATH_TPL . PH7_TPL_NAME . '/img/slideshow/*.jpg')) }}
{{ $i = mt_rand(1,$total_pics) }}
{{ $url = '' }}

{if $img_background == ''}
    {{ $url = $url_tpl . 'img/slideshow/'. $i .'.jpg' }}
{/if}
{if $img_background != ''}
    {{ $url = $url_data . 'system/modules/user/background/img/' . $username . '/' . $img_background }}
{/if}
<div class="call_to_action header-filter" data-parallax="true" style="background-image: url('{url}');"></div>
<div class="profile-page main main-raised">
    <div class="profile-content">
        <div class="container">
            <div class="row">
                <div class="col-md-6 ml-auto mr-auto">
                    <div class="profile">
                        <div class="avatar">
                            {{ UserDesignCoreModel::userStatus($id) }}
                            {{ (new AvatarDesignCore)->lightBox($username, $first_name, $sex, 400) }}
                        </div>

                        <div class="name">
                            <h2 class="title">{first_name} {middle_name} {last_name}</h2>
                            <h5>@{username}</h5>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
            <div class="col-xs-12 description text-center">
                <p>{description}</p>
            </div>
                <div class="col-xs-12 description text-center">
                <div class="center small">
                    {if !empty($join_date)}
                        {lang 'Join Date:'} <span class="italic">{join_date}</span>
                    {/if}
                    <br>
                    {if !empty($last_activity)}
                        {lang 'Last Activity:'} <span class="italic">{last_activity}</span>
                    {/if}
<br>
                    {lang 'Views:'}
                    <span class="italic">
                {% Framework\Mvc\Model\Statistic::getView($id,DbTableName::MEMBER) %}
            </span>
                </div>
                <p class="bold center">
                    {{ $design->like($username, $first_name, $sex) }}
                </p>
                {manual_include 'profile_links.inc.tpl'}
            </div>
            </div>
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-3 informations">

                    <h2>{lang 'About'} {first_name}</h2>
                    <br>
        <p>
            <i class="fa fa-{sex}"></i>
            <span class="bold">{lang 'I am a:'}</span>
                <a href="{{ $design->url('user','browse','index', '?country='.$country_code.'&match_sex='.$sex) }}">
                    {lang $sex}
                </a>
        </p>

        <div class="break"></div>

        {if !empty($match_sex)}
            <p>
                <i class="fa fa-{match_sex}"></i>
                <span class="bold">{lang 'Looking for a:'}</span>
                <span class="italic">
                    <a href="{{ $design->url('user','browse','index', '?country='.$country_code) }}{match_sex_search}">
                        {lang $match_sex}
                    </a>
                </span>
            </p>
            <div class="break"></div>
        {/if}

        {if !empty($age)}
            <p>
                <span class="bold">{lang 'Age:'}</span>
                <span class="italic">
                    <a href="{{ $design->url('user','browse','index', '?country='.$country_code.'&age='.$birth_date) }}">
                        {age}
                    </a>
                    <span class="gray">({birth_date_formatted})</span>
                </span>
            </p>
            <div class="break"></div>
        {/if}

        {* Profile's Fields *}
        {each $key => $val in $fields}
            {if $key != 'description' AND $key != 'middleName' AND !empty($val)}
                {{ $val = escape($val, true) }}

                {if $key == 'height'}
                    <p>
                        <span class="bold">{lang 'Height:'}</span>
                        <span class="italic">
                            <a href="{{ $design->url('user','browse','index', '?country='.$country_code.'&height='.$val) }}">
                                {{ (new Framework\Math\Measure\Height($val))->display(true) }}
                            </a>
                        </span>
                    </p>
                {elseif $key == 'weight'}
                    <p>
                        <span class="bold">{lang 'Weight:'}</span>
                        <span class="italic">
                            <a href="{{ $design->url('user','browse','index', '?country='.$country_code.'&weight='.$val) }}">
                                {{ (new Framework\Math\Measure\Weight($val))->display(true) }}
                            </a>
                        </span>
                    </p>
                {elseif $key == 'country'}
                    <p>
                        <span class="bold">{lang 'Country:'}</span>
                        <span class="italic">
                            <a href="{{ $design->url('user','browse','index', '?country='.$country_code) }}">
                                {country}
                            </a>
                        </span>&nbsp;&nbsp;<img src="{{ $design->getSmallFlagIcon($country_code) }}" title="{country}" alt="{country}" />
                    </p>
                {elseif $key == 'city'}
                    <p>
                        <span class="bold">{lang 'City/Town:'}</span>
                        <span class="italic">
                            <a href="{{ $design->url('user','browse','index', '?country='.$country_code.'&city='.$city) }}">
                                {city}
                            </a>
                        </span>
                    </p>
                {elseif $key == 'state'}
                    <p>
                        <span class="bold">{lang 'State/Province:'}</span>
                        <span class="italic">
                            <a href="{{ $design->url('user','browse','index', '?country='.$country_code.'&state='.$state) }}">
                                {state}
                            </a>
                        </span>
                    </p>
                {elseif $key == 'zipCode'}
                    <p>
                        <span class="bold">{lang 'Postal Code:'}</span>
                        <span class="italic">
                            <a href="{{ $design->url('user','browse','index', '?country='.$country_code.'&zip_code='.$val) }}">
                                {val}
                            </a>
                        </span>
                    </p>
                {elseif $key == 'website'}
                    <p>
                        {{ $design->favicon($val) }}&nbsp;&nbsp;<span class="bold">{lang 'Site/Blog:'}</span>
                        <span class="italic">{{ $design->urlTag($val) }}</span>
                    </p>
                {elseif $key == 'socialNetworkSite'}
                    <p>
                        {{ $design->favicon($val) }}&nbsp;&nbsp;<span class="bold">{lang 'Social Profile:'}</span>
                        <span class="italic">{{ $design->urlTag($val) }}</span>
                    </p>
                {else}
                    {{ $lang_key = strtolower($key) }}

                    {if strstr($key, 'url')}
                        <p>
                            {{ $design->favicon($val) }}&nbsp;&nbsp;<span class="bold">{lang $lang_key}</span>
                            <span class="italic">{{ $design->urlTag($val) }}</span>
                        </p>
                    {else}
                        <p>
                            <span class="bold">{lang $lang_key}</span>
                            <span class="italic">{val}</span>
                        </p>
                    {/if}
                {/if}
                <div class="break"></div>
            {/if}
        {/each}

        {{ $design->likeApi() }}
    </div>

    <div class="col-xs-12 col-sm-8 col-md-6">

        <h2>{lang 'Photo Albums'}</h2>
        {if $is_picture_enabled}
            <div class="profile-section">
                <div class="content" id="picture">
                    <script>
                        var url_picture_block = '{{ $design->url('picture','main','albums',$username) }}';
                        $('#picture').load(url_picture_block + ' #picture_block');
                    </script>
                </div>
            </div>
            <div class="clear"></div>
        {/if}

        {if $is_video_enabled}
            <div class="profile-section">
                <div class="content" id="video">
                    <script>
                        var url_video_block = '{{ $design->url('video','main','albums',$username) }}';
                        $('#video').load(url_video_block + ' #video_block');
                    </script>
                </div>
            </div>
            <div class="clear"></div>
        {/if}

    </div>

    <div class="col-xs-12 col-sm-4 col-md-3">
        <div class="s_bMarg">
            <h2>{lang 'Location'}</h2>
            <br>
            {map}
        </div>

        <div class="ad_160_600">
            {designModel.ad(160, 600)}
        </div>
        <br>
        <h2>{lang 'Comment this person'}</h2>
        <br>
        {{ CommentDesignCore::link($id, 'profile') }}

    </div>
</div>
    </div>
</div>