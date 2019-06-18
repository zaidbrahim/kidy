@extends('layouts.app')

@section('content')

    <!-- Preloader starts-->
    <!-- <div class="preloader js-preloader">
        <div class="dots">
            <div class="dot"></div>
            <div class="dot"></div>
            <div class="dot"></div>
        </div>
    </div> -->
    <!--Preloader ends -->
    <!--Page Wrapper starts-->
    <div class="page-wrapper fixed-footer">
        <!--header starts-->
        @include('includes._header')
        <!--Header ends-->
        <!--Hero section starts-->
        @include('includes._search')
        <!--Hero section ends-->
        <!--Promo Category starts-->
        @include('includes._categories')
        <!--Promo Category ends-->
        <!--Popular City starts-->
            <!-- @include('includes._city') -->
        <!--Popular City ends-->
        <!--Trending events starts-->
            @include('includes._lasts')        
        <!--Trending events ends-->
        <!--Popular Category starts-->
            @include('includes._populaire_categorie')
        <!--Popular Category ends-->
        <!--Trending Place starts-->
        <div class="trending-places section-padding pad-bot-130">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 offset-md-2 text-center">
                        <h2 class="section-title v1">Trending Places</h2>
                    </div>
                    <div class="col-md-12">
                        <div class="swiper-container trending-place-wrap">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide trending-place-item">
                                    <div class="trending-img">
                                        <img src="images/category/places/place-1.jpg" alt="#">
                                        <span class="trending-rating-green">7</span>
                                        <span class="save-btn"><i class="icofont-heart"></i></span>
                                    </div>
                                    <div class="trending-title-box">
                                        <h4><a href="single-listing-one.html">Four Seasons Resort</a></h4>
                                        <div class="customer-review">
                                            <div class="rating-summary float-left">
                                                <div class="rating-result" title="60%">
                                                    <ul class="product-rating">
                                                        <li><i class="ion-android-star"></i></li>
                                                        <li><i class="ion-android-star"></i></li>
                                                        <li><i class="ion-android-star"></i></li>
                                                        <li><i class="ion-android-star-half"></i></li>
                                                        <li><i class="ion-android-star-half"></i></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="review-summury float-right">
                                                <p><a href="#">3 Reviews</a></p>
                                            </div>
                                        </div>
                                        <ul class="trending-address">
                                            <li><i class="ion-ios-location"></i>
                                                <p>4210 Khale Street,Florence,USA</p>
                                            </li>
                                            <li><i class="ion-ios-telephone"></i>
                                                <p>+843-600-2040</p>
                                            </li>
                                            <li><i class="ion-android-globe"></i>
                                                <p>www.laresorta.com</p>
                                            </li>
                                        </ul>
                                        <div class="trending-bottom mar-top-15 pad-bot-30">
                                            <div class="trend-left float-left">
                                                <span class="round-bg pink"><i class="icofont-hotel"></i></span>
                                                <p><a href="#">Hotel</a></p>

                                            </div>
                                            <div class="trend-right float-right">
                                                <div class="trend-open"><i class="ion-clock"></i>
                                                    Open <p>till 11.00pm</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-slide trending-place-item">
                                    <div class="trending-img">
                                        <img src="images/category/places/cafe.jpg" alt="#">
                                        <span class="trending-rating-orange">9</span>
                                        <span class="save-btn"><i class="icofont-heart"></i></span>
                                    </div>
                                    <div class="trending-title-box">
                                        <h4><a href="single-listing-two.html">Cafe Intermezzo</a></h4>
                                        <div class="customer-review">
                                            <div class="rating-summary float-left">
                                                <div class="rating-result" title="60%">
                                                    <ul class="product-rating">
                                                        <li><i class="ion-android-star"></i></li>
                                                        <li><i class="ion-android-star"></i></li>
                                                        <li><i class="ion-android-star"></i></li>
                                                        <li><i class="ion-android-star-half"></i></li>
                                                        <li><i class="ion-android-star-half"></i></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="review-summury float-right">
                                                <p><a href="#">5 Reviews</a></p>
                                            </div>
                                        </div>
                                        <ul class="trending-address">
                                            <li><i class="ion-ios-location"></i>
                                                <p>2721 Andy Street,ELLSWORTH,USA</p>
                                            </li>
                                            <li><i class="ion-ios-telephone"></i>
                                                <p>+605-344-1198</p>
                                            </li>
                                            <li><i class="ion-android-globe"></i>
                                                <p>www.cafemezzo.com</p>
                                            </li>

                                        </ul>

                                        <div class="trending-bottom mar-top-15 pad-bot-30">
                                            <div class="trend-left float-left">
                                                <span class="round-bg green"><i class="icofont-tea"></i></span>
                                                <p><a href="#">Cafe</a></p>
                                            </div>

                                            <div class="trend-right float-right">
                                                <div class="trend-closed">
                                                    Closed
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-slide trending-place-item">
                                    <div class="trending-img">
                                        <img src="images/category/places/place-5.jpg" alt="#">
                                        <span class="trending-rating-pink">6.5</span>
                                        <span class="save-btn"><i class="icofont-heart"></i></span>
                                    </div>
                                    <div class="trending-title-box">
                                        <h4><a href="single-listing-one.html">Lagoon Theme Park</a></h4>
                                        <div class="customer-review">
                                            <div class="rating-summary float-left">
                                                <div class="rating-result" title="60%">
                                                    <ul class="product-rating">
                                                        <li><i class="ion-android-star"></i></li>
                                                        <li><i class="ion-android-star"></i></li>
                                                        <li><i class="ion-android-star"></i></li>
                                                        <li><i class="ion-android-star-half"></i></li>
                                                        <li><i class="ion-android-star-half"></i></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="review-summury float-right">
                                                <p><a href="#">3 Reviews</a></p>
                                            </div>
                                        </div>
                                        <ul class="trending-address">
                                            <li><i class="ion-ios-location"></i>
                                                <p>1301 Avenue, Brooklyn, NY 11230</p>
                                            </li>
                                            <li><i class="ion-ios-telephone"></i>
                                                <p>+44 20 7336 8898</p>
                                            </li>
                                            <li><i class="ion-android-globe"></i>
                                                <p>www.burgerandlobster.com</p>
                                            </li>

                                        </ul>

                                        <div class="trending-bottom mar-top-15 pad-bot-30">
                                            <div class="trend-left float-left">
                                                <span class="round-bg red"><i class="icofont-travelling"></i></span>
                                                <p><a href="#">Travel</a></p>
                                            </div>
                                            <div class="trend-right float-right">
                                                <div class="trend-open"><i class="ion-clock"></i>
                                                    Open <p>till 10.00pm</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-slide trending-place-item">
                                    <div class="trending-img">
                                        <img src="images/category/places/place-4.jpg" alt="#">
                                        <span class="trending-rating-green">8</span>
                                        <span class="save-btn"><i class="icofont-heart"></i></span>
                                    </div>
                                    <div class="trending-title-box">
                                        <h4><a href="single-listing-one.html">The Katikies</a></h4>
                                        <div class="customer-review">
                                            <div class="rating-summary float-left">
                                                <div class="rating-result" title="60%">
                                                    <ul class="product-rating">
                                                        <li><i class="ion-android-star"></i></li>
                                                        <li><i class="ion-android-star"></i></li>
                                                        <li><i class="ion-android-star"></i></li>
                                                        <li><i class="ion-android-star-half"></i></li>
                                                        <li><i class="ion-android-star-half"></i></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="review-summury float-right">
                                                <p><a href="#">3 Reviews</a></p>
                                            </div>
                                        </div>
                                        <ul class="trending-address">
                                            <li><i class="ion-ios-location"></i>
                                                <p>1301 Avenue, Brooklyn, NY 11230</p>
                                            </li>
                                            <li><i class="ion-ios-telephone"></i>
                                                <p>+44 20 7336 8898</p>
                                            </li>
                                            <li><i class="ion-android-globe"></i>
                                                <p>www.burgerandlobster.com</p>
                                            </li>

                                        </ul>

                                        <div class="trending-bottom mar-top-15 pad-bot-30">
                                            <div class="trend-left float-left">
                                                <span class="round-bg pink"><i class="icofont-hotel"></i></span>
                                                <p><a href="#">Hotel</a></p>

                                            </div>
                                            <div class="trend-right float-right">
                                                <div class="trend-open"><i class="ion-clock"></i>
                                                    Open <p>till 10.00pm</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-slide trending-place-item">
                                    <div class="trending-img">
                                        <img src="images/category/places/place-9.jpg" alt="#">
                                        <span class="trending-rating-orange">6.5</span>
                                        <span class="save-btn"><i class="icofont-heart"></i></span>
                                    </div>
                                    <div class="trending-title-box">
                                        <h4><a href="single-listing-two.html">Genji Restaurant</a></h4>
                                        <div class="customer-review">
                                            <div class="rating-summary float-left">
                                                <div class="rating-result" title="60%">
                                                    <ul class="product-rating">
                                                        <li><i class="ion-android-star"></i></li>
                                                        <li><i class="ion-android-star"></i></li>
                                                        <li><i class="ion-android-star"></i></li>
                                                        <li><i class="ion-android-star-half"></i></li>
                                                        <li><i class="ion-android-star-half"></i></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="review-summury float-right">
                                                <p><a href="#">3 Reviews</a></p>
                                            </div>
                                        </div>
                                        <ul class="trending-address">
                                            <li><i class="ion-ios-location"></i>
                                                <p>1301 Avenue, Brooklyn, NY 11230</p>
                                            </li>
                                            <li><i class="ion-ios-telephone"></i>
                                                <p>+44 20 7336 8898</p>
                                            </li>
                                            <li><i class="ion-android-globe"></i>
                                                <p>www.burgerandlobster.com</p>
                                            </li>
                                        </ul>
                                        <div class="trending-bottom mar-top-15 pad-bot-30">
                                            <div class="trend-left float-left">
                                                <span class="round-bg green"><i class="icofont-fast-food"></i></span>
                                                <p><a href="#">Restaurant</a></p>
                                            </div>
                                            <div class="trend-right float-right">
                                                <div class="trend-open"><i class="ion-clock"></i>
                                                    Open <p>till 10.00pm</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-slide trending-place-item">
                                    <div class="trending-img">
                                        <img src="images/category/places/place-11.jpg" alt="#">
                                        <span class="trending-rating-green">8</span>
                                        <span class="save-btn"><i class="icofont-heart"></i></span>
                                    </div>
                                    <div class="trending-title-box">
                                        <h4><a href="single-listing-one.html">The Straling</a></h4>
                                        <div class="customer-review">
                                            <div class="rating-summary float-left">
                                                <div class="rating-result" title="60%">
                                                    <ul class="product-rating">
                                                        <li><i class="ion-android-star"></i></li>
                                                        <li><i class="ion-android-star"></i></li>
                                                        <li><i class="ion-android-star"></i></li>
                                                        <li><i class="ion-android-star-half"></i></li>
                                                        <li><i class="ion-android-star-half"></i></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="review-summury float-right">
                                                <p><a href="#">3 Reviews</a></p>
                                            </div>
                                        </div>
                                        <ul class="trending-address">
                                            <li><i class="ion-ios-location"></i>
                                                <p>1301 Avenue, Brooklyn, NY 11230</p>
                                            </li>
                                            <li><i class="ion-ios-telephone"></i>
                                                <p>+44 20 7336 8898</p>
                                            </li>
                                            <li><i class="ion-android-globe"></i>
                                                <p>www.burgerandlobster.com</p>
                                            </li>
                                        </ul>
                                        <div class="trending-bottom mar-top-15 pad-bot-30">
                                            <div class="trend-left float-left">
                                                <span class="round-bg green"><i class="ion-ios-cart"></i></span>
                                                <p><a href="#">Shop</a></p>
                                            </div>
                                            <div class="trend-right float-right">
                                                <div class="trend-closed">
                                                    closed
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="trending-pagination"></div>
                    </div>
                </div>
            </div>
        </div>
        <!--Trending Place ends-->
        <!--Coupon starts-->
        <div class="coupon-section section-padding">
            <div class="container ">
                <div class="row">
                    <div class="col-md-8 offset-md-2 text-center">
                        <h2 class="section-title v1"> Coupons &amp; Deals</h2>
                    </div>
                    <div class="col-md-12">
                        <div class="swiper-container coupon-wrap">
                            <div class="swiper-wrapper pad-bot-15">
                                <div class="swiper-slide coupon-content">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="coupon-img">
                                                <img class="img-fluid" src="images/category/coupon/3.jpg" alt="...">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="coupon-desc float-right">
                                                <h4>30% Discount</h4>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean id porta leo.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row align-items-center">
                                        <div class="col-md-6">
                                            <div class="coupon-owner mar-top-20">
                                                <a href="single-listing-one.html">Favola Restaurant</a>
                                                <a href="#" class="rating">
                                                    <i class="ion-android-star"></i>
                                                    <i class="ion-android-star"></i>
                                                    <i class="ion-android-star"></i>
                                                    <i class="ion-android-star"></i>
                                                    <i class="ion-android-star-half"></i>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="float-left">
                                                <a class="btn v1" data-toggle="modal" data-target="#coupon_wrap">
                                                    Get Coupon
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-slide coupon-content">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="coupon-img">
                                                <img class="img-fluid" src="images/category/coupon/5.jpg" alt="...">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="coupon-desc float-right">
                                                <h4>20% Off</h4>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean id porta leo.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row align-items-center">
                                        <div class="col-md-6">
                                            <div class="coupon-owner mar-top-20">
                                                <a href="single-listing-one.html">Orion Spa</a>
                                                <a href="#" class="rating">
                                                    <i class="ion-android-star"></i>
                                                    <i class="ion-android-star"></i>
                                                    <i class="ion-android-star"></i>
                                                    <i class="ion-android-star-half"></i>
                                                    <i class="ion-android-star-half"></i>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="float-left">
                                                <a class="btn v1" data-toggle="modal" data-target="#coupon_wrap">
                                                    Get Coupon
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-slide coupon-content">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="coupon-img">
                                                <img class="img-fluid" src="images/category/coupon/4.jpg" alt="...">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="coupon-desc float-right">
                                                <h4>25% Discount</h4>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean id porta leo.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row align-items-center">
                                        <div class="col-md-6">
                                            <div class="coupon-owner mar-top-20">
                                                <a href="single-listing-one.html">Hotel La Muro</a>
                                                <a href="#" class="rating">
                                                    <i class="ion-android-star"></i>
                                                    <i class="ion-android-star"></i>
                                                    <i class="ion-android-star"></i>
                                                    <i class="ion-android-star-half"></i>
                                                    <i class="ion-android-star-half"></i>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="float-left">
                                                <a class="btn v1" data-toggle="modal" data-target="#coupon_wrap">
                                                    Get Coupon
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-slide coupon-content">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="coupon-img">
                                                <img class="img-fluid" src="images/category/coupon/1.jpg" alt="...">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="coupon-desc float-right">
                                                <h4>50% OFF</h4>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean id porta leo.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row align-items-center">
                                        <div class="col-md-6">
                                            <div class="coupon-owner mar-top-20">
                                                <a href="single-listing-one.html">Penguin Shop</a>
                                                <a href="#" class="rating">
                                                    <i class="ion-android-star"></i>
                                                    <i class="ion-android-star"></i>
                                                    <i class="ion-android-star"></i>
                                                    <i class="ion-android-star-half"></i>
                                                    <i class="ion-android-star-half"></i>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="float-left">
                                                <a class="btn v1" data-toggle="modal" data-target="#coupon_wrap">
                                                    Get Coupon
                                                </a>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                            </div>
                        </div>
                        <div class="slider-btn v1 coupon-next"><i class="ion-arrow-right-c"></i></div>
                        <div class="slider-btn v1 coupon-prev"><i class="ion-arrow-left-c"></i></div>
                        <div class="modal fade" id="coupon_wrap">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title" id="myModalLabel">Get a Coupon</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="ion-ios-close-empty"></i></span></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="modal-coupon-code">
                                            <div class="store-content">
                                                <div class="text">
                                                    Stores :
                                                    <span> La Poma ,</span>
                                                    <span>Gucci</span>
                                                </div>
                                                <div class="store-content">Cashback : <span>25% cashback </span></div>
                                                <div class="store-content">Valid till : <span>25-5-2019 </span></div>
                                                <div class="cashback-text">
                                                    <p>Cashback will be added in your wallet in next 5 Minute of your purchase.</p>
                                                </div>
                                            </div>
                                            <div class="coupon-code">
                                                <h5>
                                                    Coupon Code: <span class="coupon-code-wrapper">
                                                        <i class="fa fa-scissors"></i>
                                                        12345
                                                    </span>
                                                </h5>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="coupon-bottom">
                                        <div class="float-left"><a href="single-listing-one.html" class="btn v1">Go to Deal</a></div>
                                        <button type="button" class="btn v1 float-right" data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Coupon ends-->
        <!--mobile app start-->
        <div class="app-section section-padding pad-top-70" style="background-image: url(images/bg/bg2.png)">
            <div class="container">
                <div class="row">
                    <div class="col-md-7">
                        <div class="app-content">
                            <h2>Looking for the Best Service Provider? <span>Get the App!</span></h2>
                            <ul>
                                <li><i class="ion-android-checkbox-outline" aria-hidden="true"></i> Find nearby listings</li>
                                <li><i class="ion-android-checkbox-outline" aria-hidden="true"></i> Easy service enquiry</li>
                                <li><i class="ion-android-checkbox-outline" aria-hidden="true"></i> Listing reviews and ratings</li>
                                <li><i class="ion-android-checkbox-outline" aria-hidden="true"></i> Manage your listing, enquiry and reviews</li>
                            </ul>
                            <div class="device-logo mar-top-40 xs-center">
                                <a href="#"><img src="images/others/android.png" alt="..."> </a>
                                <a href="#"><img src="images/others/apple.png" alt="..."> </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="app-img text-center">
                            <img src="images/others/app-image-1.png" alt="...">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--mobile app ends-->
        <!--Testimonial Section start-->
            @include('includes._testimonial')
        <!--Testimonial Section ends-->
        <!--Blog Posts starts-->
            @include('includes._posts')
        <!--Blog Posts ends-->
        <!-- Scroll to top starts-->
        <span class="scrolltotop"><i class="ion-arrow-up-c"></i></span>
        <!-- Scroll to top ends-->
    </div>
    <!--Page Wrapper ends-->
    <!--Footer Starts-->
    @include('includes._footer')
    <!--Footer ends-->
    @endsection
   
    