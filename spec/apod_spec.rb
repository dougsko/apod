<<<<<<< HEAD
require 'spec_helper'

describe Apod do
    before(:each) do
        @apod = Apod.new
    end

    it 'has a version number' do
        expect(Apod::VERSION).not_to be nil
    end

=======
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Apod" do
    before do
        @apod = Apod.new
    end

>>>>>>> 7cb01caa087c8e6d3c4c1f81531fa922e27caef2
    it "starts things off" do
        @apod.pictures[0].website.should match(/html/)
    end

    it "should return an array of titles" do
        @apod.titles.class.to_s.should == "Array"
    end

    it "searches for a picture" do
        results = @apod.search("earth")
<<<<<<< HEAD
        results.first.class.to_s.should match(/Pic/)
=======
        results.class.to_s.should match(/Pic/)
>>>>>>> 7cb01caa087c8e6d3c4c1f81531fa922e27caef2
    end

    it "download the first picture" do
        @apod.pictures.first.download("/tmp/apod.jpg")
        `file /tmp/apod.jpg`.should match(/image data/)
        `rm /tmp/apod.jpg`
    end

    it "tries to search with a query that is too big" do
        @apod.search("A"*61).should match(/ERROR/)
    end

<<<<<<< HEAD
=======

>>>>>>> 7cb01caa087c8e6d3c4c1f81531fa922e27caef2
end
