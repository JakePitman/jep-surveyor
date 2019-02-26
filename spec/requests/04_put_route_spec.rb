require "spec_helper"

RSpec.describe "PUT /ratingQuestions/:id" do
  context "when the question exists" do
    it "returns a 200 OK" do
      json = {title: 'Hello World', tag: 'greetings'}.to_json
      post('/ratingQuestions', json, {'CONTENT_TYPE' => 'application/json'})
      put("/ratingQuestions/#{JSON.parse(last_response.body)["id"]}", {title: 'Hello Mars'}.to_json, {'CONTENT_TYPE' => 'application/json'})
      expect(last_response.status).to eq(200)
    end

    #it "changes just the title attribute" do
      #question = response.parse
      #expect(question.is_a?(Hash)).to eq(true)
      #expect(question["title"]).to eq("Hello Mars")
      #expect(question["tag"]).to eq("greetings")
    #end
  end

  context "asking to PUT a question that doesn't exist" do
    it "returns a 404 Not Found" do
      put("/ratingQuestions/i-will-never-exist")
      expect(last_response.status).to eq(404)
    end
  end
end
