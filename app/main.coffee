Api = require 'zooniverse/lib/api'
api = new Api project: 'leaf'

enUs = require './lib/en-us'
translate = require 't7e'
translate.load enUs

LanguageManager = require 'zooniverse/lib/language-manager'
languageManager = new LanguageManager
  translations:
    en: label: 'English', strings: enUs
    es: label: 'Español'
    pt: label: 'Português'
    pl: label: 'Polski'
    ro: label: 'Româna'

languageManager.on 'change-language', (e, code, strings) ->
  t7e.load strings
  t7e.refresh()

StackOfPages = require 'stack-of-pages'
stack = new StackOfPages
  '#/': require './controllers/home'
  '#/classify': require './controllers/classifier'
  '#/science/*': require './controllers/science'
  '#/team': require './controllers/team'
  '#/education/*': require './controllers/education'
  '#/profile': require './controllers/profile'

document.querySelector('#app').appendChild stack.el

Navigation = require './controllers/navigation'
navigation = new Navigation
navigation.el.prependTo document.body

TopBar = require 'zooniverse/controllers/top-bar'
topBar = new TopBar
topBar.el.appendTo navigation.el

Footer = require 'zooniverse/controllers/footer'
footer = new Footer
footer.el.appendTo '#footer .container'

User = require 'zooniverse/models/user'
User.fetch()

GoogleAnalytics = require 'zooniverse/lib/google-analytics'
new GoogleAnalytics
  account: 'UA-53428944-2'

ImageModal = require 'cs-utils-imagemodal'
new ImageModal

window.app = { stack, api }
