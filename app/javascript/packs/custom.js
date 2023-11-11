function convertTitle(title) {
  title = title.replace(/ /g, '-').toLowerCase();
  return title;
}

document.addEventListener("turbolinks:load", () => {
  var wrapperElement = $("#create-new-record");
  if (wrapperElement.length > 0) {
    var model = wrapperElement.data("model");
    console.log(model)
    $("input#" + model + "_title").on('input', function() {
      $('#url-display-field').val(convertTitle($('input#' + model + '_title').val()) + ".html");
      $('#url-hidden-field').val(convertTitle($('input#' + model + '_title').val()) + ".html");
    });
  }
});

window.addMoreImage = function (element){
  var n = $("#image-list > div").length
  $( ".image-upload-"+ (n-1) +"" ).click();
  $('input[type="file"]').change(function(){
    var image = window.URL.createObjectURL(this.files[0]);
    $( ".frames").prepend('<div class="parent-image"><img src="'+image+'" /></div>');
  });
  var text = "<div class='hiden'><input accept='image/jpeg, image/gif, image/png, image/jpg' class='form-control hidden image-upload-" + n + "' type='file' name='product[product_images_attributes][" + n + "][image]' id='product_product_images_attributes_" + n + "_image'></div>"
  $("#image-list").append(text)
}
