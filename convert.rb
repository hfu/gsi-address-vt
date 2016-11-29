require 'find'
require 'json'
require 'csv'

File.open('data.ndjson', 'w') {|w|
  Find.find('cache') {|path|
    next unless path.end_with?('.csv')
    p path
    CSV.foreach(path, encoding: "Shift_JIS:UTF-8") {|r|
      o = {:type => :Feature, :geometry => {:type => :Point}}
      o[:geometry][:coordinates] = r[6..7].map{|v| v.to_f}
      o[:properties] = {
        :city => r[0].to_i, :aza => r[1], :azac => r[4].split('/')[5],
        :gaiku => r[2], :kiso => r[3], :scale => r[8].to_i
      }
      [w].each {|s| s.print JSON::dump(o), "\n"}
    }
  }
}
