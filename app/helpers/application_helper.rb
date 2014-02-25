module ApplicationHelper
 def link_to_add_fields(name, f, association)
  new_object = f.object.class.reflect_on_association(association).klass.new
  fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
    render(association.to_s.singularize + "_fields", :f => builder)
  end
  link_to_function(name, h("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"))
end


def link_to_remove_fields(name, f)
  f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
end

def url_with_protocal(url)
  /^http/.match(url) ? url : "http://#{url}"
end

include TweetButton

def markdown(text)
    return unless text
    renderer = Redcarpet::Render::HTML.new
    extensions = {autolink: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render text).html_safe
end

end
