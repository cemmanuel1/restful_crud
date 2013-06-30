class Post < ActiveRecord::Base
  validates :title, uniqueness: { message: "Title already in use"}
  validates :title, presence: { message: "Must enter a title"}
  validates :description, presence: { message: "Must enter a post"}

   belongs_to :user
end
