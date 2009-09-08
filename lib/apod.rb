#!/usr/bin/env ruby
#
# Get links to NASA's Astronomy Pictures of the Day
#

require 'rubygems'
require 'open-uri'
require 'hpricot'
require 'lib/pic'

class Apod
    attr_reader(:pictures)
    def initialize
        @pictures = []

        archive_doc = Hpricot(open("http://antwrp.gsfc.nasa.gov/apod/archivepix.html"))
        archive_doc.search("/body/b/a").each do |elem|
            @pictures << Pic.new(elem.innerHTML, "http://antwrp.gsfc.nasa.gov/apod/" + elem["href"])
        end
    end

    def titles
        @pictures.collect{ |pic| pic.title }
    end

    def download(index, save_path)
        doc = Hpricot(open(@pictures[index].website))
        link = "http://apod.nasa.gov/" + doc.at("//center/p[2]/a")["href"]

        url = URI.parse(link)

        url.open do |pic|
            File.open(save_path, "w") do |file|
                file << pic.read
            end
        end
    end
end
