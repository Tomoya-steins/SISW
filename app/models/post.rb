class Post < ApplicationRecord
    has_rich_text :content
    #belongs_to :user
    has_many :likes, dependent: :destroy
    validates :title, presence: true
    validates :firm_name, presence: true
    validates :content, presence: true

    def like_user(user_id)
        likes.find_by(user_id: user_id)
    end

end
