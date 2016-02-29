require './config/environment'

class JsonTextImporter

  def import(json_file_path)
    text_id = json_file_path.match(/\D*(\d*).json/)[1]
    @text = Text.find(text_id)
    file = File.read json_file_path
    data_hash = JSON.parse file
    @top_node = TextSection.base_section(@text)
    read_sections data_hash['sections'], @top_node
  end

  def read_sections(sections, parent)
    last_section = @top_node
    ordinal = 0
    sections.each do |section|
      ordinal +=1
      last_section.to = section['page'] - 1
      last_section.save
      this_section = create_section section['title'], section['page'], 1111, parent, ordinal
      if section['sections']
        read_sections section['sections'], this_section
      end
      last_section = this_section
    end
  end

  def create_section(title, from, to, parent, ordernum)
    puts @text.id.to_s
    section = TextSection.new
    section.title = title
    section.from = from
    section.to = to
    section.parent = parent
    section.ordinal = ordernum
    section.text = @text
    section.save
    section
  end

end

# Run the script
importer = JsonTextImporter.new
importer.import(ARGV[0])
