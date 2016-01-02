class PagesController < ApplicationController
  layout 'article', except: [:landing]
  add_breadcrumb 'Filmer', :root_path

  skip_before_action :authenticate_user!

  def landing

    if user_signed_in?
      redirect_to films_url
    end

    render layout: 'transparent_header'

  end

  def about
    add_breadcrumb I18n.t('breadcrumbs.about'), :about_path
  end

end
