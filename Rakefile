task :default do
  sh "ruby convert.rb"
  sh "../tippecanoe/tippecanoe -P -f -o data.mbtiles --layer=gsi-address data.ndjson"
  sh "mbview data.mbtiles"
end

