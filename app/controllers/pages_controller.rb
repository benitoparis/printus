class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :main

  def uploadfiles
    @month = params[:month]
    @year = params[:year]

  end

  def tutoriel
  end

  def traitement
  end

  def upload

    filececurity = params[:filececurity]
    fileedt = params[:fileedt]
    @month = params[:month]
    @year = params[:year]

    Gig.where(month: @month, year: @year).destroy_all


  filececurity.each do |item|
    File.open(Rails.root.join('public', 'uploads' ,'cecurity', item.original_filename), 'wb') do |file|
      file.write(item.read)
    end
  end

    File.open(Rails.root.join('public', 'uploads' , 'edt', fileedt.original_filename), 'wb') do |file|
     file.write(fileedt.read)
    end

    #render plain: "Upload effectué"
    redirect_to uploadfiles_path(month:@month, year:@year)
  end

  def main
  end

end
