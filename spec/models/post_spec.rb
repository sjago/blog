require 'rails_helper'

describe Post do

  describe '#calculate_slug' do
      let(:post) { Post.new(title: title) }

    context "when the title is a single lower case word" do
      let(:title) { 'title'}

      it "returns the title" do
        expect(post.calculate_slug).to eq('title')
      end
    end

    context "when the title is capitalized" do
      let(:title) { 'Title'}

      it "returns the downcase" do
        expect(post.calculate_slug).to eq('title')
      end
    end

    context "when the title has blank spaces" do
      let(:title) { 'test title'}

      it "replaces them with underscores" do
        expect(post.calculate_slug).to eq('test_title')
      end
    end

    context "when the title has ." do
      let(:title) { 'A title.amazing'}

      it "replaces them with underscores" do
        expect(post.calculate_slug).to eq('a_title_amazing')
      end
    end

    context 'when the title has :' do
      let(:title) { 'A title:amazing'}

      it "replaces them with underscores" do
        expect(post.calculate_slug).to eq('a_title_amazing')
      end
    end

    context 'when the title has -' do
      let(:title) { 'A title-amazing'}

      it "replaces them with underscores" do
        expect(post.calculate_slug).to eq('a_title_amazing')
      end
    end

    context 'when the title has multiple capitalized word' do
      let(:title) { 'A Title Amazing'}

      it "downsizes the words" do
        expect(post.calculate_slug).to eq('a_title_amazing')
      end
    end

    context 'when the title has irregular characters' do
      let(:title) { 'A Title@?$%&^*! amazing'}

      it "removes the characters" do
        expect(post.calculate_slug).to eq('a_title_amazing')
      end
    end

    
  end
end
