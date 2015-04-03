class Vote < ActiveRecord::Base
  belongs_to :nomination
  belongs_to :user

  validates :user, uniqueness: {
    scope: :nomination,
    message: "You can only vote on a nomination once, buddy!"
  }
end
