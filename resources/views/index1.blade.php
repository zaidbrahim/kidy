@extends('layouts.app')

@section('content')
@include('includes._navbar')
<div class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center bg-light">
    <div class="col-md-5 p-lg-5 mx-auto my-5">
        <h1 class="display-4 font-weight-normal">Annuaire</h1>
        <p class="lead font-weight-normal">Rechercher les meilleurs écoles parmis plus de 25 000 établissements scolaires privés ou publiques au Maroc.</p>
        <p class="lead font-weight-normal">Voulez-vous ajouter une nouvelle école?</p>
        <a class="btn btn-outline-secondary" href="#">Cliquez ici!</a>
    </div>
    <div class="product-device shadow-sm d-none d-md-block"></div>
    <div class="product-device product-device-2 shadow-sm d-none d-md-block"></div>
</div>
<div class="container-fluid" id="app">
  <div class="row">
    @foreach($etablissements as $etablissement)
    <div class="col-md-3">
      <div class="card mb-4 shadow-sm">
      <div class="card-body">
        <div class="text-center">
          @if($etablissement->photo == 'default.png')
          <img class="img-fluid" src="img/default.png" alt="">          
          @else
            <img class="img-fluid" src="img/etablissement/{{ $etablissement->photo }}" alt="{{ $etablissement->etablissement }}">          
          @endif
        </div>
        <h5 class="text-info mt-3"><small>{{ $etablissement->etablissement }}</small></h5>
        <p class="card-text mt-1 mb-4" style="height: 20px !important"><small><strong>{{ $etablissement->adresse}}</strong></small></p>
        <div class="row mt-1 mb-2">
          <div class="col-md-6">
            <i class="fas fa-phone-square"></i> {{ $etablissement->tel }}
          </div>
          @if($etablissement->fax)
          <div class="col-md-6">
            <i class="fas fa-fax"></i> {{ $etablissement->fax }}
          </div>
          @endif
        </div>
        
        <div class="row mb-2">
          <div class="col-md-6">
            @if($etablissement->site_web)
              <a href="{{ $etablissement->site_web }}" target="_blank"><i class="fas fa-globe"></i> Site web</a>
            @else
              <i class="fas fa-globe"></i> Site web
            @endif
          </div>
          <div class="col-md-6">
            <i class="fas fa-city"></i> {{ $etablissement->ville->ville }}
          </div>
        </div>     

        <div class="row mb-2">
          <div class="col-md-12">
              <!-- Large modal -->
              <a href="" target="_blank" rel="" data-toggle="modal" data-target=".bd-example-modal-lg-{{ $etablissement->id}}">maps</a>
              <div class="modal fade bd-example-modal-lg-{{ $etablissement->id}}" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel-{{ $etablissement->id}}" aria-hidden="true">
                <div class="modal-dialog modal-lg-{{ $etablissement->id}}">
                  <div class="modal-content">
                  {!! $etablissement->maps !!}
                  </div>
                </div>
              </div>
          </div>
        </div>
        <div class="row mb-2">
          <div class="col-md-12">
          </div>
        </div>
      </div>
      </div>
    </div>
    @endforeach
  </div>
</div>
@endsection