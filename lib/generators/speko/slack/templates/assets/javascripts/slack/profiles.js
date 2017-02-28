var select2 = function() {
  $(".select2").select2(
    {
      placeholder: "select tags",
      allowClear: true,
      minimumInputLength: 0,
      theme: "bootstrap",
      width: 'auto',
      tokenSeparators: [',']
    }
  );

  $(".taggable").select2(
    {
      placeholder: "select tags",
      allowClear: true,
      minimumInputLength: 0,
      theme: "bootstrap",
      width: 'auto',
      tokenSeparators: [','],
      tags: $('.taggable').data('options'),
      tags: true,
      width: 'auto'
    }
  );
};

$(document).ready(select2);
