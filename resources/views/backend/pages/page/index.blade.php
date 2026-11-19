
@extends('backend.layouts.app')

@section('title', __('Pages'))

@section('content')
    <x-backend.card>
        <x-slot name="header">
            {{ $pages->label }}
        </x-slot>

        <x-slot name="body">
            <div class="table-responsive">

                <table class="table table-striped table-hover">

                    <thead>

                        <tr>

                            <th>#</th>

                            <th width="200">Label</th>

                            <th>Value</th>

                            <th class="text-center">Action</th>

                        </tr>

                    </thead>

                    <tbody>

                        @foreach ($datas as $data)    

                        <tr>

                            <td>{{ $loop->iteration }}</td>

                            <td>{{ $data->lable }}</td>

                            @if ($data->type == 'image')

                                <td>

                                    <img src="{{ asset($data->lable) }}" width="100" alt="">

                                </td> 

                            @else

                                <td>{{  Str::limit($data->value, 150)  }}</td> 
                                {{-- <td>{{ $data->value }}</td>  --}}

                            @endif

                            <td>

                                <div class="d-flex justify-content-center">

                                    <a class="btn btn-warning text-white mx-2" href="{{ route('admin.pages.edit', $data) }}" role="button">{{ __('Edit') }}</a>

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
