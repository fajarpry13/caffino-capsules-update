@extends('backend.layouts.app')

@section('title', __('Edit Produk'))

@section('content')
    <div class="row">
        <div class="col-md-8">
            <form action="{{ route('admin.product.update', $product) }}" method="post" enctype="multipart/form-data">
                @method('PUT')
                @csrf
                <x-backend.card>
                    <x-slot name="header">
                        @lang('Edit Produk')
                    </x-slot>

                    <x-slot name="headerActions">
                        <x-utils.link
                            icon="c-icon cil-arrow-circle-left"
                            class="card-header-action"
                            :href="route('admin.product')"
                            :text="__('Back')"
                        />
                    </x-slot>

                    <x-slot name="body">
                        <div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                    <label for="productBrand"><h6>Brand</h6></label>
                                    <input type="text" name="brand" class="form-control" id="productBrand" value="{{ $product->brand }}" placeholder="Caffino Bold">
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-group">
                                    <label for="productName"><h6>Nama</h6></label>
                                    <input type="text" name="name" class="form-control" id="productName" value="{{ $product->name }}" placeholder="Product Name">
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-group">
                                    <label for="productSlug"><h6>Slug</h6></label>
                                    <input type="text" name="slug" class="form-control" id="productSlug" value="{{ $product->slug }}" placeholder="Slug" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                            <label><h6>deskripsi</h6></label>
                            <textarea class="form-control" name="description" placeholder="Description" rows="8">{{ $product->description }}</textarea>
                            </div>
                            <div class="text-center my-4">
                                <h2>Info Kemasan</h2>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label><h6>Renteng Reguler</h6></label>
                                        <textarea class="form-control" name="renteng_reguler" placeholder="Renteng Reguler" rows="5">{{ $product->renteng_reguler }}</textarea>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-group">
                                        <label><h6>Pouch Reguler</h6></label>
                                        <textarea class="form-control" name="pouch_reguler" placeholder="Pouch Reguler" rows="5">{{ $product->pouch_reguler }}</textarea>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-6">
                                    <div class="form-group">
                                        <label for="banner"><h6>Gambar Produk</h6></label>
                                        <div class="input-group">
                                            <input type="text" class="form-control" name="image" id="fileManager" value="{{ $product->image }}" readonly>
                                            <div class="input-group-append">
                                                <a type="button" class="btn btn-secondary" for="fileManager" href="{{ asset('filemanager/dialog.php?type=2&field_id=fileManager&akey=caffino_responsive_file_manager') }}" data-toggle="modal" data-target="#modalFilemanager">Choose</a>
                                            </div>
                                        </div>
                                        <sub>
                                            <i>&nbsp;Recomended Dimension 347 x 436 pixels . File size limit 1 MB.</i>
                                            <br><i>&nbsp;Allowed Type: jpg, png.</i>
                                        </sub>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="form-group">
                                        <label for="banner"><h6>Product Icon</h6></label>
                                        <div class="input-group">
                                            <input type="text" class="form-control" name="icon" id="fileManager2" value="{{ $product->icon }}" readonly>
                                            <div class="input-group-append">
                                                <a type="button" class="btn btn-secondary" for="fileManager2" href="{{ asset('filemanager/dialog.php?type=2&field_id=fileManager2&akey=caffino_responsive_file_manager') }}" data-toggle="modal" data-target="#modalFilemanager2">Choose</a>
                                            </div>
                                        </div>
                                        <sub>
                                            <i>&nbsp;Recomended Dimension 70 x 91 pixels . File size limit 1 MB.</i>
                                            <br><i>&nbsp;Allowed Type: jpg, png.</i>
                                        </sub>
                                    </div>
                                </div>
                                <div class="col-2">
                                    <div class="form-group">
                                        <label for="url" class=""><h6>Background Color</h6></label>
                                        <div class="">
                                            <input type="color" id="bgColor" name="bg_color" value="{{ $product->bg_color }}">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-2">
                                    <div class="form-group">
                                        <label for="url" class=""><h6>Status</h6></label>
                                        <div class="custom-control custom-switch">
                                            <input type="checkbox" class="custom-control-input" id="published" value="1" name="published" {{ $product->isPublish() ? 'checked' : '' }}>
                                            <label class="custom-control-label" for="published">Publish</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-2">
                                    <div class="form-group">
                                        <label for="url" class=""><h6>Pack Large</h6></label>
                                        <div class="custom-control custom-switch">
                                            <input type="checkbox" class="custom-control-input" id="pack_large" value="1" name="pack_large" {{ $product->isPackLarge() ? 'checked' : '' }}>
                                            <label class="custom-control-label" for="pack_large">Large</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-2">
                                    <div class="form-group">
                                        <label for="url" class=""><h6>Is Bottle</h6></label>
                                        <div class="custom-control custom-switch">
                                            <input type="checkbox" class="custom-control-input" id="is_bottle" value="1" name="is_bottle" {{ $product->isBottle() ? 'checked' : '' }}>
                                            <label class="custom-control-label" for="is_bottle">Bottle</label>
                                        </div>
                                    </div>
                                </div>
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
        </div>

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
                                    <input type="text" name="link_tokped" class="form-control" id="linkTokped" placeholder="Tokopedia" value="">
                                </div>
                                <div class="form-group">
                                    <label for="linkShopee">Link Shopee</label>
                                    <input type="text" name="link_shopee" class="form-control" id="linkShopee" placeholder="Shopee" value="">
                                </div>
                                <div class="form-group">
                                    <label for="linkBlibli">Link Blibli</label>
                                    <input type="text" name="link_blibli" class="form-control" id="linkBlibli" placeholder="Blibli" value="">
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
                                                <input type="text" class="form-control" id="faktaNutrisiName" name="name" placeholder="Name">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <input type="text" class="form-control" id="fakataNutrisiValue" name="value" placeholder="Value">
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
    </div>

    <!-- Modal Edit Fakta Nutrisi -->
    <x-backend.modal-edit-fknutrisi />
@endsection

@push('after-scripts')
    <script>
        const name = document.querySelector('#productName');
        const slug = document.querySelector('#productSlug');

        name.addEventListener('change', function() {
            fetch('{{ route('admin.product.checkSlug') }}?name=' + name.value)
            .then(response => response.json())
            .then(data => slug.value = data.slug)
        });

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
