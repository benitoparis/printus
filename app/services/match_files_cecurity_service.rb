class MatchFilesCecurityService

  def self.match(year, month)
    tabressource = []

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


    ressource = "EDT-M6_Détail_Quantités_#{year}-#{month}-"


    Dir.glob('./public/uploads/cecurity/*.csv').each do |filename|
      name = File.basename(filename, '.csv')

    if (match = /^#{ressource}\w/.match(name))

        tabressource << name
      else
        puts "nok"
      end
    end


    Parse_csv_Cecurity_Service.parse_and_update(tabressource, year, month)

  end
end

=begin
class MatchFilesCecurityService
  def self.match(year, month)
    tabressource = []
    puts "#{year}, #{month}"

    ressource = "EDT-M6_Détail_Quantités_"+year+month"-02-"

    Dir.glob('./public/uploads/cecurity/*.csv').each do |filename|
      name = File.basename(filename, '.csv')

    if (match = /^EDT-M6_Détail_Quantités_2018-02-\w/.match(name))
        puts "#{name}"
        tabressource << name
      else
        puts "nok"
      end
    end

    ParsecsvCecurityService::launchparsing(tabressource)
  end

end
=end

