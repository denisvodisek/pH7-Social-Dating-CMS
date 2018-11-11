<div class="container">
    <a href="{{ $design->url('user-dashboard', 'main','index') }}" class="marginbottom20"><button class="btn btn-outline-danger btn-md">
            <i class="fa fa-arrow-left"></i> Back to your dashboard
        </button></a>
    <br>
    <br>
<div class="col-md-10">
    {{ PrivacyForm::display() }}

    <p class="s_tMarg">
        <a href="{{ $design->url('user','setting','delete') }}">{lang 'Want to delete your account...?'}</a>
    </p>
</div>
</div>