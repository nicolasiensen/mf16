module ApplicationHelper
  def avatar image_url, options = {}
    return image_tag(
      image_url,
      class: ["circle", "left"].concat(options[:class] ? options[:class].split(" ") : []),
      width: "40",
      height: "40"
    )
  end

  def card
    return content_tag(:div, class: "bg-white p3 rounded mb3") { yield }
  end

  def flash_message options
    render partial: "shared/flash", locals: options
  end
end
