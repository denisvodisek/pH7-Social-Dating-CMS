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
                <p>Meet genuine singles who are looking to date with the intention and the willingness to commit to a long-term relationship. Meet someone worth meeting!</p>
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
                                    <p>Our profile verification service helps ensure you receive a greater level of interest and better communication. Leading to more dates!</p>
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
                                    <div class="img-raised rounded-circle img-fluid" style="background:url('{url_tpl}img/1.jpg'); background-size:cover;height: 120px">
                                    </div>
                                </div>
                                <h4 class="card-title">Nancy Chan
                                    <br>
                                    <small class="card-description text-muted">Make-up artist</small>
                                </h4>
                                <div class="card-body">
                                    <p class="card-description">I meet Michael through this service. During our first date, I feel he is a nice and quiet gentleman, he treated me the meal. Meanwhile, we still keep in touch using whatsapp. After our vacation, we decided to meet again for movie. Then he started to like me but I wasn’t sure about my feelings. Then we went on more date and getting to know each other more deeply, I thought I didn’t like him, but I actually have some feelings for him but I just didn’t notice. I talked to him about his feeling and we were on the same page, let's see what will happen.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="team-player">
                            <div class="card card-plain">
                                <div class="col-md-6 ml-auto mr-auto">
                                    <div class="img-raised rounded-circle img-fluid" style="background:url('{url_tpl}img/2.jpg'); background-size:cover;height: 120px">
                                    </div>
                                </div>
                                <h4 class="card-title">Matthew Ma
                                    <br>
                                    <small class="card-description text-muted">IT Consultant</small>
                                </h4>
                                <div class="card-body">
                                    <p class="card-description">Sophie is the second person I dated on my first day since I joined the service. We are two Virgos and we like talking to each other all the time. We have much in common. We take feelings seriously. We both like laughing. Happy that we do not miss each other. In all, thank you Share The Moments team!</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="team-player">
                            <div class="card card-plain">
                                <div class="col-md-6 ml-auto mr-auto">
                                    <div class="img-raised rounded-circle img-fluid" style="background:url('{url_tpl}img/3.jpg'); background-size:cover;height: 120px">
                                    </div>
                                </div>
                                <h4 class="card-title">Mark Tim Lawrence
                                    <br>
                                    <small class="card-description text-muted">Sales Executive</small>
                                </h4>
                                <div class="card-body">
                                    <p class="card-description">After I moved to Hong Kong, my friend recommended me to use Share The Moments, which is definitely a good channel to meet new friends. I have never used any dating sites, and I don't even know that it can change my life. When I first met my wife at Share The Moments, I immediately flirted with her. She is exactly the type I like, so after we communicated some information, we started our first date. Now that she is my wife, we have a very happy life.
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
            <div class="col-sm-12 col-md-12 relativeDiv">
            <div class="col-sm-12 col-md-6">
                <h1 class="title">Stop <i class="heartlogo fa fa-clock-o"></i> waiting. Start dating <i class="heartlogo fa fa-heart-o"></i></h1>
                <p>Tip: Your goal in an online dating profile and in your first message to somebody is to strike up a conversation.</p>
            </div>
            <div class="col-sm-12 col-md-6 buttonMiddle">
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
            <p>Say goodbye to those embarrassing traditional dating events! Join the best dating sites in Hong Kong. At Share The Moments, you can get to know each other with your ideals. When you reach a certain level of understanding, your next appointment will be smoother.

                </p><p>Simple registration (only 60 seconds through the website, iPhone or Android app), you can find your favorite object through Share The Moments's search engine.

                </p><p>Hong Kong is a very suitable place for dating. From Central to Kowloon and beyond, there are some places for first date. Difficulties with our dating ideas tool, you can find some dating people who are interested in you to try out a new restaurant or coffee shop. Simply suggest your appointment or make an invitation based on someone else's appointment!

            </p>
        </div>
    </div>
</div>