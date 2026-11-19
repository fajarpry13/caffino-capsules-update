@extends('backend.layouts.app')

@section('title', __('Tambah Produk'))

@section('content')
    <form action="{{ route('admin.product.store') }}" method="post" enctype="multipart/form-data">
        @csrf
        <x-backend.card>
            <x-slot name="header">
                @lang('Tambah Produk')
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
                            <input type="text" name="brand" class="form-control" id="productBrand" placeholder="Ex: Caffino Bold">
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="productName"><h6>Nama</h6></label>
                                <input type="text" name="name" class="form-control" id="productName" placeholder="Product Name">
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="productSlug"><h6>Slug</h6></label>
                                <input type="text" name="slug" class="form-control" id="productSlug" placeholder="Slug" readonly>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label><h6>deskripsi</h6></label>
                        <textarea class="form-control" name="description" placeholder="Description" rows="8"></textarea>
                    </div>
                    <div class="text-center my-4">
                        <h2>Info Kemasan</h2>
                    </div>

                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label><h6>Renteng Reguler</h6></label>
                                <textarea class="form-control" name="renteng_reguler" placeholder="Renteng Reguler" rows="5"></textarea>
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label><h6>Pouch Reguler</h6></label>
                                <textarea class="form-control" name="pouch_reguler" placeholder="Pouch Reguler" rows="5"></textarea>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label for="banner"><h6>Gambar Produk</h6></label>
                                <div class="input-group">
                                    <input type="text" class="form-control" name="image" id="fileManager" value="" readonly>
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
                                    <input type="text" class="form-control" name="icon" id="fileManager2" value="" readonly>
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
                                    <input type="color" id="bgColor" name="bg_color">
                                </div>
                            </div>
                        </div>
                        <div class="col-2">
                            <div class="form-group">
                                <label for="url" class=""><h6>Status</h6></label>
                                <div class="custom-control custom-switch">
                                    <input type="checkbox" class="custom-control-input" id="published" value="1" name="published" checked>
                                    <label class="custom-control-label" for="published">Publish</label>
                                </div>
                            </div>
                        </div>
                        <div class="col-2">
                            <div class="form-group">
                                <label for="url" class=""><h6>Pack Large</h6></label>
                                <div class="custom-control custom-switch">
                                    <input type="checkbox" class="custom-control-input" id="pack_large" value="1" name="pack_large" checked>
                                    <label class="custom-control-label" for="pack_large">Large</label>
                                </div>
                            </div>
                        </div>
                        <div class="col-2">
                            <div class="form-group">
                                <label for="url" class=""><h6>Is Bottle</h6></label>
                                <div class="custom-control custom-switch">
                                    <input type="checkbox" class="custom-control-input" id="is_bottle" value="1" name="is_bottle" checked>
                                    <label class="custom-control-label" for="is_bottle">Bottle</label>
                                </div>
                            </div>
                        </div>
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
    <script>
       const name = document.querySelector('#productName');
        const slug = document.querySelector('#productSlug');

        name.addEventListener('change', function() {
            fetch('{{ route('admin.product.checkSlug') }}?name=' + name.value)
            .then(response => response.json())
            .then(data => slug.value = data.slug)
        });
    </script>
@endpush
