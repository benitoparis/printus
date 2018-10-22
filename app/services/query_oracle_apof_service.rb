require 'oci8'


class QueryOracleApofService

def self.query(year,month)

        tab =[]
        oci = OCI8.new('APOF_USER1','APOF_USER1','lhbddapof1d2.m6:1521/APOFSNAP')
        oci.exec('SELECT * FROM v_AV_600_invoices') do |record|
            if record.join(',').split(",").first.include?("0.#{year}e4") && record.join(',').split(",")[1].include?("#{month}")
                2.upto(7) do |i|
                 tab <<  record.join(',').split(",")[i].gsub(/e3/,"").gsub(/e1/,"").gsub(/e4/,"").gsub(/e5/,"").gsub(/e6/,"").gsub(/e2/,"").gsub("0.","")
               end

               puts record.join(',')
            end
        end
        puts tab
end
end
