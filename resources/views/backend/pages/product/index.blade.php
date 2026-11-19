@extends('backend.layouts.app')

@section('title', __('Product'))

@section('content')
    <x-backend.card>
        <x-slot name="header">
            @lang('List Produk')
        </x-slot>

        <x-slot name="headerActions">
            <x-utils.link
                icon="c-icon cil-plus"
                class="card-header-action"
                :href="route('admin.product.create')"
                :text="__('Tambah Produk')"
            />
        </x-slot>

        <x-slot name="body">
            <div class="table-responsive ">
                <table id="dataTables" class="table table-striped">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col" class="reorder-index">#</th>
                            <th scope="col">Gambar Produk</th>
                            <th scope="col">Brand</th>
                            <th scope="col">Nama</th>
                            <th scope="col">Status</th>
                            <th scope="col">Aksi</th>
                        </tr>
                    </thead>
                    <tbody id="tabel-sort">
                        @foreach ($products as $data)    
                        <tr id="{{ $data->id }}" class="reorder">
                            <th scope="row" class="align-middle reorder-index">{{ $loop->iteration }}</th>
                            <td class="align-middle">
                                <div>
                                    <img src="{{ asset($data->image) }}" alt="{{ $data->name }}" width="70">
                                </div>
                            </td>
                            <td class="align-middle">{{ $data->brand }}</td>
                            <td class="align-middle">{{ $data->name }}</td>
                            <td class="align-middle">
                                @if ($data->isPublish())
                                <a href="{{ route('admin.product.unpublish', $data) }}"  data-toggle="tooltip" data-placement="top" title="UnPublish?" name="confirm-item">
                                    <span class="badge badge-success cursor-pointer">Publish</span>
                                </a>
                                    {{-- <span class="badge badge-success">Publish</span> --}}
                                @else
                                    <a href="{{ route('admin.product.publish', $data) }}"  data-toggle="tooltip" data-placement="top" title="Publish?" name="confirm-item">
                                        <span class="badge badge-warning cursor-pointer">Draft</span>
                                    </a>
                                    {{-- <span class="badge badge-warning">Draft</span> --}}
                                @endif
                            </td>
                            <td class="align-middle">
                                <div class="d-flex" style="gap: 5px;">
                                    <div>
                                        <a href="{{ route('frontend.product', $data->slug) }}" target="_blank" class="btn btn-info" data-toggle="tooltip" data-placement="bottom" title="{{ __('Lihat') }}"><i class="fa-solid fa-eye"></i></a>
                                    </div>
                                    <div>
                                        <a href="{{ route('admin.product.edit', $data) }}" class="btn btn-warning" data-toggle="tooltip" data-placement="bottom" title="{{ __('Edit') }}"><i class="fa-regular fa-pen-to-square"></i></a>
                                    </div>
                                    <div> 
                                    <form action="{{ route('admin.product.destroy', $data) }}" name="delete-item"  method="post">
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
        $(document).ready(function() {
            $('#btnFaktaNutrisi').click(function () {
                $('#addFaktaNutrisi').show()
            })

            $('#closeFaktaNutrisi').click(function () {
                $('#addFaktaNutrisi').hide()
            })

            var dt = $("#dataTables").DataTable({
                // rowReorder: {
                //     selector: 'tr'
                // }

                rowReorder: {
                    selector: 'td:nth-child(2)'
                },
                responsive: true
            });

            dt.on('row-reorder.dt', function () {
                $.map($(this).find('.reorder'), function(el) {
                    let id = el.id;
                    let sorting = $(el).index() + 1;

                    $.ajax({
                        url: '{{ route('admin.product.sort') }}',
                        type: 'GET',
                        data: {
                            id: id,
                            sorting: sorting
                        },
                    });
                });
            });

        })
    </script>
@endpush
