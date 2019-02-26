require "spec_helper"

RSpec.describe "PATCH /ratingQuestions/:id" do
  context "when the question exists" do
    before(:each) do
      json = { title: 'Hello World' }.to_json
      post("/ratingQuestions", json, { 'CONTENT_TYPE' => 'application/json' })
      patch("/ratingQuestions/#{JSON.parse(last_response.body)["id"]}", { extra_field: 'Hello Mars' }.to_json, { 'CONTENT_TYPE' => 'application/json' })
    end

    it "returns a 200 OK" do
      expect(last_response.status).to eq(200)
    end

    it "returns a question -- with an additional field" do
      question = JSON.parse(last_response.body)
      expect(question.is_a?(Hash)).to eq(true)
      expect(question["title"]).to eq("Hello World")
      expect(question["extra_field"]).to eq("Hello Mars")
    end
  end

  context "asking to get a question that doesn't exist" do
    it "returns a 404 Not Found" do
      patch('/ratingQuestions/i-will-never-exist')
      expect(last_response.status).to eq(404)
    end
  end
end
