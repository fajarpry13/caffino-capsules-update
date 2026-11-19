<script src="{{ asset('js/tinymce/tinymce.min.js') }}" referrerpolicy="origin"></script>
<script>
  tinymce.init({
    selector: 'textarea#myeditorinstance', // Replace this CSS selector to match the placeholder element for TinyMCE
    document_base_url: '{{ asset('/') }}',
    relative_urls: false,
    remove_script_host: false,
    theme: "silver",
    height: 500,
    plugins: [
        "advlist autolink link image lists charmap print preview hr anchor pagebreak",
        "searchreplace wordcount visualblocks visualchars insertdatetime media nonbreaking",
        "table contextmenu directionality emoticons paste textcolor responsivefilemanager code"
    ],
    toolbar1: "undo redo | bold italic underline | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | styleselect",
    toolbar2: "| responsivefilemanager | link unlink anchor | image media | forecolor backcolor  | print preview code ",
    image_advtab: true ,
    
    external_filemanager_path:"/filemanager/",
    filemanager_title:"Responsive Filemanager" ,
    filemanager_access_key: "caffino_responsive_file_manager",
    external_plugins: { "filemanager" : "/filemanager/plugin.min.js"}
  });

  tinymce.init({
    selector: 'textarea.myeditorinstance', // Replace this CSS selector to match the placeholder element for TinyMCE
    document_base_url: '{{ asset('/') }}',
    relative_urls: false,
    remove_script_host: false,
    theme: "silver",
    height: 500,
    plugins: [
        "advlist autolink link image lists charmap print preview hr anchor pagebreak",
        "searchreplace wordcount visualblocks visualchars insertdatetime media nonbreaking",
        "table contextmenu directionality emoticons paste textcolor responsivefilemanager code"
    ],
    toolbar1: "undo redo | bold italic underline | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | styleselect",
    toolbar2: "| responsivefilemanager | link unlink anchor | image media | forecolor backcolor  | print preview code ",
    image_advtab: true ,
    
    external_filemanager_path:"/filemanager/",
    filemanager_title:"Responsive Filemanager" ,
    filemanager_access_key: "caffino_responsive_file_manager",
    external_plugins: { "filemanager" : "/filemanager/plugin.min.js"}
  });
</script>