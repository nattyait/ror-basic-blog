class Post < ApplicationRecord::Migration[7.0]
    validates :title, presence: true, length: { minimum: 5 }
    validates :content, presence: true, length: { minimum: 10 }

    scope :published, -> { where.not(published_at: nil).order(published_at: :desc) }
    scope :drafts, -> { where(published_at: nil).order(created_at: :desc) }

    def published?
        published_at.present?
    end
    
    def unpublished?
        published_at.blank?
    end

    def publish!
        update(published_at: Time.current)
    end
    
    def unpublish!
        update(published_at: nil)
    end

    def toggle_publish
        if published?
            unpublish!
        else
            publish!
        end
    end
end
