@extends('backend.layouts.app')

@section('title', __('Setting Media Sosial'))

@section('content')
    <div class="row">
        <div class="col-8">
            <form action="{{ route('admin.setting.sosmed.update', $link) }}" method="POST">
                @csrf
                @method('PUT')
                <x-backend.card>
                    <x-slot name="header">
                        Media Sosial
                    </x-slot>
        
                    <x-slot name="body">
                        <div class="form-group row">
                            <label for="linkInstagram" class="col-sm-2 col-form-label">Link Instagram</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="linkInstagram" name="link_instagram" value="{{ $link['link_instagram'] }}">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="linkTiktok" class="col-sm-2 col-form-label">Link Tiktok</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="linkTiktok" name="link_tiktok" value="{{ $link['link_tiktok'] }}">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="linkFacebook" class="col-sm-2 col-form-label">Link Facebook</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="linkFacebook" name="link_facebook" value="{{ $link['link_facebook'] }}">
                            </div>
                            </div>
                        <div class="form-group row">
                            <label for="linkYoutube" class="col-sm-2 col-form-label">Link Youtube</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="linkYoutube" name="link_youtube" value="{{ $link['link_youtube'] }}">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="linkTwitter" class="col-sm-2 col-form-label">Link Twitter</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="linkTwitter" name="link_twitter" value="{{ $link['link_twitter'] }}">
                            </div>
                        </div>
                    </x-slot>
                    
                    <x-slot name="footer">
                        <div>
                            <button class="btn btn-sm btn-primary float-right" type="submit">@lang('Update')</button>
                        </div>
                    </x-slot>
                </x-backend.card>
            </form>
        </div>
    </div>
@endsection
