<div class="hero v1 section-padding bg-zoom">
    <div class="overlay op-3"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-12 text-center">
                <h1 class="hero__title places-tab">
                    Annuaire des Écoles Privées au Maroc
                </h1>
                <h1 class="hero__title events-tab">
                    Explore great events.
                </h1>
                <p class="hero__description">
                    Recherchez parmi nos 12 606 références !
                </p>
            </div>
            <div class="col-md-12 text-center mar-top-20">
                <ul class="hero__list">
                    <li class="hero__list-item">
                        <a class="place active-list" href="#">Recherche</a>
                    </li>
                    <!-- <li class="hero__list-item">
                        <a class="events" href="#">Events<i class="icofont-list"></i></a>
                    </li> -->
                </ul>
                <form action="{{route('search')}}" method="GET" class="hero__form v1 bg-white">                        
                    <!-- {{ csrf_field() }} -->
                    <div class="row">
                        <div class="col-lg-12 col-md-12">
                            <input class="hero__form-input custom-select" type="text" name="search" id="search" placeholder="Que cherchez vous ?" />
                        </div>
                        <div class="col-lg-4 col-md-12">
                            <select class="form-control form-control-sm custom-select" name="categorie">
                                <option value="">Type d'établissement</option>
                                @foreach($categories as $categorie)
                                    <option value="{{ $categorie->id }}">{!! $categorie->categorie !!}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-lg-4 col-md-12">
                            <select class="form-control form-control-sm custom-select form-control form-control-sm" name="ville" id="ville">
                                <option value="">Ville</option>
                                @foreach($cities as $key => $value)
                                    <option value="{{ $key }}">{!! $value !!}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-lg-4 col-md-12">
                            <select class="form-control form-control-sm custom-select" name="zone" id="zone">
                                <option value="">Zone</option>
                            </select>
                        </div>

                        <div class="col-lg-12 text-right mar-top-20">
                            <div class="submit_btn">
                                <button class="btn v3" type="submit"><i class="ion-search" aria-hidden="true"></i> Chercher</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
@section('javascripts')
    <script>
        $(document).ready(function(){
            $('select[name="ville"]').on('change', function(){
                var villeID = $(this).val();
                if(villeID){
                    $.ajax({
                        url: '/getZones/'+villeID,
                        type: 'GET',
                        dataType: 'json',
                        success: function(data){
                            if(data){
                                $('select[name="zone"]').empty();
                                $('select[name="zone"]').append('<option value="">Toutes les zones</option>');
                                $.each(data, function(key, value){
                                    //console.log(value);
                                    $('select[name="zone"]').append('<option value="'+key+'">'+ value +'</option>');
                                });
                            }
                            else
                            {
                                $('select[name="zone"]').empty();

                            }
                        }
                    });
                }
                else{
                    console.log("makayen walou");
                    $('select[name="zone"]').empty();
                }
            });
        });
    </script>
@endsection