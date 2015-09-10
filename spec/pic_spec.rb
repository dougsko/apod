describe Pic do
    it "makes sure Pic.title works right" do
        pic = Pic.new("title", "link")
        pic.title.should == "title"
    end

    it "makes sure Pic.website works right" do
        pic = Pic.new("title", "link")
        pic.website.should == "link"
    end
end
