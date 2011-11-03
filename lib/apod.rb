#!/usr/bin/env ruby
#
# Get links to NASA's Astronomy Pictures of the Day
#

require 'rubygems'
require 'open-uri'
require 'httpclient'
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

    def search(query)
        if query.size > 60
            return "ERROR: Query must be less than 60 characters"
        end
        @pictures = []
        clnt = HTTPClient.new("http://antwrp.gsfc.nasa.gov/cgi-bin/apod/apod_search")
        results = clnt.post('http://antwrp.gsfc.nasa.gov/cgi-bin/apod/apod_search', {'tquery' => query}).content
        doc = Hpricot(results)
        doc.search("//p").each do |para|
            title = para.at("a[2]")
            link = para.at("a")
            if title != nil and link != nil
                @pictures << Pic.new(title.innerHTML, link["href"])
            end
        end
        @pictures.pop
    end
end
