class Parse_csv_Cecurity_Service


  def self.parse_and_update(array_ressource, year, month)

    items = []

    item7 = []
    item8 = []
    item9 = []
    item10 = []
    item11 = []
    item12 = []
    item13 = []
    item14 = []
    item15 = []
    item16 = []
    item17 = []

    array_ressource.each do |ressource|

      num_rows = 0
      plisAutomatiques = []
      pagesAutomatiques = []
      plisManuels = []
      plisManuels6a100f = []
      pagesManuelles = []
      pagesManuellesC4S100f = []
      nbC545f =[]

      myurl= "./public/uploads/cecurity/"+ressource+".csv"

    CSV.foreach(myurl, encoding: 'iso-8859-1:utf-8') do |row|

      ligne = row[0].split(";")

      if ligne[0] == "C6 : 1 à 3f" || ligne[0] == "C5 : 4 à 5f"
        plisAutomatiques << ligne[1].to_i
      end

      if ligne[0] == "C6 : 1 à 3f" || ligne[0] == "C5 : 4 à 5f"
        pagesAutomatiques << ligne[2].to_i
      end

      if ligne[0] == "C4 : 6 à 100f" || ligne[0] == "C4S : +100f"
        plisManuels << ligne[1].to_i
      end

      if ligne[0] == "C4 : 6 à 100f" || ligne[0] == "C4S : +100f"
        pagesManuelles << ligne[2].to_i
      end

      if ligne[0] == "C4 : 6 à 100f"
        plisManuels6a100f << ligne[1].to_i
      end

      if ligne[0] == "C4S : +100f"
        pagesManuellesC4S100f << ligne[1].to_i
      end

      if ligne[0] == "C5 : 4 à 5f"
        nbC545f << 1
      end


    end

      item7 << pagesAutomatiques.sum + pagesManuelles.sum
      item8 << nbC545f.sum
      item9 << (pagesAutomatiques.sum + pagesManuelles.sum) / 2
      item10 << pagesAutomatiques.sum + pagesManuelles.sum
      item11 << plisAutomatiques.sum
      item12 << plisAutomatiques.sum
      item13 << pagesAutomatiques.sum - plisAutomatiques.sum
      item14 << plisManuels6a100f.sum
      item15 << plisManuels6a100f.sum
      item16 << pagesManuellesC4S100f.sum
      item17 << pagesManuellesC4S100f.sum



    end


      puts "item7 #{item7.sum}"
      puts "item8 #{item8.sum / (12 + 1) + 1}" #En fait nous payons un forfait mensuel qui couvre jusqu’à 12 envois
      puts "item9 #{item9.sum}"
      puts "item10 #{item10.sum}"
      puts "item11 #{item11.sum}"
      puts "item12 #{item12.sum}"
      puts "item13 #{item13.sum}"
      puts "item14 #{item14.sum}"
      puts "item15 #{item15.sum}"
      puts "item16 #{item16.sum}"
      puts "item17 #{item17.sum}"

      items << { title: "#7 ", value: item7.sum }
      items << { title: "#8 ", value: item8.sum / (12 + 1) +1 }
      items << { title: "#9 ", value: item9.sum }
      items << { title: "#10 ", value: item10.sum }
      items << { title: "#11 ", value: item11.sum }
      items << { title: "#12 ", value: item12.sum }
      items << { title: "#13 ", value: item13.sum }
      items << { title: "#14 ", value: item14.sum }
      items << { title: "#15 ", value: item15.sum }
      items << { title: "#16 ", value: item16.sum }
      items << { title: "#17 ", value: item17.sum }



      items.each do |item|

        @selectedgig = Gig.where("title LIKE :query AND year = :year AND month = :monthupdate", query: "%#{item[:title]}%", year: year.to_i, monthupdate: month.to_i)
        @selectedgig.update(quantity_interne: item[:value])
      end


  end
end
