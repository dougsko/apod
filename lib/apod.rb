<<<<<<< HEAD
require "apod/version"
require_relative 'pic'
require 'nokogiri'
require 'httpclient'

#module Apod
#  # Your code goes here...
#end


class Apod
    attr_reader(:pictures)

    def initialize
        @pictures = []

        page = Nokogiri::HTML(open("http://apod.nasa.gov/apod/archivepix.html"))
        pics = page.css('b a')
        pics.each do |pic|
            @pictures << Pic.new(pic.text, "http://apod.nasa.gov/apod/" + pic["href"])
=======
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
>>>>>>> 7cb01caa087c8e6d3c4c1f81531fa922e27caef2
        end
    end

    def titles
        @pictures.collect{ |pic| pic.title }
    end

    def search(query)
<<<<<<< HEAD
        @pictures = []

        if query.size > 60
            return "ERROR: Query must be less than 60 characters"
        end

        clnt = HTTPClient.new("http://apod.nasa.gov/cgi-bin/apod/apod_search")
        res = clnt.post('http://apod.nasa.gov/cgi-bin/apod/apod_search', {'tquery' => query}).content
        page = Nokogiri::HTML(res)
        page.css('body > p > a:nth-child(2)').each do |elem|
            @pictures << Pic.new(elem.text, elem["href"])
        end
        @pictures
=======
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
>>>>>>> 7cb01caa087c8e6d3c4c1f81531fa922e27caef2
    end
end
