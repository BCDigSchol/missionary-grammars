<%= content_for :header do %>Praxis<% end %>

### Technical infrastructure

  *Frameworks*: Ruby on Rails, React
  
  *Database*: PostgreSQL
  
  *Languages*: HTML, CSS, JavaScript, Markdown, XML (TEI)
  
  *Theme*: Helios HTML5up

  *Additional software*: CartoDB 
  
  *Code is available on <a href="https://github.com/BCDigSchol/missionary-grammars" target="_blank">GitHub</a>* 

### Content development and methodology

Prior to digitization, content development, and design, corpus texts were selected from
the <a href="http://www.bc.edu/libraries/collections/collinfo/a-zlist/rarebooks.html" target="_blank">Nicholas M. Williams Ethnological Collection</a> of the the John J. Burns Library at
Boston College according to the following constraints: (1) the text is authored by a
French missionary (rather than a government official or layperson); (2) the text comments
on a language (or languages) of continental Africa or Madagascar (in this case,
languages of the Niger-Congo, Afro-Asiatic, or Austronesian families); and (3) the text
clearly represents a linguistic endeavour (i.e. is a lexicographic or grammatical analysis
rather than, for instance, a collection of transcribed folk tales or catechisms, though the text *may include* such
elements). The staff of the Boston College Libraries provided support for this endeavor throughout. Burns Library staff assisted in identifying relevant texts. The Libraries further supported the task by digitizing and making the full texts available online, a process which includes copyright review, conservation, and digitization.

We assembled metadata for each text in two major categories *bibliographic metadata*
(including authorship, publication information, and holding details) and *target language
metadata* (ethnolinguistic information pertaining to each target language). Information
about authorship was compiled from the Jesuit and Spiritan archives and, in particular,
the <cite>Catalogus Defunctorum</cite>; these are registries that provide biographic and historical information
about missionaries (place of birth/death, ecclesiastical rank, the countries they were
stationed in etc.), and assign each a unique identification number.

The central resources for ethnolinguistic information about the target languages were:

* <cite>Ethnologue</cite>: an online publication that provides various statistics on the world’s languages
(number of speakers, location, dialects, viability, availability of Bible translation,
etc.) and assigns each language (and in most cases, each dialect) a unique ISO code
* <cite>Glottolog</cite>: a bibliographic database of the world’s ‘lesser-known languages’; it includes
geographic coordinates for nuclear languages, and is searchable both by 'glottocode' and
ISO code (and therefore compatible with <cite>Ethnologue</cite>)

Target languages were identified by the name provided by the missionary author in the source text, then by corresponding
modern-day designation(s); alternate designations, including spelling variants, were
recorded. The naming or glossonomy of indigenous languages by missionaries represents a
highly charged, contested, and problematic endeavour. Given the text-based nature of the
*<cite>Missionary Linguistics in colonial Africa / Corpus de travaux linguistiques des missionnaires</cite>* project, we have privileged the glossonym attested in the
primary text. However, we recognize that the very urge to <cite>name</cite> a language (a move that is always
in contradistinction to other languages) and our modern-day adoption, circulation, or
refusal, of those names, would benefit greatly from a sensitive and detailed scholarly
analysis.

We categorized each text according to its genre (grammar, dictionary, vocabulary),
subgenre (dictionary with grammatical sketch; vocabulary with grammatical sketch), and, if
a vocabulary or dictionary, its directionality, i.e. unidirectional (either ‘target
language to source language’ or ‘source language to target language’), bidirectional (both
target language to source language and source language to target language), or
multidirectional (source language mediated by two or more target languages). We also
inventoried the paratextual elements (forewords, prefaces, appendices, etc.) in text.

For each text, we created a word document in which we mapped the text’s organizational
structure (which we reconstructed from the hierarchical ordering of sections and
subsections in the primary source), in anticipation of creating a clickable structure
coordinated with the e-text. This step allows the user to navigate the text according to
their internal organizational structure, rather than being limited to ‘paging’ or ‘scrolling’ through the
digitized version. Not only does this improve user experience by allowing the research to quickly locate and go to
specific topics treated in the text (for instance, nominal declension), but it also provides insight into how the missionary linguist
conceived of the target language and partitioned it out into a series of hierarchically
ordered, discrete, categories, often (but not always) in accord with a Greco-Latin
grammatical framework. Moreover, this technique of keying a clickable hierarchy to the digitized text
avoids the disadvantages of ‘excerpting’— by which the digital text-object is partitioned
into individual files corresponding to its subsections— which can create a truncated reader experience and distorts the source text. The clickable hierarchies are also collapsible into several levels, meaning the researcher can navigate the structure of each text with varying degrees of detail.

We created a number of TEI XML support files that digest, organize, and encode some of the
assembled metadata, using Oxygen XML Editor and TEI standards. These include an
authorography (i.e. prosopography), which encodes information about each missionary represented in the corpus;
an orgography, which encodes information about the missionary orders or organizations;
represented in the corpus; and a publication gazetteer, which associates each text with its
place of publication. We also encoded the preface and a dictionary entry from the (1855)
<cite>Dictionnaire Français–Wolof et Wolof–Français</cite>, as ‘proofs-of-concept’, to demonstrate a
technique that might be extended over the entirety of the corpus texts in the frame of a
longer project, and further to model XML rendering of older linguistic documentation. All of the TEI files are housed in the TAPAS <a href="http://beta.tapasproject.org/" target="_blank">repository</a>, but are also directly accessible on this site.

The location intelligence and visualization engine CartoDB was used to convert the data
contained in the publication gazetteer and the target language metadata fields into an
interactive map that plots the places of publication for each text in the corpus, as well
as the loci of target language speech communities. We used MapWarper to georectify a
period (1892) map from the from the University of Illinois at Urbana-Champaign <a href="http://imagesearchnew.library.illinois.edu/cdm/landingpage/collection/africanmaps" target="_blank">Maps of
Africa to 1900</a> collection, which we used as a base-layer. This resource was then embedded directly into the HTML site. 
