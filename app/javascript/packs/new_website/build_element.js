import { display_only_current_page, convertUrl, convertTitle, current_uni_page, current_uni_website, save_website, set_current_uni_page, async_menu, page_links } from "./common";
import { generate_menu, generate_header, generate_feature, generate_common } from './generate_element'

export function build_page(){
  var website = JSON.parse(localStorage.getItem('website'))
  $('#all').html('')
  website.map((page) => {
    $('#all').append("<div class='uni-" + convertTitle(page.page) + "'></div>")

    page.elements.map((ele, index) => {
      $('.uni-' + convertTitle(page.page)).append("<div class='uni-" + convertTitle(page.page) + "-" + index + "'></div>")
      $('.uni-' + convertTitle(page.page) + "-" + index).html(ele.html)

      if(ele.name == 'Menu'){
        generate_menu(page, ele, index)
      }else if(ele.name == 'Header'){
        generate_header(page, ele, index)
      }else if(ele.name == 'Feature'){
        generate_feature(page, ele, index)
      }

      generate_common(page, ele, index)
    })
  })

  $('#all a').click(function(e) {
    e.preventDefault();
  });
  display_only_current_page()
}

export async function build_toolbar(){
  let item_name = $('#select-item').val()
  let current_page = current_uni_page()
  let pages = JSON.parse(localStorage.getItem('website'))

  let page = pages.find((p) => { return p.page == current_page })

  var element = page.elements[page.elements.length - 1];
  var index = page.elements.length - 1;
  $('#mydivcontent').html('')
  const response = await fetch("./bootstrap5.json");
  const bootstrap5 = await response.json();

  page.elements.map((ele, index) => {
    let display_none = ele.open ? "" : "display-none"
    let dragable = ele.name != 'Menu' && ele.name != 'Footer'

    let html = "<div class='uni-box-item " + (dragable ? 'dragable' : '') + "' data-order='" + index + "'data-page='" +  page.page +"' data-element=\"" + 'uni-' + convertTitle(page.page) + "-" + index + "\"><div class=\"uni-item\" ><b>" + ele.name + "</b><div><button class='btn btn-danger' onclick='delete_item(this)'>Xóa</button> <button class='btn btn-warning' onclick=\"show_detail(this)\">" + (display_none ? "Chi tiết" : "Rút gọn") + "</button></div></div><div class=\"uni-detail " + display_none + "\"><div class=\"uni-detail-item\">Template:"
    html += "<select class=\"form-select\">"

    bootstrap5.map(function(theme){
      if(theme.name == ele.name){
        let selected = theme.type == ele.type
        html +=  "<option value=\"" + theme.type + "\"" + (selected ? "selected" : "") +">" + theme.type +"</option>"
      }
    })

    html += "</select><button class='btn btn-success' onclick='change_theme(this)'>Lưu</button></div>"

    if ('fullscreen' in ele.property) {
      let checked = ele.property.fullscreen
      html += "<div class=\"uni-detail-item\"><div class=\"form-check\"><input class=\"form-check-input uni-detail-menu-fullscreen\" id=\"uni-detail-menu-fullscreen-" + convertTitle(page.page) + "-" + index + "\" type=\"checkbox\" data-element=\"" + 'uni-' + convertTitle(page.page) + "-" + index +"\"" + (checked ? "checked" : "") + "><label class=\"form-check-label\" for=\"uni-detail-menu-fullscreen-" + convertTitle(page.page) + "-" + index + "\">Toàn màn hình</label></div></div>"
    }

    if ('searchable' in ele.property) {
      let checked = ele.property.searchable
      html += "<div class=\"uni-detail-item\"><div class=\"form-check\"><input class=\"form-check-input uni-detail-menu-seachable\" id=\"uni-detail-menu-searchable-" + convertTitle(page.page) + "-" + index + "\" type=\"checkbox\" " + (checked ? "checked" : "") + "><label class=\"form-check-label\" for=\"uni-detail-menu-searchable-" + convertTitle(page.page) + "-" + index  + "\">Có thể tìm kiếm</label></div></div>"
    }

    if ('loginable' in ele.property) {
      let checked = ele.property.loginable
      html += "<div class=\"uni-detail-item\"><div class=\"form-check\"><input class=\"form-check-input uni-detail-menu-loginable\" id=\"uni-detail-menu-loginable-" + convertTitle(page.page) + "-" + index + "\" type=\"checkbox\" " + (checked ? "checked" : "") + "><label class=\"form-check-label\" for=\"uni-detail-menu-loginable-" + convertTitle(page.page) + "-" + index + "\">Có thể login</label></div></div>"
    }

    if ('cartable' in ele.property) {
      let checked = ele.property.cartable
      html += "<div class=\"uni-detail-item\"><div class=\"form-check\"><input class=\"form-check-input uni-detail-menu-cartable\" id=\"uni-detail-menu-cartable-" + convertTitle(page.page) + "-" + index + "\" type=\"checkbox\" " + (checked ? "checked" : "") + "><label class=\"form-check-label\" for=\"uni-detail-menu-cartable-" + convertTitle(page.page) + "-" + index + "\">Có giỏ hàng</label></div></div>"
    }

    if ('boxshadow' in ele.property) {
      let checked = ele.property.boxshadow
      html += "<div class=\"uni-detail-item\"><div class=\"form-check\"><input class=\"form-check-input uni-detail-menu-boxshadow\" id=\"uni-detail-menu-boxshadow-" + convertTitle(page.page) + "-" + index + "\" type=\"checkbox\" " + (checked ? "checked" : "") + "><label class=\"form-check-label\" for=\"uni-detail-menu-boxshadow-" + convertTitle(page.page) + "-" + index + "\">Đổ bóng &nbsp;</label></div></div>"
    }

    if ('background' in ele.property) {
      let background = ele.property.background
      html += "<div class=\"uni-detail-item\"><label for=\"colorpickerMenu\">Background &nbsp;</label><input type=\"color\" id=\"colorpickerMenu\" value=\"" + background + "\"></div>"
    }

    if ('opacity' in ele.property) {
      let opacity = ele.property.opacity
      html += "<div class=\"uni-detail-item\"><label for=\"colorpickerMenu\">Opacity &nbsp;</label><input type=\"number\" id=\"opacityMenu\" value=\"" + opacity + "\" min='0' max='1' step='0.1'>  (1 >= opacity >= 0)</div>"
    }

    if ('colorDark' in ele.property) {
      let colorDark = ele.property.colorDark
      html += "<div class=\"uni-detail-item\"><div class=\"form-check\"><input class=\"form-check-input uni-detail-menu-colordark\" id=\"uni-detail-menu-colordark-" + convertTitle(page.page) + "-" + index + "\" type=\"checkbox\" " + (colorDark ? "checked" : "") + "><label class=\"form-check-label\" for=\"uni-detail-menu-colordark-" + convertTitle(page.page) + "-" + index + "\">Màu chữ sáng</label></div></div>"
    }

    if ('colorBold' in ele.property) {
      let colorBold = ele.property.colorBold
      html += "<div class=\"uni-detail-item\"><div class=\"form-check\"><input class=\"form-check-input uni-detail-menu-colorbold\" id=\"uni-detail-menu-colorbold-" + convertTitle(page.page) + "-" + index + "\" type=\"checkbox\" " + (colorBold ? "checked" : "") + "><label class=\"form-check-label\" for=\"uni-detail-menu-colorbold-" + convertTitle(page.page) + "-" + index + "\">Chữ đậm</label></div></div>"
    }

    if ('normalTitle' in ele.property) {
      let normalTitle = ele.property.normalTitle
      html += "<div class=\"uni-detail-item\"><input value='" + normalTitle + "'type=\"text\" data-property='normalTitle'><button class='btn btn-success' onclick='change_property_input(this)'>Lưu</button></div>"
    }

    if ('bordered' in ele.property) {
      let bordered = ele.property.bordered
      html += "<div class=\"uni-detail-item\"><div class=\"form-check\"><input class=\"form-check-input uni-detail-element-bordered\" id=\"uni-detail-element-bordered-" + convertTitle(page.page) + "-" + index + "\" type=\"checkbox\" " + (bordered ? "checked" : "") + "><label class=\"form-check-label\" for=\"uni-detail-element-bordered-" + convertTitle(page.page) + "-" + index + "\">Có viền</label></div></div>"
    }

    if ('text' in ele.property){
      ele.property.text.map((text, id) => {
        html += "<div class=\"uni-detail-item\">Text " + (id + 1) + ": &nbsp;<input class='form-control' type='text' value='" + text + "'></div>"
      })
      html += "<button class='btn btn-success mb-3' onclick='save_text(this)'>Lưu text</button>"
    }

    if ('link' in ele.property){
      let parent = '.uni-' + convertTitle(page.page) + "-" + index
      let page_links = current_page_links()
      ele.property.link.map((link, id) => {
        html += "<div class=\"uni-detail-item\">" + $(parent + ' .link-' + (id + 1)).text() + "&nbsp; <select class='form-select select-link'><option></option>"
        page_links.map((lk) => {
          let selected = lk == link ? "selected" : ""
          html += "<option " + selected + " >" + lk + "</option>"
        })

        html += "</select></div>"
      })
      html += "<button class='btn btn-success mb-3' onclick='save_link(this)'>Lưu link</button></div>"
    }

    if ('categoryName' in ele.property){
      let categoryName = ele.property.categoryName
      html += "<div class=\"uni-detail-item\">Category name &nbsp; " + "<input class='form-control' type='text' value='" + categoryName + "'><button class='btn btn-success' onclick='save_category(this)'>Lưu</button>"
    }

    if ('linkNetwork' in ele.property){
      let linkNetwork = ele.property.linkNetwork
      html += "<div class='link-network-group'>"
      for (const key in linkNetwork) {
        const value = linkNetwork[key];
        html += "<div class=\"uni-detail-item\">" + key + "&nbsp; " + "<input class='form-control' data-key=" + key +" type='text' value='" + value + "'></div>"
      }
      html += "<button class='btn btn-success mb-3' onclick='save_link_network(this)'>Lưu</button></div>"
    }

    if ('iframeMap' in ele.property){
      let iframeMap = ele.property.iframeMap
      html += "<div class=\"uni-detail-item\"> Iframe Google Map &nbsp;" + "<input class='form-control' type='text' value='" + iframeMap + "'><button class='btn btn-success mb-3' onclick='save_iframe_map(this)'>Lưu</button></div>"
    }

    if(ele.name == "Menu"){
      html += "<div class=\"uni-detail-item\"><i>Lưu ý: Logo sẽ được chỉnh trong phần quản lý</i></div>"
    }

    if ('menu_items' in ele) {
      ele.menu_items.map(function(item, k){
        html += "<div class=\"uni-detail-item\"><div class=\"uni-detail-menu-item\" data-order='" + k + "'><p>" + item.name + "</p><select>"
        const types = ["normal", "dropdown", "disabled"]
        types.map((type) => {
          let selected = item.type == type;
          html += "<option " + (selected ? "selected" : "") + ">" + type + "</option>";
        })
        if(k == 0){
          html += "</select></div><div class=\"uni-detail-menu-item-button\"><button class=\"btn btn-secondary\" onclick='edit_menu_item(this)'>Sửa</button></div></div>"
        }else{
          html += "</select></div><div class=\"uni-detail-menu-item-button\"><button class=\"btn btn-secondary\" onclick='edit_menu_item(this)'>Sửa</button><button onclick='remove_menu_item(this)' class=\"btn btn-danger\">Xóa</button></div></div>"
        }

        if(item.type == 'dropdown'){
          let item_children = item.children || []
          html += '<div class="uni-detail-item-dropdown"><div class="uni-list-dropdown">'
          item_children.map((it) => {
            html += '<label class="btn-dropdown-menu btn">' + it + '&nbsp;&nbsp;<span onclick="remove_item_dropwdown(this)">&#215;</span></label>'
          })
          html += '</div><div class="uni-detail-item-dropdown-children"><input class="form-control"><button class="btn btn-info" onclick="add_dropdown_item(this)">Thêm</button></div></div>'
        }
      })
    }

    if(ele.name == "Menu"){
      html += "<div class=\"uni-detail-item\"><div class=\"uni-detail-menu-item\"><input class=\"form-control\" id=\"uniq-add-menu-item\"><select><option>normal</option><option>dropdown</option><option>disabled</option></select><div class=\"uni-detail-menu-item-button\"><button class=\"btn btn-dark\" onclick='add_item_menu(this)'>Thêm</button></div></div></div></div></div></div>"
    }

    $('#mydivcontent').append(html)

    $('input.uni-detail-menu-loginable').change(function() {
      let website = JSON.parse(localStorage.getItem('website'))

      let parent = $(this).closest('.uni-box-item').data('element')
      let page_name = $(this).closest('.uni-box-item').data('page')
      let order = $(this).closest('.uni-box-item').data('order')

      let page = website.find((p) => { return p.page == page_name})
      let element = page.elements[order]
      website.map((p) => { p.elements[0].property.loginable })

      if(this.checked) {
      	element.property.loginable = true
      	$('.' + parent + ' .uni-loginable').html('<li class="nav-item nav-user"><a>Login</a>/<a>Sign up</a></li>')
      } else {
      	element.property.loginable = false
      	$('.' + parent + ' .uni-loginable').html('')
      }
      save_website(website)
      async_menu()
    });

    $('input.uni-detail-menu-fullscreen').change(function() {
      let website = JSON.parse(localStorage.getItem('website'))

      let parent = $(this).closest('.uni-box-item').data('element')
      let page_name = $(this).closest('.uni-box-item').data('page')
      let order = $(this).closest('.uni-box-item').data('order')

      let page = website.find((p) => { return p.page == page_name})
      let element = page.elements[order]

      if(this.checked) {
        // let container = $('.' + parent + ' .container')
        // container.removeClass('container');

        // container.addClass('container-fluid');
        element.property.fullscreen = true
      } else {
        // let container = $('.' + parent + ' .container-fluid')
        // container.removeClass('container-fluid');

        // container.addClass('container');
        element.property.fullscreen = false
      }

      save_website(website)
      build_page()
      async_menu()
    });

    $('input.uni-detail-menu-seachable').change(function() {
      let website = JSON.parse(localStorage.getItem('website'))

      let parent = $(this).closest('.uni-box-item').data('element')
      let page_name = $(this).closest('.uni-box-item').data('page')
      let order = $(this).closest('.uni-box-item').data('order')

      let page = website.find((p) => { return p.page == page_name})
      let element = page.elements[order]

      if(this.checked) {
        element.property.searchable = true
        $('.' + parent + ' .uni-searchable').append('<form class="d-flex mb-0"><input class="form-control me-2" type="search" placeholder="Search" aria-label="Search"><button class="btn btn-outline-success" type="submit">Search</button></form>')
      } else {
        element.property.searchable = false
        $('.' + parent + ' .uni-searchable').html('')
      }
      save_website(website)
      async_menu()
    });

    $('input.uni-detail-menu-cartable').change(function() {
      let website = JSON.parse(localStorage.getItem('website'))

      let parent = $(this).closest('.uni-box-item').data('element')
      let page_name = $(this).closest('.uni-box-item').data('page')
      let order = $(this).closest('.uni-box-item').data('order')

      let page = website.find((p) => { return p.page == page_name})
      let element = page.elements[order]

      if(this.checked) {
        element.property.cartable = true
        // $('.' + parent + ' .uni-cartable').append('<li class="nav-item"><i class="fas fa-shopping-cart"></i></li>')
      } else {
        element.property.cartable = false
        // $('.' + parent + ' .uni-cartable').html('')
      }
      save_website(website)
      build_page()
      async_menu()
    });

    $('input.uni-detail-menu-boxshadow').change(function() {
      let website = JSON.parse(localStorage.getItem('website'))

      let parent = $(this).closest('.uni-box-item').data('element')
      let page_name = $(this).closest('.uni-box-item').data('page')
      let order = $(this).closest('.uni-box-item').data('order')

      let page = website.find((p) => { return p.page == page_name})
      let element = page.elements[order]

      if(this.checked) {
        element.property.boxshadow = true
        $('.' + parent + ' nav.navbar').addClass('box-shadow-menu')
      } else {
        element.property.boxshadow = false
        $('.' + parent + ' nav.navbar').removeClass("box-shadow-menu");
      }
      localStorage.setItem('website', JSON.stringify(website))
      async_menu()
    });

    $('input.uni-detail-menu-colordark').change(function() {
      let website = JSON.parse(localStorage.getItem('website'))

      let parent = $(this).closest('.uni-box-item').data('element')
      let page_name = $(this).closest('.uni-box-item').data('page')
      let order = $(this).closest('.uni-box-item').data('order')

      let page = website.find((p) => { return p.page == page_name})
      let element = page.elements[order]

      if(this.checked) {
        element.property.colorDark = true
        $('.' + parent + ' nav.navbar').addClass('color-dark')
      } else {
        element.property.colorDark = false
        $('.' + parent + ' nav.navbar').removeClass("color-dark");
      }
      localStorage.setItem('website', JSON.stringify(website))
      async_menu()
    });

    $('input.uni-detail-menu-colorbold').change(function() {
      let website = JSON.parse(localStorage.getItem('website'))

      let parent = $(this).closest('.uni-box-item').data('element')
      let page_name = $(this).closest('.uni-box-item').data('page')
      let order = $(this).closest('.uni-box-item').data('order')

      let page = website.find((p) => { return p.page == page_name})
      let element = page.elements[order]

      if(this.checked) {
        element.property.colorBold = true
        $('.' + parent + ' nav.navbar').addClass('color-bold')
      } else {
        element.property.colorBold = false
        $('.' + parent + ' nav.navbar').removeClass("color-bold");
      }
      localStorage.setItem('website', JSON.stringify(website))
      async_menu()
    });

    $('#colorpickerMenu').on('input', function () {
      const value = $(this).val();
      const website = JSON.parse(localStorage.getItem('website'));
      const $boxItem = $(this).closest('.uni-box-item');
      const parent = $boxItem.data('element');
      const page_name = $boxItem.data('page');
      const order = $boxItem.data('order');
      const page = website.find((p) => p.page === page_name);
      const element = page.elements[order];

      element.property.background = value;
      $('.' + parent + ' nav.navbar').attr('style', 'background: ' + value + ' !important');

      localStorage.setItem('website', JSON.stringify(website));
      async_menu();
    });

    $('#opacityMenu').on('input', function () {
      const value = $(this).val();
      const website = JSON.parse(localStorage.getItem('website'));
      const $boxItem = $(this).closest('.uni-box-item');
      const parent = $boxItem.data('element');
      const page_name = $boxItem.data('page');
      const order = $boxItem.data('order');
      const page = website.find((p) => p.page === page_name);
      const element = page.elements[order];
      const color = element.property.background;
      element.property.opacity = value;
      let red = parseInt(color.substring(1, 3), 16);
      let green = parseInt(color.substring(3, 5), 16);
      let blue = parseInt(color.substring(5, 7), 16);
      let rgba  = ` rgba(${red}, ${green}, ${blue}, ${value})`
      $('.' + parent + ' nav.navbar').attr('style', 'background: ' + rgba + ' !important');

      if(value <1){
        $('.' + parent + ' nav.navbar').addClass('opacity-menu')
      }else{
        $('.' + parent + ' nav.navbar').removeClass('opacity-menu')
      }

      localStorage.setItem('website', JSON.stringify(website));
      async_menu();
    });

    $('input.uni-detail-element-bordered').change(function() {
      let website = JSON.parse(localStorage.getItem('website'))

      let parent = $(this).closest('.uni-box-item').data('element')
      let page_name = $(this).closest('.uni-box-item').data('page')
      let order = $(this).closest('.uni-box-item').data('order')

      let page = website.find((p) => { return p.page == page_name})
      let element = page.elements[order]

      if(this.checked) {
        element.property.bordered = true
      } else {
        element.property.bordered = false
      }
      localStorage.setItem('website', JSON.stringify(website))
      build_page()
      async_menu()
    });

    function current_page_links(){
      let website = JSON.parse(localStorage.getItem('website'))
      let first_item = website[0].elements[0]
      let page_links = ["index.html"]
      if (first_item.name == "Menu"){
        page_links = []
        first_item.menu_items.map((item, i) => {
          if(i == 0){
            page_links.push('index.html')
          }else{
            if(item.type == "dropdown"){
              item.children.map((ch) => { page_links.push(convertUrl(ch) + '.html')})
            }else{
              page_links.push(convertUrl(item.name) + '.html')
            }
          }
        })
      }
      return page_links
    }
  })
}

export function build_console(){
  let website = JSON.parse(localStorage.getItem('website'))

  if(website){
    $('.uni-toolbar-page').html('')
    let elements = website[0].elements[0] || {}
    let menu_items = elements.menu_items || []

    website.map((page)=>{
      let dropdown = page.dropdown == true
      if(menu_items.find((item) => {return item.name == page.page && item.type == 'dropdown'})) return

      if(current_uni_page() == page.page){
        $('.uni-toolbar-page').append('<button class="btn btn-info mr-3" onclick="set_current_uni_page(this)">' + page.page + '</button>')
      }else{
        $('.uni-toolbar-page').append('<button class="btn btn-secondary ' + (dropdown ? 'btn-dropdown' : '') + ' mr-3" onclick="set_current_uni_page(this)">' + page.page + '</button>')
      }
    })
  }else{
    $('.uni-toolbar-page').html('<button class="btn btn-info" onclick="set_current_uni_page(this)">' + 'Trang chủ' + '</button>')
  }
}
