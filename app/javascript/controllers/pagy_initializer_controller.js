import { Controller } from "@hotwired/stimulus";
import Pagy from "pagy-module";

export default class extends Controller {
  connect() {
    Pagy.init(this.element);
  }
}

/*
Usage:
<div data-controller="pagy-initializer">
  <%== pagy_nav_js(@pagy) %>
</div>
*/
