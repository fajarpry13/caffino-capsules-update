@extends('backend.layouts.app')

@section('title', 'File Manager')

@section('content')
    <x-backend.card>
        <x-slot name="header">
            <h4 class="card-title mb-0">
                File Manager
            </h4>
        </x-slot>

        <x-slot name="body">
            <div class="embed-responsive embed-responsive-16by9">
                <iframe class="embed-responsive-item" src="{{ asset('filemanager/dialog.php?type=0&akey=caffino_responsive_file_manager') }}" allowfullscreen></iframe>
            </div>
        </x-slot>
    </x-backend.card>
@endsection