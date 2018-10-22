#require_relative '../services/parse_xls_edt_service'

class GigController < ApplicationController
  before_action :authenticate_user!

  def index

    @gigs = Gig.where(nil) # creates an anonymous scope
    @gigs = @gigs.year(params[:year]) if params[:year].present?
    @gigs = @gigs.month(params[:month]) if params[:month].present?

    @gigssorted = @gigs.sort_by do |item|
      item.id
    end

    @month = params[:month] if params[:month].present?
    @year = params[:year] if params[:year].present?
    @years_array = Gig.select(:year).distinct.order(year: :desc)
    @sommeinterne = Gig.where(year:params[:year], month: params[:month]).sum(:quantity_interne)
    @sommeedt = Gig.where(year:params[:year], month: params[:month]).sum(:quantity_edt)

    @stats_overview = Gig.find_by_sql("SELECT
    title,
    SUM(quantity_interne) AS total_estimated_quantity,
    SUM(quantity_edt) AS total_billed_quantity,
    (SUM(quantity_interne) - SUM(quantity_edt)) AS delta
    FROM gigs WHERE year = @year  GROUP BY title ORDER BY title")

   @stats_year = Gig.find_by_sql("SELECT

    SUM(quantity_interne) AS total_estimated_quantity,
    SUM(quantity_edt) AS total_billed_quantity,
    (SUM(quantity_interne) - SUM(quantity_edt)) AS delta
    FROM gigs WHERE year = @year")



=begin      @stats_per_month = Gig.select("
      title,
      month,
      SUM(quantity_interne) AS total_estimated_quantity,
      SUM(quantity_edt) AS total_billed_quantity,
      (SUM(quantity_interne) - SUM(quantity_edt)) AS delta"
    ).group("month, title").order(:month, :title).group_by(&:month)
=end

  end

  def show
  end

  def retrieve_new_monthly_datas

    month = params[:month]
    year = params[:year]


    #on met à jour le model gig avec la nouvelle facture EDT pour un mois donné
    Parse_xls_Edt_Service.parse_and_insert(year.to_i,month.to_i)

   # on va chercher les datas sur le tableau de edt
    # itemsedt = ParsexlsEdtService.parse_and_insert

    # itemsedt.each do |item|
    # @gig = Gig.new(title: item[:title], price: 0, source: 0, year: year, month: month, quantity_interne: 0, quantity_edt: item[:value])
    #  @gig.save!
    # end

    #on va chercher les datas sur les tableaux cecurity pour un mois donné et on update le model gig
    arrayitems = MatchFilesCecurityService.match(year.to_i, month.to_i)

    #arrayitems.each do |item|
     # @selectedgig = Gig.where("title LIKE :query AND year = :year AND month = :month", query: "%#{item[:title]}%", year: year, month: month)
      #@selectedgig.update(quantity_interne: item[:value])
    #end

    #UpdateInvoiceDeliveryOptions.update(year.to_i, month.to_i)

    #On met à jour le CSV de données globale
    DownloadModelGigIntoCsv.fill_in_csv

    # on redirige vers cette même page
    redirect_to gig_index_path
  end


  def create
  end



  def edit
  end

  def self.update(year, month)
   #arrayitems = MatchFilesCecurityService.match(year, month)
    #puts 'waaaaooo'
    #puts arrayitems
    #puts 'waaaaooo2'

    #arrayitems.each do |item|
     #   @selectedgig = Gig.where("title LIKE :query AND year = :year AND month = :month", query: "%#{item[:title]}%", year: year, month: month)
     #   @selectedgig.update(quantity_interne: item[:value])
    #end


    #itemsedt = ParsexlsEdtService.parse
    #itemsedt.each do |item|
     #   @selectedg = Gig.where("title LIKE :query AND year = :year AND month = :month", query: "%#{item[:title]}%", year: year, month: month)
     #   @selectedg.update(quantity_edt: item[:value])
    #end
  end

  def self.retrieve_history_data_from_2012
    results = ParsexlsHistoryService.parse
    results.each do |item|
      @gig = Gig.new(title: item[0], price: item[1], source: item[2], year: item[3], month: item[4], quantity_interne:item[5], quantity_edt:item[6])
      @gig.save!
    end
    redirect_to gig_index_path
  end


  def self.fill_in_csv_with_displayed_gigs
    DownloadModelGigIntoCsv.fill_in_csv
  end


end
