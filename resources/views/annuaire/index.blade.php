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
                        @include('includes._filter')
                        <!-- listing -->
                        <div class="item-wrapper mar-top-50">
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
                        @include('includes._maps')
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

@section('maps_js')
    {!! $map['js'] !!}
@endsection