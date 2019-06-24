<div class="popular-cities mar-bot-10 pad-top-10">
    <div class="container">
        <div class="row">
            <div class="col-md-8 offset-md-2 text-center">
                <h2 class="section-title v1">Etablissements pour enfant par ville</h2>
            </div>
            <div class="col-md-12">
                <div class="swiper-container popular-place-wrap">
                    <div class="swiper-wrapper">
                        @foreach($villes as $ville)
                            <div class="swiper-slide popular-item">
                                <div class="single-place">
                                    @if($ville->image == 'default.png')
                                        <img class="img-fluid" src="img/default.png" alt="">          
                                    @else
                                        <img class="img-fluid" src="img/villes/{{ $ville->image }}" alt="{{ $ville->ville }}">          
                                    @endif
                                    <div class="single-place-content">
                                        <h2 class="single-place-title">
                                            <a href="{{ route('annuaire.ville', ['ville' => $ville->id]) }}">{!! $ville->ville !!}</a>
                                        </h2>
                                        <a class="btn v6 explore-place" href="{{ route('annuaire.ville', ['ville' => $ville->id]) }}">Explorer</a>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
                <div class="slider-btn v1 popular-next"><i class="ion-arrow-right-c"></i></div>
                <div class="slider-btn v1 popular-prev"><i class="ion-arrow-left-c"></i></div>
            </div>
        </div>
    </div>
</div>