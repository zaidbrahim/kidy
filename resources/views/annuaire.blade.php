@extends('layouts.app')

@section('content')
   
    <!--Page Wrapper starts-->
    <div class="page-wrapper">
        <!--header starts-->
        @include('includes._header')
        <!--Header ends-->
        <!--Listing section starts-->
        <div class="filter-wrapper style1 mar-top-100 half-map">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-7 col-md-12">
                        <div class="form-group filter-group">
                            <div class="row">
                                <div class="col-md-6 col-12">
                                    <input type="text" class="form-control filter-input" id="search-filter" name="search-bar" placeholder="I'm looking for . . .">
                                </div>
                                <div class="col-md-6  col-12">
                                    <input type="text" class="form-control filter-input" id="location-filter" name="search-bar" placeholder="Location">
                                </div>
                                <div class="col-md-12  col-12">
                                    <select class="filter-input" id="option-select" style="display: none;">
                                        <option>Select Categories</option>
                                        <option>Art's</option>
                                        <option>Health</option>
                                        <option>Hotels</option>
                                        <option>Real Estate</option>
                                        <option>Rentals</option>
                                    </select>
                                </div>
                                <div class="col-md-12">
                                    <div class="filter-sub-area style1">
                                        <div class="filter-title  mar-top-20 mar-bot-15">
                                            <p>Choose distance : <span><input type="text" id="amount"></span></p>
                                        </div>
                                        <div id="slider-range" class="price-range mar-bot-40"></div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-12">
                                    <div class="filter-sub-menu style1">
                                        <ul>
                                            <li class="has-sub"><a href="# ">More Filters</a>
                                                <ul class="explore__form-checkbox-list half-filter">
                                                    <div class="filter-checkbox">
                                                        <p>Sort By Features</p>
                                                        <li><input id="check-a" type="checkbox" name="check">
                                                            <label for="check-a">Open Now</label></li>
                                                        <li> <input id="check-b" type="checkbox" name="check">
                                                            <label for="check-b">Near me</label></li>
                                                        <li><input id="check-c" type="checkbox" name="check">
                                                            <label for="check-c">Child Friendly</label></li>
                                                        <li><input id="check-d" type="checkbox" name="check">
                                                            <label for="check-d">Free Parking</label></li>
                                                        <li><input id="check-f" type="checkbox" name="check">
                                                            <label for="check-f">Events</label></li>
                                                        <li><input id="check-e" type="checkbox" name="check">
                                                            <label for="check-e">Free Wifi</label></li>
                                                    </div>
                                                    <div class="filter-checkbox">
                                                        <p>Sort By Ratings</p>
                                                        <input id="check-w" type="checkbox" name="check">
                                                        <label for="check-w">
                                                            <div class="list-ratings">
                                                                <span class="ion-android-star"></span>
                                                                <span class="ion-android-star"></span>
                                                                <span class="ion-android-star"></span>
                                                                <span class="ion-android-star"></span>
                                                                <span class="ion-android-star"></span>
                                                            </div>
                                                        </label>
                                                        <input id="check-x" type="checkbox" name="check">
                                                        <label for="check-x">
                                                            <div class="list-ratings">
                                                                <span class="ion-android-star"></span>
                                                                <span class="ion-android-star"></span>
                                                                <span class="ion-android-star"></span>
                                                                <span class="ion-android-star"></span>
                                                                <span class="ion-ios-star-outline"></span>
                                                            </div>
                                                        </label>
                                                        <input id="check-y" type="checkbox" name="check">
                                                        <label for="check-y">
                                                            <div class="list-ratings">
                                                                <span class="ion-android-star"></span>
                                                                <span class="ion-android-star"></span>
                                                                <span class="ion-android-star"></span>
                                                                <span class="ion-ios-star-outline"></span>
                                                                <span class="ion-ios-star-outline"></span>
                                                            </div>
                                                        </label>
                                                        <input id="check-z" type="checkbox" name="check">
                                                        <label for="check-z">
                                                            <div class="list-ratings">
                                                                <span class="ion-android-star"></span>
                                                                <span class="ion-android-star"></span>
                                                                <span class="ion-ios-star-outline"></span>
                                                                <span class="ion-ios-star-outline"></span>
                                                                <span class="ion-ios-star-outline"></span>
                                                            </div>
                                                        </label>
                                                    </div>
                                                    <div class="filter-checkbox">
                                                        <p>Sort By tags</p>
                                                        <input id="check-ab" type="checkbox" name="check">
                                                        <label for="check-ab">Hotel</label>
                                                        <input id="check-bc" type="checkbox" name="check">
                                                        <label for="check-bc">Restaurant</label>
                                                        <input id="check-cd" type="checkbox" name="check">
                                                        <label for="check-cd">sports</label>
                                                        <input id="check-df" type="checkbox" name="check">
                                                        <label for="check-df">travel </label>
                                                    </div>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-md-6  col-12 text-right sm-left">
                                    <button type="submit" class="btn v1 mar-top-10">Apply</button>
                                </div>
                            </div>
                        </div>
                        <div class="row mar-top-25 pad-bot-30 align-items-center">
                            <div class="col-lg-4 col-sm-4 col-12">
                                <!-- <div class="item-view-mode res-box"> -->
                                    <!-- item-filter-list start -->
                                    <!-- <ul class="nav item-filter-list" role="tablist">
                                        <li><a data-toggle="tab" href="#grid-view" class=><i class="ion-grid"></i></a></li>
                                        <li><a class="active" data-toggle="tab" href="#list-view"><i class="ion-ios-list"></i></a></li>
                                    </ul> -->
                                    <!-- item-filter-list end -->
                                <!-- </div> -->
                            </div>
                            <div class="col-lg-8 col-sm-8 col-12">
                                <div class="item-element res-box  text-right xs-left">
                                    <p>Total <span>{{ $etablissements->count() }}</span> Listings</p>
                                </div>
                            </div>
                        </div>
                        <!-- listing -->
                        <div class="item-wrapper">
                            <div class="tab-content">
                                <div id="grid-view" class="tab-pane active product-grid">
                                    <div class="row">
                                        @foreach($etablissements as $etablissement)
                                        <div class="col-xl-6 col-lg-12">
                                            <div class="trending-place-item">
                                                <div class="trending-img">
                                                @if($etablissement->photo == 'default.png')
                                                    <img class="img-fluid" src="{{ asset('img/default.png') }}" alt="">          
                                                @else
                                                    <img class="img-fluid" src="{{ asset('img/etablissement/'.$etablissement->photo) }}" alt="{{ $etablissement->etablissement }}">          
                                                @endif
                                                    <!-- <span class="trending-rating-green">New</span> -->
                                                    <span class="save-btn"><i class="icofont-heart"></i></span>
                                                </div>
                                                <div class="trending-title-box">
                                                    <h5><a href="single-listing-one.html">{!! $etablissement->etablissement !!}</a></h5>
                                                    <!-- <div class="customer-review">
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
                                                    </div> -->
                                                    <ul class="trending-address">
                                                        <li><i class="ion-ios-location"></i>
                                                            <p>{!! $etablissement->adresse !!}</p>
                                                        </li>
                                                        <li><i class="ion-ios-telephone"></i>
                                                            <p>{!! $etablissement->tel !!}</p>
                                                        </li>
                                                        <li><i class="ion-android-globe"></i>
                                                        @if($etablissement->site_web)
                                                            <a href="{{ $etablissement->site_web }}" target="_blank"><i class="fas fa-globe"></i> <p>{!! $etablissement->site_web !!}</p></a>
                                                        @else
                                                            <i class="fas fa-globe"></i><p> Site web</p>
                                                        @endif
                                                        </li>
                                                    </ul>
                                                    <div class="trending-bottom mar-top-15 pad-bot-30">
                                                        <div class="trend-left float-left">
                                                            <span class="round-bg green"><i class="{!! $etablissement->categorie->categorie_icon !!}"></i></span>
                                                            <p><a href="#">{!! $etablissement->categorie->categorie !!}</a></p>
                                                        </div>
                                                        <div class="trend-right float-right">
                                                            <div class="trend-open mar-top-5"><i class="ion-ios-location"></i> {!! $etablissement->ville->ville !!}</div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        @endforeach
                                    </div>
                                </div>
                                <!--pagination starts-->
                                <div class="post-nav nav-res pad-bot-80">
                                    <div class="row">
                                        <div class="col-md-8 offset-md-2 col-xs-12 ">
                                            <div class="text-center">
                                            @php
                                                if(isset($_GET['perpage'])){
                                                    $page = $_GET['page'];
                                                }
                                                else{
                                                    $page = '1';
                                                }

                                                if(isset($_GET['ville'])){
                                                    $ville = $_GET['ville'];
                                                }
                                                
                                                if(isset($_GET['categorie'])){
                                                    $categorie = $_GET['categorie'];
                                                }

                                                if(isset($_GET['search'])){
                                                    $search = $_GET['search'];
                                                }

                                            @endphp
                                            
                                            @if(isset($search) || isset($ville) || isset($categorie))
                                                @php
                                                    $url = url('search?&search='.$search.'&ville='.$ville.'&categorie='.$categorie);
                                                @endphp
                                                    {{$etablissements->withPath($url)}}
                                                @else
                                                    {{ $etablissements->render()}}

                                            @endif

                                            
                                            <!-- {{ $etablissements->render()}} -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--pagination ends-->
                            </div>
                        </div>
                    </div>
                    <div class="explore__map-side">
                        <div id="map_right_listing"></div>
                    </div>
                </div>
            </div>
        </div>
        <!--Listing section ends-->
        <!-- Scroll to top starts-->
        <span class="scrolltotop"><i class="ion-arrow-up-c"></i></span>
        <!-- Scroll to top ends-->
    </div>
@endsection