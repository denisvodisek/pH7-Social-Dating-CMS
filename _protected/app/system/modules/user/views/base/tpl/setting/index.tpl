<div class="container">
    <div class="card card-nav-tabs card-plain">
        <div class="card-header card-header-danger">
            <!-- colors: "header-primary", "header-info", "header-success", "header-warning", "header-danger" -->
            <div class="nav-tabs-navigation">
                <div class="nav-tabs-wrapper">
                    <ul class="nav nav-tabs" data-tabs="tabs">
                        <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#edit"><span>{lang 'Edit'}</span><div class="ripple-container"></a></li>
                        <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#avatar"><span>{lang 'Profile Photo'}</span><div class="ripple-container"></a></li>
                        <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#design"><span>{lang 'Profile Wallpaper'}</span><div class="ripple-container"></a></li>
                        <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#notification"><span>{lang 'Email Notification'}</span><div class="ripple-container"></a></li>
                        <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#privacy"><span>{lang 'Privacy'}</span><div class="ripple-container"></a></li>
                        <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#pwd"><span>{lang 'Password'}</span><div class="ripple-container"></a></li>
                    </ul>
                </div>
            </div>
        </div><div class="card-body ">
            <div class="tab-content text-center">
                <div class="tab-pane active" id="edit">
                    {manual_include 'edit.tpl'}
                </div>

                <div class="tab-pane" id="avatar">
                    {manual_include 'avatar.tpl'}
                </div>

                <div class="tab-pane" id="design">
                    {manual_include 'design.tpl'}
                </div>

                <div class="tab-pane"" id="notification">
                    {manual_include 'notification.tpl'}
                </div>

                <div class="tab-pane" id="privacy">
                    {manual_include 'privacy.tpl'}
                </div>

                <div class="tab-pane" id="pwd">
                    {manual_include 'password.tpl'}
                </div>

            </div>
        </div></div>
<script src="{url_static}js/tabs.js"></script>
<script>tabs('p', ['edit','avatar','design','notification','privacy','pwd']);</script>
</div>