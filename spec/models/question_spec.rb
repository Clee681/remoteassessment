require 'spec_helper'

describe Question do

  context "associations" do 
    before :each do 
      @q = create(:question)
    end

    it "has choices" do 
      expect(@q.choices.first).to be_a Choice
      expect(@q.choices.count).to eq 4
    end

    it "has one single correct answer" do 
      correct = @q.choices.select(&:correctness)
      expect(correct.count).to eq(1)
    end

    it "belongs to an assignment" do 
      expect(@q.assignment).to be_an Assignment
    end

  end

  it "has answers submitted by students" do 
    pending
  end

end
