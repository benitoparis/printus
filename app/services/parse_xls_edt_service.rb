class Parse_xls_Edt_Service

  def self.parse_and_insert(year, month)



    case month
      when 1, 2, 3
        quarter = "T1"
      when 4, 5, 6
        quarter = "T2"
      when 7, 8, 9
        quarter = "T3"
      when 10, 11, 12
        quarter = "T4"
      else
        # no-op
    end

    case month
      when 1
        month_letter = "Janvier"
      when 2
        month_letter = "Février"
      when 3
        month_letter = "Mars"
      when 4
        month_letter = "Avril"
      when 5
        month_letter = "Mai"
      when 6
        month_letter = "Juin"
      when 7
        month_letter = "Juillet"
      when 8
        month_letter = "Aout"
      when 9
        month_letter = "Septembre"
      when 10
        month_letter = "Octobre"
      when 11
        month_letter = "Novembre"
      when 12
        month_letter = "Décembre"
      else
        # no-op
    end

#ici on va chercher le dernier fichier déposé sur le dossier
dir = Dir.glob('./public/uploads/edt/*').sort_by { |f| File.mtime(f) }
puts "good #{dir.last}"


    items_edt = []
    items_cecurity =[]

#on va utiliser le dernier fichier déposé, l'ouvrir puis le parser.
    xlsx = Roo::Spreadsheet.open("#{dir.last}")
    xlsx = Roo::Excelx.new("#{dir.last}")

    #xlsx = Roo::Spreadsheet.open('./public/uploads/edt/Stat M6 T2 2018 .xlsx')
    #xlsx = Roo::Excelx.new('./public/uploads/edt/Stat M6 T2 2018 .xlsx')


    case month_letter
      when xlsx.excelx_value(3, 6)
        coltab = 6

      when xlsx.excelx_value(3, 7)
        coltab = 7

      when xlsx.excelx_value(3, 8)
        coltab =8

      when xlsx.excelx_value(3, 10)
        coltab = 10

      when xlsx.excelx_value(3, 11)
        coltab = 11

      when xlsx.excelx_value(3, 12)
        coltab = 12

      when xlsx.excelx_value(3, 14)
        coltab = 14

      when xlsx.excelx_value(3, 15)
        coltab = 15

      when xlsx.excelx_value(3, 16)
        coltab = 16

      when xlsx.excelx_value(3, 18)
        coltab = 18

      when xlsx.excelx_value(3, 19)
        coltab = 19

      when xlsx.excelx_value(3, 20)
        coltab = 20

      else
        # no-op
    end



      items_edt << {title: "#1 - Archives uniquement", value: xlsx.excelx_value(5, coltab)  == nil ? 0 : xlsx.excelx_value(5, coltab) }
      items_edt << {title: "#2 - Original PFP vers Annonceur avec archivage", value: xlsx.excelx_value(7, coltab) == nil ? 0 : xlsx.excelx_value(7, coltab) }
      items_edt << {title: "#3 - Original PDF vers Editique avec archivage", value: xlsx.excelx_value(9, coltab) == nil ? 0 : xlsx.excelx_value(9, coltab) }
      items_edt << {title: "#4 - Copie PFP vers Agence sans archivage", value: xlsx.excelx_value(11, coltab) == nil ? 0 : xlsx.excelx_value(11, coltab) }
      items_edt << {title: "#5 - Copie PDF vers Editique sans archivage", value: xlsx.excelx_value(13, coltab) == nil ? 0 : xlsx.excelx_value(13, coltab) }
      items_edt << {title: "#6 - Copie PDF vers Agence sans archivage", value: xlsx.excelx_value(15, coltab) == nil ? 0 : xlsx.excelx_value(15, coltab) }
      items_edt << {title: "#7 - Composition  & Personnalisation N&B", value: xlsx.excelx_value(17, coltab) == nil ? 0 : xlsx.excelx_value(17, coltab) }
      items_edt << {title: "#8 - Traitement forfait (prise en charge Laser) 12 envois", value: xlsx.excelx_value(19, coltab) == nil ? 0 : xlsx.excelx_value(19, coltab) }
      items_edt << {title: "#9 - Papier Blanc 80 gr", value: xlsx.excelx_value(21,coltab) == nil ? 0 : xlsx.excelx_value(21, coltab) }
      items_edt << {title: "#10 - Traitement/Tri Regroupement", value: xlsx.excelx_value(23, coltab) == nil ? 0 : xlsx.excelx_value(23, coltab) }
      items_edt << {title: "#11 - Fournitures C5 mécanisable-fenêtres", value: xlsx.excelx_value(25, coltab) == nil ? 0 : xlsx.excelx_value(25, coltab) }
      items_edt << {title: "#12 - 1er pli C5 mécanisable-fenêtres", value: xlsx.excelx_value(27, coltab) == nil ? 0 : xlsx.excelx_value(27, coltab) }
      items_edt << {title: "#13 - Plis >1 C5 mécanisable-fenêtres", value: xlsx.excelx_value(29, coltab) == nil ? 0 : xlsx.excelx_value(29, coltab) }
      items_edt << {title: "#14 - Fourniture C4 à fenêtres", value: xlsx.excelx_value(31, coltab) == nil ? 0 : xlsx.excelx_value(31, coltab) }
      items_edt << {title: "#15 - Pli manuel C4 à fenêtres", value: xlsx.excelx_value(33, coltab) == nil ? 0 : xlsx.excelx_value(33, coltab) }
      items_edt << {title: "#16 - Fourniture C4 à soufflet avec imp.adresse", value: xlsx.excelx_value(35,coltab) == nil ? 0 : xlsx.excelx_value(35, coltab) }
      items_edt << {title: "#17 - Pli manuel C4 à soufflet", value: xlsx.excelx_value(37, coltab) == nil ? 0 : xlsx.excelx_value(37, coltab) }
      items_edt << {title: "#18 - Timbres", value: xlsx.excelx_value(39, coltab) == nil ? 0 : xlsx.excelx_value(39, coltab) }
      items_edt << {title: "#19 - Dépôt La Poste", value: xlsx.excelx_value(40, coltab) == nil ? 0 : xlsx.excelx_value(40, coltab) }
      items_edt << {title: "#20 - Gestion des PND", value: xlsx.excelx_value(42, coltab) == nil ? 0 : xlsx.excelx_value(42, coltab) }
      items_edt << {title: "#21 - Livraison par coursier intramuros", value: xlsx.excelx_value(44, coltab) == nil ? 0 : xlsx.excelx_value(44, coltab) }
      items_edt << {title: "#22 - Livraison par coursier 77a-78a-91a-95a", value: xlsx.excelx_value(46, coltab) == nil ? 0 : xlsx.excelx_value(46, coltab) }
      items_edt << {title: "#23 - Livraison par coursier 77b-78b-91b-95b", value: xlsx.excelx_value(48, coltab) == nil ? 0 : xlsx.excelx_value(48, coltab) }
      items_edt << {title: "#24 - Livraison par coursier 92-93-94", value: xlsx.excelx_value(50, coltab) == nil ? 0 : xlsx.excelx_value(50, coltab) }
      items_edt << {title: "#26 - Logistique courrier industriel (par enveloppe)", value: xlsx.excelx_value(52, coltab) == nil ? 0 : xlsx.excelx_value(52, coltab) }





      items_cecurity << {title: "#18 ", value: xlsx.excelx_value(39, coltab) == nil ? 0 : xlsx.excelx_value(39, coltab) }
      items_cecurity << {title: "#19 ", value: xlsx.excelx_value(40, coltab) == nil ? 0 : xlsx.excelx_value(40, coltab) }
      items_cecurity << {title: "#20 ", value: xlsx.excelx_value(42, coltab) == nil ? 0 : xlsx.excelx_value(42, coltab) }
      items_cecurity << {title: "#21 ", value: xlsx.excelx_value(44, coltab) == nil ? 0 : xlsx.excelx_value(44, coltab) }
      items_cecurity << {title: "#22 ", value: xlsx.excelx_value(46, coltab) == nil ? 0 : xlsx.excelx_value(46, coltab) }
      items_cecurity << {title: "#23 ", value: xlsx.excelx_value(48, coltab) == nil ? 0 : xlsx.excelx_value(48, coltab) }
      items_cecurity << {title: "#24 ", value: xlsx.excelx_value(50, coltab) == nil ? 0 : xlsx.excelx_value(50, coltab) }
      items_cecurity << {title: "#26 ", value: xlsx.excelx_value(52, coltab) == nil ? 0 : xlsx.excelx_value(52, coltab) }



    #on itère sur le tableau ditem et on insert les nouvelles prestations dans le model gig
    items_edt.each do |item|
      @gig = Gig.new(title: item[:title], price: 0, source: 0, year: year, month: month, quantity_interne: 0, quantity_edt: item[:value])
      @gig.save!
      end

    #on copie les valeurs de edt pour l'année y et le mois m depuis les chiffres d'edt pour les item 18 à 26 sur la colonne quantité interne
    items_cecurity.each do |item|

      @selectedgig = Gig.where("title LIKE :query AND year = :year AND month = :monthupdate", query: "%#{item[:title]}%", year: year.to_i, monthupdate: month.to_i)
      @selectedgig.update(quantity_interne: item[:value])
      end

  end
end


=begin
class ParsexlsEdtService

  def self.parse


    workbook = Roo::Spreadsheet.open('./public/uploads/edt/Stat M6 T2 2018 .xlsx')
    worksheets = workbook.sheets
    puts "Found #{worksheets.count} worksheets"

    worksheets.each do |worksheet|
      puts "Reading: #{worksheet}"
      num_rows = 0
      workbook.sheet(worksheet).each_row_streaming do |row|
        row_cells = row.map { |cell| cell.value }
        num_rows += 1

        if num_rows > 3 && num_rows <= 17 && !num_rows.even?
          puts " #{row_cells},  Avril: #{row[0]}"
        end

      end
      puts "Read #{num_rows} rows"
    end
  end
end
=end
