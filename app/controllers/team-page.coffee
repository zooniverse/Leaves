Page = require './page'

content = '''
  <p>The project is a collaborative effort spearheaded by seven partnering institutions. More information about the team and various roles of each team member can be found here</p>
  <p>The project is supported in part by the National Science Foundation (see Award No. 114589, No. 1057418, and the Grainger Foundation.</p>

  <h2>The Field Museum</h2>
  <ul>
    <li>Matt von Konrat, Principal Investigator (Head of Botanical Collections, Science & Education)</li>
    <li>Eve Gaus, Co-Principal Investigator (Digital Learning Manager, Education Department)</li>
    <li>Juan Larrain (Post Doctoral Research Scholar, Science & Education)</li>
    <li>Beth Crownover (Director, Education Department)</li>
    <li>Jessica Hankey (School Partnerships and Programs Manager, Education Department)</li>
    <li>Kristina Lugo (Annual Fund Coordinator, Institutional Advancement)</li>
    <li>Juan Larrain (Post Doctoral Research Scholar, Science & Education)</li>
    <li>Beth Sanzenbacher (Outreach Coordinator, BioSynC)</li>
    <li>Audrey Aronowsky (Outreach Coordinator, BioSynC)</li>
  </ul>

  <h2>The Adler Planetarium</h2>
  <ul>
    <li>Arfon Smith, Co-Principal Investigator (Director of Citizen Science)</li>
    <li>Michael Parrish</li>
    <li>Brian Carstensen</li>
    <li>David Miller</li>
    <li>Kelly Borden</li>
  </ul>

  <h2>Northeastern Illinois University</h2>
  <ul>
    <li>Tom Campbell (Biology Instructor, Department of Biology)</li>
    <li>John Kasmer (Associate Professor and Chair, Department of Biology)</li>
    <li>Oana Vadineanu (Intern, Field Museum)</li>
  </ul>

  <h2>Wilbur Wright College</h2>
  <ul>
    <li>Matt Greif (Biology Instructor)</li>
  </ul>

  <h2>University of Illinois, Chicago</h2>
  <ul>
    <li>Leilah Lyons (Assistant Professor Computer and Learning Sciences)</li>
    <li>Tia Shelley (Research Assistant, Computer and Learning Sciences)</li>
  </ul>

  <h2>Roosevelt University</h2>
  <ul>
    <li>Mike Bryson (Associate Professor of Humanities and Sustainability Studies)</li>
  </ul>

  <h2>Duke University</h2>
  <ul>
    <li>Blanka Shaw (Database Manager)</li>
  </ul>

  <h2>Interns</h2>
  <ul>
    <li>Dara  Arabsheibani (Northeastern Illinois University)</li>
    <li>Charlie D'Lavoy (Northeastern Illinois University)</li>
    <li>Alex Vizzone (Northeastern Illinois University)</li>
    <li>Xenia Alava (Northeastern Illinois University)</li>
    <li>Ariel Wagner (DePaul University)</li>
    <li>Veronica Lopez (Northeastern Illinois University)</li>
    <li>Jonathan Scheffel (Harold Washington, Chicago City College)</li>
    <li>Pedro Rebollar (DePaul University)</li>
    <li>Kavita Elliott (Ohio State University)</li>
    <li>Ramsey Millison (DePaul University)</li>
    <li>Zak Zillon (Northeastern Illinois University)</li>
  </ul>
'''

class TeamPage extends Page
  content: content

module.exports = TeamPage
