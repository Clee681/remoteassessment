require 'spec_helper'

describe Student do
  
  describe "incomplete assignments" do
    before :each do
      @teacher = Teacher.create(
        email: "john.doe@test.com",
        password: "password",
        name: "John Doe",
        phone_number: "2139862443")

      @student = Student.create(
        name: "Christopher Lee",
        phone_number: "2132158528")

      @assignment = Assignment.create(
        name: "History 101",
        description: "Please read your history book.")

      @student.student_assignments.create(assignment: @assignment)
    end

    it "returns an array of StudentAssignment objects" do
      expect(@student.incomplete_assignments(@teacher.id).first).to be_a StudentAssignment
    end

    
  end

end
