@extends('backend.layouts.app')

@section('title', __('Kontak Masuk'))

@section('content')
    <x-backend.card>
        <x-slot name="header">
            @lang('Kontak Masuk')
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
                <div>
                    <h4>{{ $inbox->subject }}</h4>
                </div>
                <div class="d-flex w-100 justify-content-between">
                    <div>
                        <div>
                            <div>
                                <span class="font-weight-bold">{{ $inbox->name }} </span> 
                                <span>({{ $inbox->email . ' - ' . $inbox->phone}})</span>
                                <!-- Example single danger button -->
                            </div>
                            <div class="btn-group">
                                <span type="button" class="badge badge-secondary badge-pill dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                    More
                                </span>
                                <div class="dropdown-menu" style="width: 350px;">
                                    <table class="table table-borderless">
                                        <tbody>
                                            <tr>
                                                <th scope="row" width="100">Nama</th>
                                                <td>:</td>
                                                <td>{{ $inbox->name }}</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Email</th>
                                                <td width="10">:</td>
                                                <td>{{ $inbox->email }}</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">No. Telpon</th>
                                                <td>:</td>
                                                <td colspan="2">{{ $inbox->phone }}</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Tanggal</th>
                                                <td>:</td>
                                                <td colspan="2">{{ $inbox->created_at->format('D, d M Y H:i') }}</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Subjek</th>
                                                <td>:</td>
                                                <td colspan="2">{{ $inbox->subject }}</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <span>{{ $inbox->created_at->format('D, d M Y H:i') . ' (' . $inbox->created_at->diffForHumans() . ')' }}</span>
                    </div>
                </div>
                <hr>
                <div class="mt-5">
                    <p style="font-size: 18px;">
                        {!! nl2br($inbox->message) !!}
                    </p>
                </div>
            </div>
        </x-slot>
    </x-backend.card>
@endsection

@push('after-scripts')
@endpush
