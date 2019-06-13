<div class="trending-places section-padding pad-bot-130">
    <div class="container">
        <div class="row">
            <div class="col-md-8 offset-md-2 text-center">
                <h2 class="section-title v1">What's happening?</h2>
            </div>
            <div class="col-md-12">
                <div class="swiper-container trending-place-wrap">
                    <div class="swiper-wrapper">
                        @foreach($lasts as $last)
                        <div class="swiper-slide trending-place-item">
                            <div class="trending-img">
                                @if($last->photo == 'default.png')
                                    <img class="img-fluid" src="img/default.png" alt="">          
                                @else
                                    <img class="img-fluid" src="img/etablissement/{{ $last->photo }}" alt="{{ $last->etablissement }}">          
                                @endif
                                <span class="trending-rating-green">New</span>
                                <span class="save-btn"><i class="icofont-heart"></i></span>
                            </div>
                            <div class="trending-title-box">
                                <h5><a href="single-listing-one.html">{!! $last->etablissement !!}</a></h5>
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
                                        <p>{!! $last->adresse !!}</p>
                                    </li>
                                    <li><i class="ion-ios-telephone"></i>
                                        <p>{!! $last->tel !!}</p>
                                    </li>
                                    <li><i class="ion-android-globe"></i>
                                    @if($last->site_web)
                                    <a href="{{ $last->site_web }}" target="_blank"><i class="fas fa-globe"></i> <p>{!! $last->site_web !!}</p></a>
                                    @else
                                    <i class="fas fa-globe"></i> Site web
                                    @endif
                                        
                                    </li>
                                </ul>
                                <div class="trending-bottom mar-top-15 pad-bot-30">
                                    <div class="trend-left float-left">
                                        <span class="round-bg green"><i class="{!! $last->categorie->categorie_icon !!}"></i></span>
                                        <p><a href="#">{!! $last->categorie->categorie !!}</a></p>
                                    </div>
                                    <!-- <div class="trend-right float-right">
                                        <div class="trend-open mar-top-5"><i class="ion-clock"></i> 2.30 pm</div>
                                    </div> -->
                                </div>
                            </div>
                        </div>
                        @endforeach
                    </div>
                </div>
                <div class="trending-pagination"></div>
            </div>
        </div>
    </div>
</div>