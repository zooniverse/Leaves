module.exports.config =
  files:
    javascripts: joinTo: 'application.js'
    templates: joinTo: 'application.js'
    stylesheets: joinTo: 'application.css'

  bower:
    order: ['jquery']

  server:
    port: 1347
