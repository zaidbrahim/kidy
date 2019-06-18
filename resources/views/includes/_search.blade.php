<div class="hero v1 section-padding bg-zoom">
    <div class="overlay op-3"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-12 text-center">
                <h1 class="hero__title places-tab">
                    Annuaire des Écoles Privées
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
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-lg-4 col-md-12">
                            <select class="hero__form-input custom-select dynamic" name="ville" id="ville">
                                <option value="">Ville</option>
                                @foreach($villes as $ville)
                                    <option value="{{ $ville->id }}">{!! $ville->ville !!}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-lg-4 col-md-12">
                            <select class="hero__form-input custom-select" name="zone" id="zone">
                                <option value="">Zone</option>
                            </select>
                        </div>
                        <div class="col-lg-4 col-md-12">
                            <select class="hero__form-input custom-select" name="categorie">
                                <option value="">Type d'établissement</option>
                                @foreach($categories as $categorie)
                                    <option value="{{ $categorie->id }}">{!! $categorie->categorie !!}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <br>
                    <div class="row justify-content-end">
                        <div class="col-2">
                        <div class="submit_btn">
                                <button class="btn v3 text-right" type="submit"><i class="ion-search" aria-hidden="true"></i> Chercher</button>
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
                var ville_id = $(this).val();
                if(ville_id){  
                    $.ajax({
                        url: '/getZones/'+ville_id,
                        type: 'GET',
                        dataType: 'json',
                        success: function(data){
                            $('select[name="zone"]').empty();
                            $.each(data, function(value){
                                // console.log(value.zone);
                                $('select[name="zone"]').append('<option value="'+value.id+'">'+ value.zone +'</option>');
                            });
                        }
                    });
                }
                else{
                    $('select[name="zone"]').empty();
                }
            });
        });
    </script>
@endsection