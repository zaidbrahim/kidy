<div class="hero-catagory mar-top-30 section-padding">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="hero-catagory-wrapper v1 text-center">
                    @foreach($categories as $categorie)
                    <a href="grid-fullwidth.html" class="hero-category-content v1">
                        <i class="{{ $categorie->categorie_icon}}"></i>
                        <p class="name">{{ $categorie->categorie }}</p>
                        <p class="d-name">22 Locations</p>
                    </a>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
</div>