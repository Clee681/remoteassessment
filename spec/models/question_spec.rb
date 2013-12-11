require 'spec_helper'

describe Question do
  
  it "has content and correct answer" do
    question = Question.new(
      content: "What year was the Declaration of Independence signed?",
      correct_answer: "1776")

    expect(question).to be_valid
  end

  it "is invalid without content" do
    expect(Question.new(
      content: nil,
      correct_answer: "1776")).to have(2).errors_on(:content)
  end

  it "is invalid without a correct answer" do
    expect(Question.new(
      content: "What year was the Declaration of Independence signed?",
      correct_answer: nil)).to have(2).errors_on(:correct_answer)
  end

  it "has content within 1 to 160 characters" do
    expect(Question.new(
      content: "What year was the Declaration of Independence signed?What year was the Declaration of Independence signed?What year was the Declaration of Independence signed?????",
      correct_answer: "1776")).to have(1).errors_on(:content)
  end
  
  it "has a correct answer within 1 to 160 characters" do
    expect(Question.new(
      content: "What year was the Declaration of Independence signed?",
      correct_answer: "17761776177617761776177617761776177617761776177617761776177617761776177617761776177617761776177617761776177617761776177617761776177617761776177617761776177617761776")).to have(1).errors_on(:correct_answer)
  end

  context "behaviours" do
    it "belongs to an assignment"

    it "has many answers"
    
  end

end
