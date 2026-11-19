@extends('backend.layouts.app')

@section('title', __('Kontak Masuk'))

@section('content')
    <x-backend.card>
        <x-slot name="header">
            @lang('Kontak Masuk')
        </x-slot>

        <x-slot name="body">

            @if ($inboxes->isEmpty())        
                <div class="text-center">
                    <h2>Tidak Ada Kotak Masuk</h2>
                </div>
            @else
                <div class="list-group">
                    @foreach ($inboxes as $inbox)
                    <a href="{{ route('admin.inbox.show', $inbox) }}" class="list-group-item list-group-item-action {{ !$inbox->read ? 'list-group-item-info' : 'list-group-item-secondary' }}">
                        <div class="d-flex w-100 justify-content-between">
                            <div class="d-flex flex-column">
                                <h6 class="mb-0">{{ $inbox->name }}</h6>
                                <h6 class="mb-1">{{ $inbox->email }} - {{ ($inbox->phone) }}</h6>
                            </div>
                            <div>
                                <small>{!! !$inbox->read ? '<span class="badge badge-success mr-2">New</span>' : '' !!}{{ $inbox->created_at->format('d, M Y') }} ({{ $inbox->created_at->diffForHumans() }})</small>
                            </div>
                        </div>
                        <p class="mb-1">{!! $inbox->message !== 'NULL' ? Str::limit($inbox->subject . ' - ' . "<span class='text-muted'>$inbox->message</span>", 240) : '<span class="badge badge-warning mr-2">No Message</span>' !!}</p>
                    </a>
                    @endforeach
                </div>
                <div class="row my-2 d-flex justify-content-end">
                    <div class="col">
                        <div class="ml-auto">
                            {{ $inboxes->links() }}
                        </div>
                    </div>
                </div>
            @endif
        </x-slot>
    </x-backend.card>
@endsection

@push('after-scripts')
@endpush
