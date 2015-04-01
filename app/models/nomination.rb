class Nomination < ActiveRecord::Base
  belongs_to :nominator, class_name: "User", foreign_key: :nominator_id
  belongs_to :nominee, class_name: "User", foreign_key: :nominee_id

  validates :content, presence: true
end
