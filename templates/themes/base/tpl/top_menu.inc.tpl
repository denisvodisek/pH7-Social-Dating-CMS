    {* Get the frequently used functions in variables to optimize the script and call those functions only once in the file *}
    {{
      $admin_logged_as_user = UserCore::isAdminLoggedAs();
      $admin_logged_as_affiliate = AffiliateCore::isAdminLoggedAs()
     }}


    {* Creating Objects *}
      {{ $oSession = new Framework\Session\Session() }}


    {* Menu for All *}
    <nav class="navbar navbar-expand-lg bg-primary fixed-top navbar-expand-lg">
      <div class="container">
      <div class="navbar-translate">
        <a class="navbar-brand" href="#"></a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="sr-only">Toggle navigation</span>
        <span class="navbar-toggler-icon"></span>
        <span class="navbar-toggler-icon"></span>
        <span class="navbar-toggler-icon"></span>
      </button>
      </div>
        <div class="collapse navbar-collapse">
          <ul class="navbar-nav">
            <li class="nav-item"><a class="nav-link" href="{{ $design->homePageUrl() }}"><i class="fa fa-heart"></i> {lang 'Share The Moments'}</a></li>

            {* Guest Menu *}
      {if !$is_user_auth AND !$is_aff_auth AND !$is_admin_auth}
        <li class="nav-item"><a class="nav-link" href="{{ $design->url('user','signup','step1') }}" title="{lang 'Join Now!'}"><i class="fa fa-user-plus"></i> {lang 'Join Now!'}</a></li>
        <li class="nav-item"><a class="nav-link" href="{{ $design->url('user', 'main','login') }}" title="{lang 'Login'}" data-load="ajax"><i class="fa fa-sign-in"></i> {lang 'Login'}</a></li>
      {/if}


    {* Menu Guest, Member and Admin *}
      {if !$is_aff_auth}
        <li class="dropdown nav-item">
          <a href="{{ $design->url('user', 'browse', 'index') }}" title="{lang 'Members'}" class="dropdown-toggle nav-link" role="button" data-toggle="dropdown"><i class="fa fa-user fa-fw"></i> {lang 'People'}</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="{{ $design->url('user', 'browse', 'index') }}" rel="nofollow" title="{lang 'Members'}"><i class="fa fa-users"></i> {lang 'People'}</a>
              <div class="dropdown-divider"></div>
              <a href="{{ $design->url('user', 'birthday', 'index') }}" title="{lang 'Users Birthday'}" class="dropdown-header" role="button" aria-expanded="false" data-toggle="dropdown" data-load="ajax"><i class="fa fa-birthday-cake"></i> {lang 'Birthday'}</a>
              <a class="dropdown-item" href="{{ $design->url('user', 'birthday', 'index', 'all') }}" rel="nofollow" title="{lang 'All Birthday'}" data-load="ajax">{lang 'All Birthday'}</a>
              <a class="dropdown-item" href="{{ $design->url('user', 'birthday', 'index', 'male') }}" title="{lang 'Men Birthday'}" data-load="ajax">{lang 'Men Birthday'}</a>
              <a class="dropdown-item" href="{{ $design->url('user', 'birthday', 'index', 'female') }}" title="{lang 'Women Birthday'}" data-load="ajax">{lang 'Women Birthday'}</a>
              <a class="dropdown-item" href="{{ $design->url('user', 'birthday', 'index', 'couple') }}" title="{lang 'Couples Birthday'}" data-load="ajax">{lang 'Couples Birthday'}</a>

          </div>
        </li>
            <li class="dropdown nav-item"><a href="{{ $design->url('user','search', 'index') }}" title="{lang 'Search the members'}" class="dropdown-toggle nav-link" role="button" aria-expanded="false" data-toggle="dropdown" data-load="ajax"><i class="fa fa-search"></i> {lang 'Search'}</a>
              <div class="dropdown-menu" role="menu">
                <a class="dropdown-item" href="{{ $design->url('user', 'search', 'quick') }}" title="{lang 'Quick Search'}" data-load="ajax">{lang 'Quick Search'}</a>
                <a class="dropdown-item" href="{{ $design->url('user', 'search', 'advanced') }}" title="{lang 'Advanced Search'}" data-load="ajax">{lang 'Advanced Search'}</a>
              <a class="dropdown-item" href="{{ $design->url('user','country','index',$country.PH7_SH.$city) }}" title="{lang 'Users in %0% through the Map!',$city}">{lang 'People Nearby'}</a>

        </div>
            </li>
      {/if}


    {* Menu Guest, Member and LoginUserAs of Admin Panel *}
      {if ( !$is_aff_auth AND !$is_admin_auth ) OR $admin_logged_as_user }
        {if $is_chat_enabled OR $is_chatroulette_enabled}
          <li class="dropdown nav-item"><a href="#" title="{lang 'Free Social Dating Chat Rooms'}" class="dropdown-toggle nav-link" role="button" aria-expanded="false" data-toggle="dropdown" data-load="ajax"><i class="fa fa-weixin"></i> {lang 'Chat'}</span></a>
            <div class="dropdown-menu" role="menu">
              {if $is_chat_enabled}
                <a class="dropdown-item" href="{{ $design->url('chat','home','index') }}" rel="nofollow" title="{lang 'Chat Rooms'}" data-load="ajax"><i class="fa fa-weixin"></i> {lang 'Chat'}</a>
              {/if}
              {if $is_chatroulette_enabled}
                <a class="dropdown-item" href="{{ $design->url('chatroulette','home','index') }}" title="{lang 'Chat Roulette'}"><i class="fa fa-random"></i> {lang 'Chatroulette'}</a>
              {/if}
            </div>
          </li>
        {/if}

        {if $is_picture_enabled}
          <li class="dropdown nav-item"><a href="{{ $design->url('picture','main','index') }}" title="{lang 'Photo Gallery'}" class="dropdown-toggle nav-link" role="button" aria-expanded="false" data-toggle="dropdown" data-load="ajax"><i class="fa fa-picture-o"></i> {lang 'Photo'} </span></a>
            <div class="dropdown-menu" role="menu">
              <a class="dropdown-item" href="{{ $design->url('picture','main','index') }}" rel="nofollow" title="{lang 'Photo Gallery'}" data-load="ajax"><i class="fa fa-picture-o"></i> {lang 'Photos'}</a>
              {if $is_hotornot_enabled}
                <a class="dropdown-item" href="{{ $design->url('hotornot','main','rating') }}" title="{lang 'Hot Or Not'}" data-load="ajax"><i class="fa fa-star-half-o"></i> {lang 'Hot Or Not'}</a>
              {/if}
              <a class="dropdown-item" href="{{ $design->url('picture','main','search') }}" title="{lang 'Search Photos'}" data-load="ajax"><i class="fa fa-search"></i> {lang 'Search'}</a>
            </div>
          </li>
        {/if}

        {if $is_video_enabled}
          <li class="dropdown nav-item"><a href="{{ $design->url('video','main','index') }}" title="{lang 'Video Gallery'}" class="dropdown-toggle nav-link" role="button" aria-expanded="false" data-toggle="dropdown" data-load="ajax"><i class="fa fa-youtube-play"></i> {lang 'Video'} </span></a>
            <div class="dropdown-menu" role="menu">
              <a class="dropdown-item" href="{{ $design->url('video','main','index') }}" rel="nofollow" title="{lang 'Video Gallery'}" data-load="ajax"><i class="fa fa-youtube-play"></i> {lang 'Videos'}</a>
              <a class="dropdown-item" href="{{ $design->url('video','main','search') }}" title="{lang 'Search Videos'}" data-load="ajax"><i class="fa fa-search"></i> {lang 'Search'}</a>
            </div>
          </li>
        {/if}

        {if $is_game_enabled}
          <li class="dropdown nav-item"><a href="{{ $design->url('game','main','index') }}" title="{lang 'Games Zone'}" class="dropdown-toggle nav-link" role="button" aria-expanded="false" data-toggle="dropdown" data-load="ajax"><i class="fa fa-gamepad"></i> {lang 'Game'} </span></a>
            <div class="dropdown-menu" role="menu">
              <a class="dropdown-item" href="{{ $design->url('game','main','index') }}" rel="nofollow" title="{lang 'Games Zone'}" data-load="ajax"><i class="fa fa-gamepad"></i> {lang 'Game'}</a>
              <a class="dropdown-item" href="{{ $design->url('game','main','search') }}" title="{lang 'Search Games'}" data-load="ajax"><i class="fa fa-search"></i> {lang 'Search'}</a>
            </div>
          </li>
        {/if}

        {if $is_forum_enabled}
          <li class="dropdown nav-item"><a href="{{ $design->url('forum','forum','index') }}" title="{lang 'Forums'}" class="dropdown-toggle nav-link" role="button" aria-expanded="false" data-toggle="dropdown" data-load="ajax"><i class="fa fa-comments"></i> {lang 'Forum'} </span></a>
            <div class="dropdown-menu" role="menu">
              <a class="dropdown-item" href="{{ $design->url('forum','forum','index') }}" rel="nofollow" title="{lang 'Forums'}" data-load="ajax"><i class="fa fa-comments"></i> {lang 'Forum'}</a>
              <a class="dropdown-item" href="{{ $design->url('forum','forum','search') }}" title="{lang 'Search Topics'}" data-load="ajax"><i class="fa fa-search"></i> {lang 'Search'}</a>
            </div>
          </li>
        {/if}

        {if $is_note_enabled}
          <li class="dropdown nav-item"><a href="{{ $design->url('note','main','index') }}" title="{lang 'Community Notes'}" class="dropdown-toggle nav-link" role="button" aria-expanded="false" data-toggle="dropdown" data-load="ajax"><i class="fa fa-newspaper-o"></i> {lang 'Note'} </span></a>
            <div class="dropdown-menu" role="menu">
              <a class="dropdown-item" href="{{ $design->url('note','main','index') }}" rel="nofollow" title="{lang 'Community Notes'}" data-load="ajax"><i class="fa fa-newspaper-o"></i> {lang 'Notes'}</a>
              <a class="dropdown-item" href="{{ $design->url('note','main','search') }}" title="{lang 'Search Notes'}" data-load="ajax"><i class="fa fa-search"></i> {lang 'Search'}</a>
            </div>
          </li>
        {/if}
      {/if}


    {* Member Menu *}
      {if $is_user_auth AND ( !$is_aff_auth AND !$is_admin_auth ) OR $admin_logged_as_user }
          {if $is_mail_enabled}
            <li class="dropdown nav-item"><a href="{{ $design->url('mail','main','inbox') }}" title="{lang 'My Emails'}" class="dropdown-toggle nav-link" role="button" aria-expanded="false" data-toggle="dropdown"><i class="fa fa-envelope-o fa-fw"></i> {lang 'Mail'} {if $count_unread_mail}<span class="badge">{count_unread_mail}</span>{/if} </span></a>
              <div class="dropdown-menu" role="menu">
                <a class="dropdown-item" href="{{ $design->url('mail','main','compose') }}" title="{lang 'Compose'}"><i class="fa fa-pencil"></i> {lang 'Compose'}</a>
                <a class="dropdown-item" href="{{ $design->url('mail','main','inbox') }}" title="{lang 'Inbox - Messages Received'}"><i class="fa fa-inbox"></i> {lang 'Inbox'}</a>
                <a class="dropdown-item" href="{{ $design->url('mail','main','outbox') }}" title="{lang 'Messages Sent'}"><i class="fa fa-paper-plane-o"></i> {lang 'Sent'}</a>
                <a class="dropdown-item" href="{{ $design->url('mail','main','trash') }}" title="{lang 'Trash'}"><i class="fa fa-trash-o"></i> {lang 'Trash'}</a>
                <a class="dropdown-item" href="{{ $design->url('mail','main','search') }}" title="{lang 'Find Messages'}"><i class="fa fa-search"></i> {lang 'Search'}</a>
              </div>
            </li>
          {/if}

          <noscript>
            <li class="dropdown nav-item"><a href="{{ $design->url('user','setting','edit') }}" title="{lang 'Settings'}" class="dropdown-toggle nav-link" role="button" aria-expanded="false" data-toggle="dropdown">{lang 'Settings'} </span></a>
              <div class="dropdown-menu" role="menu">
                <a class="dropdown-item" href="{{ $design->url('user','setting','edit') }}">{lang 'Edit Profile'}</a>
                <a class="dropdown-item" href="{{ $design->url('user','setting','design') }}">{lang 'Design Profile'}</a>
                <a class="dropdown-item" href="{{ $design->url('user','setting','notification') }}">{lang 'Notifications'}</a>
                <a class="dropdown-item" href="{{ $design->url('user','setting','privacy') }}">{lang 'Privacy Settings'}</a>
                <a class="dropdown-item" href="{{ $design->url('payment','main','info') }}">{lang 'Membership Details'}</a>
                <a class="dropdown-item" href="{{ $design->url('user','setting','password') }}">{lang 'Change Password'}</a>
              </div>
            </li>
          </noscript>

          <li class="dropdown nav-item"><a href="{{ $design->url('user','account','index') }}" title="{lang 'My Account'}" class="dropdown-toggle nav-link" role="button" aria-expanded="false" data-toggle="dropdown"><i class="fa fa-cog"></i> {lang 'Account'} </span></a>
            <div class="dropdown-menu" role="menu">
              <a class="dropdown-item" href="{{ $design->url('user','setting','index') }}" title="{lang 'My Settings'}"><i class="fa fa-cog fa-fw"></i> {lang 'Edit Profile'}</a>
              <a class="dropdown-item" href="{% (new UserCore)->getProfileLink($oSession->get('member_username')) %}" title="{lang 'See My Profile'}"><i class="fa fa-user fa-fw"></i> {lang 'See My Profile'}</a>
              <a class="dropdown-item" href="{{ $design->url('user','setting','avatar') }}" title="{lang 'Change Profile Photo'}"><i class="fa fa-upload"></i> {lang 'Change Profile Photo'}</a>

              {if $is_picture_enabled}
              <div class="dropdown-divider"></div>
                <a href="{{ $design->url('picture','main','index') }}" title="{lang 'Photo Gallery'}" class="dropdown-header" role="button" aria-expanded="false" data-toggle="dropdown" data-load="ajax"><i class="fa fa-picture-o"></i> {lang 'Photo Gallery'}</a>
                    <a class="dropdown-item" href="{{ $design->url('picture','main','addalbum') }}" title="{lang 'Add an Album'}">{lang 'Add an Album'}</a>
                    <a class="dropdown-item" href="{{ $design->url('picture','main','albums', $oSession->get('member_username')) }}" title="{lang 'My Albums'}" data-load="ajax">{lang 'My Albums'}</a>
              {/if}

              {if $is_video_enabled}
              <div class="dropdown-divider"></div>
                <a href="{{ $design->url('video','main','index') }}" title="{lang 'Videos Gallery'}" class="dropdown-header" role="button" aria-expanded="false" data-toggle="dropdown" data-load="ajax"><i class="fa fa-youtube-play"></i> {lang 'Videos Gallery'}</a>

                    <a class="dropdown-item" href="{{ $design->url('video','main','addalbum') }}" title="{lang 'Add an Album'}">{lang 'Add an Album'}</a>
                    <a class="dropdown-item" href="{{ $design->url('video','main','albums', $oSession->get('member_username')) }}" title="{lang 'My Albums'}" data-load="ajax">{lang 'My Albums'}</a>

              {/if}

              {if $is_note_enabled}
                <div class="dropdown-divider"></div>
                <a href="{{ $design->url('note','main','index') }}" title="{lang 'Notes'}" class="dropdown-header" role="button" aria-expanded="false" data-toggle="dropdown"><i class="fa fa-newspaper-o"></i> {lang 'Note'}</a>

                    <a class="dropdown-item" href="{{ $design->url('note','main','add') }}" title="{lang 'Add a Note'}">{lang 'Add a Note'}</a>
                    <a class="dropdown-item" href="{{ $design->url('note','main','author', $oSession->get('member_username')) }}" title="{lang 'My Notes'}">{lang 'My Notes'}</a>

              {/if}

              {if $is_friend_enabled}
                <div class="dropdown-divider"></div>
                <a href="{{ $design->url('friend','main','index') }}" title="{lang 'Friends Manager'}" class="dropdown-header" role="button" aria-expanded="false" data-toggle="dropdown"><i class="fa fa-users"></i> {lang 'Friends Manager'} {if $count_pen_friend_request}<span class="badge">{count_pen_friend_request}</span>{/if}</a>
                      <a class="dropdown-item" href="{{ $design->url('friend','main','index') }}" title="{lang 'Friends List'}">{lang 'Friends List'}</a>
                    <a class="dropdown-item" href="{{ $design->url('friend','main','search',$oSession->get('member_username')) }}" title="{lang 'Find a friend in my list'}">{lang 'Find a Friend'}</a>
              {/if}
            <div class="dropdown-divider"></div>
            <a href="{{ $design->url('user','visitor','index') }}" title="{lang 'Who Visited My Profile'}" class="dropdown-header" role="button" aria-expanded="false" data-toggle="dropdown"><i class="fa fa-eye"></i> {lang 'Who See Me'}</a>
                  <a class="dropdown-item" href="{{ $design->url('user','visitor','index') }}" title="{lang 'Who Visited My Profile'}">{lang 'Who See Me'}</a>
                  <a class="dropdown-item" href="{{ $design->url('user','visitor','search') }}" title="{lang 'Find who visited my profile'}">{lang 'Find Visitor(s)'}</a>

              <li class="nav-item"><a class="nav-link" href="{{ $design->url('user','main','logout') }}" title="{lang 'Logout'}"><i class="fa fa-sign-out"></i> {lang 'Logout'}</a></li>
            </div>
          </li>
      {/if}


    {* Affiliate Menu *}
      {if $is_aff_auth AND ( !$is_user_auth AND !$is_admin_auth OR $admin_logged_as_affiliate ) }
        <li class="nav-item"><a class="nav-link" href="{{ $design->url('affiliate','ads','index') }}" title="{lang 'Get Ad Banners'}"><i class="fa fa-money"></i> {lang 'Banners'}</a></li>

        <li class="dropdown nav-item"><a href="{{ $design->url('affiliate','account','index') }}" title="{lang 'My Account'}" class="dropdown-toggle nav-link" role="button" aria-expanded="false" data-toggle="dropdown"><i class="fa fa-cog"></i> {lang 'Account'} </span></a>
          <div class="dropdown-menu" role="menu">
            <a class="dropdown-item" href="{{ $design->url('affiliate','account','index') }}" title="{lang 'My Account'}"><i class="fa fa-tachometer"></i> {lang 'Dashboard'}</a>
            <a class="dropdown-item" href="{{ $design->url('affiliate','account','edit') }}" title="{lang 'Edit My Account'}"><i class="fa fa-cog"></i> {lang 'Edit My Account'}</a>
            <a class="dropdown-item" href="{{ $design->url('affiliate','account','password') }}" title="{lang 'Change Password'}"><i class="fa fa-key fa-fw"></i> {lang 'Change Password'}</a>
            <a class="dropdown-item" href="{{ $design->url('affiliate','home','logout') }}" title="{lang 'Logout'}"><i class="fa fa-sign-out"></i> {lang 'Logout'}</a>
          </div>
        </li>
      {/if}


    {* Admin Menu *}
      {if $is_admin_auth AND ( !$is_user_auth AND !$is_aff_auth ) }
        {{ $count_total_reports = ReportCoreModel::totalReports() }}
        <li class="dropdown nav-item"><a href="{{ $design->url(PH7_ADMIN_MOD,'user','index') }}" title="{lang 'Users/Admins Manager'}" class="dropdown-toggle nav-link" role="button" aria-expanded="false" data-toggle="dropdown"><i class="fa fa-user fa-fw"></i> {lang 'User/Admin'} </span></a>
          <div class="dropdown-menu" role="menu">
            <a class="dropdown-header" href="{{ $design->url(PH7_ADMIN_MOD,'user','browse') }}" title="{lang 'Users Manager'}" class="dropdown-toggle" role="button" aria-expanded="false" data-toggle="dropdown"><i class="fa fa-user"></i> {lang 'Users'}</a>
                <a class="dropdown-item" href="{{ $design->url(PH7_ADMIN_MOD,'user','browse') }}" title="{lang 'Browse Users'}"><i class="fa fa-users"></i> {lang 'Browse'}</a>
                <a class="dropdown-item" href="{{ $design->url(PH7_ADMIN_MOD,'user','search') }}" title="{lang 'Search Users'}"><i class="fa fa-search"></i> {lang 'Search'}</a>
                <a class="dropdown-item" href="{{ $design->url(PH7_ADMIN_MOD,'user','add') }}" title="{lang 'Add a User'}"><i class="fa fa-user-plus"></i> {lang 'Add User'}</a>
                <a class="dropdown-item" href="{{ $design->url('report','admin','index') }}" title="{lang 'Report Abuse'}"><i class="fa fa-flag"></i> {lang 'Reports'} {if $count_total_reports}<span class="badge">{count_total_reports}</span>{/if}</a>
                <a class="dropdown-item" href="{{ $design->url(PH7_ADMIN_MOD,'user','addfakeprofiles') }}" title="{lang 'Fake Profiles Automatic Generator'}"><i class="fa fa-user-plus"></i> {lang 'Fake Profile Generator'}</a>
                <a class="dropdown-item" href="{{ $design->url(PH7_ADMIN_MOD,'user','import') }}" title="{lang 'Import Users'}"><i class="fa fa-user-plus"></i> {lang 'Import Users'}</a>
                <a class="dropdown-item" href="{{ $design->url(PH7_ADMIN_MOD,'user','countryrestriction') }}" title="{lang 'Country Restrictions for Registration and Search form'}"><i class="fa fa-globe"></i> {lang 'Country Restriction'}</a>
            <div class="dropdown-divider"></div>
                <a class="dropdown-header" href="{{ $design->url('field','field','all','user') }}" title="{lang 'User Fields'}" class="dropdown-toggle" role="button" aria-expanded="false" data-toggle="dropdown"><i class="fa fa-check-circle-o"></i> {lang 'User Fields'}</a>
                <a class="dropdown-item" href="{{ $design->url('field','field','all','user') }}" title="{lang 'Fields List'}">{lang 'Fields List'}</a>
                <a class="dropdown-item" href="{{ $design->url('field','field','add','user') }}" title="{lang 'Add Fields'}">{lang 'Add Fields'}</a>
            <div class="dropdown-divider"></div>
              <a class="dropdown-header" href="{{ $design->url(PH7_ADMIN_MOD,'admin','browse') }}" title="{lang 'Admins Manager'}" class="dropdown-toggle" role="button" aria-expanded="false" data-toggle="dropdown"><i class="fa fa-user"></i> {lang 'Admins'}</a>
              <a class="dropdown-item" href="{{ $design->url(PH7_ADMIN_MOD,'admin','browse') }}" title="{lang 'Browse Admins'}"><i class="fa fa-users"></i> {lang 'Browse'}</a>
              <a class="dropdown-item" href="{{ $design->url(PH7_ADMIN_MOD,'admin','search') }}" title="{lang 'Search an Admin'}"><i class="fa fa-search"></i> {lang 'Search'}</a>
              <a class="dropdown-item" href="{{ $design->url(PH7_ADMIN_MOD,'admin','add') }}" title="{lang 'Add an Admin'}"><i class="fa fa-user-plus"></i> {lang 'Add Admin'}</a>
          </div>
        </li>

        <li class="dropdown nav-item"><a href="{{ $design->url(PH7_ADMIN_MOD,'setting','index') }}" title="{lang 'Settings'}" class="dropdown-toggle nav-link" role="button" aria-expanded="false" data-toggle="dropdown"><i class="fa fa-cog fa-fw"></i> {lang 'Setting'} </span></a>
          <div class="dropdown-menu" role="menu">
            <a class="dropdown-item" href="{{ $design->url(PH7_ADMIN_MOD,'setting','index') }}" title="{lang 'General Settings'}"><i class="fa fa-tachometer"></i> {lang 'General'}</a>
            <a class="dropdown-item" href="{{ $design->url(PH7_ADMIN_MOD, 'setting','metamain') }}" title="{lang 'Meta Tags/Homepage Texts'}"><i class="fa fa-tag"></i> {lang 'Meta Tags/Homepage Texts'}</a>
            <a class="dropdown-item" href="{{ $design->url(PH7_ADMIN_MOD,'setting','ads') }}" title="{lang 'Add Banners on the best click-through-rate locations'}"><i class="fa fa-money"></i> {lang 'Ad Banners'}</a>
            <a class="dropdown-item" href="{{ $design->url(PH7_ADMIN_MOD,'setting','analyticsapi') }}" title="{lang 'Analytics Code'}"><i class="fa fa-bar-chart"></i> {lang 'Analytics Code'}</a>
            <a class="dropdown-item" href="{{ $design->url(PH7_ADMIN_MOD,'setting', 'style') }}" title="{lang 'Custom CSS Style'}"><i class="fa fa-code"></i> {lang 'CSS Style'}</a>
            <a class="dropdown-item" href="{{ $design->url(PH7_ADMIN_MOD,'setting', 'script') }}" title="{lang 'JavaScript Injection'}"><i class="fa fa-code"></i> {lang 'JavaScript'}</a>
          </div>
        </li>

        <li class="dropdown nav-item"><a href="{{ $design->url(PH7_ADMIN_MOD,'module','index') }}" title="{lang 'Modules Manager'}" class="dropdown-toggle nav-link" role="button" aria-expanded="false" data-toggle="dropdown"><i class="fa fa-puzzle-piece"></i> {lang 'Mod'} </span></a>
          <div class="dropdown-menu" role="menu">
            <a class="dropdown-item" href="{{ $design->url(PH7_ADMIN_MOD,'module','disable') }}" title="{lang 'Enable/Disable System Modules'}"><i class="fa fa-toggle-on"></i> {lang 'Enable/Disable Modules'}</a>
            <a class="dropdown-item" href="{{ $design->url(PH7_ADMIN_MOD,'module','index') }}" title="{lang 'Third-party Modules Manager'}"><i class="fa fa-plug"></i> {lang '3rd-party Mods Manager'}</a>
          </div>
        </li>
            {if $is_newsletter_enabled}
              <li class="dropdown nav-item"><a class="dropdown-toggle nav-link" href="{{ $design->url('newsletter', 'admin', 'index') }}" title="{lang 'Mass Mailer'}"  role="button" aria-expanded="false" data-toggle="dropdown"><i class="fa fa-newspaper-o"></i> {lang 'Newsletters'}</a>
                <div class="dropdown-menu" role="menu">
                  <a class="dropdown-item" href="{{ $design->url('newsletter', 'admin', 'index') }}" title="{lang 'Mass Mailer'}">{lang 'Newsletters'}</a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="{{ $design->url('newsletter', 'admin', 'browse') }}" title="{lang 'Browse Subscribers'}" role="button" aria-expanded="false" data-toggle="dropdown">{lang 'Subscribers'}</a>
                  <a class="dropdown-item" href="{{ $design->url('newsletter', 'admin', 'browse') }}" title="{lang 'Browse Subscribers'}">{lang 'Browse'}</a>
                  <a class="dropdown-item" href="{{ $design->url('newsletter', 'admin', 'search') }}" title="{lang 'Search Subscribers'}">{lang 'Search'}</a>
                </div>
              </li>
            {/if}

            {if $is_forum_enabled}
              <li class="nav-item"><a class="nav-link" href="{{ $design->url('forum','admin','index') }}" title="{lang 'Forum - Admin Mode'}"><i class="fa fa-comments"></i> {lang 'Forum'}</a></li>
            {/if}

            {if $is_blog_enabled}
              <li class="dropdown nav-item"><a class="dropdown-toggle nav-link" href="{{ $design->url('blog','admin','index') }}" title="{lang 'Admin Blog'}"><i class="fa fa-commenting-o"></i> {lang 'Blog'}</a>
                <div class="dropdown-menu" role="menu">
                  <a class="dropdown-item" href="{{ $design->url('blog','admin','index') }}" title="{lang 'Admin Control - Blog'}">{lang 'Admin Blog'}</a>
                  <a class="dropdown-item" href="{{ $design->url('blog','admin','add') }}" title="{lang 'Add a Blog Post'}">{lang 'Add a Post'}</a>
                </div>
              </li>
            {/if}

            {if $is_note_enabled}
              <li class="nav-item"><a class="nav-link" href="{{ $design->url('note','admin','index') }}" title="{lang 'Moderate Note Posts'}"><i class="fa fa-newspaper-o"></i> {lang 'Note'}</a></li>
            {/if}

            {if $is_game_enabled}
              <li class="dropdown nav-item"><a href="{{ $design->url('game','admin','index') }}" title="{lang 'Admin Game'}" class="dropdown-toggle" role="button" aria-expanded="false" data-toggle="dropdown"><i class="fa fa-gamepad"></i> {lang 'Game'}</a>
                <div class="dropdown-menu" role="menu">
                  <a class="dropdown-item" href="{{ $design->url('game','admin','index') }}" title="{lang 'Admin Game'}">{lang 'Admin Game'}</a>
                  <a class="dropdown-item" href="{{ $design->url('game','admin','add') }}" title="{lang 'Add a Game'}">{lang 'Add a Game'}</a>
                </div>
              </li>
            {/if}

            {if $is_affiliate_enabled}
        <li class="dropdown nav-item"><a href="{{ $design->url('affiliate','admin','index') }}" title="{lang 'Affiliate Manager'}" class="dropdown-toggle nav-link" role="button" aria-expanded="false" data-toggle="dropdown"><i class="fa fa-money"></i> {lang 'Affiliate'}</a>
                <div class="dropdown-menu" role="menu">
                  <a class="dropdown-item" href="{{ $design->url('affiliate','admin','banner') }}" title="{lang 'Banners Manager'}">{lang 'Banners'}</a>
                  <a class="dropdown-item" href="{{ $design->url('affiliate','admin','browse') }}" title="{lang 'Affiliates List'}">{lang 'Browse Affiliates'}</a>
                  <a class="dropdown-item" href="{{ $design->url('affiliate','admin','search') }}" title="{lang 'Search an Affiliate'}">{lang 'Search an Affiliate'}</a>
                  <a class="dropdown-item" href="{{ $design->url('affiliate','admin','add') }}" title="{lang 'Add an Affiliate'}">{lang 'Add Affiliate'}</a>
                  <a class="dropdown-item" href="{{ $design->url('affiliate','admin','config') }}" title="{lang 'Affiliate Settings'}">{lang 'Settings'}</a>
                  <a class="dropdown-item" href="{{ $design->url('affiliate','admin','countryrestriction') }}" title="{lang 'Country Restrictions for Registration form'}">{lang 'Country Restriction'}</a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="{{ $design->url('field','field','all','aff') }}" title="{lang 'Affiliate Fields'}" class="dropdown-toggle" role="button" aria-expanded="false" data-toggle="dropdown">{lang 'Affiliate Fields'}</a>
                      <a class="dropdown-item" href="{{ $design->url('field','field','all','aff') }}" title="{lang 'Fields List'}">{lang 'Fields List'}</a>
                      <a class="dropdown-item" href="{{ $design->url('field','field','add','aff') }}" title="{lang 'Add Fields'}">{lang 'Add Fields'}</a>
                </div>
              </li>
            {/if}

        <li class="dropdown nav-item"><a href="{{ $design->url('payment','admin','index') }}" title="{lang 'Payment System'}" class="dropdown-toggle nav-link" role="button" aria-expanded="false" data-toggle="dropdown"><i class="fa fa-credit-card"></i> {lang 'Billing'}</a>
              <div class="dropdown-menu" role="menu">
                <a class="dropdown-item" href="{{ $design->url(PH7_ADMIN_MOD,'setting','general') }}#p=registration" title="{lang 'Set the Default Membership Group for new Users'}">{lang 'Default Membership Group'}</a>
                <a class="dropdown-item" href="{{ $design->url('payment','admin','membershiplist') }}" title="{lang 'Membership Manager'}">{lang 'Memberships List'}</a>
                <a class="dropdown-item" href="{{ $design->url('payment','admin','addmembership') }}" title="{lang 'Add a new Membership'}">{lang 'Add Membership'}</a>
                <a class="dropdown-item" href="{{ $design->url('payment','admin','config') }}" title="{lang 'Payment Gateway Config'}">{lang 'Gateway Config'}</a>
              </div>
            </li>

            {if $is_mail_enabled}
              <li class="dropdown nav-item"><a href="{{ $design->url('mail','admin','index') }}" title="{lang 'Member Mails Manager'}" class="dropdown-toggle nav-link" role="button" aria-expanded="false" data-toggle="dropdown"><i class="fa fa-envelope-o"></i> {lang 'Mail Manager'}</a>
                <div class="dropdown-menu" role="menu">
                  <a class="dropdown-item" href="{{ $design->url('mail','admin','msglist') }}" title="{lang 'Member Messages Monitor'}">{lang 'Messages Monitor'}</a>
                  <a class="dropdown-item" href="{{ $design->url('mail','main','search') }}" title="{lang 'Search Member Messages'}">{lang 'Search Messages'}</a>
                </div>
              </li>
            {/if}

            {if $is_video_enabled}
              <li class="nav-item"><a class="nav-link" href="{{ $design->url('video', 'admin', 'config') }}"><i class="fa fa-youtube-play"></i> {lang 'Video Youtube API key'}</a></li>
            {/if}

            {if $is_connect_enabled}
              <li class="nav-item"><a class="nav-link" href="{{ $design->url('connect', 'admin', 'config') }}"><i class="fa fa-share-alt-square"></i> {lang 'Universal Login Config'}</a></li>
            {/if}

        {* Moderate Count *}
          {{
            $oModeratorModel = new ModeratorCoreModel();

            $count_moderate_total_picture_album = $oModeratorModel->totalPictureAlbums();
            $count_moderate_total_picture = $oModeratorModel->totalPictures();
            $count_moderate_total_video_album = $oModeratorModel->totalVideoAlbums();
            $count_moderate_total_video = $oModeratorModel->totalVideos();
            $count_moderate_total_avatar = $oModeratorModel->totalAvatars();
            $count_moderate_total_background = $oModeratorModel->totalBackgrounds();
            $count_moderate_total_note = $oModeratorModel->totalNotes();

            unset($oModeratorModel);
          }}

        <li class="dropdown nav-item"><a href="{{ $design->url(PH7_ADMIN_MOD,'moderator','index') }}" title="{lang 'User Moderation'}" class="dropdown-toggle nav-link" role="button" aria-expanded="false" data-toggle="dropdown"><i class="fa fa-user-secret"></i> {lang 'Moderation'} </span></a>
          <div class="dropdown-menu" role="menu">
            <a class="dropdown-item" href="{{ $design->url(PH7_ADMIN_MOD,'moderator','picturealbum') }}" title="{lang 'Moderate Photo Albums'}"><i class="fa fa-picture-o"></i> {lang 'Photo Albums'} {if $count_moderate_total_picture_album }<span class="badge">{count_moderate_total_picture_album}</span>{/if}</a>
            <a class="dropdown-item" href="{{ $design->url(PH7_ADMIN_MOD,'moderator','picture') }}" title="{lang 'Moderate Pictures'}"><i class="fa fa-picture-o"></i> {lang 'Photos'} {if $count_moderate_total_picture }<span class="badge">{count_moderate_total_picture}</span>{/if}</a>
            <a class="dropdown-item" href="{{ $design->url(PH7_ADMIN_MOD,'moderator','videoalbum') }}" title="{lang 'Moderate Video Albums'}"><i class="fa fa-youtube-play"></i> {lang 'Video Albums'} {if $count_moderate_total_video_album }<span class="badge">{count_moderate_total_video_album}</span>{/if}</a>
            <a class="dropdown-item" href="{{ $design->url(PH7_ADMIN_MOD,'moderator','video') }}" title="{lang 'Moderate Videos'}"><i class="fa fa-youtube-play"></i> {lang 'Videos'} {if $count_moderate_total_video }<span class="badge">{count_moderate_total_video}</span>{/if}</a>
            <a class="dropdown-item" href="{{ $design->url(PH7_ADMIN_MOD,'moderator','avatar') }}" title="{lang 'Moderate Profile Photos'}"><i class="fa fa-picture-o"></i> {lang 'Profile Photos'} {if $count_moderate_total_avatar }<span class="badge">{count_moderate_total_avatar}{/if}</span></a>
            <a class="dropdown-item" href="{{ $design->url(PH7_ADMIN_MOD,'moderator','background') }}" title="{lang 'Moderate Profile Background'}"><i class="fa fa-picture-o"></i> {lang 'Profile Backgrounds'} {if $count_moderate_total_background}<span class="badge">{count_moderate_total_background}</span>{/if}</a>

            {if $is_note_enabled}
            <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="{{ $design->url('note','admin','index') }}" title="{lang 'Moderate Notes'}" class="dropdown-toggle" role="button" aria-expanded="false" data-toggle="dropdown"><i class="fa fa-newspaper-o"></i> {lang 'Notes'} {if $count_moderate_total_note}<span class="badge">{count_moderate_total_note}</span>{/if}</a>
                  <a class="dropdown-item" href="{{ $design->url('note','admin','unmoderated') }}" title="{lang 'Unmoderated Note Posts'}">{lang 'Unmoderated Notes'} {if $count_moderate_total_note}<span class="badge">{count_moderate_total_note}</span>{/if}</a>
                  <a class="dropdown-item" href="{{ $design->url('note','admin','index') }}" title="{lang 'Moderate Note Posts'}">{lang 'All Notes'}</a>
          </div>
              </li>
            {/if}

            {if $is_webcam_enabled}
              <li class="nav-item"><a class="nav-link" href="{{ $design->url(PH7_ADMIN_MOD,'moderator','picturewebcam') }}" title="{lang 'Moderate the Webcam Pictures'}"><i class="fa fa-camera"></i> {lang 'Webcam Pictures'}</a></li>
            {/if}
          </div>
        </li>

        <li class="dropdown nav-item"><a href="{{ $design->url(PH7_ADMIN_MOD,'file','index') }}" title="{lang 'File/Page CMS'}" class="dropdown-toggle nav-link" role="button" aria-expanded="false" data-toggle="dropdown"><i class="fa fa-file"></i> {lang 'File/Page'} </span></a>
          <div class="dropdown-menu" role="menu">
            <a class="dropdown-item" href="{{ $design->url(PH7_ADMIN_MOD,'file','display') }}" title="{lang 'Public File Manager'}"><i class="fa fa-file"></i> {lang 'Public Files'}</a>
            <a class="dropdown-item" href="{{ $design->url(PH7_ADMIN_MOD,'file','display','protected') }}" title="{lang 'Protected File Manager'}"><i class="fa fa-file"></i> {lang 'Protected Files'}</a>
            <a class="dropdown-item" href="{{ $design->url(PH7_ADMIN_MOD,'file','pagedisplay') }}" title="{lang 'Display Static Pages'}"><i class="fa fa-pencil-square-o"></i> {lang 'Page Module'}</a>
            <a class="dropdown-item" href="{{ $design->url(PH7_ADMIN_MOD,'file','maildisplay') }}" title="{lang 'Display Email Template'}"><i class="fa fa-pencil"></i> {lang 'Email Template'}</a>
            <a class="dropdown-item" href="{{ $design->url(PH7_ADMIN_MOD,'file','themedisplay') }}" title="{lang 'Display all Templates Files'}"><i class="fa fa-paint-brush"></i> {lang 'Templates Files'}</a>
            <a class="dropdown-item" href="{{ $design->url(PH7_ADMIN_MOD,'file','suggestiondisplay') }}" title="{lang 'Suggestion List'}"><i class="fa fa-plus-circle"></i> {lang 'Suggestion List'}</a>
            <a class="dropdown-item" href="{{ $design->url(PH7_ADMIN_MOD,'file','bandisplay') }}" title="{lang 'Ban Options'}"><i class="fa fa-ban"></i> {lang 'Ban Options'}</a>
          </div>
        </li>

        <li class="dropdown nav-item"><a href="{{ $design->url(PH7_ADMIN_MOD,'tool','index') }}" title="{lang 'Tools'}" class="dropdown-toggle nav-link" role="button" aria-expanded="false" data-toggle="dropdown"><i class="fa fa-wrench"></i> {lang 'Tool'} </span></a>
          <div class="dropdown-menu" role="menu">
            <a class="dropdown-item" href="{{ $design->url(PH7_ADMIN_MOD,'tool','index') }}" title="{lang 'General Tools'}"><i class="fa fa-database"></i> {lang 'Tools'}</a>
            <a class="dropdown-item" href="{{ $design->url(PH7_ADMIN_MOD,'tool','envmode') }}" title="{lang 'Change the Environment Mode'}"><i class="fa fa-eye"></i> {lang 'Environment Mode'}</a>
            <div class="dropdown-divider"></div>
            <a href="{{ $design->url(PH7_ADMIN_MOD,'tool','cache') }}" title="{lang 'Caches Manager'}" class="dropdown-item" role="button" aria-expanded="false" data-toggle="dropdown"><i class="fa fa-tachometer"></i> {lang 'Caches'}</a>
                <a class="dropdown-item" href="{{ $design->url(PH7_ADMIN_MOD,'tool','cache') }}" title="{lang 'Caches Controls'}">{lang 'Caches Manager'}</a>
                <a class="dropdown-item" href="{{ $design->url(PH7_ADMIN_MOD,'tool','cacheconfig') }}" title="{lang 'Cache Settings'}">{lang 'Cache Setting'}</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="{{ $design->url(PH7_ADMIN_MOD,'tool','backup') }}" title="{lang 'Backup Manager'}"><i class="fa fa-floppy-o"></i> {lang 'Backup Manager'}</a>
            <a class="dropdown-item" href="{{ $design->url(PH7_ADMIN_MOD,'tool','freeSpace') }}" title="{lang 'Free Space Server'}"><i class="fa fa-refresh"></i> {lang 'Free Space Server'}</a>
            <div class="dropdown-divider"></div>
            <a href="{{ $design->url(PH7_ADMIN_MOD,'info','index') }}" title="{lang 'Information'}" class="dropdown-item" role="button" aria-expanded="false" data-toggle="dropdown"><i class="fa fa-info-circle"></i> {lang 'Info'}</a>
                <a class="dropdown-item" href="{{ $design->url(PH7_ADMIN_MOD,'main','stat') }}" title="{lang 'Site Statistics'}">{lang 'Site Stats'}</a>
                <a class="dropdown-item" href="{{ $design->url(PH7_ADMIN_MOD,'info','software') }}" title="{lang 'Software'}">{lang 'Software'}</a>
                <a class="dropdown-item" href="{{ $design->url(PH7_ADMIN_MOD,'info','language') }}" title="{lang 'PHP Info'}">{lang 'PHP'}</a>
            <div class="dropdown-divider"></div>
           <a class="dropdown-item" href="{{ $design->url(PH7_ADMIN_MOD,'tool','blockcountry') }}" title="{lang 'Block Countries'}"><i class="fa fa-ban"></i> {lang 'Block Countries'}</a>
          </div>
        </li>

        <li class="dropdown nav-item"><a class="bold dropdown-toggle" href="{software_doc_url}" title="{lang 'Need some Helps?'}" role="button" aria-expanded="false" data-toggle="dropdown"><i class="fa fa-life-ring"></i> {lang 'Help'} </span></a>
          <div class="dropdown-menu" role="menu">
            <a class="dropdown-item" class="bold underline" href="{{ $design->url('ph7cms-helper','main','suggestionbox','?box=donationbox') }}" title="{lang 'Will You Be Nice Today? Like 78% of our users who contribute on a regular basis.'}"><i class="fa fa-trophy"></i> {lang 'Will You Help pH7CMS?'}</a>
            <a class="dropdown-item" href="{software_doc_url}" title="{lang 'Software Documentation'}"><i class="fa fa-book"></i> {lang 'Documentation'}</a>
            <a class="dropdown-item" href="{software_review_url}" title="{lang 'Help pH7CMS by giving a nice review! Highly appreciated :)'}"><i class="fa fa-heart"></i> {lang 'Give Nice Review'}</a>
            <a class="dropdown-item" href="{software_issue_url}" title="{lang 'Report a Problem'}"><i class="fa fa-bug"></i> {lang 'Report a Bug'}</a>
          </div>
        </li>

        <li class="dropdown nav-item"><a href="{{ $design->url(PH7_ADMIN_MOD,'account','index') }}" title="{lang 'My account'}" class="dropdown-toggle" role="button" aria-expanded="false" data-toggle="dropdown"><i class="fa fa-cog"></i> {lang 'Account'} </span></a>
          <div class="dropdown-menu" role="menu">
            <a class="dropdown-item" href="{{ $design->url(PH7_ADMIN_MOD,'account','edit') }}" title="{lang 'Edit My Account'}"><i class="fa fa-pencil fa-fw"></i> {lang 'Edit My Account'}</a>
            <a class="dropdown-item" href="{{ $design->url(PH7_ADMIN_MOD,'account','password') }}" title="{lang 'Change Password'}"><i class="fa fa-key fa-fw"></i> {lang 'Change Password'}</a>
            <a class="dropdown-item" href="{{ $design->url(PH7_ADMIN_MOD,'main','logout') }}" title="{lang 'Logout'}"><i class="fa fa-sign-out"></i> {lang 'Logout'}</a>
          </div>
        </li>
      {/if}
    </ul>
    </div>
    </div>
    </nav>
<br>
{* For LoginUserAs of Admin Panel *}
  {if $is_admin_auth AND $admin_logged_as_user }
    <p class="center bold loginas"><a href="{{ $design->url(PH7_ADMIN_MOD, 'user', 'logoutuseras') }}">{lang}Switch back to the Admin Panel{/lang}</a></p>
  {elseif $is_admin_auth AND $admin_logged_as_affiliate }
    <p class="center bold loginas"><a href="{{ $design->url('affiliate', 'admin', 'logoutuseras') }}">{lang}Switch back to the Admin Panel{/lang}</a></p>
  {/if}

  {* Destroy Session varaible *}
  {{ unset($oSession) }}
