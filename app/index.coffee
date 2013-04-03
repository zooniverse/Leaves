require 'json2ify'
require 'es5-shimify'

$ = require 'jqueryify'
Api = require 'zooniverse/lib/api'
TopBar = require 'zooniverse/controllers/top-bar'
User = require 'zooniverse/models/user'
Route = require 'spine/lib/route'
{Stack} = require 'spine/lib/manager'
Page = require './controllers/page'
HomePage = require './controllers/home-page'
Classifier = require './controllers/classifier'
Profile = require 'zooniverse/controllers/profile'
browserDialog  = require 'zooniverse/controllers/browserDialog'
GoogleAnalytics = require 'zooniverse/lib/google-analytics'

stack = new Stack
  className: "main #{Stack::className}"
  el: '#app .main'

  controllers:
    home: HomePage
    science: class extends Page then content: $('''
      <p>Researchers are conducting a modern and novel taxonomic treatment of a hyper-diverse group of early land plants in the liverwort genus Frullania. Liverworts (Marchantiophyta) are pivotal in our understanding of early land plant evolution and exist as important components of the vegetation in many regions of the world. The project represents an unprecedented investigation of this scale on a leafy liverwort genus, so-called because of the leafy plant structure. Taxonomic conclusions will be drawn from a multi-faceted data set, including morphology, fieldwork, experimental growth studies, as well as DNA sequence data, and population studies using DNA microsatellite markers. The research is supported by the National Science Foundation (<a href="http://www.nsf.gov/awardsearch/showAward?AWD_ID=1145898">Award 114589</a>)</p>
      <p>The liverwort genus Frullania represents an exceptionally hyper-diverse, taxonomically complex genus with a worldwide distribution. There are over 2000 published names, of which almost 800 are currently accepted. Many Frullania species have interesting biological properties. For example, chemical compounds from some species show cytotoxicity against certain cancer cell lines. Many new species await discovery. The feature being measured, the lobule, is similar to a modified leaf and is a very important character in distinguishing between different species. More information about the genus can be found at: http://bryophyteportal.org/frullania</p>
    ''')
    classify: Classifier
    profile: class extends Page then className: "content #{Page::className}", content: new Profile
    team: class extends Page then content: $('''
      <h1>The team</h1>

      <h2>The Field Museum</h2>
      <ul>
        <li>Matt von Konrat</li>
        <li>Juan Larrain</li>
        <li>Beth Crownover</li>
        <li>Eve Gaus</li>
        <li>Jessica Hankey</li>
        <li>Kristina Lugo</li>
      </ul>

      <h2>Duke University</h2>
      <ul>
        <li>Blanka Shaw</li>
      </ul>

      <h2>Wilbur Wright College</h2>
      <ul>
        <li>Matt Greif</li>
      </ul>

      <h2>Roosevelt University</h2>
      <ul>
        <li>Mike Bryson</li>
      </ul>

      <h2>Northeastern Illinois University</h2>
      <ul>
        <li>Tom Campbell</li>
        <li>John Kasmer</li>
        <li>Oana Vadineanu</li>
      </ul>

      <h2>Zooniverse</h2>
      <ul>
        <li>Arfon Smith</li>
        <li>Michael Parrish</li>
        <li>Brian Carstensen</li>
        <li>David Miller</li>
        <li>Kelly Borden</li>
      </ul>
    ''')

  routes:
    '/': 'home'
    '/science': 'science'
    '/classify': 'classify'
    '/profile': 'profile'
    '/team': 'team'

  default: 'home'

Route.setup()

api = new Api project: 'leaf'

topBar = new TopBar

topBar.el.appendTo 'body'

User.fetch()

browserDialog.check()

# new GoogleAnalytics account: '1234567890'

module.exports = {stack, api, topBar}
