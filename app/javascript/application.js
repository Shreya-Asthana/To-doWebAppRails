import Rails from "@rails/ujs"
import * as Turbo from "@hotwired/turbo"
import { Application } from "@hotwired/stimulus"

Rails.start()
Turbo.start()

const application = Application.start()
