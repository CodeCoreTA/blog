class Post < ActiveRecord::Base

  has_many :comments, dependent: :destroy
  # The above allows us to fetch all the comments belonging to a single post
  # post.comments

  #Validation
  validates(:title, presence: true,
                    uniqueness: {message: "was used already"})

  validates(:body, presence: true)

  def self.search(term)
    if term
        # searches the body and title for search term regardless of case
        where(["title ILIKE :search_term OR body ILIKE :search_term", {search_term: "%#{term}%"} ])
    else
      Post.all
    end
  end



end
