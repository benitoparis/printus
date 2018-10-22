class DownloadModelGigIntoCsv


  def self.fill_in_csv

    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"', encoding: "ISO8859-1" }

    #on le lit comme ça. le fichier est séparé par virgules, la séparation va se faire avec des guillemets et il s’agit de double quote.

    filepath    = './public/downloads/alldatas.csv'

    CSV.open(filepath, 'wb', csv_options) do |csv|

      @allgiginstances = Gig.all

        @allgiginstances.each do |item|

          #csv << [item.id, item.title, item.source]

           csv << [item.id, item.title, item.price, item.source, item.quantity_interne , item.quantity_edt, item.year, item.month]

        end

    end

  end
end
