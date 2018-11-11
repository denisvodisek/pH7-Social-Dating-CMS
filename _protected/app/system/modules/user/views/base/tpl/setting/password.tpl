<div class="container">
    <a href="{{ $design->url('user-dashboard', 'main','index') }}" class="marginbottom20"><button class="btn btn-outline-danger btn-md">
            <i class="fa fa-arrow-left"></i> Back to your dashboard
        </button></a>
    <br>
    <br>
<div class="col-md-8">
    {{ ChangePasswordCoreForm::display() }}
    {{ TwoFactorAuthDesignCore::link('user') }}
</div>
</div>