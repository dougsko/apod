require "apod/version"
require_relative 'pic'
require 'nokogiri'
require 'httpclient'

class Apod
    attr_reader(:pictures)

    def initialize
        @pictures = []

        page = Nokogiri::HTML(open("http://apod.nasa.gov/apod/archivepix.html"))
        pics = page.css('b a')
        pics.each do |pic|
            @pictures << Pic.new(pic.text, "http://apod.nasa.gov/apod/" + pic["href"])
        end
    end

    def titles
        @pictures.collect{ |pic| pic.title }
    end

    def search(query)
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
    end
end
