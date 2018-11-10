{if $is_users_block}
    <div class="center profiles_window thumb pic_block">
        {{ $userDesignModel->profiles(0, $number_profiles) }}
    </div>
{/if}

<div>
    <h2 class="title">{lang 'Meet &amp; date amazing people near %0%!', $design->geoIp(false)}</h2>
    <p>{promo_text}</p>
</div>
