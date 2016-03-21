class PagesController < ApplicationController
  layout 'home', only: [:home]

  def home
    render_page 'index'
  end

  def show
    render template: "pages/#{params[:page]}"
  end

  def render_page(page)
    render template: "pages/#{page}"
  end
end
