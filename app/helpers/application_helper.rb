module ApplicationHelper
  def avatar image_url, options = {}
    return image_tag(
      image_url,
      class: ["circle", "left"].concat(options[:class] ? options[:class].split(" ") : []),
      width: "40",
      height: "40"
    )
  end

  def card options={}
    render layout: "shared/card" do
      yield
    end
  end

  def card_body
    render layout: "shared/card_body" do
      yield
    end
  end

  def card_actions
    render layout: "shared/card_actions" do
      yield
    end
  end

  def card_header
    render layout: "shared/card_header" do
      yield
    end
  end

  def flash_message options
    render partial: "shared/flash", locals: options
  end

  def btn_sidebar text, path, options = {}
    link_to(
      text,
      path,
      class: [
        "btn-primary",
        "block",
        "p2",
        "text-decoration-none",
        "black",
        "btn-sidebar",
        options[:selected] ? "selected" : nil
      ]
    )
  end

  def user_menu user
    render partial: "shared/user_menu", locals: {user: user}
  end
end

def container
  return content_tag(:div, class: "max-width-4 mx-auto py2 px2") { yield }
end
