<div class="form-group filter-group">
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