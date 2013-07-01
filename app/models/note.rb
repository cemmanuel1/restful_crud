class Note < ActiveRecord::Base
  validates :title, presence: { message: "Must enter a title"}
  validates :content, presence: { message: "Must enter content"}

end
