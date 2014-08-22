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
    restartTutorial: 'Restart Tutorial'
    guide: 'Guide'
    info: 'info'
    prompt: 'Measure the Microleaves!'
    finished: 'Finishied'

    fieldGuide:
      header: 'Image Classification'
      exampleMarkings: 'Example Markings'

      question_1: 'Oops! I made a mistake. How do I undo a mistake?'
      answer_1: 'First off, don’t panic! Simply, select the "X" that appears in the grey box after each measurement to delete that set of measures. In any event, if you make a mistake, we will be able to sort that out when all the data is collected.'

      question_2: 'How do I differentiate a microleaf from the rest of the image?'
      answer_2: 'Usually the structures in clear focus within the image will be the microleaves; it will generally be toward the center of the image. We will measure only microleaves (modified leaves) that are clearly focused and fall entirely within the image. Here are some pictures to help guide you.'

      question_3: 'How many microleaves are on each image?'
      answer_3: 'Each image will have at least one microleaf; however, some images will have several.'

      question_4: 'The app is not loading, what should I do?'
      answer_4: 'The website may be affected by your connection speed. If you’re able to connect to the internet, check to see if you’re using the latest version of the recommended browser (Google Chrome of Firefox.)'

    metadata:
      header: 'Location & Information'
      coordinates: 'Coordinates'
      collector: 'Collector'
      comments: 'Other Comments'
      dateCollected: 'Date Collected'

    summary:
      header: 'Measurements Recorded!'
      excerpt: 'If you want, you can discuss this on Talk or share it with the world!'
      favorite: 'Favorite'
      discuss: 'Discuss'
      readyToContinue: 'Ready to Move on?'
      askForSurvey: """
        Thank you for your work! We'd love it if you took the time to complete <a href="http://fieldmuseum.fluidsurveys.com/s/MicroPlants2014/" target="_blank">this survey</a> about your Microplants experience. Thank you!
      """
      seenThisSession: "You have marked $seen so far this session!"
      beforeSurvey: 'We ask each person to mark 5 images.'

  science:
    header: 'Science'
    navigation: 
      overview: 'Overview'
      aboutBryophytes: 'About Bryophytes'
      bryophyteImportance: 'Importance of Bryophytes'
      origin: 'Origin of Images'
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
        <p>The significance of biological collections of museums and academic institutions make countless contributions to science and society in general, especially in documenting, describing and discovering diversity. In this project, dried plant specimens are collected in the field from habitats ranging from tropical cloud forests to temperate tundra.</p>

        <div class="block-images short">
          <img src="./images/science/origin-6.jpg" />
          <img src="./images/science/origin-7.jpg" />
        </div>

        <h3>Where are the specimens stored?</h3>
        <p>The dried plant specimens are stored in a facility called a herbarium such as that at the Field Museum where some 3 million plants specimens, representing the full spectrum of green land plant diversity, are housed. Because bryophytes (mosses, liverworts and hornworts) are generally small they are typically housed in archival packets. These specimens serve as the foundation for biodiversity research and have wide ranging applications from conservation and land management to understanding species relationships and evolution.</p>

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
        <p>Bryophytes are a diverse group of early land plants that includes liverworts (Marchantiophyta), hornworts (Anthocerotophyta), and mosses (Bryophyta). They are considered to be the living descendents of the first terrestrial plants that evolved here on Earth. While much remains to be discovered about their biodiversity, biology, and geographic distribution, they are widespread throughout the globe and have important evolutionary, ecological, and medicinal characteristics that make them critically important to document, identify, and study. Some bryophytes might be confused with small ferns or even lichens. Use <a href="./pdfs/guides-bryophytes-ferns-lichens.pdf">this guide</a> to help distinguish a bryophyte from ferns and lichens. Use <a href="http://fm1.fieldmuseum.org/keystonature/bryophytes/bryophytes1.html">this identification tool</a> to help you distinguish between a moss, a liverwort and a hornwort.</p>

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
    intro: 'The Connecting Collections: MicroPlants project includes a network of students, scientists, educators, and administrators partnering with Zooniverse. Together, the team has developed a framework using digitized images captured from biological specimens to increase student participation in the scientific process and connecting museum specimens to a broader audience. The data generated can also be used in education programs.'
    contactsHeader: 'Primary Contacts:'
    contactsExcerpt: '''
      <ul>
        <li>MicroPlants Project Coordinator – Dr. Matt von Konrat, The Field Museum, mvonkonrat@fieldmuseum.org</li>
        <li>K-12 Education Programs – Eve Gaus, The Field Museum, egaus@fieldmuseum.org</li>
        <li>University Programs – Dr. Tom Campbell, Northeastern Illinois University, T-Campbell7@neiu.edu</li>
      </ul>
    '''
    internsHeader: '2014 MicroPlants Internship Team'
    contributorsHeader: 'Personnel who have contributed to MicroPlants: Past and Present'
    acknowledgementsHeader: 'Acknowledgements'
    acknowledgementsExcerpt: '''
      <p>The Connecting Collections:MicroPlant project has been generously supported by The Encyclopedia of Life, The Grainger Foundation, The Field Museum, Zooniverse, and the National Science Foundation (Award Number DEB-1145898).</p>

      <p>The MicroPlants Team acknowledge the many people who have been involved throughout:</p>
    '''

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
      '19': 'Tia Shelley (Research Assistant, Computer and Learning Sciences)'
      '20': 'Arfon Smith, Co-Principal Investigator (Director of Citizen Science)'
      '21': 'Steve Schultz, Imaging'
      '22': 'Kalman Strauss, Volunteer (Field Museum)
