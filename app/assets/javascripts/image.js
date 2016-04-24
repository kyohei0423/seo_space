$(function() {
  var i = 0;
  $('.add-image-form').on('click', function() {
    $(this).addClass('default-hidden')
    console.log(i);
    $('.add-image-form').eq(i + 1).removeClass('default-hidden')
    $('.appear_form').eq(i).removeClass('default-hidden')
    i++
  })
})
