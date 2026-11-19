{{-- @dd($banner->isPublish()) --}}
@extends('backend.layouts.app')

@section('title', __('Setting Banner Home Page'))

@section('content')
<div class="row">
    <div class="col-10">
        <form action="{{ route('admin.setting.banner.store') }}" method="POST">
            @csrf
            <x-backend.card>
                <x-slot name="header">
                    @lang('Edit Banner Home Page')
                </x-slot>

                <x-slot name="headerActions">
                    <x-utils.link
                        icon="c-icon cil-arrow-circle-left"
                        class="card-header-action"
                        :href="route('admin.setting.banner')"
                        :text="__('Back')"
                    />
                </x-slot>

                <x-slot name="body">
                    <div class="form-group">
                        <label for="banner"><h6>Gambar Banner Desktop</h6></label>
                        <div class="input-group">
                            <input type="text" class="form-control" name="source" id="BannerHomeDesktop" value="" readonly>
                            <div class="input-group-append">
                                <a type="button" class="btn btn-secondary" for="BannerHomeDesktop" href="{{ asset('filemanager/dialog.php?type=1&field_id=BannerHomeDesktop&akey=caffino_responsive_file_manager') }}" data-toggle="modal" data-target="#modalBannerDesktop">Choose</a>
                            </div>
                        </div>
                        <sub>
                            <i>&nbsp;Recomended Dimension 1920 x 1080 pixels . File size limit 1 MB.</i>
                            <br><i>&nbsp;Allowed Type: jpg, png.</i>
                        </sub>
                    </div>
                    <div class="form-group">
                        <label for="banner"><h6>Gambar Banner Mobile</h6></label>
                        <div class="input-group">
                            <input type="text" class="form-control" name="source_mobile" id="BannerHomeMobile" value="" readonly>
                            <div class="input-group-append">
                                <a type="button" class="btn btn-secondary" for="BannerHomeMobile" href="{{ asset('filemanager/dialog.php?type=1&field_id=BannerHomeMobile&akey=caffino_responsive_file_manager') }}" data-toggle="modal" data-target="#modalBannerMobile">Choose</a>
                            </div>
                        </div>
                        <sub>
                            <i>&nbsp;Recomended Dimension Width: 479 pixels . File size limit 1 MB.</i>
                            <br><i>&nbsp;Allowed Type: jpg, png.</i>
                        </sub>
                    </div>
                    <div class="form-group">
                        <label for="url" class=""><h6>Status</h6></label>
                        <div class="custom-control custom-switch">
                            <input type="checkbox" class="custom-control-input" id="published" value="1" name="published">
                            <label class="custom-control-label" for="published">Publish</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <label for="bannerImgHome">Banner Home Desktop</label>
                            <img src="" alt="" id="bannerImgHomeDesktop" class="w-100">
                        </div>
                        <div class="col-md-4">
                            <label for="bannerImgHome">Banner Home Mobile</label>
                            <img src="" alt="" id="bannerImgHomeMobile" class="w-100">
                        </div>
                    </div>
                </x-slot>

                <x-slot name="footer">
                    <div>
                        <button class="btn btn-sm btn-primary float-right" type="submit">@lang('Create')</button>
                    </div>
                </x-slot>
            </x-backend.card>
        </form>
    </div>
</div>
@endsection

@push('after-scripts')
    <script>
        function responsive_filemanager_callback(field_id){
            let url=jQuery('#'+field_id).val();
            let base_url = '{{ asset('/') }}';

            switch (field_id) {
                case 'BannerHomeDesktop':
                    $('#bannerImgHomeDesktop').attr('src', base_url + url);
                    break;
                case 'BannerHomeMobile':
                    $('#bannerImgHomeMobile').attr('src', base_url + url);
                    break;
                default:
                    break;
            }
        }
    </script>
@endpush
