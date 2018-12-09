module ApplicationHelper

   def gravatar_for(user, options = { size: 200})
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
   end

  def markdown_to_html(text)
    Kramdown::Document.new(text, input: "GFM").to_html
  end

end
