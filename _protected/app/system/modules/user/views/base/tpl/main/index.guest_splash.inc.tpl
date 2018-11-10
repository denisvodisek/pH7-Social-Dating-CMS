<!-- Begin Content -->
{* Count the number of different splash videos *}
{{ $total_videos = count(glob(PH7_PATH_TPL . PH7_TPL_NAME . '/img/slideshow/*.jpg')) }}
{{ $i = mt_rand(1,$total_videos) }}
{{ $j = mt_rand(1,$total_videos) }}

{* Enable the video only if visitors aren't from a mobile devices (for performance optimization) *}
<div class="page-header header-filter" data-parallax="true" style="background: white url('{url_tpl}img/slideshow/{i}.jpg') no-repeat center center fixed;-webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        background-size: cover;">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <h1 class="title">Your Story Starts With Us.</h1>
                <p>Every landing page needs a small description after the big bold title, that&apos;s why we added this text here. Add here all the information that can make you or your product create the first impression.</p>
                <br>
                <a href={{ $design->url('user','signup','step1') }} title="{lang 'Join Now!'}" target="_blank" class="btn btn-danger btn-raised btn-lg">
                    <i class="fa fa-heart"></i> Join us
                </a>
            </div>
        </div>
    </div>
</div>
<div class="main main-raised">
    <div class="container">
        <div class="section text-center">
            <div class="row">
                <div class="col-md-12 ml-auto mr-auto">
                    <h2 class="title">{lang '<i class="heartlogo fa fa-heart"></i> Meet & date amazing <i class="heartlogo fa fa-users"></i> people near %0%!', $design->geoIp(false)}</h2>
                    <br>
                    {if $is_users_block}
                        <div class="center profiles_window thumb pic_block">
                            {{ $userDesignModel->profiles(0, $number_profiles) }}
                        </div>
                    {/if}
                    <br>
                    <br>
                            <p>{promo_text}</p>
                </div>
            </div>
            <div class="features fadeInLeft">
                <div class="row">
                    <div class="col-md-12">
                        <div class="col-lg-6 col-md-12 col-sm-12">
                            <div class="col-md-6 col-sm-12">
                                <div class="info">
                                    <div class="icon icon-info">
                                        <i class="material-icons">chat</i>
                                    </div>
                                    <h3 class="info-title">Connect & Chat</h3>
                                    <p>Chat in real-time with other users. Who doesn’t love some instant chat?</p>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-12">
                                <div class="info">
                                    <div class="icon icon-success">
                                        <i class="material-icons">verified_user</i>
                                    </div>
                                    <h3 class="info-title">Verified Users</h3>
                                    <p>Every single member is verified by a living breathing person. Result? No fake, misleading or catfish profiles.</p>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-12">
                                <div class="info">
                                    <div class="icon icon-danger">
                                        <i class="material-icons">fingerprint</i>
                                    </div>
                                    <h3 class="info-title">Fingerprint</h3>
                                    <p>Divide details about your product or agency work into parts. Write a few lines about each one. A paragraph describing a feature will be enough.</p>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-12">
                                <div class="info">
                                    <div class="icon icon-success">
                                        <i class="material-icons">verified_user</i>
                                    </div>
                                    <h3 class="info-title">Verified Users</h3>
                                    <p>Every single member is verified by a living breathing person. Result? No fake, misleading or catfish profiles.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-12 col-sm-12">
                            <br>
                            <br>
                            <div class="login_form">
                                {{ JoinForm::step1() }}
                            </div>
                        </div>
            </div>
        </div>
    </div>
        </div>
    </div>
</div>
<div class="main" style="margin-top: 70px">
    <div class="container">
        <div class="section text-center">
            <h2 class="title">Testimonials from  <i class="heartlogo fa fa-heartbeat"></i> couples that met <i class="heartlogo fa fa-map-pin"></i> here</h2>
            <div class="team">
                <div class="row">
                    <div class="col-md-4">
                        <div class="team-player">
                            <div class="card card-plain">
                                <div class="col-md-6 ml-auto mr-auto">
                                    <img src="https://cdn.lovestruck.com/hongkong/img/testimonials/michael-hazel-2.jpg" alt="Thumbnail Image" class="img-raised rounded-circle img-fluid">
                                </div>
                                <h4 class="card-title">Gigi Hadid
                                    <br>
                                    <small class="card-description text-muted">Model</small>
                                </h4>
                                <div class="card-body">
                                    <p class="card-description">You can write here details about one of your team members. You can give more details about what they do. Feel free to add some
                                        <a href="#">links</a> for people to be able to follow them outside the site.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="team-player">
                            <div class="card card-plain">
                                <div class="col-md-6 ml-auto mr-auto">
                                    <img src="https://cdn.lovestruck.com/hongkong/img/testimonials/michael-hazel-2.jpg" alt="Thumbnail Image" class="img-raised rounded-circle img-fluid">
                                </div>
                                <h4 class="card-title">Christian Louboutin
                                    <br>
                                    <small class="card-description text-muted">Designer</small>
                                </h4>
                                <div class="card-body">
                                    <p class="card-description">You can write here details about one of your team members. You can give more details about what they do. Feel free to add some
                                        <a href="#">links</a> for people to be able to follow them outside the site.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="team-player">
                            <div class="card card-plain">
                                <div class="col-md-6 ml-auto mr-auto">
                                    <img src="https://cdn.lovestruck.com/hongkong/img/testimonials/michael-hazel-2.jpg" alt="Thumbnail Image" class="img-raised rounded-circle img-fluid">
                                </div>
                                <h4 class="card-title">Kendall Jenner
                                    <br>
                                    <small class="card-description text-muted">Model</small>
                                </h4>
                                <div class="card-body">
                                    <p class="card-description">You can write here details about one of your team members. You can give more details about what they do. Feel free to add some
                                        <a href="#">links</a> for people to be able to follow them outside the site.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="call_to_action header-filter" data-parallax="true" style="background: white url('{url_tpl}img/slideshow/{j}.jpg') no-repeat center center fixed;-webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        background-size: cover;">
    <div class="container">
        <div class="row">
            <div class="col-md-12 relativeDiv">
            <div class="col-md-6">
                <h1 class="title">Stop <i class="heartlogo fa fa-clock-o"></i> waiting. Start dating <i class="heartlogo fa fa-heart-o"></i></h1>
                <p>Every landing page needs a small description after the big bold title, that&apos;s why we added this text here. Add here all the information that can make you or your product create the first impression.</p>
            </div>
            <div class="col-md-6 text-right buttonMiddle">
                <a href={{ $design->url('user','signup','step1') }} title="{lang 'Join Now!'}" target="_blank" class="btn btn-danger btn-raised btn-lg">
                    <i class="fa fa-heart"></i> Start meeting new people now!
                </a>
            </div>
            </div>
        </div>
    </div>
</div>
<div class="main">
    <div class="container">
        <div class="section text-center">
            <h2 class="title">Who we are and how can we help you<i class="heartlogo fa fa-question"></i></h2>
        </div>
            <p>Say goodbye to those embarrassing traditional dating events! Join the best dating sites in Hong Kong. At Lovestruck, you can get to know each other with your ideals. When you reach a certain level of understanding, your next appointment will be smoother.

                </p><p>Simple registration (only 60 seconds through the website, iPhone or Android app), you can find your favorite object through Lovestruck's search engine.

                </p><p>Hong Kong is a very suitable place for dating. From Central to Kowloon and beyond, there are some places for first date. Difficulties with our dating ideas tool, you can find some dating people who are interested in you to try out a new restaurant or coffee shop. Simply suggest your appointment or make an invitation based on someone else's appointment!

            </p>
        </div>
    </div>
</div>