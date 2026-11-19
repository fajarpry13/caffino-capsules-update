@extends('backend.layouts.app')

@section('title', __('Tanya Jawab'))

@section('content')
<form action="{{ route('admin.faq.store') }}" method="POST">
    @csrf
    <x-backend.card>
        <x-slot name="header">
            @lang('Tanya Jawab')
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
            <div>
                <div class="form-group">
                    <label for="question">Pertanyaan</label>
                    <input type="text" name="questions" class="form-control" id="question" placeholder="Pertanyaan">
                </div>
                <div class="form-group">
                    <label for="myeditorinstance">Jawaban</label>
                    <textarea class="form-control" name="answer" id="myeditorinstance" rows="3" placeholder="Jawaban"></textarea>
                </div>
            </div>
        </x-slot>

        <x-slot name="footer">
            <div>
                <button class="btn btn-sm btn-primary float-right" type="submit">@lang('Tambah')</button>
            </div>
        </x-slot>
    </x-backend.card>
</form>
@endsection

@push('after-scripts')
@endpush
