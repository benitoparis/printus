class ParseXlsxGrilleTarif

  def self.parse

    #ici on va chercher le dernier fichier déposé sur le dossier
    dir = Dir.glob('./public/uploads/grilletarifaire/*').sort_by { |f| File.mtime(f) }
    puts "good #{dir.last}"


        items_price = []


    #on va utiliser le dernier fichier déposé, l'ouvrir puis le parser.
        xlsx = Roo::Spreadsheet.open("#{dir.last}")
        xlsx = Roo::Excelx.new("#{dir.last}")


    (2).upto(26) do |n|
    items_price << xlsx.excelx_value(n, 3)
    end

    return items_price

  end

end
