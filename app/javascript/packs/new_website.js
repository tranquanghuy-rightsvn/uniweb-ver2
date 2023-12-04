// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import "../stylesheets/application";
import "@fortawesome/fontawesome-free/css/all.css";
import 'bootstrap';

require("jquery")
require("jquery-ui")
require("packs/new_website/common")
require("packs/new_website/dragdrop")
require("packs/new_website/generate_element")
require("packs/new_website/build_element")
require("packs/new_website/add_element")
require("packs/new_website/submit_website")
require("packs/new_website/index")

Rails.start()
Turbolinks.start()
