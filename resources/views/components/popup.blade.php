    @props ([
        'name',
    ])

    <div
        x-data="{show: false,
                modalName: '{{ $name }}'  
                }"
        x-on:open-modal.window="if ($event.detail === modalName) { show = true }"
        x-on:close-modal.window="if ($event.detail === modalName) { show = false }"
        x-on:keydown.escape.window="show = false"
        x-show="show"
        class="fixed inset-0 z-50 flex items-center justify-center overflow-auto  backdrop-blur-sm "
        style="display: none;">

        <div x-transition:enter="transition ease-out duration-300"
            x-transition:enter-start="opacity-0 transform scale-90"
            x-transition:enter-end="opacity-100 transform scale-100"
            x-transition:leave="transition ease-in duration-300"
            x-transition:leave-start="opacity-100 transform scale-100"
            x-transition:leave-end="opacity-0 transform scale-90"
            class=" rounded-lg w-full max-w-md p-6 relative">
            
            

            <div class="mt-4">
                {{ $slot }}
            </div>
        </div>

    </div>