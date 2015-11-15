class Post < ActiveRecord::Base

  belongs_to :user
  has_many :comments, dependent: :destroy
  # The above allows us to fetch all the comments belonging to a single post
  # post.comments

  has_many :favourites, dependent: :destroy
  has_many :favouriting_users, through: :favourites, source: :user

  #Validation
  validates(:title, presence: true,
                    uniqueness: {message: "was used already"})

  validates(:body, presence: true)

  def favourited_by?(user)
    favourites.find_by_user_id(user.id).present?
  end

  def favourite_for(user)
    favourites.find_by_user_id(user.id)
  end

  def self.search(term)
    if term
        # searches the body and title for search term regardless of case
        where(["title ILIKE :search_term OR body ILIKE :search_term", {search_term: "%#{term}%"} ])
    else
      Post.all
    end
  end



end
