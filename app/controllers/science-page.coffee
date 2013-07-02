Page = require './page'

content = '''
  <p>Biologists believe life on Earth is undergoing a mass extinction crisis. The world's biodiversity is diminishing rapidly and undergoing an extinction crisis. Biological collections of museums and academic institutions, documenting the fossilized and living members of the world’s ecosystems and their changes over time, are uniquely poised to inform the stewardship of life on Earth.</p>
  <p>Taxonomy – the branch of science classifying biodiversity. Researchers at The Field Museum and partnering institutions are conducting a taxonomic treatment of a hyper-diverse group of early land plants in the liverwort genus Frullania. This includes documenting, describing and discovering new species to science. Liverworts (Marchantiophyta) are pivotal in our understanding of early land plant evolution and exist as important components of the vegetation in many regions of the world. Taxonomic conclusions will be drawn from a multi-faceted data set, including morphology, fieldwork, experimental growth studies, as well as DNA sequence data, and population studies using DNA microsatellite markers. The research is supported by the National Science Foundation (Award 114589).</p>
  <p>We need your help! The liverwort genus Frullania represents an exceptionally diverse lineage of over 2000 published names and with a worldwide distribution. In order for scientists to investigate biodiversity they rely heavily on collections housed at institutions such as The Field Museum where there are 25 million specimens and objects representing the worlds biodiversity and cultural artifacts. You can help plant scientists at The Field Museum by using this measuring tool and generate data scientists can use to document the biodiversity of Frullania.  The feature being measured, the lobule, is similar to a modified leaf and is a very important character in distinguishing between different species. More information about the genus can be found at: http://bryophyteportal.org/frullania Many new species await discovery!</p>
  <p>Biological significance. Many Frullania species have interesting biological properties. For example, chemical compounds from some species show cytotoxicity against certain cancer cell lines.</p>
'''

class SciencePage extends Page
  content: content

module.exports = SciencePage
