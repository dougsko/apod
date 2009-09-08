require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Apod" do
    before do
        @apod = Apod.new
    end

    it "starts things off" do
        @apod.pictures[0].website.should match(/html/)
    end

    it "should return an array of titles" do
        @apod.titles.class.to_s.should == "Array"
    end

    it "should download today's pic" do
        @apod.download(0, "/tmp/apod.jpg")
        `file /tmp/apod.jpg`.should match(/image data/)
        `rm /tmp/apod.jpg`
    end

end
