<div class="popular-catagory pad-bot-50 section-padding">
    <div class="container">
        <div class="row">
            <div class="col-md-8 offset-md-2 text-center">
                <h2 class="section-title v1">Explore What To do</h2>
            </div>
            @foreach($categories as $categorie)
            <div class="col-md-3">
                <a href="grid-fullwidth.html">
                    <div class="popular-catagory-content">
                        <div class="popular-catagory-img">
                            <img src="img/categories/{!! $categorie->categorie_image !!}" alt="hotel" class="img_fluid">
                        </div>
                        <div class="cat-content">
                            <h6 class="title">{!! $categorie->categorie !!}</h6>
                            <span>{{ $categorie->etablissements->count() }}</span>
                        </div>
                    </div>
                </a>
            </div>
            @endforeach
        </div>
    </div>
</div>