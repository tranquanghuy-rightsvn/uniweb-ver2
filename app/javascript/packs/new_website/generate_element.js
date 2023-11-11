import { display_only_current_page, convertUrl, convertTitle, current_uni_page, current_uni_website, save_website, set_current_uni_page, async_menu, page_links } from "./common";

export function generate_menu(page, ele, index){
  let menu_items = ele.menu_items || []
  let html = ''
  menu_items.map((item, i) => {
    if(item.type == 'normal'){
      let link = ''
      if(i == 0){
        link = 'index.html'
      }else{
        link = convertUrl(item.name) + '.html'
      }

      let active = convertTitle(page.page) == convertTitle(ele.name) ? 'active' : ''
      html += '<li class="nav-item"><a class="nav-link ' + active + '" aria-current="page" href="'  + link + '">' + item.name + '</a></li>'
    }else if(item.type == 'disabled'){
      let link = ''
      if(i == 0){
        link = 'index.html'
      }else{
        link = convertUrl(item.name) + '.html'
      }

      html += '<li class="nav-item"><a class="nav-link disabled" aria-disabled="true" href="'  + link + '">' + item.name + '</a></li>'
    }else if(item.type == 'dropdown'){
      html += '<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown' + i +'" role="button" data-bs-toggle="dropdown" aria-expanded="false">' + item.name + '</a>'
      html += '<ul class="dropdown-menu" aria-labelledby="navbarDropdown' + i + '">'

      let item_children = item.children || []
      item_children.map((drop) => {
        html += '<li><a class="dropdown-item" href="' + convertUrl(drop) + '.html">' + drop + '</a></li>'
      })

      // if(item.children_special != [] && item.children_special != undefined){
      //   html += '<hr class="dropdown-divider">'
      //   children_special = item.children_special || []
      //   children_special.map((drop) => {
      //     html += '<li><a class="dropdown-item" href="#">' + drop + '</a></li>'
      //   })
      // }

      html += '</ul></li>'
    }
  })
  $('.uni-' + convertTitle(page.page) + "-" + index + ' .menu-list-item').append(html)

  if ('fullscreen' in ele.property) {
    let checked = ele.property.fullscreen
    let parent = 'uni-' + convertTitle(page.page) + "-" + index

    if(checked) {
      let container = $('.' + parent + ' .container')
      container.removeClass('container');
      container.addClass('container-fluid');
    } else {
      let container = $('.' + parent + ' .container-fluid')
      container.removeClass('container-fluid');
      container.addClass('container');
     }
  }

  if ('searchable' in ele.property) {
    let checked = ele.property.searchable
    let parent = 'uni-' + convertTitle(page.page) + "-" + index
    if(checked) {
      $('.' + parent + ' .uni-searchable').html('<form class="d-flex mb-0"><input class="form-control me-2" id="formSearchNav" type="search" placeholder="Search" aria-label="Search"><button class="btn btn-outline-success" onclick="search_nav()" type="button">Search</button></form>')
    } else {
      $('.' + parent + ' .uni-searchable').html('')
    }
  }

  if ('loginable' in ele.property) {
    let checked = ele.property.loginable
    let parent = 'uni-' + convertTitle(page.page) + "-" + index

    if(checked) {
      $('.' + parent + ' .uni-loginable').html('<li class="nav-item nav-user"><a>Login</a>/<a>Sign up</a></li>')
    } else {
      $('.' + parent + ' .uni-loginable').html('')
    }
  }

  if ('cartable' in ele.property) {
    let checked = ele.property.cartable
    let parent = 'uni-' + convertTitle(page.page) + "-" + index

    if(checked) {
      $('.' + parent + ' .uni-cartable').html('<a href="cart.html"><li class="nav-item"><i class="fas fa-shopping-cart"></i></li></a>')
    } else {
      $('.' + parent + ' .uni-cartable').html('')
    }
  }

  if ('boxshadow' in ele.property) {
    let checked = ele.property.boxshadow
    let parent = 'uni-' + convertTitle(page.page) + "-" + index

    if(checked) {
      $('.' + parent + ' nav.navbar').addClass("box-shadow-menu")
    } else {
      $('.' + parent + ' nav.navbar').removeClass("box-shadow-menu");
    }
  }

  if ('background' in ele.property) {
    let checked = ele.property.background
    let parent = 'uni-' + convertTitle(page.page) + "-" + index

    if(checked) {
      $('.' + parent + ' nav.navbar').addClass("background-custom")
    } else {
      $('.' + parent + ' nav.navbar').removeClass("background-custom");
    }
  }

  if ('opacity' in ele.property) {
    let opacity = ele.property.opacity
    let parent = 'uni-' + convertTitle(page.page) + "-" + index
    const color = ele.property.background;
    let red = parseInt(color.substring(1, 3), 16);
    let green = parseInt(color.substring(3, 5), 16);
    let blue = parseInt(color.substring(5, 7), 16);
    let rgba  = ` rgba(${red}, ${green}, ${blue}, ${opacity})`
    $('.' + parent + ' nav.navbar').attr('style', 'background: ' + rgba + ' !important');

    if(opacity < 1) {
      $('.' + parent + ' nav.navbar').addClass("opacity-menu")
    } else {
      $('.' + parent + ' nav.navbar').removeClass("opacity-menu");
    }
  }

  if ('colorDark' in ele.property) {
    let dark = ele.property.colorDark
    let parent = 'uni-' + convertTitle(page.page) + "-" + index

    if(dark) {
      $('.' + parent + ' nav.navbar').addClass("color-dark")
    } else {
      $('.' + parent + ' nav.navbar').removeClass("color-dark");
    }
  }

  if ('colorBold' in ele.property) {
    let bold = ele.property.colorBold
    let parent = 'uni-' + convertTitle(page.page) + "-" + index

    if(bold) {
      $('.' + parent + ' nav.navbar').addClass("color-bold")
    } else {
      $('.' + parent + ' nav.navbar').removeClass("color-bold");
    }
  }
}


