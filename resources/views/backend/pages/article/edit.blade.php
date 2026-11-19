@extends('backend.layouts.app')

@section('title', __('Edit Artikel'))

@section('content')
<form action="{{ route('admin.article.update', $data) }}" method="POST">
    @csrf
    @method('PUT')
    <div class="row">
        <div class="col-9">
            <x-backend.card>
                <x-slot name="header">
                    @lang('Edit Artikel')
                </x-slot>

                <x-slot name="headerActions">
                    <x-utils.link
                        icon="c-icon cil-arrow-circle-left"
                        class="card-header-action"
                        :href="route('admin.article')"
                        :text="__('Back')"
                    />
                </x-slot>

                <x-slot name="body">
                    <div class="form-article">
                        <div class="form-group">
                            <label for="title">Judul</label>
                            <input id="istilte" type="text" name="title" class="form-control" id="title" value="{{ old('title', $data->title) }}">
                            {{-- <small  class="form-text text-muted">text</small> --}}
                        </div>
                        <div class="form-group">
                            <label for="slug">Slug</label>
                            <input id="isslug" type="text" name="slug" class="form-control" id="slug" value="{{ old('slug', $data->slug) }}" readonly>
                            {{-- <small class="form-text text-muted">text</small> --}}
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlTextarea1">Content</label>
                            <textarea id="myeditorinstance" name="content">{{ old('content', $data->content) }}</textarea>
                        </div>
                    </div>
                </x-slot>=
            </x-backend.card>
        </div>
        <div class="col-3">
            <x-backend.card>
                <x-slot name="body">
                    <div class="form-group">
                        <label for="banner"><h6>Featured Image</h6></label>
                        <div class="input-group">
                            <input type="text" class="form-control" name="image" id="fileManager" value="{{ old('image', $data->image) }}" readonly>
                            <div class="input-group-append">
                                <a type="button" class="btn btn-secondary" for="fileManager" href="{{ asset('filemanager/dialog.php?type=2&field_id=fileManager&akey=caffino_responsive_file_manager') }}" data-toggle="modal" data-target="#modalFilemanager">Choose</a>
                            </div>
                        </div>
                        <sub>
                            <i>&nbsp;Recomended Dimension 1440 x 657 pixels . File size limit 1 MB.</i>
                            <br><i>&nbsp;Allowed Type: jpg, png.</i>
                        </sub>
                    </div>
                    <div class="custom-control custom-switch">
                        <input type="checkbox" class="custom-control-input" id="is_published" value="1" name="is_published" {{ $data->is_published ? 'checked' : '' }}>
                        <label class="custom-control-label" for="is_published">Publish</label>
                    </div>
                </x-slot>

                <x-slot name="footer">
                    <button id="btnsubmit" class="btn btn-sm btn-primary float-right" type="submit">
                        <span>{{ $data->is_published ? __('Update & Publish') : __('Update & Save Draf') }}</span>
                    </button>
                </x-slot>
            </x-backend.card>
        </div>
    </div>
</form>
@endsection

@push('after-scripts')
    <script>
        let isPublish = $('input[name=is_published]')
        $(isPublish).on('change', function () {
            
            if (this.checked) {
                $("#btnsubmit span").text("Update & Publish");
                // $(isPublish).val(true);
            } else {
                $("#btnsubmit span").text("Update & Save Draf");
                // $(isPublish).val(false);
            }
        })

        const isTitle = $('input[name=title]')
        const isSlug = $('input[name=slug]')
        $(isTitle).on('change', function () {
            fetch('{{ route('admin.article.checkSlug') }}?title=' + $(isTitle).val())
            .then( async (response) => {
                let data = await response.json();
                if(response.status === 200){
                    $(isSlug).val(data.slug)
                }
            })
            .catch((err) => {
                console.log(err);
            })
        })
    </script>
@endpush
