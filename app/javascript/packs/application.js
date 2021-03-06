// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';
import { initGroupCable } from "channels/group_channel";
import { btnEvents } from '../plugins/botton_favorite';

Rails.start()
Turbolinks.start()
ActiveStorage.start()
$('.carousel').carousel({
  interval: 3000
})


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

document.addEventListener('turbolinks:load', () => {
  initMapbox();
})

// External imports
import "bootstrap";
import { initFlatpickr } from "../plugins/flatpickr";


// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  initGroupCable();
  initFlatpickr();
  btnEvents();
});
