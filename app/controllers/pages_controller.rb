class PagesController < ApplicationController
  layout 'page'

  def home
    render_page 'home'
  end

  def show
    @page = params[:page]
    render template: "pages/#{params[:page]}"
  end

  def render_page(page)
    render template: "pages/#{page}"
  end
end
