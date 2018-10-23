class ParsexlsHistoryService

  #def self.initialize(foo)
   # @foo = foo
  #end

  def self.parse
    tab = []
    workbook = Roo::Spreadsheet.open MyConstant::HISTORYFOLDER #'./public/uploads/history/history-invoice.xlsx'
    worksheets = workbook.sheets
    puts "Found #{worksheets.count} worksheets"

    worksheets.each do |worksheet|
      puts "Reading: #{worksheet}"
      num_rows = 0
      workbook.sheet(worksheet).each_row_streaming do |row|

      if(num_rows>0) #skipping header
      temp = []
      row_cells = row.map { |cell| cell.value}


        if worksheet == "2018"  || worksheet == "2017" || worksheet == "2016" || worksheet == "2015" || worksheet == "2014" || worksheet == "2013" || worksheet == "2012"

           puts "c'est la #{row_cells[0]}"
            temp << row_cells[0]
            temp << row_cells[1]
            temp << row_cells[2]
            temp << row_cells[3]
            temp << row_cells[4]
            temp << row_cells[5]
            temp << row_cells[6]

          tab << temp
        end
      end

      num_rows += 1

      end
      puts "Read #{num_rows} rows"
    end

    tab.each do |item|
      @gig = Gig.new(title: item[0], price: item[1], source: item[2], year: item[3], month: item[4], quantity_interne:item[5], quantity_edt:item[6])
      @gig.save!
    end


  end
end
