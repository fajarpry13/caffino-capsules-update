@extends('backend.layouts.app')

@section('title', __('Detail Produk'))

@section('content')

    <div class="row">
        <div class="col-md-4">
            <div class="row">
                <div class="col">
                    {{-- card <link rel="stylesheet" href=""> olshop --}}
                    <x-backend.card>
                        <x-slot name="header">
                            @lang('Link Online Shop')
                        </x-slot>

                        <x-slot name="body">

                            @if ($product->buyNow)    
                            <form action="{{ route('admin.product.buynow.update', $product->buyNow) }}" method="post">
                                @method('PUT')
                                @csrf
                                <div class="form-group">
                                    <label for="linkTokped">Link Tokopedia</label>
                                    <input type="text" class="form-control" name="link_tokped" id="linkTokped" placeholder="Tokopedia" value="{{ old('link_tokped', $product->buyNow->link_tokped) }}">
                                </div>
                                <div class="form-group">
                                    <label for="linkShopee">Link Shopee</label>
                                    <input type="text" class="form-control" name="link_shopee" id="linkShopee" placeholder="Shopee" value="{{ old('link_shopee', $product->buyNow->link_shopee) }}">
                                </div>
                                <div class="form-group">
                                    <label for="linkBlibli">Link Blibli</label>
                                    <input type="text" class="form-control" name="link_blibli" id="linkBlibli" placeholder="Blibli" value="{{ old('link_blibli', $product->buyNow->link_blibli) }}">
                                </div>
                                <div class="form-group">
                                    <label for="bukalapak">Link Bukalapak</label>
                                    <input type="text" name="link_bukalapak" class="form-control" id="bukalapak" placeholder="Bukalapak" value="{{ old('link_bukalapak', $product->buyNow->link_bukalapak) }}">
                                </div>
                                <button class="btn btn-sm btn-primary float-right" type="submit">@lang('Update')</button>
                            </form>
                            @else
                            <form action="{{ route('admin.product.buynow.store') }}" method="post">
                                @csrf
                                <div class="form-group">
                                    <label for="linkTokped">Link Tokopedia</label>
                                    <input type="text" name="product_id" class="form-control" id="linkTokped" placeholder="Tokopedia" value="{{ $product->id }}" hidden>
                                    <input type="text" name="link_tokped" class="form-control" id="linkTokped" placeholder="Tokopedia" value="{{ old('link_tokped') }}">
                                </div>
                                <div class="form-group">
                                    <label for="linkShopee">Link Shopee</label>
                                    <input type="text" name="link_shopee" class="form-control" id="linkShopee" placeholder="Shopee" value="{{ old('link_shopee') }}">
                                </div>
                                <div class="form-group">
                                    <label for="linkBlibli">Link Blibli</label>
                                    <input type="text" name="link_blibli" class="form-control" id="linkBlibli" placeholder="Blibli" value="{{ old('link_blibli') }}">
                                </div>
                                <div class="form-group">
                                    <label for="bukalapak">Link Bukalapak</label>
                                    <input type="text" name="link_bukalapak" class="form-control" id="bukalapak" placeholder="Bukalapak" value="{{ old('link_bukalapak') }}">
                                </div>
                                <button class="btn btn-sm btn-primary float-right" type="submit">@lang('Simpan')</button>
                            </form>
                            @endif
                        </x-slot>
                    </x-backend.card>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    {{-- card CRUD Fakta Nutrisi --}}
                    <x-backend.card>
                        <x-slot name="header">
                            @lang('Fakta Nutrisi')
                        </x-slot>

                        <x-slot name="headerActions">
                            <button
                                class="btn card-header-action"
                                id="btnFaktaNutrisi"
                            ><i class="c-icon cil-plus"></i> @lang('Tambah')</button>
                        </x-slot>

                        <x-slot name="body">
                            <div class="mb-5" id="addFaktaNutrisi" style="display: none;">
                                <form action="{{ route('admin.product.faktanutrisi.create') }}" method="post">
                                    @csrf
                                    <div class="row">
                                        <div class="col-md-8">
                                            <div class="form-group">
                                                <input type="text" class="form-control" id="faktaNutrisiName" name="product_id" value="{{ $product->id }}" hidden>
                                                <input type="text" class="form-control" id="faktaNutrisiName" name="name" placeholder="Nama">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <input type="text" class="form-control" id="fakataNutrisiValue" name="value" placeholder="Nilai">
                                            </div>
                                        </div>
                                    </div>
                                    <div>
                                        <button class="btn btn-sm btn-primary float-right" type="submit">@lang('Tambah')</button>
                                        <a id="closeFaktaNutrisi" class="btn btn-sm btn-warnig float-right">@lang('Cencel')</a>
                                    </div>
                                </form>
                            </div>

                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Nama</th>
                                            <th scope="col">Nilai</th>
                                            <th scope="col">Aksi</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($FaktaNutrisi as $data)       
                                        <tr>
                                            <th scope="row">{{ $loop->iteration }}</th>
                                            <td>{{ $data->name }}</td>
                                            <td width="100%">{{ $data->value }}</td>
                                            <td>
                                                <div class="d-flex">
                                                    <button class="btn btn-warning open_modal mr-2" value="{{ $data->id}}" data-toggle="modal" data-target="#modalEditFaktaNutrisi"><i class="fa-regular fa-pen-to-square"></i></button>
                                                    <form action="{{ route('admin.product.faktanutrisi.destroy', $data) }}" name="delete-item"  method="post">
                                                    @method('delete')
                                                    @csrf
                                                    <button class="btn btn-danger" type="submit">
                                                        <i class="fa-regular fa-trash-can"></i>
                                                    </button>
                                                    </form>
                                                </div>
                                            </td>
                                        </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </x-slot>
                    </x-backend.card>
                </div>
            </div>
        </div>
        <div class="col-md-8">
            {{-- card detail product --}}
            <x-backend.card>
                <x-slot name="header">
                    @lang('Products')
                </x-slot>

                <x-slot name="headerActions">
                    {{-- <x-utils.link
                        icon="fa-solid fa-pen-to-square"
                        class="card-header-action"
                        :href="route('admin.product.edit', $product)"
                        :text="__('Edit Product')"
                    /> --}}
                    <x-utils.link
                    icon="c-icon cil-arrow-circle-left"
                    class="card-header-action"
                    :href="route('admin.product')"
                    :text="__('Back')"
                    />
                </x-slot>

                <x-slot name="body">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered">
                            <tbody> 
                                <tr>
                                    <th class="col-2 align-middle" scope="row" class="align-middle">Gambar Produk</th>
                                    <td class="col-8 align-middle">
                                        <div>
                                            <img src="{{ asset($product->image) }}" alt="{{ $product->name }}" width="150">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th class="col-2 align-middle" scope="row" class="align-middle">Icon</th>
                                    <td class="col-8 align-middle">
                                        <div>
                                            <img src="{{ asset($product->icon) }}" alt="{{ $product->name }}" width="50">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th class="col-2 align-middle" scope="row" class="align-middle">Brand</th>
                                    <td class="col-8 align-middle">
                                        <div>
                                            {{ $product->brand }}
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th class="col-2 align-middle" scope="row" class="align-middle">Nama Produk</th>
                                    <td class="col-8 align-middle">
                                        <div>
                                            {{ $product->name }}
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th class="col-2 align-middle" scope="row" class="align-middle">Deskripsi</th>
                                    <td class="col-8 align-middle">
                                        <div>
                                            {!! $product->description !!}
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2" class="col-2 align-middle" scope="row" class="align-middle">Info Kemasan :</th>
                                </tr>
                                <tr>
                                    <th class="col-2 align-middle" scope="row" class="align-middle">Renteng Reguler</th>
                                    <td class="col-8 align-middle">
                                        <div>
                                            {!! $product->renteng_reguler !!}
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th class="col-2 align-middle" scope="row" class="align-middle">Pouch Reguler</th>
                                    <td class="col-8 align-middle">
                                        <div>
                                            {!! $product->pouch_reguler !!}
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th class="col-2 align-middle" scope="row" class="align-middle">Background Color</th>
                                    <td class="col-8 align-middle">
                                        <div>
                                            <input type="color" id="favcolor" name="btn_color" value="{{ $product->bg_color }}" disabled>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table> 
                    </div>
                </x-slot>
            </x-backend.card>
        </div>
        
    </div>

    <!-- Modal Edit Fakta Nutrisi -->
    <x-backend.modal-edit-fknutrisi />
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

            //modal update faktanutrisi
            $(document).on('click','.open_modal',function(){
                var product_id = $(this).val();

                let url = '{{ url('admin/product/faktanutrisi/') }}';

                let urlForm = url + '/' + product_id + '/update';

                // Populate Data in Edit Modal Form
                $.ajax({
                    type: "GET",
                    url: url + '/' + product_id + '/edit',
                    success: function (data) {
                        $('#faktanutrisi_form').attr('action', urlForm);
                        $('#product_id').val(data[0].product_id);
                        $('#fakta_name').val(data[0].name);
                        $('#fakta_value').val(data[0].value);
                    },
                    error: function (data) {
                        console.log('Error:', data);
                    }
                });
            });
        })

    </script>
@endpush
