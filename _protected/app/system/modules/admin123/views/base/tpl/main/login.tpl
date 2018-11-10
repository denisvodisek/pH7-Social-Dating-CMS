<div class="container">
<div class="col-md-12">
    {{ LoginForm::display() }}
    <p>{{ LostPwdDesignCore::link(PH7_ADMIN_MOD) }}</p>
    <p class="red">{lang 'Your logged IP is:'} <em class="bold">{ip}</em></p>
</div>
</div>