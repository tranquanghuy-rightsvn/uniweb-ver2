import { build_page, build_toolbar, build_console } from "./build_element";
import { display_only_current_page, convertUrl, convertTitle, current_uni_page, current_uni_website, save_website, set_current_uni_page, async_menu, async_footer, page_links, set_root_variable_css, save_maps } from "./common";

document.addEventListener("turbolinks:load", () => {
function add_toolbar(){
	item_name = $('#select-item').val()
	current_page = current_uni_page()
	let pages = JSON.parse(localStorage.getItem('website'))

	let page = pages.find((p) => { return p.page == current_page })

	var element = page.elements[page.elements.length - 1];
	var index = page.elements.length - 1;
		let html = "<div class='uni-box-item' data-order='" + index + "'data-page='" +  page.page +"' data-element=\"" + 'uni-' + convertTitle(page.page) + "-" + index + "\"><div class=\"uni-item\" ><b>" + element.name + "</b><div><button class='btn btn-danger' onclick='delete_item(this)'>Xóa</button> <button class='btn btn-warning' onclick=\"show_detail(this)\">Chi tiết</button></div></div><div class=\"uni-detail\"><div class=\"uni-detail-item\">Template:"
		html += "<select class=\"form-select\" id=\"select-menu-theme\">"

		html += "</select></div>"

		if ('fullscreen' in element.property) {
      let checked = element.property.fullscreen
      html += "<div class=\"uni-detail-item\"><div class=\"form-check\"><input class=\"form-check-input uni-detail-menu-fullscreen\" id=\"uni-detail-menu-fullscreen-" + convertTitle(page.page) + "-" + index + "\" type=\"checkbox\" data-element=\"" + 'uni-' + convertTitle(page.page) + "-" + index +"\"" + (checked ? "checked" : "") + "><label class=\"form-check-label\" for=\"uni-detail-menu-fullscreen-" + convertTitle(page.page) + "-" + index + "\">Toàn màn hình</label></div></div>"
    }

    if ('searchable' in element.property) {
      let checked = element.property.searchable
      html += "<div class=\"uni-detail-item\"><div class=\"form-check\"><input class=\"form-check-input uni-detail-menu-seachable\" id=\"uni-detail-menu-searchable-" + convertTitle(page.page) + "-" + index + "\" type=\"checkbox\" " + (checked ? "checked" : "") + "><label class=\"form-check-label\" for=\"uni-detail-menu-searchable-" + convertTitle(page.page) + "-" + index  + "\">Có thể tìm kiếm</label></div></div>"
    }

    if ('loginable' in element.property) {
      let checked = element.property.loginable
      html += "<div class=\"uni-detail-item\"><div class=\"form-check\"><input class=\"form-check-input uni-detail-menu-loginable\" id=\"uni-detail-menu-loginable-" + convertTitle(page.page) + "-" + index + "\" type=\"checkbox\" " + (checked ? "checked" : "") + "><label class=\"form-check-label\" for=\"uni-detail-menu-loginable-" + convertTitle(page.page) + "-" + index + "\">Có thể login</label></div></div>"
    }

    if ('cartable' in element.property) {
      let checked = element.property.cartable
      html += "<div class=\"uni-detail-item\"><div class=\"form-check\"><input class=\"form-check-input uni-detail-menu-cartable\" id=\"uni-detail-menu-cartable-" + convertTitle(page.page) + "-" + index + "\" type=\"checkbox\" " + (checked ? "checked" : "") + "><label class=\"form-check-label\" for=\"uni-detail-menu-cartable-" + convertTitle(page.page) + "-" + index + "\">Có giỏ hàng</label></div></div>"
    }

    if ('boxshadow' in ele.property) {
      let checked = ele.property.boxshadow
      html += "<div class=\"uni-detail-item\"><div class=\"form-check\"><input class=\"form-check-input uni-detail-menu-boxshadow\" id=\"uni-detail-menu-boxshadow-" + convertTitle(page.page) + "-" + index + "\" type=\"checkbox\" " + (checked ? "checked" : "") + "><label class=\"form-check-label\" for=\"uni-detail-menu-boxshadow-" + convertTitle(page.page) + "-" + index + "\">Đổ bóng</label></div></div>"
    }

    if ('background' in ele.property) {
      let background = ele.property.background
      html += "<div class=\"uni-detail-item\"><label for=\"colorpickerMenu\">Background</label><input type=\"color\" id=\"colorpickerMenu\" value=\"" + background + "\"></div>"
    }

    if ('opacity' in ele.property) {
      let opacity = ele.property.opacity
      html += "<div class=\"uni-detail-item\"><label for=\"colorpickerMenu\">Opacity</label><input type=\"number\" id=\"opacityMenu\" value=\"" + opacity + "\" min='0' max='1' step='0.1'> (1 >= opacity >= 0)</div>"
    }

    // if ('nomalTitle' in ele.property) {
    //   let opacity = ele.property.opacity
    //   html += "<div class=\"uni-detail-item\"><input type=\"text\" data-property='normalTitle'><button class='btn btn-success' onclick='change_normal_title(this)'>Lưu</button></div>"
    // }

		if(element.type == "Menu"){
			html += "<div class=\"uni-detail-item\"><i>Lưu ý: Logo sẽ được chỉnh trong phần quản lý</i></div>"
		}

    if ('menu_items' in element) {
      element.menu_items.map(function(item, k){
        html += "<div class=\"uni-detail-item\"><div class=\"uni-detail-menu-item\" data-order='" + k + "'><p>" + item.name + "</p><select>"
        const types = ["normal", "dropdown", "disabled"]
        types.map((type) => {
          let selected = item.type == type;
          html += "<option " + (selected ? "selected" : "") + ">" + type + "</option>";
        })
        html += "</select></div><div class=\"uni-detail-menu-item-button\"><button class=\"btn btn-secondary\" onclick='edit_menu_item(this)'>Sửa</button><button class=\"btn btn-danger\">Xóa</button></div></div>"

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

		if(element.type == "Menu"){
			html += "<div class=\"uni-detail-item\"><div class=\"uni-detail-menu-item\"><input class=\"form-control\" id=\"uniq-add-menu-item\"><select><option>normal</option><option>dropdown</option><option>disabled</option></select><div class=\"uni-detail-menu-item-button\"><button class=\"btn btn-dark\">Thêm</button></div></div></div></div></div></div>"
		}

		$('#mydivcontent').append(html)

	$('input.uni-detail-menu-fullscreen').change(function() {
		let website = JSON.parse(localStorage.getItem('website'))

		let parent = $(this).closest('.uni-box-item').data('element')
		let page_name = $(this).closest('.uni-box-item').data('page')
		let order = $(this).closest('.uni-box-item').data('order')

		let page = website.find((p) => { return p.page == page_name})
		let element = page.elements[order]

		if(this.checked) {
			element.property.fullscreen = true
		} else {
			element.property.fullscreen = false
		}

		localStorage.setItem('website', JSON.stringify(website))
    console.log('build')
    build_page()
    build_toolbar()
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
			$('.' + parent + ' .uni-searchable').html('<div class="d-flex mb-0"><input class="form-control me-2" id="formSearchNav" type="search" placeholder="Search" aria-label="Search"><button class="btn btn-outline-success" onclick="search_nav()" type="button">Search</button></div>')
		} else {
			element.property.searchable = false
			$('.' + parent + ' .uni-searchable').html('')
		}
		localStorage.setItem('website', JSON.stringify(website))

	});

	$('input.uni-detail-menu-loginable').change(function() {
		let website = JSON.parse(localStorage.getItem('website'))

		let parent = $(this).closest('.uni-box-item').data('element')
		let page_name = $(this).closest('.uni-box-item').data('page')
		let order = $(this).closest('.uni-box-item').data('order')

		let page = website.find((p) => { return p.page == page_name})
		let element = page.elements[order]

    save_website(website)
    build_page()
    build_toolbar()
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
		} else {
			element.property.cartable = false
		}
		localStorage.setItem('website', JSON.stringify(website))
    build_page()
    build_toolbar()
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
      $('.' + parent + ' nav.navbar').addClass("box-shadow-menu");
    }
    localStorage.setItem('website', JSON.stringify(website))
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

  $('input.uni-detail-element-bordered').change(function() {
    console.log('dfsdf')
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

  function page_links(){
    let website = JSON.parse(localStorage.getItem('website'))
    let first_item = website[0].elements[0]
    page_links = ["index.html"]
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
}

window.add_dropdown_item = function(button){
  let new_child = $(button).closest('.uni-detail-item-dropdown-children').find('input').val();
  let website = JSON.parse(localStorage.getItem('website'))

  let parent = $(button).closest('.uni-box-item').data('element')
  let page_name = $(button).closest('.uni-box-item').data('page')
  let order = $(button).closest('.uni-box-item').data('order')
  let menu_item_name = $(button).closest('.uni-detail-item-dropdown').prevAll('.uni-detail-item:first').find('.uni-detail-menu-item p').text()

  let page = website.find((p) => { return p.page == page_name})
  let item = page.elements[order].menu_items.find((it) => {return it.name == menu_item_name})
  item.children = item.children || []
  item.children.push(new_child)
  let new_id = 0

  for (let i = 0; i < page.elements[0].menu_items.length; i++) {
    const it = page.elements[0].menu_items[i];
    if (it.type == 'dropdown') {
      new_id += it.children.length + 1;
    } else {
      new_id += 1;
    }
    if (it.name == menu_item_name) {
      break;
    }
  }

  website.splice(new_id - 1, 0, {"page": new_child, "elements": [page.elements[0]], "dropdown": true})
  save_website(website);
  $('.uni-list-dropdown').append('<label class="btn-dropdown-menu btn">' + new_child + '&nbsp;&nbsp;<span onclick="remove_item_dropwdown(this)">&#215;</span></label>')
  build_page()
  build_toolbar()
  build_console()
}

window.remove_item_dropwdown = function(span){
  let website = JSON.parse(localStorage.getItem('website'))
  let parent = $(span).closest('.uni-box-item').data('element')
  let page_name = $(span).closest('.uni-box-item').data('page')
  let order = $(span).closest('.uni-box-item').data('order')
  let menu_item_name = $(span).closest('.uni-detail-item-dropdown').prevAll('.uni-detail-item:first').find('.uni-detail-menu-item p').text()
  let page = website.find((p) => { return p.page == page_name})
  let item = page.elements[order].menu_items.find((it) => {return it.name == menu_item_name})
  let item_name = $(span).closest('label').text().slice(0, -3);


  let new_id = 0

  for (let i = 0; i < page.elements[0].menu_items.length; i++) {
    const it = page.elements[0].menu_items[i];
    if (it.name == menu_item_name) {
      new_id += (it.children.indexOf(item_name) + 1)
      break;
    }

    if (it.type == 'dropdown') {
      new_id += it.children.length + 1;
    } else {
      new_id += 1;
    }
  }

  website.splice(new_id, 1)

  for (var i = item.children.length - 1; i >= 0; i--) {
    if (item.children[i] == item_name) {
      item.children.splice(i, 1);
    }
  }

  save_website(website);
  build_page()
  build_console()

  $(span).closest('label').remove()
}

window.add_item_menu = function(button){
  let website = JSON.parse(localStorage.getItem('website'))
  let parent = $(button).closest('.uni-box-item').data('element')
  let page_name = $(button).closest('.uni-box-item').data('page')
  let order = $(button).closest('.uni-box-item').data('order')
  let menu_item_name = $(button).closest('.uni-detail-menu-item').find('input').val()
  let menu_item_type = $(button).closest('.uni-detail-menu-item').find('select').val()

  let page = website.find((p) => { return p.page == page_name})

  page.elements[order].menu_items.push({name: menu_item_name, type: menu_item_type})
  website.push({"page": menu_item_name, "elements": [page.elements[0]]})
  save_website(website)
  build_page()
  build_toolbar()
  build_console()
}

window.remove_menu_item = function(button){
  if (confirm("Việc xóa Item của Menu có thể khiến bạn mất dữ liệu của trang đó. Bạn chắc chắn muốn xóa?") == true) {
    let website = JSON.parse(localStorage.getItem('website'))
    let parent = $(button).closest('.uni-box-item').data('element')
    let page_name = $(button).closest('.uni-box-item').data('page')
    let order = $(button).closest('.uni-box-item').data('order')
    let item_name = $(button).closest('.uni-detail-item').find('.uni-detail-menu-item').find('p').text()
    let page = website.find((p) => { return p.page == page_name})
    let menu_items = page.elements[order].menu_items
    let new_id = 0
    for (let i = 0; i < page.elements[0].menu_items.length; i++) {
      const it = page.elements[0].menu_items[i];
      if (it.name == item_name){
        var delete_number = 1
        if(it.type == 'dropdown'){
          delete_number = it.children.length + 1
        }
        break;
      }
      if(it.type == 'dropdown'){
        new_id += it.children.length + 1
      }else{
        new_id += 1
      }
    }
    website.splice(new_id, delete_number)

    for (var i = menu_items.length - 1; i > 0; i--) {
      if (menu_items[i].name == item_name) {
        menu_items.splice(i, 1);
      }
    }
    save_website(website)
    build_page()
    build_toolbar()
    build_console()
  }
}

window.change_theme = async function(button){
  let element_name = $(button).closest('.uni-box-item').find('.uni-item b').text()
  let theme_type = $(button).siblings('select').val()
  const response = await fetch("./bootstrap5.json");
  const bootstrap5 = await response.json();
  let new_theme = bootstrap5.find((th) => {return th.type == theme_type && th.name == element_name})
  new_theme.open = true
  let new_website
  if(element_name == "Menu"){
    if (confirm("Việc thay đổi template của Menu sẽ khiến bạn mất toàn bộ dữ liệu các trang. Bạn có muốn reset không?") == true) {
      new_website = []
      let id = 0
      new_theme.menu_items.map((item) => {
        new_website[id] = { "page": item.name, elements: [new_theme]}
        id += 1
        if(item.type == 'dropdown'){
          let children = item.children || []
          children.map((child) => {
            new_website[id] = { page: child, elements: [new_theme], dropdown: true}
            id += 1
          })
        }
      })
      localStorage.setItem('current_uni_page', 'Trang chủ')
    }
  }else{
    new_website = current_uni_website()
    let order = $(button).closest('.uni-box-item').data('order')
    let current_page = new_website.find((p) => {return p.page == current_uni_page()})
    current_page.elements[order] = new_theme
  }

  save_website(new_website)
  build_toolbar()
  build_console()
  build_page()
  set_root_variable_css()

  if(element_name == "Posts" || element_name == "Products") {
    save_maps()
  }
}

window.save_category = function(button){
  let website = JSON.parse(localStorage.getItem('website'))
  let parent = $(button).closest('.uni-box-item').data('element')
  let page_name = $(button).closest('.uni-box-item').data('page')
  let order = $(button).closest('.uni-box-item').data('order')
  let current_page = website.find((p) => {return p.page == current_uni_page()})
  let value = $(button).closest('.uni-detail-item').find('input').val()

  current_page.elements[order].property.categoryName = value

  save_website(website)
  build_page()
  build_toolbar()
  save_maps()
}

window.save_link_network = function(button){
  let website = JSON.parse(localStorage.getItem('website'))
  let parent = $(button).closest('.uni-box-item').data('element')
  let page_name = $(button).closest('.uni-box-item').data('page')
  let order = $(button).closest('.uni-box-item').data('order')
  let current_page = website.find((p) => {return p.page == current_uni_page()})
  let inputs = $(button).closest('.link-network-group').find('input')

  Array.from(inputs).map((input) => {
    current_page.elements[order].property.linkNetwork[$(input).data('key')] = $(input).val()
  })

  save_website(website)
  build_page()
  build_toolbar()
}
})
