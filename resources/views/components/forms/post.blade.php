<form method="post" {{ $attributes->merge(['action' => '#', 'class' => 'form-horizontal', 'name' => '']) }}>
    @csrf

    {{ $slot }}
</form>
