@props(['hide' => ''])
<div class="nav__link__item-footer">
    <div>
      <a href="{{ route('frontend.faq') }}">Tanya Jawab</a>
      <a href="{{ route('frontend.about') }}">Tentang Kami</a>
      <a href="{{ route('frontend.terms') }}">Syarat & Ketentuan</a>
      <a href="{{ route('frontend.contact') }}" class="{{ $hide }}">Kontak</a>
    </div>
    <div>
      <a href="{{ $link['link_instagram'] }}" target="_blank">Instagram</a>
      <a href="{{ $link['link_tiktok'] }}" target="_blank">Tiktok</a>
      <a href="{{ $link['link_facebook'] }}" target="_blank">Facebook</a>
      <a href="{{ $link['link_youtube'] }}" target="_blank">YouTube</a>
      <a href="{{ $link['link_twitter'] }}" target="_blank">Twitter</a>
    </div>
</div>