
<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Laravel</title>
    <script src="http://demo.itsolutionstuff.com/plugin/jquery.js"></script>      
     <link rel="stylesheet" href="http://demo.itsolutionstuff.com/plugin/bootstrap-3.min.css">

</head>
<body>


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
                                @foreach($countries as $key => $value)
                                    <option value="{{ $key }}">{{ $value}}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-lg-4 col-md-12">
                            <select class="hero__form-input custom-select" name="zone" id="zone">
                                <option value="">Zone</option>
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


<script type="text/javascript">
    $(document).ready(function() {
        $('select[name="ville"]').on('change', function() {
            var countryID = $(this).val();
            if(countryID) {
                $.ajax({
                    url: '/myform/ajax/'+countryID,
                    type: "GET",
                    dataType: "json",
                    success:function(data) {
                        $('select[name="zone"]').empty();
                        $.each(data, function(key, value) {
                            $('select[name="zone"]').append('<option value="'+ key +'">'+ value +'</option>');
                        });
                    }
                });
            }else{
                $('select[name="zone"]').empty();
            }
        });
    });
</script>
<script src="{{ asset('js/main.js') }}"></script>
<script src="{{ asset('js/plugin.js') }}"></script>


</body>
</html>