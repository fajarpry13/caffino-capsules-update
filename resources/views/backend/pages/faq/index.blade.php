@extends('backend.layouts.app')

@section('title', __('Tanya Jawab'))

@section('content')
    <x-backend.card>
        <x-slot name="header">
            @lang('Tanya Jawab')
        </x-slot>

        <x-slot name="headerActions">
            <x-utils.link
                icon="c-icon cil-plus"
                class="card-header-action"
                :href="route('admin.faq.create')"
                :text="__('Tambah')"
            />
        </x-slot>

        <x-slot name="body">
            <div class="table-responsive ">
                <table id="dataTables" class="table table-striped">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col" class="reorder-index">#</th>
                            <th scope="col">Tanya Jawab</th>
                            <th scope="col">Aksi</th>
                        </tr>
                    </thead>
                    <tbody id="tabel-sort">
                        @foreach ($faq as $data)    
                        <tr id="{{ $data->id }}" class="reorder">
                            <th scope="row" class="align-middle reorder-index">{{ $loop->iteration }}</th>
                            <td class="align-middle">
                                <div>
                                    <span class="font-weight-bold">{{ $data->questions }}</span>
                                    {!! $data->answer !!}
                                </div>
                            </td>
                            <td class="align-middle">
                                <div class="d-flex" style="gap: 5px;">
                                    <div>
                                        {{-- <a href="{{ route('admin.faq.detail', $data) }}" class="btn btn-info" data-toggle="tooltip" data-placement="bottom" title="{{ __('Detail') }}"><i class="fa-solid fa-eye"></i></a> --}}
                                    </div>
                                    <div>
                                        <a href="{{ route('admin.faq.edit', $data) }}" class="btn btn-warning" data-toggle="tooltip" data-placement="bottom" title="{{ __('Edit') }}"><i class="fa-regular fa-pen-to-square"></i></a>
                                    </div>
                                    <div> 
                                        <form action="{{ route('admin.faq.destroy', $data) }}" name="delete-item"  method="post">
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
                        url: '{{ route('admin.faq.sort') }}',
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