export function generate_header(page, ele, index){
  if ('fullscreen' in ele.property) {
    let checked = ele.property.fullscreen
    let parent = 'uni-' + convertTitle(page.page) + "-" + index

    if(checked) {
      let container = $('.' + parent + ' > *')
      container.removeClass('container');
    } else {
      let container = $('.' + parent + ' > *')
      container.addClass('container');
    }
  }

  if ('normalTitle' in ele.property) {
    let normal_title = ele.property.normalTitle
    let parent = 'uni-' + convertTitle(page.page) + "-" + index
    $('.' + parent + ' .text-title h1').text(normal_title)
  }
}

export function generate_feature(page, ele, index){
  if ('fullscreen' in ele.property) {
    let checked = ele.property.fullscreen
    let parent = 'uni-' + convertTitle(page.page) + "-" + index

    if(checked) {
      let container = $('.' + parent + ' > *')
      container.removeClass('container');
    } else {
      let container = $('.' + parent + ' > *')
      container.addClass('container');
    }
  }

  if ('bordered' in ele.property) {
    let bordered = ele.property.bordered
    let parent = 'uni-' + convertTitle(page.page) + "-" + index

    if(bordered) {
      $('.' + parent + ' .icon-feature').addClass("bordered-item")
    } else {
      $('.' + parent + ' .icon-feature').removeClass("bordered-item");
    }
  }
}

export function generate_common(page, ele, index){
  if ('text' in ele.property){
    let texts = ele.property.text
    let parent = 'uni-' + convertTitle(page.page) + "-" + index
    texts.map((text, i) => {
      let k = i + 1
      $('.' + parent + ' .text-' + k).text(text)
    })
  }

  if ('link' in ele.property){
    let links = ele.property.link
    let parent = 'uni-' + convertTitle(page.page) + "-" + index
    links.map((link, i) => {
      let k = i + 1
      $('.' + parent + ' a.link-' + k).attr("href", link);
    })
  }

  if ('categoryName' in ele.property) {
    let categoryName = ele.property.categoryName
    let parent = 'uni-' + convertTitle(page.page) + "-" + index
    $('.' + parent + ' .categoryName').text(categoryName)
  }

  if ('linkNetwork' in ele.property) {
    let linkNetwork = ele.property.linkNetwork
    let parent = 'uni-' + convertTitle(page.page) + "-" + index

    for (const key in linkNetwork) {
      $('.' + parent + ' a.' + key).attr("href", linkNetwork[key]);
    }
  }


  if ('iframeMap' in ele.property) {
    let iframeMap = ele.property.iframeMap
    let parent = 'uni-' + convertTitle(page.page) + "-" + index

    $('.' + parent + ' .iframe-google-map').html(iframeMap);
    $('.' + parent + ' .iframe-google-map iframe').addClass('google-map');
    $('.' + parent + ' .iframe-google-map iframe').attr('referrerpolicy', 'no-referrer-when-downgrade');
  }
}
