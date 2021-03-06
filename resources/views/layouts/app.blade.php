
<!DOCTYPE html>
<html dir="ltr" lang="fr-FR">
<head>
    <!-- Metas -->
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta name="author" content="" />
    <!-- Links -->
    <link rel="icon" type="image/png" href="#" />
    <!-- google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800" rel="stylesheet">
    <!-- Plugins CSS -->
    <link href="{{ asset('css/plugin.css') }}" rel="stylesheet" />
    <!-- style CSS -->
    <link href="{{ asset('css/style.css') }}" rel="stylesheet" />
    <!--color switcher css-->
    <link rel="stylesheet" href="{{ asset('css/switcher/skin-aqua.css') }}" media="screen" id="style-colors" />
    <script src="http://demo.itsolutionstuff.com/plugin/jquery.js"></script>
   @yield('maps_js')
    <!-- Document Title -->
    <title>KID'In</title>
</head>
<body>
@yield('content')
<!--Scripts starts-->

<!--plugin js-->
<script src="{{ asset('js/plugin.js') }}"></script>
<!--google maps-->
<!-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD_8C7p0Ws2gUu7wo0b6pK9Qu7LuzX2iWY&amp;libraries=places&amp;callback=initAutocomplete"></script>
<script src="{{ asset('js/maps.js') }}"></script> -->
<!--Main js-->
<script src="{{ asset('js/main.js') }}"></script>

@yield('javascripts')
<!--Scripts ends-->
</body>
</html>