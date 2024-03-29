import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"






export default class extends Controller {
  connect() {
    //
    flatpickr(this.element, {
      position: "below",
      mode: "range",
      // locale: French,
      dateFormat: "d-m-Y",
      closeOnSelect: true,
      onChange: (selectedDates) => {
        if (selectedDates.length === 1) {
          document.getElementById('date-difference').innerText = '';
          document.getElementById('end-date-input').value = selectedDates[1];
        }
      }
    });

  }




}