'
      '23': 'Oana Vadineanu, 2012 Coordination, (Northeastern Illinois University, FM intern)'
      '24': 'Alex Vizzone, Guest Interaction, (Northeastern Illinois University)'
      '25': 'Ariel Wagner, Imaging and Guest Interaction, (DePaul University)'
      '26': 'Nyree Zerega, Education, (Northwestern University)'
      '27': 'Zak Zillen, Guest Interaction, (Northeastern Illinois University)'
      '28': 'Will Flannery, Graphic Design (Field Museum)'

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
      '15': 'Tatyana Livshultz, Pilot Educator (Drexel University)'
      '16': 'Mariam Nasser, Pilot Educator (Elgin Academy)'
      '17': 'The many collaborating scientists who have kindly collected plants from around the world, especially Tamás Pócs (Fiji, Australia), John J. Engel (New Zealand, Chile), Peter de Lange (New Zealand), John Braggins (New Zealand, Fiji, Australia), Matt Renner (Australia), Bill Buck (Chile), and Laura Briscoe (Chile).'
      '18': 'The senior scientists also thank the many herbarium curators from museums, universities and scientific institutions from around the world who have kindly loaned herbarium (dried plant specimens) to the project for study.'

  education:
    header: 'Education'
    navigation:
      overview: 'Overview'
      activities: 'Programs, Guides, and Activities'
      plants: 'Plants 101'
      videos: 'Videos'

    content:
      overview: """
        <p>Scientists and educators at <a href="http://www.fieldmuseum.org/">The Field Museum (Chicago)</a> partnered with Citizen Science and <a href="https://www.zooniverse.org/">Zooniverse</a> at the <a href="http://www.adlerplanetarium.org/">Adler Planetarium</a> to coordinate a network of students and professionals at universities, city colleges, high schools, and middle schools to accelerate the pace of scientific discovery. The underlying theme is to connect biological research and collections with education and outreach. The project has the specific goal of engaging a broader audience, especially students (K-12 and college) and citizen scientists to partner with our efforts in recording critical data sets from digitally rendered images. Our education guides are designed for a university level classroom and are suitable for various classes and majors. Our Virtual Visits program is designed for a middle school or high school classroom.</p>

        <h3>Can Collection Connection: MicroPlants be used in the classroom?</h3>
        <p>Of course! MicroPlants is user friendly and can be used in the classroom as well as an at home assignment! Take part in scientific research anywhere and at anytime.</p>

        <h3>How can these activities be implemented into my curriculum?</h3>
        <p><b>K-12 programs:</b> Educators from the Education Department at The Field Museum developed <a href="https://www.fieldmuseum.org/educators/virtual-visits">Virtual Visits from The Field</a> – an NGSS aligned program that virtually brings our MicroPlants Scientists into the classroom. This sixty minute live broadcast is accompanied by pre and post activities that easily integrates MicroPlants into your curriculum.</p>

        <p><b>Undergraduate level or equivalent:</b> To help promote ideas, several activities have been developed and applied to non biology as well as entry level biology majors. Some of the activities could also be used for advanced placement biology students in high school.</p>

        <h3>Undergraduate students express their experience!</h3>
        <p>"All together" Past Field Museum undergraduate interns, explain their experiences using MicroPlants as well as the ImageJ software used in some of our activities!</p>
        <div class="center"><iframe src="//player.vimeo.com/video/58426100" width="600" height="320" frameborder="0" allowfullscreen></iframe></div>
      """
      activities: """
        <p>The MicroPlants team, Citizen Science, and Zooniverse are connecting research and collections with education and outreach. Our goal is to engage a broader audience, especially students (K-12 and university level), as well as the general public to partner with our efforts in recording critical data from digital images. </p>

        <div class="center"><img src="./images/logos/virtual-visits.png"></div>
        <p><b>Virtual Visits from The Field</b> is an sixty minute live broadcast that explores taxonomy through the lens of citizen science. Students will learn about the evolution of early land plants and will engage in the process of collecting and classifying bryophytes (microplants) with the Museum’s MicroPlants team. Students will have the opportunity to become citizen scientists and contribute to the microplants project. Pre-and-post activities accompany this live broadcast, take a sneak peak at the activities!</p>

        <p>NGSS DCI Alignments: LS4.A: Evidence of Common Ancestry and Diversity. For more information visit: <a href="www.fieldmuseum.org/virtualvisits">www.fieldmuseum.org/virtualvisits</a></p>

        <h2>Guides</h2>
        <p>Our guides are simple and useful for both classroom activities and while out in the field exploring. They can be laminated and combined to form a packet when going out on a field trip or on a walk through any natural area.</p>

        <div class="activity-or-guide">
          <img src="./pdfs/thumbs/compare-table.png">
          <h3><a href="./pdfs/guides-comparative-table.pdf">Comparative table</a></h3>
          <p>A useful beginners’ guide to distinguishing between Liverworts, Mosses, Hornworts, Ferns, and Lichen.</p>
        </div>

        <div class="activity-or-guide">
          <img src="./pdfs/thumbs/whos-who.png">
          <h3><a href="./pdfs/guides-bryophytes-ferns-lichens.pdf">Who's who?</a></h3>
          <p>A guide to understanding the similarities and differences between nomenclature, habitats, and the distinguishing structures of bryophytes, ferns, and lichens.</p>
        </div>

        <div class="activity-or-guide">
          <img src="./pdfs/thumbs/bryophytes.png">
          <h3><a href="./pdfs/guides-early-land-plants.pdf">Bryophytes or Early Land Plants</a></h3>
          <p>This chart provides a comparison of distinguishing surface structures of Mosses, Liverworts, and Hornworts.</p>
        </div>

        <hr>

        <h2>Activities</h2>
        <p>These activities are suitable for various undergraduate classes and majors. They can be implemented into any discussion on plants, habitats, local and global issues.</p>

        <div class="activity-or-guide">
          <img src="./pdfs/thumbs/sci-draw.png">
          <h3><a href="./pdfs/scientific-drawings.pdf">Biological Illustrations.pdf</a></h3>
          <p>Learn how to make scientific illustrations and record your observations, a great tool to help you to remember all the features of an observed specimen.</p>
        </div>

        <div class="activity-or-guide">
          <img src="./pdfs/thumbs/phylo-tree.png">
          <h3><a href="./pdfs/early-land-plants-lab.pdf">Early Land Plants Today.pdf</a></h3>
          <p>This activity focuses on morphology, the study of form and structure of organisms and specific structural features. Students can investigate morphological characteristics of early land plants.</p>
        </div>

        <div class="activity-or-guide">
          <img src="./pdfs/thumbs/imagej.png">
          <h3><a href="./pdfs/imagej-instructions.pdf">ImageJ Instructions.pdf</a></h3>
          <p>ImageJ is a free program developed by the National Institute of Health (NIH) that has given the scientific community a way of generating data from images.</p>
        </div>
        """
      plants: """
        <p>Bryophytes, specifically liverworts such as Frullania, are considered the earliest land plants. Researchers at The Field Museum are creating a working phylogeny of known species and discovering new species all over the world. Early land plants are environmental indicators. Because of their small size, liverworts respond quickly to environmental and ecological change. They are potential indicators of climate change, assist in assessing the overall "health" of forests, and detect heavy metals and pollution in the atmosphere.</p>

        <div class="center"><img src="./images/education/plant-diversity.jpg"></div>
        <p>From macro scale to micro scale, plants are critical to a healthy environment and life on earth. Life as we know it would cease to exist without plants. Whether directly or indirectly food, water, medicine, air, habitat and climate depends on plant life. The early land plants that we are studying are the Liverworts. You will be measuring microleaves, an anatomical structure on the liverwort, which is smaller than a tip on a pencil. Scientists who go out to different collection locations have to keep a keen eye for these tiny plants that are only found in the most lush areas. More information on plants and conservation can be found at The Botanic Gardens Conservation International: <a href="http://www.bgci.org/plantconservationday/whyplantsimportant/">http://www.bgci.org/plantconservationday/whyplantsimportant/</a></p>

        <div class="center"><img src="./images/education/vegetation-zones.png"></div>
        <div class="center"><img src="./images/education/plants-101-vegetation.png"></div>

        <p>Collecting Bryophytes is no easy task, getting to these early land plants involves going to some of the most remote areas of the world. Field Museum botanists have collected from places all over Chile, Fiji, New Caledonia as well as New Zealand. This process takes time to find the perfect collection sites. Some areas that these specimen were collected from are Temperate Broadleaf Forest and Riparian, Subtropical Moist Forest, Tropical Mountain Rainforests, as well as Tropical and Subtropical Moist Forest and Rainforests. Why do you think that these areas would be the perfect growing location for early land plants?</p>

        <p>For more information, check out these scholarly articles on Frullania:</p>
        <ul>
          <li><a href="http://scholar.google.com/scholar?oi=bibs&hl=en&cluster=12614588440966343677&btnI=Lucky">Early Land Plants Today (ELPT): How many liverwort species are there?</a> M Von Konrat, L Soderstrom, MAM Renner, A Hagborg… - Phytotaxa, 2014</li>
          <li><a href="http://scholar.google.com/scholar?oi=bibs&hl=en&cluster=15347743729748958913&btnI=Lucky">Early Land Plants Today: Global patterns of liverwort diversity, distribution, and floristic knowledge</a> M von Konrat, A Hagborg, L Söderström, MAM Renner… - Bryology in Asia in the New Millennium. Proceedings of …, 2007</li>
        </ul>

        <div class="center"><img src="./images/education/plant-diversity-2.png"></div>

        <p>Bryophytes are a diverse group of early land plants that includes liverworts (Marchantiophyta), hornworts (Anthocerotophyta), and mosses (Bryophyta). They are considered to be the living descendents of the first terrestrial plants that evolved here on Earth. Liverworts (Marchantiophyta) are pivotal in our understanding of early land plant evolution and exist as important components of the vegetation in many regions of the world. Taxonomic conclusions will be drawn from a multi-faceted data set, including morphology, fieldwork, experimental growth studies, as well as DNA sequence data, and population studies using DNA microsatellite markers.</p>

        <div class="center"><img src="./images/education/herbarium-specimen.jpg"></div>
        <p>Of the 24 million specimens and objects housed in the Field Museum (Chicago), approximately 3 million are plant specimens. The herbarium preserves and documents the biodiversity of plants. An herbarium is a repository of preserved and labeled plant specimens arranged in such a way as to allow easy access and archival storage. Each specimen is typically stored in the form of an herbarium sheet, which is a pressed and dried plant affixed to a sheet of heavy paper. Each sheet includes a label describing the plant's Latin name, the origin of the collection, the date of collection, and the name of the collector. Herbarium sheets are all of standardized size and arrangement, and are filed in protective storage cabinets. Within these cabinets the specimens are arranged according to the family, genus, and species they represent, as well as the geographic location from which they were collected.</p>
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
    microleavesMarked: 'Microleaves Marked'
