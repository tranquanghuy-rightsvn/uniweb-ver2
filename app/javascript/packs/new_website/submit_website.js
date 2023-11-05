import { convertUrl, convertTitle } from './common'

window.submit_website = function(){
  let website = JSON.parse(localStorage.getItem('website'))
  let pages = []
  let map_images = []
  let elements = website[0].elements[0] || {}
  let menu_items = elements.menu_items || []
  let id_hash = $('#user-id').data('id')
  website.map((page, i) => {
    if(menu_items.find((item) => {return item.name == page.page && item.type == 'dropdown'})) return

    let url = convertUrl(page.page) + '.html'
    if(i == 0){ url = 'index.html' }
    let html = ''
    Array.from($('#all .uni-' + convertTitle(page.page)).children()).map((element) => {
      html += element.innerHTML
    })

    pages.push({url: url, html: html, name: page.page})
    page.elements.map(function(element, i){
      if(element.map_images){
        element.map_images.map(function(image_map){
          map_images.push({element_name: (element.name + " - " + i), page_name: page.page, parent_div: image_map.parent_div })
        })
      }
    })
  })

  let maps = localStorage.getItem('maps')
  $.ajax({
    type: "POST",
    url: '/api/websites',
    data: {
      website: {
        pages: JSON.stringify(pages),
        maps: maps,
        map_images: JSON.stringify(map_images),
        user_id: id_hash,
        title: $('#titleWebsite').val(),
        name: $('#nameWebsite').val(),
        description: $('#descriptionWebsite').val()
      }
    },
    success: function(response){
      console.log(response)
    }
  });
}
