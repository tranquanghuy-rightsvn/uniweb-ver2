function convertTitle(title) {
  title = title.replace(/ /g, '-').toLowerCase();
  title = title.replace(/[áàảãạăắẳẵặằâấầẩẫậ]/g, 'a');
  title = title.replace(/[èéẻẽẹêềếểễệ]/g, 'e');
  title = title.replace(/[iìỉíịĩ]/g, 'i');
  title = title.replace(/[ýỳỷỹỵ]/g, 'y');
  title = title.replace(/[òóỏõọôồốổỗộơờớởỡợ]/g, 'o');
  title = title.replace(/[ưừứựửữùúủũụ]/g, 'u');
  title = title.replace(/[đ]/g, 'd');

  title = title.split('').filter(function (cha) {
    return 'qwertyuiopasdfghjklzxcvbnm-0123456789'.includes(cha);
  }).join('');

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
