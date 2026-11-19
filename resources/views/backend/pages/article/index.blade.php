@extends('backend.layouts.app')

@section('title', __('Artikel'))

@section('content')
    <x-backend.card>
        <x-slot name="header">
            @lang('Artikel')
        </x-slot>

        <x-slot name="headerActions">
            <x-utils.link
                icon="c-icon cil-plus"
                class="card-header-action"
                :href="route('admin.article.create')"
                :text="__('Tambah Artikel')"
            />
        </x-slot>

        <x-slot name="body">
            <div class="table-responsive ">
                <table id="dataTables" class="table table-striped">
                    <thead class="thead-dark">
                        <tr>
                            <th width="50px">#</th>
                            <th width="200px" style="min-width: 130px">Featured Image</th>
                            <th width="300px">Judul</th>
                            {{-- <th width="250px">Excerpt</th> --}}
                            <th width="150px">Author</th>
                            <th width="80px">Status</th>    
                            <th width="150px" style="min-width: 80px">Published at</th>    
                            <th width="150px" style="min-width: 80px">Created at</th>    
                            <th width="200px">Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($articles as $data)    
                            <tr>
                                <th scope="row" class="align-middle">{{ $loop->iteration }}</th>
                                <td class="align-middle">
                                    <div>
                                        @if ($data->image)
                                        <img class="img-thumbnail" width="70%" src="{{ asset($data->image) }}" alt="{{ $data->title }}">
                                        @else
                                        <img class="img-thumbnail" width="70%"src="{{ asset('img/caffino-article.jpg') }}" alt="{{ $data->title }}">
                                        @endif
                                    </div>
                                </td>
                                <td class="align-middle">
                                    <span class="cursor-pointer" data-toggle="tooltip" data-placement="bottom" title="{{ $data->title }}">
                                        {{ Str::limit($data->title, 45) }}
                                    </span>
                                </td>
                                {{-- <td class="align-middle">{!! Str::limit($data->content, 200) !!}</td> --}}
                                <td class="align-middle">{{ $data->user->name }}</td>
                                <td class="align-middle">
                                    @if ($data->isPublish())
                                    <a href="{{ route('admin.article.unpublish', $data) }}"  data-toggle="tooltip" data-placement="top" title="UnPublish?" name="confirm-item">
                                        <span class="badge badge-success cursor-pointer">Publish</span>
                                    </a>
                                        {{-- <span class="badge badge-success">Publish</span> --}}
                                    @else
                                        <a href="{{ route('admin.article.publish', $data) }}"  data-toggle="tooltip" data-placement="top" title="Publish?" name="confirm-item">
                                            <span class="badge badge-warning cursor-pointer">Draft</span>
                                        </a>
                                        {{-- <span class="badge badge-warning">Draft</span> --}}
                                    @endif
                                </td>
                                <td class="align-middle">
                                    @if ($data->isPublish())
                                        {{ Carbon\Carbon::parse($data->published_at)->format('d, M Y') }}
                                    @else
                                        Null
                                    @endif
                                </td>
                                <td class="align-middle">{{ $data->created_at->format('d, M Y') }}</td>
                                <td class="align-middle">
                                    <div class="d-flex" style="gap: 5px;">
                                        <div>
                                            <a href="{{ route('admin.article.show', $data) }}" class="btn btn-info" data-toggle="tooltip" data-placement="bottom" title="{{ __('Detail') }}"><i class="fa-solid fa-eye"></i></a>
                                        </div>
                                        <div>
                                            <a href="{{ route('admin.article.edit', $data) }}" class="btn btn-warning" data-toggle="tooltip" data-placement="bottom" title="{{ __('Edit') }}"><i class="fa-regular fa-pen-to-square"></i></a>
                                        </div>
                                        <div> 
                                            <form action="{{ route('admin.article.destroy', $data) }}" name="delete-item"  method="post">
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

@push('after-scripts')
    <script>
        $(document).ready(function () {
            $("#dataTables").DataTable();
        })
    </script>
@endpush
