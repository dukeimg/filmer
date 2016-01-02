class PagesController < ApplicationController
  layout 'article', except: [:landing]
  add_breadcrumb 'Filmer', :root_path

  def landing
    render layout: 'transparent_header'
  end

  def about
    add_breadcrumb I18n.t('breadcrumbs.about'), :about_path
  end

end
