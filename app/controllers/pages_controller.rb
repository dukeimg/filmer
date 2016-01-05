class PagesController < ApplicationController
  layout 'article'
  add_breadcrumb 'Filmer', :root_path

  skip_before_action :authenticate_user!

  def landing

    if user_signed_in?
      redirect_to dashboard_path
    else
      render layout: 'transparent_header'
    end

  end

  def about
    add_breadcrumb I18n.t('breadcrumbs.about'), :about_path
  end

  def dashboard
    render layout: 'fixed_drawer'
  end

end
