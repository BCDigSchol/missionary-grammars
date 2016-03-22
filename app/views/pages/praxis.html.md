<%= content_for :header do %>Praxis<% end %>

### Technical infrastructure

#### Software

#### Theme

#### Plugins

### Content development and methodology

Prior to digitization, content development, and design, corpus texts were selected from
the <cite>Nicholas M. Williams Ethnological Collection</cite> of the the John J. Burns Library at
Boston College according to the following constraints (1) the text was authored by a
French missionary (rather than a government official or layperson); (2) the text commented
on a language (or languages) of continental Africa or Madagascar (that is to say,
languages of the Niger-Congo, Afro-Asiatic, or Austronesian families); and (3) the text
clearly represents a linguistic endeavour (i.e. is a lexicographic or grammatical analysis
rather than transcribed folk tales or catechisms, though the text *may include* such
elements). The selected texts were then examined for their physical condition, and five
were submitted to conservation work including rebacking, and repairing brittle text blocks
and warped boards. Digitization took place at the John. J. Burns Library and the Boston
Public Library. (digitization standards? more information here?)

We assembled metadata for each text in two major categories *bibliographic metadata*
(including authorship, publication information, and holding details) and *target language
metadata* (ethnolinguistic information pertaining to each target language). Information
about authorship was compiled from the Jesuit and Spiritan archives and, in particular,
the <cite>Catalogus Defunctorum</cite>, registries that provide biographic and historical information
about missionaries (place of birth/death, ecclesiastical rank, the countries they were
stationed in etc.).

The central resources for ethnolinguistic information about the target languages were:

* <cite>Ethnologue</cite>: online publication providing various statistics on the world’s languages
(number of speakers, location, dialects, viability, availability of Bible translation,
etc.); assigns each language (and in most cases, each dialect) a unique ISO code
* <cite>Glottolog</cite>: a bibliographic database of the world’s ‘lesser-known languages’; includes
geographic coordinates for nuclear languages, and is searchable both by “glottocode” and
ISO code (and therefore compatible with <cite>Ethnologue</cite>)

Target languages were identified by the name provided by the missionary author in the source text, then by the corresponding
modern-day designation; finally, alternate designations, including spelling variants, were
recorded. The naming or glossonomy of indigenous languages by missionaries represents a
highly charged, contested, and problematic enterprise. Given the text-based nature of the
<cite>Language, mission, and Africa</cite> project, we have privileged the glossonym attested in the
primary text. However, we recognize that the very urge to <cite>name</cite> a language, which is always
in contradistinction to other languages, and our modern-day adoption, circulation, or
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
their structure, rather than being limited to ‘paging’ or ‘scrolling’ through the
digitized version. Not only does this provide insight into how the missionary linguist
conceived of the target language— and partitioned it out into a series of hierarchically
ordered, discrete, categories, often (but not always) in accord with a Greco-Latin
grammatical framework— but it also allows the research to quickly locate and go to
specific topics treated in the text (for instance, nominal declension). Moreover, it
avoids the disadvantages of ‘excerpting’— by which the digital text-object is partitioned
into individual files corresponding to its subsections, and then keyed to a clickable
hierarchy— which can create a truncated reader experience and distorts the source text.

We created a number of XML support files that digest, organize, and encode some of the
assembled metadata, using Oxygen XML Editor and TEI standards. These include an
authorography, which encodes information about each missionary represented in the corpus;
an orgography, which encodes information about the missionary orders or organizations;
represented in the corpus; and a publication gazateer, which associates each text with its
place of publication. We also encoded the preface and a dictionary entry from the (1855)
<cite>Dictionnaire Français–Wolof et Wolof–Français</cite>, as ‘proofs-of-concept’, to demonstrate a
technique that might be extended over the entirety of the corpus texts in the frame of a
longer project, and further to model XML rendering of older linguistic documentation. We
housed these files in the TAPAS repository, which is interoperable with the database
platform.

The location intelligence and visualization engine CartoDB was used to convert the data
contained in the publication gazateer and the target language metadata fields into an
interactive map that plots the places of publication for each text in the corpus, as well
as the loci of target language speech communities. We used MapWarper to georectify a
period (1892) map from the from the University of Illinois at [Urbana-Champaign Maps of
Africa to 1900](http://imagesearchnew.library.illinois.edu/cdm/landingpage/collection/africanmaps) collection, which we used as a base-layer.

### User experience and design

### Outreach and publicity

### Challenges and next steps