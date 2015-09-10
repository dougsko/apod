#!/usr/bin/env ruby
#
# Class to hold an entry's information
#

class Pic
    attr_reader(:title, :website)
             
    # Takes two strings, the title of the picture and the URL to its
    # website.
    def initialize(title, website)
        @title = title
        @website = website
    end

    # Download a picture to a file
    def download(save_path)
        page = Nokogiri::HTML(open(self.website))
        link = "http://apod.nasa.gov/" + page.css('body > center:nth-child(1) > p:nth-child(3) > a')[0]['href']
        url = URI.parse(link)
        url.open do |pic|
            File.open(save_path, "w") do |file|
                file << pic.read
            end
        end
    end
end
