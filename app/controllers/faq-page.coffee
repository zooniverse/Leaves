Page = require './page'

content = '''
  <h2>Project Background</h2>

  <h3>What is a bryophyte?</h3>
  <p>Bryophytes are a diverse group of early land plants that includes liverworts, hornworts, and mosses.  They are considered to be the living descendents of the first terrestrial plants that evolved here on Earth. While much remains to be discovered about their biodiversity, biology, and geographic distribution, they are widespread throughout the globe and have important evolutionary, ecological, and medicinal characteristics that make them critically important to document, identify, and study.</p>

  <h3>Why are liverworts important?</h3>
  <p>Chemical compounds extracted from liverworts exhibit important biological activities.  For example, chemical extracts derived from Frullania species have activity against certain cancer cell lines, and some show significant anti-microbial and anti- fungal activity.</p>
  <p>Liverworts and related species are also important indicators of air quality and climate change, as they are acutely sensitive to pollution and other environmental factors. Scientists can map potential human health hazards, such as chronic air pollution, by surveying liverwort species diversity and density in a given area.</p>

  <h3>What is a liverwort?</h3>
  <p>Liverworts derive their name from old times when early botanists believed that the shape of a plant dictated its function.  Some liverworts have leaves that look, roughly, like small livers, hence they believed these small plants were beneficial medicines for liver troubles.  Today, we know that liverworts are a division of plants…..</p>

  <h3>What are Frullania?</h3>
  <p>Frullania is a hyper-diverse genus of liverwort species that includes over 700 species many of which, as of yet, are unclassified and remain to be described!</p>

  <h3>Where are these images from?</h3>
  <p>Liverworts grow all over the world, but these Frullania images have typically been collected from the southern hemisphere in areas like Fiji, New Caledonia, and Chile.  Specimens were collected in the field, brought back to the museum, and then imaged with a microscope. Images were taken by interns at the Field Museum from Northeastern Illinois University, DePaul University, Harold Washington Chicago City College, and The Ohio State University. You might be the first person ever to study and analyze a particular image!</p>

  <h3>What is a lobule?</h3>
  <p>A lobule is simply a special name for a modified leaf structure.</p>

  <h3>How do I benefit from participating?</h3>
  <p>Even through this short exercise, you have contributed to a global biodiversity research program and will have provided scientists with critically needed data to advance the identification and study of these important plants.</p>

  <h3>How does my involvement contribute to the project?</h3>
  <p>Scientist will use the data you collect to analyze, catalog and discover new species of early land plants, which are of great evolutionary and ecological significance.</p>

  <h3>What is the scientific significance of measuring a lobule?</h3>
  <p>Just like you might be able to tell the difference between your older brother and younger sister from afar because one is taller than the other, we can distinguish between species based on particular defining characteristics.  Lobule size is just one of these characteristics.</p>

  <h3>How do you sort through the data?</h3>
  <p>After the data has been collected it will be statistically processed, outliers will be eliminated, and then it will be applied to the taxonomic identification of liverworts.</p>

  <hr />

  <h2>Web Tool</h2>

  <h3>Oops!  I made a mistake.  How do I undo a mistake?</h3>
  <p>First off, don’t panic!  Simply, select the “X” that appears in the grey box after each measurement to delete that set of measures.  In any event, if you make a mistake, we will be able to sort that out when all the data is collected.</p>

  <h3>How do I differentiate a lobule from the rest of the image?</h3>
  <p>Usually the structures in clear focus within the image will be the lobules; it will generally be toward the center of the image.  We will measure only lobules (modified leaves) that are clearly focused and fall entirely within the image.  Here are some pictures to help guide you.</p>

  INSERT IMAGE 1

  INSERT IMAGE 2

  <h3>How many lobules are on each image?</h3>
  <p>Each image will have at least one lobule; however, some images will have several.</p>

  <h3>The app is not loading, what should I do?</h3>
  <p>The website may be affected by your connection speed.  If you’re able to connect to the internet, check to see if you’re using the latest version of the recommended browser (Google Chrome of Firefox.)</p>

  <h3>How is the data recorded?</h3>
  <p>Datum are automatically uploaded to our servers and stored in a database.</p>

  <h3>How long do I need to do this activity?</h3>
  <p>We appreciate your help!  Anytime you would like to exit the activity, just click “finish this image” and then please click the link, “fill out a short survey” to fill out a short survey about the project.  We greatly value your feedback.</p>

  <h3>Who can I contact with any concerns?</h3>
  <p>If you have any concerns or questions about this project, please feel free to contact Dr. Matt von Konrat (mkonrat@fieldmuseum.org) or Dr. Tom Campbell (T-Campbell7@neiu.edu).</p>
'''

class FaqPage extends Page
  content: content

module.exports = FaqPage
