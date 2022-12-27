import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus = application

import ContentLoader from 'stimulus-content-loader'
application.register('content-loader', ContentLoader)


export { application }