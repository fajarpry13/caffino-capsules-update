@extends('backend.layouts.app')

@section('title', __('Dashboard'))

@section('content')
<form action="{{ route('admin.pages.update', $data) }}"  method="POST">
    @csrf
    @method('PUT')
    <x-backend.card>
        <x-slot name="header">
            Edit
        </x-slot>

        <x-slot name="headerActions">
            <x-utils.link
                icon="c-icon cil-arrow-circle-left"
                class="card-header-action"
                :href="url()->previous()"
                :text="__('Back')"
            />
        </x-slot>

        <x-slot name="body">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <div class="form-group">
                            <label for="lable">Label</label>
                            <h4>{{ $data->lable }}</h4>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="value">Content</label>
                    @if ($data->type == 'textarea')
                        <textarea class="form-control" name="value" id="value" style="height: 100px;">{{ $data->value }}</textarea>
                    @elseif ($data->type == 'texteditor')
                        <textarea class="form-control" name="value" id="myeditorinstance" style="height: 100px;">{{ $data->value }}</textarea>
                    @elseif ($data->type == 'image')
                        <div class="input-group">
                            <input type="text" class="form-control" name="value" id="fileManager" value="{{ old('value', $data->value) }}" readonly>
                            <div class="input-group-append">
                                <a type="button" class="btn btn-secondary" for="fileManager" href="{{ asset('filemanager/dialog.php?type=2&field_id=fileManager&akey=5days_file_responsive_manager') }}" data-toggle="modal" data-target="#exampleModal">Choose</a>
                            </div>
                        </div>
                        <sub>
                            <i>{!! $data->text_helper !!}</i>
                        </sub>
                    @elseif ($data->type == 'text')
                        <div class="form-group">
                            <input type="text" class="form-control" id="value" name="value" value="{{ old('value', $data->value) }}">
                        </div>
                    @endif

                    @if ($data->helper)
                    <sub>
                        <i>{!! $data->helper !!}</i>
                    </sub>
                    @endif

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
@endsection
