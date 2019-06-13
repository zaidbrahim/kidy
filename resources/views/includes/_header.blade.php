<header class="header transparent scroll-hide">
    <!--Main Menu starts-->
    <div class="site-navbar-wrap v2">
        <div class="container">
            <div class="site-navbar">
                <div class="row align-items-center">
                    <div class="col-md-4 col-6">
                        <a class="navbar-brand" href="{{ route('index') }}"><img src="{{ asset('images/logo-black.png') }}" alt="logo" class="img-fluid"></a>
                    </div>
                    <div class="col-md-8 col-6">
                        <nav class="site-navigation float-left">
                            <div class="container">
                                <ul class="site-menu js-clone-nav d-none d-lg-block">
                                    <li class="has-children">
                                        <a href="{{ route('index') }}">Home</a>
                                        
                                    </li>
                                    <li class="has-children">
                                        <a href="#">Annuaire</a>
                                        <ul class="dropdown">
                                            @foreach($categories as $categorie)
                                                <li><a href="{{ route('annuaire',['categorie'=>$categorie->slug]) }}">{!! $categorie->categorie !!}</a></li>
                                            @endforeach
                                        </ul>
                                    </li>
                                    <li class="has-children">
                                        <a href="#">Pages</a>
                                        <ul class="dropdown">
                                            <li><a href="about.html">About us</a></li>
                                            <li><a href="contact.html">Contact us</a></li>
                                            <li class="has-children">
                                                <a href="#">News Layout</a>
                                                <ul class="dropdown sub-menu">
                                                    <li><a href="news-left-sidebar.html">News Left sidebar</a></li>
                                                    <li><a href="news-right-sidebar.html">News right sidebar</a></li>
                                                    <li><a href="news-without-sidebar.html">News without sidebar</a></li>
                                                </ul>
                                            </li>
                                            <li class="has-children">
                                                <a href="#">Single News Layout</a>
                                                <ul class="dropdown sub-menu">
                                                    <li><a href="single-news-one.html">Single News one</a></li>
                                                    <li><a href="single-news-two.html">Single News two</a></li>
                                                    <li><a href="single-news-three.html">Single News three</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="404-page.html">404 error</a></li>
                                            <li><a href="add-listing.html">Add Listing</a></li>
                                            <li><a href="booking.html">Booking Page</a></li>
                                            <li><a href="booking-confirmation.html">Booking Confirmation</a></li>
                                            <li><a href="login.html">Login</a></li>
                                            <li><a href="pricing-table.html">Pricing Table</a></li>
                                            <li><a href="user-profile.html">User profile</a></li>
                                            <li><a href="faq.html">FAQ</a></li>
                                            <li><a href="invoice.html">invoice</a></li>
                                        </ul>
                                    </li>
                                    <li class="has-children">
                                        <a href="#">User Panel</a>
                                        <ul class="dropdown">
                                            <li><a href="db.html">Dashboard</a></li>
                                            <li><a href="db-my-listing.html">My Listings</a></li>
                                            <li><a href="db-bookings.html">Bookings</a></li>
                                            <li><a href="db-messages.html">Inbox</a></li>
                                            <li><a href="db-favourites.html">Favourite Listing</a></li>
                                            <li><a href="db-add-listing.html">Add Listing</a></li>
                                            <li><a href="db-recieve-reviews.html">Reviews</a></li>
                                            <li><a href="db-my-profile.html">User Profile</a></li>
                                            <li><a href="db-invoices.html">Invoices </a></li>

                                        </ul>
                                    </li>
                                    <li class="d-lg-none"><a class="btn v1" href="add-listing.html">Add Listing <i class="ion-plus-round"></i></a></li>
                                </ul>
                            </div>
                        </nav>
                        <div class="d-lg-none sm-right">
                            <a href="#" class="mobile-bar js-menu-toggle">
                                <span class="ion-android-menu"></span>
                            </a>
                        </div>
                        <div class="add-list float-right">
                            <a class="btn v8" href="add-listing.html">Add Listing <i class="ion-plus-round"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <!--mobile-menu starts -->
            <div class="site-mobile-menu">
                <div class="site-mobile-menu-header">
                    <div class="site-mobile-menu-close  js-menu-toggle">
                        <span class="ion-ios-close-empty"></span>
                    </div>
                </div>
                <div class="site-mobile-menu-body"></div>
            </div>
            <!--mobile-menu ends-->
        </div>
    </div>
    <!--Main Menu ends-->
</header>