require "spec_helper"

RSpec.describe Dadaist::Story do
  context "with a single static template" do
    let(:templates) { ["This is a simple static template"] }
    subject(:story) { Dadaist::Story.new(templates) }

    it "returns the static story" do
      expect(story.generate).to eq("This is a simple static template")
    end
  end

  context "with a template with embedded ruby" do
    let(:templates) { ["This is a dynamic template: <%= 2 + 2 %>"] }
    subject(:story) { Dadaist::Story.new(templates) }

    it "successfully renders the dynamic story" do
      expect(story.generate).to eq("This is a dynamic template: 4")
    end
  end

  context "with a sources directory and JSON template file with one dynamic element" do
    let(:templates) { JSON.parse(File.read('spec/fixtures/test-single.json')) }
    subject(:story) { Dadaist::Story.new(templates, 'spec/fixtures') }

    it "successfully renders the story" do
      expect(story.generate).to eq("I want to insert a person's name: Borges")
    end
  end

  context "with a sources directory and JSON template file with multiple dynamic elements" do
    let(:templates) { JSON.parse(File.read('spec/fixtures/test-multiple.json')) }
    subject(:story) { Dadaist::Story.new(templates, 'spec/fixtures') }

    it "successfully renders the story" do
      expect(story.generate).to eq("Borges lived in Argentina which is in South America")
    end
  end


end
