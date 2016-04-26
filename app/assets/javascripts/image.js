$(function() {
  var i = 0;
  var addImageForm = $('.add-image-form');
  addImageForm.eq(i).removeClass('default-hidden')
  addImageForm.on('click', function() {
    $(this).addClass('default-hidden')
    addImageForm.eq(i + 1).removeClass('default-hidden')
    $('.appear_form').eq(i).removeClass('default-hidden')
    i++
  })

  $('.image-upload').each(function() {
    var self = $(this);
    var input = self.find('input[type=file]');
    input.change(function() {
      var file = $(this).prop('files')[0];
      var fileReader = new FileReader();
      if (!this.files.length) {
        return
      }
      if (!file.type.match('image.*')) {
        return
      }
      fileReader.onload = function() {
        self.css({
          'background-image': 'url(' + fileReader.result + ')',
          'background-size': 'contain'
        });
      };
      fileReader.readAsDataURL(file);
    })
  })
})
