@extends('backend.layouts.app')

@section('title', __('Change Password'))

@section('content')
    <x-forms.patch :action="route('admin.user.change-password-new.update', $user)">
        <x-backend.card>
            <x-slot name="header">
                @lang('Change Password')
            </x-slot>

            <x-slot name="headerActions">
                <x-utils.link class="card-header-action" :href="route('admin.dashboard')" :text="__('Cancel')" />
            </x-slot>

            <x-slot name="body">
                <div class="form-group row">
                    <label for="current_password" class="col-md-2 col-form-label">@lang('Current Password')</label>

                    <div class="col-md-10">
                        <input type="password" name="current_password" id="current_password" class="form-control" placeholder="{{ __('Current Password') }}" maxlength="100" required autocomplete="current-password" />
                    </div>
                </div><!--form-group-->
                <div class="form-group row">
                    <label for="password" class="col-md-2 col-form-label">@lang('Kata sandi baru')</label>

                    <div class="col-md-10">
                        <input type="password" name="password" id="password" class="form-control" placeholder="{{ __('Password') }}" maxlength="100" required autocomplete="new-password" />
                    </div>
                </div><!--form-group-->

                <div class="form-group row">
                    <label for="password_confirmation" class="col-md-2 col-form-label">@lang('Password Confirmation')</label>

                    <div class="col-md-10">
                        <input type="password" name="password_confirmation" id="password_confirmation" class="form-control" placeholder="{{ __('Password Confirmation') }}" maxlength="100"  autocomplete="new-password" />
                    </div>
                </div><!--form-group-->
            </x-slot>

            <x-slot name="footer">
                <button class="btn btn-sm btn-primary float-right" type="submit">@lang('Update')</button>
            </x-slot>
        </x-backend.card>
    </x-forms.patch>
@endsection
