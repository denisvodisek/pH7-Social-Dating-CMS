<div class="container">
<div class="left col-md-8 col-md-offset-2">
    {{ ContactForm::display() }}
    <p class="italic red">{lang 'Your IP is: %0%', $ip}</p>
</div>

<div role="banner" class="right col-md-2 col-md-offset-2 ad_160_600">
    {designModel.ad(160, 600)}
</div>
</div>
