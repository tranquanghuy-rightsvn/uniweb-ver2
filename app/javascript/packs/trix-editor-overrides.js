document.addEventListener("turbolinks:load", () => {
  setTimeout(() => {
    $('#alert').hide()
  }, 4000)

  window.addEventListener("trix-attachment-add", function (event) {
    if (event.attachment.file) {
      const image = event.attachment;
      const formData = new FormData();

      formData.append("file", event.attachment.file);

      $.ajax({
        url: "/attachments/resize",
        type: "POST",
        data: formData,
        processData: false,
        contentType: false,
        success: function(response) {
          console.log("Thành công");
          console.log(response);

          // Điều chỉnh thông tin hình ảnh nếu cần
          image.setAttributes({
            url: response.url,
            width: response.width,
            height: response.height,
          });
        },
        error: function(xhr, status, error) {
          console.error("Lỗi khi gửi yêu cầu AJAX: " + error);
        }
      });
    }
  })
})
