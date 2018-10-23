class QueryOracleApofService

  def self.query(year,month)

    tab =[]
    oci = OCI8.new(ENV[USERDB],ENV[PSWDB],ENV[HOSTPORTDBNAME])
    oci.exec('SELECT * FROM #{ENV[TABLENAME]}') do |record|
        if record.join(',').split(",").first.include?("0.#{year}e4") && record.join(',').split(",")[1].include?("#{month}")
            2.upto(7) do |i|
             tab <<  record.join(',').split(",")[i].gsub(/e3/,"").gsub(/e1/,"").gsub(/e4/,"").gsub(/e5/,"").gsub(/e6/,"").gsub(/e2/,"").gsub("0.","")
           end

           puts record.join(',')
        end
    end

    gig1 = tab[0] #1 - Archives uniquement
    gig2 = tab[1] #2 - Original PFP vers Annonceur avec archivage
    gig3 = tab[2] #3 - Original PDF vers Editique avec archivage
    gig4 = tab[3] #4 - Copie PFP vers Agence sans archivage
    gig5 = tab[4] #5 - Copie PDF vers Editique sans archivage
    gig6 = tab[5] #6 - Copie PDF vers Agence sans archivage"



    items = []

    items << { title: "#1 ", value: gig1 }
    items << { title: "#2 ", value: gig2 }
    items << { title: "#3 ", value: gig3 }
    items << { title: "#4 ", value: gig4 }
    items << { title: "#5 ", value: gig5 }
    items << { title: "#6 ", value: gig6 }



    items.each do |item|
      @gigstoupdate = Gig.where("title LIKE :query AND year = :year AND month = :monthtoupdate", query: "%#{item[:title]}%", year: year.to_i, monthtoupdate: month.to_i)
      @gigstoupdate.update(quantity_interne:item[:value])
    end

  end
end
