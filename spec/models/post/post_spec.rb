require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      post = build(:post)
      expect(post).to be_valid
    end

    it 'is not valid without a title' do
      post = build(:post, title: nil)
      expect(post).to be_invalid
    end
  end

  describe 'title' do
    it 'is required' do
      post = build(:post, title: nil)
      expect(post).to be_invalid
    end

    it 'is invalid with a title less than 5 characters' do
      post = build(:post, title: '1234')
      expect(post).to be_invalid
    end

    it 'is valid with a title of 5 characters' do
      post = build(:post, title: '12345')
      expect(post).to be_valid
    end
  end
  describe 'content' do
    it 'is required' do
      post = build(:post, content: nil)
      expect(post).to be_invalid
    end

    it 'is invalid with a content less than 10 characters' do
      post = build(:post, content: '123456789')
      expect(post).to be_invalid
    end
  end
  describe 'scope' do
    it 'returns published posts' do
      post = create(:post, :published)
      expect(Post.published).to include(post)
    end

    it 'returns drafts' do
      post = create(:post, :draft)
      expect(Post.drafts).to include(post)
    end
  end
end