class MarkdownTemplateHandler
  def self.call(template)
    erb = ActionView::Template.registered_template_handler(:erb)
    source = erb.call(template)

    <<-SOURCE
    renderer = Redcarpet::Render::HTML.new()
    options = {
        autolink: true,
        no_intra_emphasis: true,
        strikethrough: true,
        superscript: true
    }
    Redcarpet::Markdown.new(renderer, options).render(begin;#{source};end)
    SOURCE
  end
end


ActionView::Template.register_template_handler(:md, MarkdownTemplateHandler)