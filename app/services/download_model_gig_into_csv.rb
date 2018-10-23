class DownloadModelGigIntoCsv
  def self.fill_in_csv

    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"', encoding: "ISO8859-1" }

    #on définit l'emplacement du fichier CSV ou sera enregistré tout l'historique des données.
    filepath    = MyConstant::DOWNLOADALLDATAFILE

    CSV.open(filepath, 'wb', csv_options) do |csv|

      @allgiginstances = Gig.all

        @allgiginstances.each do |item|
          csv << [item.title, item.price, item.source, item.year, item.month, item.quantity_interne, item.quantity_edt]
        end
    end
  end
end
