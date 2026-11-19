@extends('backend.layouts.app')

@section('title', __('Detail Artikel'))

@section('content')
    <x-backend.card>
        <x-slot name="header">
            @lang('Detail Artikel')
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
            <div class="article__header">
                <img class="article__banner" src="{{ asset('img/caffino-article.jpg') }}" alt="">
            </div>
            <div class="container">
                <div class="d-flex" style="justify-content: space-between">
                    <div class="d-flex" style="gap: 10px;">
                        <div>
                            <a href="{{ route('admin.article.edit', $data) }}" class="btn btn-warning btn-sm" data-toggle="tooltip" data-placement="bottom" title="{{ __('Edit') }}"><i class="fa-regular fa-pen-to-square"></i></a>
                        </div>
                        <div> 
                            <form action="{{ route('admin.article.destroy', $data) }}" name="delete-item"  method="post">
                                @method('delete')
                                @csrf
                                <button class="btn btn-danger btn-sm" type="submit" data-toggle="tooltip" data-placement="bottom" title="{{ __('Delete') }}">
                                    <i class="fa-regular fa-trash-can"></i>
                                </button>
                            </form>
                        </div>
                    </div>
                    <div class="d-flex">
                        <div class="mr-2">Status : </div>
                        <div>
                            @if ($data->isPublish())
                                <a href="{{ route('admin.article.unpublish', $data) }}"  data-toggle="tooltip" data-placement="top" title="UnPublish?" name="confirm-item">
                                    <span class="badge badge-success cursor-pointer">Publish</span>
                                </a>
                            @else
                                <a href="{{ route('admin.article.publish', $data) }}"  data-toggle="tooltip" data-placement="top" title="Publish?" name="confirm-item">
                                    <span class="badge badge-warning cursor-pointer">Draft</span>
                                </a>
                            @endif
                        </div>
                    </div>
                </div>
                <div class="article__body">
                    <div class="title">
                        {!! $data->title !!}
                    </div>
                    <div class="line">
                        <hr class="line__border">
                    </div>
                    <div class="content">
                        {!! nl2br($data->content) !!}
                    </div>
                </div>
            </div>
        </x-slot>
    </x-backend.card>
@endsection

@push('after-scripts')
    <script>
    </script>
@endpush
