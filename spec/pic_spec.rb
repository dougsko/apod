<<<<<<< HEAD
describe Pic do
=======
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Pic" do
>>>>>>> 7cb01caa087c8e6d3c4c1f81531fa922e27caef2
    it "makes sure Pic.title works right" do
        pic = Pic.new("title", "link")
        pic.title.should == "title"
    end

    it "makes sure Pic.website works right" do
        pic = Pic.new("title", "link")
        pic.website.should == "link"
    end
end
