
@extends('backend.layouts.app')

@section('title', __('Setting Banner Home Page'))

@section('content')
    <x-backend.card>
        <x-slot name="header">
            @lang('Banner Home Page')
        </x-slot>

        <x-slot name="headerActions">
            <x-utils.link
                icon="c-icon cil-plus"
                class="card-header-action"
                :href="route('admin.setting.banner.create')"
                :text="__('Tambah Banner')"
            />
        </x-slot>

        <x-slot name="body">
            <div class="table-responsive ">
                <table id="dataTables" class="table table-striped">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col" class="reorder-index">#</th>
                            <th scope="col">Banner Image</th>
                            <th scope="col">Status</th>
                            <th scope="col">Update at</th>
                            <th scope="col">Aksi</th>
                        </tr>
                    </thead>
                    <tbody id="tabel-sort">
                        @foreach ($banners as $banner)
                        <tr>
                            <th scope="row">{{ $loop->iteration }}</th>
                            <td class="">
                                <div>
                                    <img src="{{ asset($banner->source) }}" alt="" width="150">
                                </div>
                            </td>
                            <td class="">
                                @if ($banner->isPublish())
                                <a href="{{ route('admin.setting.banner.unpublish', $banner) }}"  data-toggle="tooltip" data-placement="top" title="UnPublish?" name="confirm-item">
                                    <span class="badge badge-success cursor-pointer">Publish</span>
                                </a>
                                    {{-- <span class="badge badge-success">Publish</span> --}}
                                @else
                                    <a href="{{ route('admin.setting.banner.publish', $banner) }}"  data-toggle="tooltip" data-placement="top" title="Publish?" name="confirm-item">
                                        <span class="badge badge-secondary cursor-pointer">Unpublish</span>
                                    </a>
                                    {{-- <span class="badge badge-warning">Draft</span> --}}
                                @endif
                            </td>
                            <td>
                                {{ $banner->updated_at }}
                            </td>
                            <td>
                                <div class="d-flex" style="gap: 5px;">
                                    <div>
                                        <a href="{{ route('admin.setting.banner.edit', $banner) }}" class="btn btn-warning" data-toggle="tooltip" data-placement="bottom" title="{{ __('Edit') }}"><i class="fa-regular fa-pen-to-square"></i></a>
                                    </div>
                                    <div>
                                        <form action="{{ route('admin.setting.banner.destroy', $banner) }}" name="delete-item"  method="post">
                                            @method('delete')
                                            @csrf
                                            <button class="btn btn-danger" type="submit" data-toggle="tooltip" data-placement="bottom" title="{{ __('Delete') }}">
                                                <i class="fa-regular fa-trash-can"></i>
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </x-slot>
    </x-backend.card>
@endsection
