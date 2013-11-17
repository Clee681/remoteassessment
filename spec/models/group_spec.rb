require 'spec_helper'

describe Group do
  context "behaviors" do

    before :each do 
      @g = create(:group)
    end
    it "has no students upon initialization" do 
      expect(@g.students.count).to eq(0)
    end 

    it "always has a teacher association" do 
      expect(@g.teacher).to be_a Teacher
    end
  end

  it "can have students" do 
    g = create(:full_class)
    expect(g.students.count).to eq(5)
    expect(g.students.first).to be_a Student
  end

  it "can have assignments" do 
    pending
  end

end
