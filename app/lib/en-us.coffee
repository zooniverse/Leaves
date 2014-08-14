module.exports =
  navigation:
    home: 'MicroPlants'
    classify: 'Classify'
    science: 'Science'
    team: 'Team'
    education: 'Education'
    profile: 'Profile'
    discuss: 'Discuss'
    blog: 'Blog'

  home:
    tagline: 'Help discover biodiversity!'
    excerpt: "The world's biodiversity is diminishing rapidly and undergoing an extinction crisis. Scientists from the Field Museum, Duke University and international researchers need your help."
    callToAction: 'Get Started'
    learnMore: 'Learn More'

    firstBlock:
      header: 'What is this project?'
      excerpt: 'From macro scale to micro scale, the importance of plants and the environment are critical to life on earth. You will be measuring microleaves, an anatomical structure smaller than a tip on a pencil. Scientists who go out to different collection locations have to keep a keen eye for these tiny plants that are only found in the most lush areas.'
      link: '<em><span class="faded">Learn:</span> <a href="#/science">What is this project all about?</a></em>'

    secondBlock:
      header: 'What are we asking for?'
      excerpt: 'Measure a critical morphological feature, a modified leaf (microleaf), from early land plants to help scientists document and describe new species to science.'
      link: '<em><span class="faded">Learn:</span> <a href="#/science/about-bryophytes">What is a microleaf?</a></em>'

    thirdBlock:
      header: 'Ready to help?'
      excerpt: 'Step through the tutorial and <a href="#/classify">let’s start!</a>'
      callToAction: 'Get Started'

  classifier:
    header: 'Image Classification'
    info: 'Info'
    guide: 'Guide'
    prompt: 'Measure the Microleaves!'
    finished: 'Finishied'

    metadata:
      header: 'Location & Information'
      coordinates: 'Coordinates'
      collector: 'Collector'
      comments: 'Other Comments'

    summary:
      header: 'Measurements Recorded!'
      excerpt: 'If you want, you can discuss this on Talk or share it with the world!'
      favorite: 'Favorite'
      discuss: 'Discuss'
      readyToContinue: 'Ready to Move on?'

  science:
    header: 'Science'
    navigation: 
      overview: 'Overview'
      aboutBryophytes: 'About Bryophytes'
      bryophyteImportance: 'Importance of Bryophytes'
      origin: 'Images Origin'
      howCanIHelp: 'How can I help?'

    content:
      overview: """
        <p>Life on Earth is undergoing a mass extinction crisis. The world's biodiversity is diminishing rapidly and undergoing an extinction crisis. Biological collections of museums and academic institutions, documenting the fossilized and living members of the world’s ecosystems and their changes over time, are uniquely poised to inform the stewardship of life on Earth.</p>

        <div class="center">
          <iframe src="//player.vimeo.com/video/68192847" width="600" height="310" frameborder="0" allowfullscreen></iframe>
        </div>
        <p>It takes a lot of work to describe new species. We need your help! Field museum bryologists, with the help of citizen scientists, are striving to collect data to uncover some of the secrets behind what makes early land plants so special.</p>

        <p>Taxonomy – the branch of science classifying biodiversity. Researchers at The Field Museum and partnering institutions are conducting a taxonomic treatment of a hyper-diverse group of early land plants in the liverwort genus Frullania. This includes documenting, describing and discovering new species to science. Liverworts (Marchantiophyta) are pivotal in our understanding of early land plant evolution and exist as important components of the vegetation in many regions of the world. Taxonomic conclusions will be drawn from a multi-faceted data set, including morphology, fieldwork, experimental growth studies, as well as DNA sequence data, and population studies using DNA microsatellite markers. The research is supported by the National Science Foundation (<a href="http://www.nsf.gov/awardsearch/showAward?AWD_ID=1145898&HistoricalAwards=false">Award 114589</a>).</p>

        <p><b>We need your help!</b> The liverwort genus Frullania represents an exceptionally diverse lineage of over 2000 published names and with a worldwide distribution. In order for scientists to investigate biodiversity they rely heavily on collections housed at institutions such as The Field Museum where there are 25 million specimens and objects representing the worlds biodiversity and cultural artifacts. You can help plant scientists at The Field Museum by using this measuring tool and generate data scientists can use to document the biodiversity of Frullania. The feature being measured, the microleaf, is similar to a modified leaf and is a very important character in distinguishing between different species. More information about the genus can be found at: <a href="http://bryophyteportal.org/frullania">http://bryophyteportal.org/frullania</a>.</p>

        <h3>How do I benefit from participating?</h3>
        <p>Even through this short exercise, you have contributed to a global biodiversity research program and will have provided scientists with critically needed data to advance the identification and study of these important plants.</p>

        <h3>How does my involvement contribute to the project?</h3>
        <p>Scientist will use the data you collect to analyze, catalog and discover new species of early land plants, which are of great evolutionary and ecological significance.</p>

        <h3>What is the scientific significance of measuring a microleaf?</h3>
        <p>Just like you might be able to tell the difference between your older brother and younger sister from afar because one is taller than the other, we can distinguish between species based on particular defining characteristics. Microleaf size is just one of these characteristics.</p>

        <h3>How do you sort through the data?</h3>
        <p>After the data has been collected it will be statistically processed, outliers will be eliminated, and then it will be applied to the taxonomic identification of liverworts.</p>

        <h3>How is the data recorded?</h3>
        <p>Datum are automatically uploaded to our servers and stored in a database.</p>
      """
      origin: """
        <h3>Where are these images from?</h3>
        <p>Liverworts grow all over the world, but these Frullania images have typically been collected from the southern hemisphere in areas like Fiji, New Caledonia, and Chile. Specimens were collected in the field, brought back to the museum, and painstakingly mounted onto slides. From there, they imaged with a microscope by our many interns. Images were taken by interns at the Field Museum from Northeastern Illinois University, DePaul University, Harold Washington Chicago City College, and The Ohio State University. You might be the first person ever to study and analyze a particular image!</p>

        <div class="block-images short">
          <img src="./images/science/origin-3.jpg" />
          <img src="./images/science/origin-4.jpg" />
          <img src="./images/science/origin-5.jpg" />
        </div>

        <h3>Where have we collected?</h3>
        <p>The scientists involved with the MicroPlants project have collected all over the world! The pictures you measure represent countless hours of plane, car and boat rides to various collection sites to gather data.</p>

        <p>Explore Fiji with scientists from The Field Museum! Watch as they explain climate change as well as Fiji’s varying habitats. Discover the huge role that bryophytes plants play in the ecosystem.</p>

        <div class="center">
          <iframe src="//player.vimeo.com/video/33755995" width="600" height="320" frameborder="0" allowfullscreen></iframe>
        </div>
      """
      howCanIHelp: """
        <h3>How do I benefit from participating?</h3>
        <p>Even through this short exercise, you have contributed to a global biodiversity research program and will have provided scientists with critically needed data to advance the identification and study of these important plants.</p>

        <h3>How does my involvement contribute to the project?</h3>
        <p>Scientist will use the data you collect to analyze, catalog and discover new species of early land plants, which are of great evolutionary and ecological significance.</p>

        <h3>What is the scientific significance of measuring a microleaf?</h3>
        <p>Just like you might be able to tell the difference between your older brother and younger sister from afar because one is taller than the other, we can distinguish between species based on particular defining characteristics. Microleaf size is just one of these characteristics.</p>

        <h3>How do you sort through the data?</h3>
        <p>After the data has been collected it will be statistically processed, outliers will be eliminated, and then it will be applied to the taxonomic identification of liverworts.</p>

        <h3>How is the data recorded?</h3>
        <p>Datum are automatically uploaded to our servers and stored in a database.</p>
      """
      bryophyteImportance: """
        <h2>Why Study Bryophytes</h2>
        <h3>Why are bryophytes important?</h3>
        <p>Together, bryophytes are the second largest group of land plants after flowering plants, and are pivotal in our understanding of early land plant evolution. Bryophytes are an important component of the vegetation in many regions of the world, constituting a major part of the biodiversity in moist forest, wetlands, mountain, and tundra ecosystems. Liverworts and mosses offer microhabitats that are critical to the survival of a tremendous diversity of organisms such as single-celled eukaryotes, protozoa, and numerous groups of invertebrates. Their structural contribution to levels of diversity might be as significant as that of vascular plants, albeit at a smaller scale.</p>

        <img src="./images/science/why-study-habitat-2.jpg" class="small left" />
        <p>Liverworts, in concert with mosses and hornworts, play a significant role in the global carbon budget and CO2 exchange, plant succession, net production and phytomass, nutrient cycling, and water retention. These plants also are important environmental and ecological indicators and have been used as indicators of past climate change, to validate climate models, and are potential indicators of global warming. Chemical compounds extracted from liverworts also exhibit important biological activities. For example, chemical extracts derived from Frullania species have anti-microbial, anti-fungal, cytotoxic, insect and muscle relaxing activity.</p>
      """
      aboutBryophytes: """
        <h2>About Bryophytes</h2>
        <h3>What is a bryophyte?</h3>
        <p>Bryophytes are a diverse group of early land plants that includes liverworts (Marchantiophyta), hornworts (Anthocerotophyta), and mosses (Bryophyta). They are considered to be the living descendents of the first terrestrial plants that evolved here on Earth. While much remains to be discovered about their biodiversity, biology, and geographic distribution, they are widespread throughout the globe and have important evolutionary, ecological, and medicinal characteristics that make them critically important to document, identify, and study. Some bryophytes might be confused with small ferns or even lichens. See or click here: (see file ‘bryophytes who is who.pdf’) Use this guide to help distinguish a bryophyte from ferns and lichens. See or click here: <a href="http://fm1.fieldmuseum.org/keystonature/bryophytes/bryophytes1.html">http://fm1.fieldmuseum.org/keystonature/bryophytes/bryophytes1.html</a> use this identification tool to help you distinguish between a moss, a liverwort and a hornwort.</p>

        <div class="box">
          <img src="./images/science/bryophytes-liverwort-2.jpg" class="small right" />
          <h3>What is a liverwort?</h3>
          <p>Liverworts derive their name from old times when early botanists believed that the shape of a plant dictated its function. Some liverworts have leaves that look, roughly, like small livers, hence they believed these small plants were beneficial medicines for liver troubles. Today, we know that liverworts are a division of green land plants with over 7,500 estimated species.</p>
        </div>

        <div class="box">
          <img src="./images/science/bryophytes-frullania.jpg" class="small right" />
          <h3>What are Frullania?</h3>
          <p>Frullania is a hyper-diverse genus of liverwort species that includes over 700 species many of which, as of yet, are unclassified and remain to be described!</p>
        </div>

        <div class="box">
          <h3>What are you looking at? What is a microleaf?</h3>
          <p>The images you are classifying are of single stems of a plant. Even though these plants are microscopic in size, they are very complex. A microleaf is simply a special name for a modified leaf structure. The leaf in the genus Frullania is actually comprised of three parts, a main leaf that appears flat, a microleaf that is often a sac-like structure, and a small structure called a stylus.</p>
          <div class="center"><img src="./images/science/bryophytes-plant-parts.jpg" /></div>
        </div>
      """

  team:
    header: 'The Science, Education and Outreach Team'
    internsHeader: '2014 MicroPlants Internship Team'
    contributorsHeader: 'Personnel who have contributed to MicroPlants: Past and Present'
    acknowledgementsHeader: 'Acknowledgements'
    concernsHeader: 'Who can I contact with any concerns?'
    concernsExcerpt: 'If you have any concerns or questions about this project, please feel free to contact <a href="mailto: mkonrat@fieldmuseum.org">Dr. Matt von Konrat</a> or <a href="mailto: T-Campbell7@neiu.edu">Dr. Tom Campbell</a>'

    bios:
      bryson: """
        Michael Bryson is Associate Professor of Humanities and Sustainability Studies at <a href="http://www.roosevelt.edu/">Roosevelt University</a> in Chicago, and a Research Associate in Science and Education at the <a href="http://www.fieldmuseum.org/">Field Museum of Natural History</a>. Bryson also co-founded (in 2010) and directs Roosevelt’s <a href="http://www.roosevelt.edu/ETS/Programs/SustainabilityStudies.aspx">Sustainability Studies program</a>. As a faculty participant in the Microplants Project, Bryson is interested in how crowd-sourced citizen science tools can be integrated fruitfully in sustainability, biodiversity, and general science college curricula. He's also curious about the philosophical implications of how such practices relate to old-school modes of studying natural history (like going outside and looking at stuff).
        """

      briscoe: """
        Laura Briscoe is a research and collections assistant at the Field Museum, working primarily with bryophyte collections and taxonomic research. She has been at the museum for 7 years and received her M.S. in 2012 from Northwestern University and the Chicago Botanic Garden based on a taxonomic treatment of a family of liverworts. She spends much of her time behind the microscope, taking measurements similar to those collected by Microplants users. She has been lucky enough to be involved with field work collecting bryophytes in Fiji and Chile - some of which are featured in Microplants! When she's not looking at bryophytes, she is probably knitting.
        """

      crownover: """
        Elizabeth Crownover has served as the Director of Education at The Field Museum since 2010 and possesses over 15 years experience in informal education. Since joining The Field Museum team in 1997 her major accomplishments include development and daily management of the Crown Family PlayLab, overseeing the  renovation of the N. W. Harris Learning Collection, the construction of the Grainger Digital Media Studio and shepherding a K-3 science reform program, Early Elementary Science Partnership, through its successful pilot phase. Beth works with a team of educators to deliver The Field Museum’s Pre-K- 12 education programs and products that focus on showcasing The Museum’s research and collections to inspire wonder with families and develop scientific thinking in an effort to improve classroom practices and make deep impacts in science literacy over time. Through its programs and products, the Education Department serves over 600,000 individuals annually. Beth received her BA from Coe College in Cedar Rapids, Iowa in 1996 with majors in History and Religion and an emphasis in Education.
        """

      campbell: """
        Tom Campbell is an Instructor of Biology at Northeastern Illinois University. Though his formal training is in the molecular biology and physiology of angiosperms, he has a passion for all plant biology. A member of the Microplants team since its inception, he has been working to realize its educational and broader citizen science goals. He has piloted several iterations of this project in the classroom and is responsible for many of the students on the team. When he’s not working on various aspects of this project, delivering gripping lectures, or otherwise engaging students, he enjoys travelling and outdoor pursuits.
        """

      delavoi: """
        Charlie DeLavoi has been an intern at the Chicago Field Museum where he prepares slides and captures the images you see in this program. He completed his bachelors degree at Northeastern Illinois University, and is currently seeking a graduate program in botanical taxonomy and systematics. His favorite liverwort genus is Frullania, and his favorite moss genus Orthotrichum. Charlie would love to focus his studies in bryology, but is open to where the adventure his love of plants will lead. When Charlie is not looking at plants under a microscope, he's watering them.
        """

      drag: """
        Justyna Drag is a student at Northeastern Illinois University working towards completing her Bachelor's Degree in Secondary Education with a concentration in Science. She joined the team in the Summer of 2014 to assist with developing educational activities for Undergraduates. Justyna first became interested in microbiology and horticulture working in her mother's garden. As an educator, she hopes to have within her the capacity to instill in her students a love of learning and to always keep an open mind.
        """

      gaus: """
        Eve Gaus is the Digital Learning Manager in the Education Department of The Field Museum. Her work focuses on engaging teens in exploring science through the lens of digital media. She is interested in developing youth agency and engaging reluctant science learners through project based learning. Eve graduated with an M.S. in Library and Information Science from the University of Illinois at Urbana-Champaign. She has worked on bringing the MicroPlants project to a teenage audience through the Museum’s online education program, Virtual Visits from The Field as well as in summer camps.
        """

      greif: """
        Matthew Greif is currently an instructor at Wilbur Wright College, one of the City Colleges of Chicago, where he teaches courses in Biology, Botany, and Microbiology. Matthew has a B.Sc. in Botany from the University of Toronto and a Ph.D. in Environmental Biology and Ecology from the University of Alberta. Students in Matthew’s Biology and Botany classes at Wilbur Wright College were some of the earliest participants working with the Microplants web-pages, and have helped test the functionality of various on-line features. Matthew is very excited to explore the potential of citizen science in undergraduate science education.
        """

      hasan: """
        Lauren Hasan is the Project Coordinator on the MicroPlants project, having been involved with data analysis, educational brainstorming, public outreach, and organizing feedback for the development of the webtool. She has been at the Field Museum for 1 year and is working on her M.S. from Northwestern University in Health Communications. She has earned a double bachelors from the University of Illinois-Chicago in Biology and Psychology in 2013. She enjoys spending time with her family as well as running in marathons all over the country.
        """

      larrain: """
        Juan Larraín is a Chilean bryologist graduated from Universidad de Concepción, Chile, specializing in southern south American bryophytes in general. He is currently working as a postdoctoral researcher at the Field Museum, studying the liverwort genus Frullania, both working to resolve the backbone phylogeny of this hyperdiverse group, and developing a monograph of one of its subgenera, Microfrullania, which is a group with approximately 20 taxa with a Southern Hemisphere distribution. His contribution to the Microplants project includes teaching interns on permanent slide preparation and imaging, as well as collect material in the field and identify the specimens.
        """

      konrat: """
        Matt von Konrat, originally from Aotearoa-New Zealand, is currently Head of Botanical Collections at The Field Museum. Matt is also an adjunct curator and Collections Manager of Bryophytes. His field of interest has focused on the systematics of bryophytes, particularly liverworts. He is stimulated by the variety of disciplines that plant systematics has to offer including aspects of plant ecology &amp; biogeography, reproductive morphology, ultrastructure, and the use of molecular markers. He is particularly interested in theoretical aspects relating to species concepts and biogeography and how our understanding of these relate to conservation biology and conservation management decisions. Matt has strong interests in education outreach and the dissemination of knowledge using various forms of multimedia, especially now with large scale digitial imaging of scientific collections. Von Konrat is the lead investigator on the Connecting Collections: MicroPlants project.
        """

      reidy: """
        Brendon Reidy has been an intern at the field museum, and has been involved with the microplants project for the past two summers. His role in microplants has been working heavily on the floor recruiting citizen scientists , as well as taking images of the frullania for the project. He is currently an undergraduate at NEIU working towards a bachelors in biology with hopes to pursue a graduate degree in ecology or wildlife biology. When not studying or interning at the field Brendon enjoys prairie restoration, snake chasing, and reading more than his time permits.
        """

      scheffel: """
        Jonathan Scheffel began working with the Microplants project in 2013 and has proved proficient with microscope slide preperation for the many specimens becoming apart of our vast collection. On Tuesdays,he can be found delicately removing branches and stems of Frullania from their erstwhile homes onto glass intended for future Bryophyte enthusiasts to observe and enjoy.
        """

    contributors:
      '01': 'Asadullah Ahmadi, Imaging, (Northeastern Illinois University)'
      '02': 'Xenia Alava, Guest Interaction, (Northeastern Illinois University)'
      '03': 'Dara Arabsheibani, Guest Interaction, (Northeastern Illinois University)'
      '04': 'Audrey Aronowsky (Outreach Coordinator, BioSynC)'
      '05': 'Anthony Carmona, Imaging (Northeastern Illinois University)'
      '06': 'Kavita Elliott, Guest Interaction, (Ohio State University)'
      '07': 'Ed Gluzman, Imaging (DePaul University)'
      '08': 'Kristina Lugo (Annual Fund Coordinator, Institutional Advancement)'
      '09': 'Leilah Lyons (Assistant Professor Computer and Learning Sciences)'
      '10': 'Stephanie Maxwell, Imaging (Northeastern Illinois University)'
      '11': 'Kasey Mennie, Graphic Design, (Field Museum)'
      '12': 'Ramsey Millison, Imaging and Guest Interaction, (DePaul University)'
      '13': 'Lisa Murata, 2012 Pilot Trials, (NEIU, FM intern)'
      '14': 'Jordan Newson, Slide Preparation and Imaging (Albion College)'
      '15': 'Vishal Patel, Imaging (DePaul University)'
      '16': 'Pedro Rebollar, Guest Interaction, (DePaul University)'
      '17': 'Beth Sanzenbacher, Education '
      '18': 'Blanka Shaw (Database Manager) (Duke university)'
      '19': 'Tia Shelley (Research Assistant, Computer and Learning Scie'
      '20': 'Arfon Smith, Co-Principal Investigator (Director of Citizen Science)'
      '21': 'Steve Schultz, Imaging'
      '22': 'Oana Vadineanu, 2012 Coordination, (Northeastern Illinois University, FM intern)'
      '23': 'Alex Vizzone, Guest Interaction, (Northeastern Illinois University)'
      '24': 'Ariel Wagner, Imaging and Guest Interaction, (DePaul University)'
      '25': 'Nyree Zerega, Education, (Northwestern University)'
      '26': 'Zak Zillen, Guest Interaction, (Northeastern Illinois University)'

    acknowledgements:
      '01': 'Norbert Cordeiro, Roosevelt University/Field Museum--Instructor/Research Associate'
      '02': 'Michael Davis, Associate Vice Chancellor for STEM (City Colleges of Chicago)'
      '03': 'Nicholas Devos, Post Doctoral Research Scholar (Duke University, North Carolina)'
      '04': 'Doris Espiritu, Chair, Physical Science Department/Service Learning Coordinator (Wilbur Wright College, Chicago)'
      '05': 'Leonard Etlinger, Director for Grants and Contracts (City Colleges of Chicago)'
      '06': 'Jessica Hankey (School Partnerships and Programs Manager, Education Department)'
      '07': 'Joseph Hibdon Jr., Northeastern Illinois University--Instructor, Math Department'
      '08': 'Jeff Janulis, Associate Dean of Instruction (Wilbur Wright College, Chicago)'
      '09': 'John Kasmer (Associate Professor and Chair, Department of Biology)'
      '10': 'Austin Mast, Associate Professor (Florida State University, Florida)'
      '11': 'David Marshall, Vice President for Academic Affairs (Olive-Harvey College, Chicago)'
      '12': 'Tom Moher, Associate Professor Computer Science, Learning Sciences, and Education (University of Illinois, Chicago)'
      '13': 'Kara Nuss, Biology Instructor (Northeastern Illinois University, Chicago)'
      '14': 'Norm Wickett, Conservation Scientist, Genomics and Bioinformatics (Chicago Botanic Garden; Northwestern University, Chicago)'

  education:
    header: 'Education'
    navigation:
      overview: 'Overview'
      activities: 'Activities and Guides'
      plants: 'Plants 101'
      videos: 'Videos'

    content:
      overview: """
        <p>Scientists and educators at <a href="http://www.fieldmuseum.org/">The Field Museum (Chicago)</a> partnered with Citizen Science and Zooniverse at the <a href="http://www.adlerplanetarium.org/">Adler Planetarium</a> have coordinated a network of students and professionals at universities, city colleges, high schools, and middle schools to accelerate the pace of scientific discovery. The underlying theme is to connect biological research and collections with education and outreach. The project has the specific goal of engaging a broader audience, especially students (K-12 and university level) and citizen scientists to partner with our efforts in recording critical data sets from digitally rendered images. Our education guides are suitable for various classes and majors. </p>

        <h3>Can Collection Connection: MicroPlants be used in the classroom?</h3>
        <p>Of course! MicroPlants is user friendly and can be used in the classroom as well as an at home assignment! Take part in scientific research anywhere and at anytime.</p>

        <h3>How can these activities be implemented into my curriculum?</h3>
        <p>K-12 programs: Educators from the Education Department at The Field Museum have developed lessons, activities, and virtual visits – establishing communication between your students and our MicroPlants Scientists. Every activity has a rubric that facilitates implementing them into your unit plan. These activities align with <a href="http://www.corestandards.org">Common Core</a> and <a href="http://www.nextgenscience.org">Next Generation Science Standards</a>.</p>

        <p>Undergraduate level or equivalent: To help promote ideas, several activities have been developed and applied to non biology as well as entry level biology majors. Some of the activities could also be used for advanced placement biology students in high school.</p>

        <h3>Undergraduate students express their experience!</h3>
        <p>"All together" Past Field Museum undergraduate interns, explain their experiences using MicroPlants as well as the ImageJ software used in some of our activities!</p>
      """
      activities: """
        <h2>Guides</h2>
        <p>Lead in statement for guides</p>

        <div class="activity-or-guide">
          <img src="./pdfs/thumbs/whos-who.png">
          <h3><a href="./pdfs/guides-bryophytes-ferns-lichens.pdf">Who is who?: Bryophytes, Ferns and Lichens</a></h3>
        </div>

        <div class="activity-or-guide">
          <img src="./pdfs/thumbs/compare-table.png">
          <h3><a href="./pdfs/guides-comparative-table.pdf">Comparative table: Common features distinguishing bryophytes, ferns and lichens</a></h3>
        </div>

        <div class="activity-or-guide">
          <img src="./pdfs/thumbs/early-land-plants.png">
          <h3><a href="./pdfs/guides-early-land-plants.pdf">Bryophytes or Early Land Plants: Comparison between Mosses, Liverworts and Hornworts</a></h3>
        </div>

        <hr>

        <h2>Activities</h2>

        <div class="activity-or-guide">
          <img src="./pdfs/thumbs/sci-draw.png">
          <h3><a href="./pdfs/biological-illustrations.pdf">Biological Illustrations.pdf</a></h3>
          <p>Learn how to make scientific illustrations and record your observations, a great tool to help you to remember all the features of an observed specimen.</p>
        </div>

        <div class="activity-or-guide">
          <img src="./pdfs/thumbs/phylo-tree.png">
          <h3><a href="./pdfs/early-land-plants-tdoay.pdf">Early Land Plants Today.pdf</a></h3>
          <p>This activity focuses on morphology, the study of form and structure of organisms and specific structural features. Students can investigate morphological characteristics of early land plants.</p>
        </div>

        <div class="activity-or-guide">
          <img src="./pdfs/thumbs/imagej.png">
          <h3><a href="./pdfs/imagej-instructions.pdf">ImageJ Instructions.pdf</a></h3>
          <p>ImageJ is a free program developed by the National Institute of Health (NIH) that has given the scientific community a way of generating data from images.</p>
        </div>
        """
      plants: """
        <p>Bryophytes, specifically liverworts such as Frullania, are considered the earliest land plants. Researchers at The Field Museum are creating a working phylogeny of known species and discovering new species all over the world. Early land plants are environmental indicators. Because of their small size, liverworts respond quickly to environmental and ecological change. They are potential indicators of climate change, assist in assessing the overall “health” of forests, and detect heavy metals and pollution in the atmosphere.</p>
      """
      videos: """
        <p>Check out some of these videos to learn more on what the scientists at The Field Museum are doing behind the scenes.</p>

        <hr>

        <h3><a href="http://vimeo.com/24013431">Science at FMNH - Early Land Plants v1</a></h3>
        <p>Discover the microscopic world of liverworts, hornworts and mosses as we speak with Matt VonKonrat, Collections Manager &amp; Adjunct Curator in the Botany Department at the Field Museum of Natural History.</p>

        <hr>

        <h3><a href="http://vimeo.com/36771513">Science at FMNH - Environmental Significance of Early Land Plants</a></h3>
        <p>We continue our discussion with Matt Von Konrat by exploring the biological and environmental significance of early land plants, such as mosses and liverworts.</p>

        <hr>

        <h3><a href="http://vimeo.com/36788537">Science at FMNH - Threats for Early Land Plants</a></h3>
        <p>We continue our discussion with Matt Von Konrat by discussing the environmental impacts that threaten the existence of the descendants of early land plants.</p>

        <hr>

        <h3><a href="http://vimeo.com/24013867">Science at FMNH - Oil Bodies Inside Early Land Plants v1</a></h3>
        <p>We continue our discussion with Matt Von Konrat by exploring the unique structures called oil bodies that are found inside the cells of liverworts.</p>
      """

  profile:
    hello: 'Hello'
    imagesMarked: 'Images Marked'
    favoriteCount: 'Favorite Count'

