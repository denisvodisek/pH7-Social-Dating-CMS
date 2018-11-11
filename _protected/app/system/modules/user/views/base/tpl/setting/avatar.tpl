<div class="container">
    <a href="{{ $design->url('user-dashboard', 'main','index') }}" class="marginbottom20"><button class="btn btn-outline-danger btn-md">
            <i class="fa fa-arrow-left"></i> Back to your dashboard
        </button></a>
    <br>
    <br>
<div class="row">
<div class="col-md-8">
    {{ $avatarDesign->lightBox($username, $first_name, $sex, 400) }}
<br>
    {if $is_admin_auth AND !$is_user_auth}
        {{ LinkCoreForm::display(t('Remove the profile photo?'), null, null, null, array('del'=>1)) }}
    {else}
        {{ LinkCoreForm::display(t('Remove the profile photo?'), 'user', 'setting', 'avatar', array('del'=>1)) }}
    {/if}
    <br>

    <p>
        <span class="underline err_msg">{lang 'Warning:'}</span> {lang 'Your profile photo must contain a photo of you under penalty of banishment of your account!'}
    </p>

    {{ AvatarForm::display() }}


    {if $is_webcam_enabled} {* Check if the module is enabled *}
        <p class="s_tMarg bold"><a href="{{ $design->url('webcam','webcam','picture') }}">{lang 'Want to take a photo of yourself directly with your webcam?'}</a></p>
    {/if}
</div>
</div>
</div>