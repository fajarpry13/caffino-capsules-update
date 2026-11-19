<x-frontend.layout.app title="Kontak Kami - {{ appName() }}" bg="bg-caffino" hamburger="fill-white" logo="fill-white" textCont="text-white">
    <div class="blackheader">
        <div class="blackheader__wrap">
            <p class="blackheader__title">Kontak Kami</p>
        </div>
    </div>
    <div class="container_fluid">
        <div class="container_wrap">
            <form method="POST" action="{{ route('frontend.sendContact') }}">
                @csrf
                <div class="contact__form">
                    <label for="floating_name" class="contact__form-label">Nama Lengkap *</label>
                    <input type="text" name="name" id="floating_name" value="{{ old('name') }}"
                            class="contact__form-input {{ $errors->has('name') ? 'border-red-500' : 'border-gray-500' }}"
                            placeholder="Nama Lengkap Sesuai KTP" required />

                    @error('name')
                        <small class="text-red">* {{ $message }}</small>
                    @enderror
                </div>
    
                <div class="contact__form">
                    <label for="floating_email" class="contact__form-label underline">Email *</label>
                    <input type="email" name="email" id="floating_email" value="{{ old('email') }}"
                            class="contact__form-input {{ $errors->has('email') ? 'border-red-500' : 'border-gray-500' }}"
                            placeholder="EmailAnda@email.com" required />

                    @error('email')
                        <small class="text-red">* {{ $message }}</small>
                    @enderror
                </div>
    
                <div class="contact__form">
                    <label for="floating_number" class="contact__form-label">Nomor Telepon *</label>
                    <input type="number" name="phone" id="floating_number" value="{{ old('phone') }}"
                            class="contact__form-input {{ $errors->has('phone') ? 'border-red-500' : 'border-gray-500' }}"
                            placeholder="08*********" required />

                    @error('phone')
                        <small class="text-red">* {{ $message }}</small>
                    @enderror
                </div>
    
                <div class="contact__form">
                    <label for="floating_subject" class="contact__form-label">Subjek *</label>
                    <input type="text" name="subject" id="floating_subject" value="{{ old('subject') }}" 
                            class="contact__form-input {{ $errors->has('subject') ? 'border-red-500' : 'border-gray-500' }}"
                            placeholder="Subjek pesan" required />

                    @error('subject')
                        <small class="text-red">* {{ $message }}</small>
                    @enderror
                </div>
    
                <div class="contact__form">
                    <label for="floating_message" class="contact__form-label">Pesan Anda</label>
                    <textarea name="message" id="floating_message"
                                class="h-60 contact__form-input {{ $errors->has('message') ? 'border-red-500' : 'border-gray-500' }}"
                                placeholder="Ketik pesan anda di sini" required > 
                    {{ old('message') }}
                    </textarea>
                    @error('message')
                        <small class="text-red">* {{ $message }}</small>
                    @enderror
                </div>
    
                <div class="contact__agreement">
                    <input id="checked-checkbox" type="checkbox" value="" class="contact__agreement-checkbox" required>
                    <label for="checked-checkbox" class="contact__agreement-label">Saya menyetujui semua peraturan & ketentuan yang berlaku</label>
                </div>
    
                <div class="contact__form-button">
                    <button class="block text-center text-white bg-black py-4 w-[320px] md:w-[300px] rounded-full uppercase relative">KIRIM PESAN <i class="fa-solid fa-angle-right text-xl absolute right-10 top-1/2 -translate-y-1/2"></i></button>
                </div>
            </form>
        </div>
        <div class="contact__maps">
            {{-- <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d15865.97976418908!2d106.797573!3d-6.198243!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xccf6fb55c4ff1786!2sPT%20Gonusa%20Prima%20Distribusi!5e0!3m2!1sid!2sid!4v1659434957075!5m2!1sid!2sid" 
                    width="1110" 
                    height="450" 
                    style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade">
            </iframe> --}}
            {!! $data['g-maps']->value !!}
        </div>
        <div class="contact__address container_wrap">
            <div class="font-bold">
                KANTOR PUSAT CAFFINO
            </div>
            <div class="mt-5">
                {!! nl2br($data['office-addrs']->value) !!}
            </div>
        </div>
    </div>

    @push('after-scripts')
        <x-frontend.script.nav />
    @endpush
</x-frontend.layout.app>