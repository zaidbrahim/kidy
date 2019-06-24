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

        <!--Blog Posts starts-->
        @include('includes._categories')
        <!--Blog Posts ends-->

        <!--Promo Category starts-->
            @include('includes._city')
        <!--Promo Category ends-->

        <!--Popular City starts-->
            <!-- @include('includes._city') -->
        <!--Popular City ends-->

        <!--Trending events starts-->
            @include('includes._lasts')        
        <!--Trending events ends-->
        

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
            <!-- @include('includes._testimonial') -->
        <!--Testimonial Section ends-->
       
        <!-- Scroll to top starts-->
        <span class="scrolltotop"><i class="ion-arrow-up-c"></i></span>
        <!-- Scroll to top ends-->
    </div>
    <!--Page Wrapper ends-->
    <!--Footer Starts-->
    @include('includes._footer')
    <!--Footer ends-->
    @endsection
   
    