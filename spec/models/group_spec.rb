require 'spec_helper'

describe Group do
  context "behaviors" do

    before :each do 
      @group = create(:group)
    end
    it "has no students upon initialization" do 
      expect(@group.students.count).to eq(0)
    end 

    it "always has a teacher association" do 
      expect(@group.teacher).to be_a Teacher
    end
  end

  it "can have students" do 
    group = create(:full_class)
    expect(group.students.count).to eq(5)
    expect(group.students.first).to be_a Student
  end

  it "can have assignments" do 
    pending
  end

end
