{{ $total_pics = count(glob(PH7_PATH_TPL . PH7_TPL_NAME . '/img/slideshow/*.jpg')) }}
{{ $i = mt_rand(1,$total_pics) }}
{{ $url = '' }}
{if !$background}
    {{ $url = $url_tpl . 'img/slideshow/'. $i .'.jpg' }}
{/if}
{if $background}
    {{ $url = $background }}
{/if}

<div class="call_to_action header-filter" data-parallax="true" style="background-image: url('{url}');"></div>
<div class="profile-page main main-raised">
    <div class="profile-content">
        <div class="container">
            <div class="row">
                <div class="col-md-6 ml-auto mr-auto">
                    <div class="profile">
                        <div class="avatar">
                            {{ $avatarDesign->lightBox($username, $first_name, $sex, 400) }}
                        </div>
                        <div class="name">
                            <h2 class="title">{first_name} {last_name}</h2>
                            <h5>@{username}</h5>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 description text-center">
                <p>{description}</p>
            </div>
    {* "My Profile" block don't really fit well on small mobile devices, so ignore it if it's the case *}
            <br>
    {if !$browser->isMobile()}
        <div class="left col-xs-12 col-sm-4 col-md-3">
            <h2>{lang 'My Profile'}</h2>
                     <ul class="nav nav-pills nav-stacked menu">
                        <li role="presentation"><a href="{{ $design->url('user','setting','avatar') }}" title="{lang 'Change My Profile Photo'}"><i class="fa fa-upload"></i> {lang 'Change Profile Photo'}</a>
                        </li>
                        <li role="presentation"> <a href="{{ $design->url('user','setting','edit') }}" title="{lang 'Edit My Profile'}"><i class="fa fa-cog fa-fw"></i> {lang 'Edit Profile'}</a>
                        </li>
                         <li role="presentation"><a href="{{ $design->url('user','setting','design') }}" title="{lang 'My Wallpaper'}"><i class="fa fa-picture-o"></i> {lang 'Design Profile'}</a>
                         </li>
                         <li role="presentation"><a href="{{ $design->url('user','setting','notification') }}" title="{lang 'My Email Notification Settings'}"><i class="fa fa-envelope-o"></i> {lang 'Notifications'}</a>
                         </li>
                         <li role="presentation"> <a href="{{ $design->url('user','setting','privacy') }}" title="{lang 'My Privacy Settings'}"><i class="fa fa-user-secret"></i> {lang 'Privacy Setting'}</a>
                         </li>
                         <li role="presentation"><a href="{{ $design->url('payment','main','info') }}" title="{lang 'My Membership'}"><i class="fa fa-credit-card"></i> {lang 'Membership Details'}</a>
                         </li>
                         <li role="presentation"><a href="{{ $design->url('user','setting','password') }}" title="{lang 'Change My Password'}"><i class="fa fa-key fa-fw"></i> {lang 'Change Password'}</a>
                         </li>
                    </ul>
                </div>
    {/if}

    <div class="left col-xs-12 col-sm-6 col-md-6">
        <h2 class="center underline">{lang 'The Latest Users'}</h2>
        {{ $userDesignModel->profilesBlock() }}

        {if $is_video_enabled}
            <h2 class="center underline">{lang 'My video albums'}</h2>
            <div class="content" id="video">
                <script>
                    var url_video_block = '{{ $design->url('video','main','albums',$username) }}';
                    $('#video').load(url_video_block + ' #video_block');
                </script>
            </div>
            <div class="clear"></div>
            <br>
        {/if}

        {if $is_forum_enabled}
            <h2 class="center underline">{lang 'My discussions'}</h2>
            <div class="content" id="forum">
                <script>
                    var url_forum_block = '{{ $design->url('forum','forum','showpostbyprofile',$username) }}';
                    $('#forum').load(url_forum_block + ' #forum_block');
                </script>
            </div>
            <div class="clear"></div>
            <br>
        {/if}

        {if $is_note_enabled}
            <h2 class="center underline">{lang 'My notes'}</h2>
            <div class="content" id="note">
                <script>
                    var url_note_block = '{{ $design->url('note','main','author',$username) }}';
                    $('#note').load(url_note_block + ' #note_block');
                </script>
            </div>
            <div class="clear"></div>
            <br>
        {/if}
    </div>

    <div class="left col-xs-12 col-sm-2 col-md-3">
        <h2>{lang 'The Latest News'}</h2>
        <div id="wall"></div>
    </div>
</div>
</div>
    <div class="container">
        <br>
        <hr style="width:50%">
        <br>
    <div class="row">
        <div class="col-md-6 ml-auto mr-auto">
            <div class="profile-tabs">
                <ul class="nav nav-pills nav-pills-icons justify-content-center" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" href="#studio" role="tab" data-toggle="tab">
                            <i class="material-icons">favorite</i> My Friends
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#works" role="tab" data-toggle="tab">
                            <i class="material-icons">palette</i> Visitors who visited my profile
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#favorite" role="tab" data-toggle="tab">
                            <i class="material-icons">camera</i> My Photo Albums
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="tab-content tab-space">
        <div class="tab-pane active text-center gallery" id="studio">
            <div class="row">
                <div class="col-xs-12">
                <h2 class="center underline">{lang 'My friends'}</h2>
                <div class="content" id="friend">
                    <script>
                        var url_friend_block = '{{ $design->url('friend','main','index',$username) }}';
                        $('#friend').load(url_friend_block + ' #friend_block');
                    </script>
                </div>
                </div>
            </div>
        </div>
        <div class="tab-pane text-center gallery" id="works">
            <div class="row">
                <div class="col-xs-12">
                <h2 class="center underline">{lang 'Visitors who visited my profile'}</h2>
                <div class="content" id="visitor">
                    <script>
                        var url_visitor_block = '{{ $design->url('user','visitor','index',$username) }}';
                        $('#visitor').load(url_visitor_block + ' #visitor_block');
                    </script>
                </div>
                </div>
            </div>
        </div>
        <div class="tab-pane text-center gallery" id="favorite">
            <div class="row">
                {if $is_picture_enabled}
                <div class="col-xs-12">
                    <h2 class="center underline">{lang 'My photo albums'}</h2>
                    <div class="content" id="picture">
                        <script>
                            var url_picture_block = '{{ $design->url('picture','main','albums',$username) }}';
                            $('#picture').load(url_picture_block + ' #picture_block');
                        </script>
                    </div>
                    </div>
                {/if}
            </div>
        </div>
    </div>
        <div class="col-xs-12">
        <h2 class="center underline italic s_tMarg">{lang 'Quick User Search'}</h2>
        {{ SearchUserCoreForm::quick() }}
        </div>
    </div>
<script>
    $(document).ready(function() {
        $('ul.zoomer_pic').slick({
            dots: true,
            infinite: false,
            slidesToShow: 6,
            slidesToScroll: 6,
            adaptiveHeight: true
        })
    });
</script>
