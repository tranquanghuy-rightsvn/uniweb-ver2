import { build_page, build_toolbar, build_console } from "./build_element";
import { display_only_current_page, convertUrl, convertTitle, current_uni_page, current_uni_website, save_website, set_current_uni_page, async_menu, async_footer, page_links, set_root_variable_css, save_maps } from "./common";

function initialize(){
  let default_website = [
    {
      "page": "Trang chủ",
      "elements": []
    }
  ]

  let website = localStorage.getItem('website') || JSON.stringify(default_website)

  localStorage.setItem('website', website)
  localStorage.setItem('current_uni_page', 'Trang chủ')
  build_page();
  build_toolbar();
  build_console();
  display_only_current_page();
  set_root_variable_css()
}

window.addElement = async function(){
  let website = JSON.parse(localStorage.getItem('website'))
  let current_page_name = current_uni_page() //edit
  let current_page = website.find((page) => { return page.page == current_page_name})
  let item_name = $('#select-item').val()

  const response = await fetch("./bootstrap5.json");
  const bootstrap5 = await response.json();
  let first_ele = bootstrap5.find((ele) => { return ele.name == item_name})

  if(first_ele != undefined){
    first_ele['open'] = false;
    if(first_ele.name == "Menu" || first_ele.name == "Footer" ){
      let available_ele = current_page.elements.find((ele) => { return ele.name == first_ele.name})
      if(available_ele){
        alert('Chỉ một ' + first_ele.name)
        return
      }
    }
    current_page.elements.push(first_ele)
    current_page.elements.sort(function(a, b) {
      if (a.name === "Menu") {
          return -1;
      } else if (b.name === "Menu") {
          return 1;
      } else if (a.name === "Footer") {
          return 1;
      } else if (b.name === "Footer") {
          return -1;
      } else {
          return 0;
      }
    });

    if(first_ele.name == "Menu"){
      first_ele.menu_items.map((item, k) => {
        if(k == 0) return
        website.push({
          "page": item.name,
          "elements": [
            first_ele
          ]
        })

        if(item.type == 'dropdown'){
          item.children.map((ch) => {
            website.push({
              "page": ch,
              "dropdown": true,
              "elements": [
                first_ele
              ]
            })
          });
        }
      })
    }

    localStorage.setItem('website', JSON.stringify(website))
    build_page()
    build_toolbar()
    build_console()
    display_only_current_page()
    if(first_ele.name == "Footer"){
      async_footer()
    }

    if(first_ele.name == "Posts" || first_ele.name == "Products") {
      save_maps()
    }
  }
}

window.show_detail = function(button){
  let website = JSON.parse(localStorage.getItem('website'))
  let parent = $(button).closest('.uni-box-item').data('element')
  let page_name = $(button).closest('.uni-box-item').data('page')
  let order = $(button).closest('.uni-box-item').data('order')
  let page = website.find((p) => { return p.page == page_name})
  let elements = page.elements
  elements[order].open = !elements[order].open;

  save_website(website)
  build_toolbar()
}

window.delete_item = function(button){
  let order_delete = $(button).closest(".uni-box-item").data('order')
  $(button).closest(".uni-box-item").remove();
  let element_delete = $(button).closest(".uni-box-item").data('element')
  let page_name = $(button).closest(".uni-box-item").data('page')
  let order = $(button).closest(".uni-box-item").data('order')

  $("." + element_delete).remove();
  let website = JSON.parse(localStorage.getItem('website'))
  let page = website.find((p) => { return p.page == page_name })
  let element_delete_name = page.elements[order].name
  page.elements.splice(order, 1)

  if(element_delete_name == "Menu"){
    website[0].elements.shift()
    website = [website[0]]
  }

  save_website(website)
  build_console()
  build_toolbar()

  if(element_delete_name == "Posts" || element_delete_name == "Products") {
    save_maps()
  }
}

window.edit_menu_item = function(button){
  let p = $(button).closest('.uni-detail-item').find('p')
  p.replaceWith('<input type="text" value="' + p.text() + '" class="form-control">')
  $(button).replaceWith('<button class="btn btn-success" onclick="update_menu_item(this)">OK</button>')
}

window.update_menu_item = function(button){
  let input = $(button).closest('.uni-detail-item').find('input')
  let select = $(button).closest('.uni-detail-item').find('select')

  let order = $(button).closest('.uni-detail-item').find('.uni-detail-menu-item').data('order')
  let order_element = $(button).closest('.uni-box-item').data('order')
  let current_website = current_uni_website()
  let current_page = current_website.find((p) => {return p.page == current_uni_page() })
  current_page.elements[order_element].menu_items[order].name = input.val()
  current_page.elements[order_element].menu_items[order].type = select.val()
  let number_delete = 0
  if(select.val() != 'dropdown'){
    let children = current_page.elements[order_element].menu_items[order].children || []
    number_delete = children.length
  }
  let new_id = 0

  for (let i = 0; i < current_page.elements[order_element].menu_items.length; i++) {
    const it = current_page.elements[order_element].menu_items[i];
    if (it.name == input.val()) {
      break;
    }
    if (it.type == 'dropdown') {
      new_id += it.children.length + 1;
    } else {
      new_id += 1;
    }
  }
  current_website[new_id].page = input.val()
  current_website.splice(new_id + 1, number_delete)
  current_page.elements[order_element].menu_items[order].children = []

  let check_current_page = current_website.find((p) => {return p.page == current_uni_page()})

  if(check_current_page == undefined){
    localStorage.setItem('current_uni_page', input.val())
  }

  save_website(current_website)
  build_page()
  build_toolbar()
  build_console()
  async_menu()
}

window.change_property_input = function(button){
  let new_value = $(button).siblings('input').val()
  let property = $(button).siblings('input').data('property')
  let order_element = $(button).closest('.uni-box-item').data('order')
  let current_website = current_uni_website()
  let current_page = current_website.find((p) => {return p.page == current_uni_page() })
  current_page.elements[order_element].property[property] = new_value

  save_website(current_website)
  build_page()
  build_console()
}

window.save_text = function(button){
  let inputs = $(button).closest('.uni-detail').find('input[type="text"]')
  let new_value = $(button).siblings('input').val()
  let order_element = $(button).closest('.uni-box-item').data('order')
  let current_website = current_uni_website()
  let current_page = current_website.find((p) => {return p.page == current_uni_page() })
  let new_text = Array.from(inputs).map((input) => { return input.value })

  current_page.elements[order_element].property.text = new_text
  save_website(current_website)
  build_page()
  build_console()
}

window.save_link = function(button){
  let selects = $(button).closest('.uni-detail').find('select.select-link')
  let order_element = $(button).closest('.uni-box-item').data('order')
  let current_website = current_uni_website()
  let current_page = current_website.find((p) => {return p.page == current_uni_page() })

  let new_links = Array.from(selects).map((select) => { return $(select).val() })
  console.log(new_links)

  current_page.elements[order_element].property.link = new_links
  save_website(current_website)
  build_page()
  build_console()
}


window.save_iframe_map = function(button){
  let new_value = $(button).siblings('input').val()
  let order_element = $(button).closest('.uni-box-item').data('order')
  let current_website = current_uni_website()
  let current_page = current_website.find((p) => {return p.page == current_uni_page() })

  current_page.elements[order_element].property.iframeMap = new_value
  save_website(current_website)
  build_page()
  build_console()
}
document.addEventListener("turbolinks:load", () => {
  initialize();
})

window.set_current_uni_page = function(button){
  localStorage.setItem('current_uni_page', $(button).text())
  build_page()
  build_console()
  build_toolbar()
}
