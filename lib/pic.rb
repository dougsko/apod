#!/usr/bin/env ruby
#
# class to hold an entry's information
#

class Pic
    attr_reader(:title, :website)
             
    def initialize(title, website)
        @title = title
        @website = website
    end
end
