class UpdateInvoiceDeliveryOptions
def self.update(year,month)


case month
  when 1
    month = "01"
  when 2
    month = "02"
  when 3
    month = "03"
  when 4
    month = "04"
  when 5
    month = "05"
  when 6
    month = "06"
  when 7
    month = "07"
  when 8
    month = "08"
  when 9
    month = "09"
  else
    # no-op
end

gig1 = 288 #1 - Archives uniquement
gig2 = 552 #2 - Original PFP vers Annonceur avec archivage
gig3 = 557 #3 - Original PDF vers Editique avec archivage
gig4 = 88 #4 - Copie PFP vers Agence sans archivage
gig5 = 1502 #5 - Copie PDF vers Editique sans archivage
gig6 = 105 #6 - Copie PDF vers Agence sans archivage"



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
