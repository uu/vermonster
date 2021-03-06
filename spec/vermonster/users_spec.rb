require "spec_helper"

describe Vermonster::Users do
  before do
    VCR.insert_cassette 'users', :record => :new_episodes
  end

  before(:each) do
    oauth!
  end

  describe "#me" do
    before do
      @moi = @cheddar.me
    end

    it "should be an instance of Vermonster::Users::User" do
      @moi.should be_an_instance_of Vermonster::Users::User
    end

    it "should return the correct information" do
      @moi["username"].should == "vermonster"
      @moi["has_plus"].should be_false
    end
  end

  describe "#users" do
    describe "#me" do
      before do
        @moi = @cheddar.users.me
      end

      it "should be an instance of Vermonster::Users::User" do
        @moi.should be_an_instance_of Vermonster::Users::User
      end

      it "should return the correct information" do
        @moi["username"].should == "vermonster"
        @moi["has_plus"].should be_false
      end
    end
  end

  describe "::User" do
    describe "#initalize" do
      before do
        @moi = @cheddar.me
      end

      it "should return the same information from generated instance variables as key-value request" do
        @moi["username"].should == @moi.username
      end
    end
  end

  after do
    VCR.eject_cassette
  end
end