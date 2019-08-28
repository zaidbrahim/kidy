@extends('layouts.app')

@section('content')
<!--Page Wrapper starts-->
<div class="page-wrapper fixed-footer">
    @include('includes._header')
    <!--Listing Details Hero starts-->
    <div class="listing-details-slider swiper-container">
        <div class="swiper-wrapper">
            <div class="swiper-slide single-listing-slider">
                <a href="{{ asset('images/single-listing/restaurant-1.jpg') }}" data-lightbox="listing-slider"><img src="images/single-listing/restaurant-1.jpg" alt="..."></a>
            </div>
        </div>
        <div class="listing-details-next slider-btn v4"><i class="ion-arrow-right-c"></i></div>
        <div class="listing-details-prev slider-btn v4"><i class="ion-arrow-left-c"></i></div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="list-details-title v2">


                    <div class="row">
                        <div class="col-lg-6 col-md-7 col-sm-12">
                            <div class="single-listing-title float-left">
                                <p><a href="#" class="btn v6 red">{!! $etablissement->categorie->categorie !!}</a></p>
                                <h3>{!! $etablissement->etablissement !!}</h3>
                                    @foreach($niveaux as $niveau)
                                        <span class="badge badge-success">{!! $niveau->niveau !!}</span>
                                    @endforeach
                                <div class="list-ratings">
                                    <span class="ion-android-star"></span>
                                    <span class="ion-android-star"></span>
                                    <span class="ion-android-star"></span>
                                    <span class="ion-android-star"></span>
                                    <span class="ion-android-star-half"></span>
                                    <!--<a href="#">(31 Reviews)</a>-->
                                </div>
                            </div>

                        </div>
                        <div class="col-lg-6 col-md-5 col-sm-12">
                            <div class="list-details-btn text-right sm-left">
                                <div class="share-btn">
                                    <a href="#" class="btn v3"><i class="ion-android-share-alt"></i> Share</a>
                                    <ul class="social-share">
                                        <li class="bg-fb"><a href="#"><i class="ion-social-facebook"></i></a></li>
                                        <li class="bg-tt"><a href="#"><i class="ion-social-twitter"></i></a></li>
                                        <li class="bg-ig"><a href="#"><i class="ion-social-instagram"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--Listing Details Hero ends-->
    <!--Listing Details Info starts-->
    <div class="list-details-section section-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-12">
                    <div id="list-menu" class="list_menu">
                        <ul class="list-details-tab fixed_nav">
                            <li class="nav-item active"><a href="#overview" class="active">Overview</a></li>
                            <li class="nav-item"><a href="#gallery">Gallery</a></li>
                        </ul>
                    </div>
                    <!--Listing Details starts-->
                    <div class="list-details-wrap">
                        <div id="overview" class="list-details-section">
                            <h4>Présentation</h4>
                            <div class="overview-content">
                                <p class="mar-bot-10">
                                    {!! $etablissement->description !!}
                                </p>
                            </div>
                            <div class="mar-top-20">
                                <h6>Amenities</h6>
                                <ul class="listing-features">
                                    <li><i class="icofont-credit-card"></i> Accepts Credit cards</li>
                                    <li><i class="icofont-no-smoking"></i> No Smoking zone</li>
                                    <li><i class="icofont-car-alt-3"></i> Free Parking on premises</li>
                                    <li><i class="icofont-snow"></i>Air Conditioned</li>
                                    <li><i class="icofont-search-restaurant"></i> Online order</li>
                                    <li><i class="icofont-wheelchair"></i> Wheelchair Friendly</li>
                                    <li><i class="icofont-paw"></i> Pet Friendly </li>
                                </ul>
                            </div>
                        </div>
                        <div id="gallery" class="list-details-section">
                            <h4>Gallery</h4>
                            <!--Carousel Wrapper-->
                            <div id="carousel-thumb" class="carousel slide carousel-fade carousel-thumbnails list-gallery" data-ride="carousel">
                                <!--Slides-->
                                <div class="carousel-inner" role="listbox">
                                    <div class="carousel-item active">
                                        <img class="d-block w-100" src="images/single-listing/restaurant-1.jpg" alt="slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100" src="images/single-listing/restaurant-2.jpg" alt="slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100" src="images/single-listing/restaurant-3.jpg" alt="slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100" src="images/single-listing/restaurant-4.jpg" alt="slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100" src="images/single-listing/restaurant-5.jpg" alt="slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100" src="images/single-listing/restaurant-6.jpg" alt="slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100" src="images/single-listing/restaurant-7.jpg" alt="slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100" src="images/single-listing/restaurant-8.jpg" alt="slide">
                                    </div>
                                </div>
                                <!--Controls starts-->
                                <a class="carousel-control-prev" href="#carousel-thumb" role="button" data-slide="prev">
                                    <span class="ion-arrow-left-c" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="carousel-control-next" href="#carousel-thumb" role="button" data-slide="next">
                                    <span class="ion-arrow-right-c" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                                <!--Controls ends-->
                                <ol class="carousel-indicators  list-gallery-thumb">
                                    <li data-target="#carousel-thumb" data-slide-to="0"><img class="img-fluid d-block w-100" src="images/single-listing/restaurant-1.jpg"></li>
                                    <li data-target="#carousel-thumb" data-slide-to="1"><img class="img-fluid d-block w-100" src="images/single-listing/restaurant-2.jpg"></li>
                                    <li data-target="#carousel-thumb" data-slide-to="2"><img class="img-fluid d-block w-100" src="images/single-listing/restaurant-3.jpg"></li>
                                    <li data-target="#carousel-thumb" data-slide-to="3"><img class="img-fluid d-block w-100" src="images/single-listing/restaurant-4.jpg"></li>
                                    <li data-target="#carousel-thumb" data-slide-to="4"><img class="img-fluid d-block w-100" src="images/single-listing/restaurant-5.jpg"></li>
                                    <li data-target="#carousel-thumb" data-slide-to="5"><img class="img-fluid d-block w-100" src="images/single-listing/restaurant-6.jpg"></li>
                                    <li data-target="#carousel-thumb" data-slide-to="6"><img class="img-fluid d-block w-100" src="images/single-listing/restaurant-7.jpg"></li>
                                    <li data-target="#carousel-thumb" data-slide-to="7"><img class="img-fluid d-block w-100" src="images/single-listing/restaurant-8.jpg"></li>
                                </ol>
                            </div>
                            <!--/.Carousel Wrapper-->
                        </div>
                    </div>
                    <!--Listing Details ends-->
                </div>
                <div class="col-lg-4 col-md-12">
                    <div class="listing-sidebar">
                        <div class="sidebar-widget">
                            <div class="row">
                                <div class="col-md-12">
                                    {!! $etablissement->maps !!}
                                </div>
                            </div>
                            <div class="address">
                                <span class="ion-ios-location"></span>
                                <p> {!! $etablissement->adresse !!}</p>
                            </div>
                            <div class="address">
                                <span class="ion-ios-telephone"></span>
                                <p> {!! $etablissement->tel !!}</p>
                            </div>
                            <div class="address">
                                <span class="ion-android-globe"></span>
                                <p>{!! $etablissement->site_web !!}</p>
                            </div>
                        </div>
                        <div class="sidebar-widget follow">
                            <div class="follow-img">
                                <img src="{!! asset('img/etablissement/'.$etablissement->photo) !!}" alt="{{ $etablissement->etablissement }}" class="img-fluid" alt="#">
                                <h6>Christine Evans</h6>
                                <span>New York</span>
                            </div>
                            <ul class="social-counts">
                                <li>
                                    <h6>26</h6>
                                    <span>Listings</span>
                                </li>
                                <li>
                                    <h6>326</h6>
                                    <span>Followers</span>
                                </li>
                                <li>
                                    <h6>12</h6>
                                    <span>Following</span>
                                </li>
                            </ul>
                            <div class="text-center mar-bot-25">
                                <a href="#" class="btn v3"><i class="icofont-eye-alt"></i> Follow</a>
                            </div>
                        </div>
                        <div class="sidebar-widget ad-box">
                            <a href="#"><img src="images/others/ad-3.jpg" alt="..."></a>
                        </div>
                        <div class="sidebar-widget listing-tags">
                            <h4>Tags</h4>
                            <ul class="list-tags">
                                <li><a href="#" class="btn v6 dark">Restaurant</a></li>
                                <li><a href="#" class="btn v6 dark">Hotel</a></li>
                                <li><a href="#" class="btn v6 dark">Travel</a></li>
                                <li><a href="#" class="btn v6 dark">Food</a></li>
                                <li><a href="#" class="btn v6 dark">Living</a></li>
                                <li><a href="#" class="btn v6 dark">Luxury</a></li>
                                <li><a href="#" class="btn v6 dark">Eat &amp; Drink</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--Listing Details Info ends-->
    <!-- Scroll to top starts-->
    <span class="scrolltotop"><i class="ion-arrow-up-c"></i></span>
    <!-- Scroll to top ends-->
</div>
@endsection()