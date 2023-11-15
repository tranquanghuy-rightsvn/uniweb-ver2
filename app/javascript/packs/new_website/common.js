import { build_page, build_toolbar, build_console } from "./build_element";

export function convertTitle(title) {
	title = title.replace(/ /g, '_').toLowerCase();
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

export function convertUrl(title) {
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


export function save_website(website){
	localStorage.setItem('website', JSON.stringify(website))
}

export function current_uni_website(){
	return JSON.parse(localStorage.getItem('website'))
}

export function current_uni_page(){
	return localStorage.getItem('current_uni_page') || 'Trang chủ'
}

export function set_current_uni_page(button){
  localStorage.setItem('current_uni_page', $(button).text())
  build_page()
  build_console()
  build_toolbar()
}

export function async_menu(){
  let website = JSON.parse(localStorage.getItem('website'))

  let curent_page = website.find((page) => {return page.page == current_uni_page()})
  website.map((page)=>{
    page.elements[0] = curent_page.elements[0]
  })

  save_website(website)
}

export function async_footer(){
  let website = JSON.parse(localStorage.getItem('website'))

  let curent_page = website.find((page) => {return page.page == current_uni_page()})
  website.map((page, i)=>{
    if(i == 0) return;

    page.elements.push(curent_page.elements[curent_page.elements.length - 1])
  })

  save_website(website)
  build_page()
}

export function display_only_current_page(){
  $('#all > div').hide();
  $('#all > .uni-' + convertTitle(current_uni_page())).show();
}

export function page_links(){
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

export function set_root_variable_css(){
  let root = document.querySelector(':root');
  let website = JSON.parse(localStorage.getItem('website'))
  let current_page = website.find((p) => { return p.page == current_uni_page() })
  let menu = current_page.elements.find((ele) => { return ele.name == "Menu"})

  if(menu){
    if('background' in menu.property){
      if('opacity' in menu.property && menu.property.opacity <1 ){
        const value = menu.property.opacity
        const color = menu.property.background;
        let red = parseInt(color.substring(1, 3), 16);
        let green = parseInt(color.substring(3, 5), 16);
        let blue = parseInt(color.substring(5, 7), 16);
        let rgba  = ` rgba(${red}, ${green}, ${blue}, ${value})`
        root.style.setProperty('--custom-background-menu', rgba)
      }else{
        root.style.setProperty('--custom-background-menu', menu.property.background)
      }
    }
  }
}

export function save_maps(){
  let maps = []
  let website = JSON.parse(localStorage.getItem('website'))
  website.map((page) => {
    page.elements.map((ele) => {
      if((ele.name == 'Posts' || ele.name == 'Products') && ele.map){
        maps.push({
          type: ele.map.type,
          variant: ele.map.variant,
          parent_div: ele.map.parent_div,
          page_name: page.page,
          template_name: ele.map.template_name,
          limit_item: ele.map.limit_item,
          category_name: $(ele.map.parent_div).siblings('.categoryName').text() || ''
        })
      }
    })
  })

  localStorage.setItem('maps', JSON.stringify(maps))
}
