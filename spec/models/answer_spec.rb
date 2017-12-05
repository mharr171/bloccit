require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:question) { Question.create!(title: "New Question", body: "New Question Body", resolved: false) }
  let(:answer) { Answer.create!(body: 'Comment Body', question: question)}

  describe "attributes" do
    it "has title, body, and resolved attributes" do
      expect(answer).to have_attributes(body: 'Comment Body', question: question)
    end
  end
end
