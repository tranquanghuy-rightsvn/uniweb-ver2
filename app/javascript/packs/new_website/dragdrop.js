import { display_only_current_page, convertUrl, convertTitle, current_uni_page, current_uni_website, save_website, set_current_uni_page, async_menu, page_links, set_root_variable_css } from "./common";
import { build_page, build_toolbar, build_console } from "./build_element";

document.addEventListener("turbolinks:load", () => {
dragElement(document.getElementById("mydiv"));

function dragElement(elmnt) {
  var pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0;
  if (document.getElementById(elmnt.id + "header")) {
    document.getElementById(elmnt.id + "header").onmousedown = dragMouseDown;
  } else {
    elmnt.onmousedown = dragMouseDown;
  }

  function dragMouseDown(e) {
    e = e || window.event;
    pos3 = e.clientX;
    pos4 = e.clientY;
    document.onmouseup = closeDragElement;
    document.onmousemove = elementDrag;
  }

  function elementDrag(e) {
    e = e || window.event;
    e.preventDefault();
    pos1 = pos3 - e.clientX;
    pos2 = pos4 - e.clientY;
    pos3 = e.clientX;
    pos4 = e.clientY;
    elmnt.style.top = (elmnt.offsetTop - pos2) + "px";
    elmnt.style.left = (elmnt.offsetLeft - pos1) + "px";
  }

  function closeDragElement() {
    document.onmouseup = null;
    document.onmousemove = null;
  }
}

dragElement(document.getElementById("uni-toolbar"));

function dragElementConsole(elmnt) {
  var pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0;
  elmnt.onmousedown = dragMouseDown;

  function dragMouseDown(e) {
    e = e || window.event;
    pos3 = e.clientX;
    pos4 = e.clientY;
    document.onmouseup = closeDragElement;
    document.onmousemove = elementDrag;
  }

  function elementDrag(e) {
    e = e || window.event;
    e.preventDefault();
    pos1 = pos3 - e.clientX;
    pos2 = pos4 - e.clientY;
    pos3 = e.clientX;
    pos4 = e.clientY;
    elmnt.style.top = (elmnt.offsetTop - pos2) + "px";
    elmnt.style.left = (elmnt.offsetLeft - pos1) + "px";
  }

  function closeDragElement() {
    document.onmouseup = null;
    document.onmousemove = null;
  }
}


$("#mydivcontent").sortable({
  items: ".dragable",
  cursor: "move",
  update: function(event, ui) {
    let sortedItems = $("#mydivcontent .uni-box-item");
    let website = JSON.parse(localStorage.getItem('website'))
    let current_page = current_uni_page()
    let page = website.find((p) => { return p.page == current_page })

    let element_list = Array.from(sortedItems).map(function(item) {
      return $(item).find('.uni-item').find('b').text()
    });

    page.elements.sort((x, y) => {
      const indexX = element_list.indexOf(x.name);
      const indexY = element_list.indexOf(y.name);
      return indexX - indexY;
    });

    save_website(website);
    build_page()
    build_toolbar()
  }
});
})
