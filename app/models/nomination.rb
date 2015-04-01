class Nomination < ActiveRecord::Base
  #belongs_to :user # user_id
  belongs_to :nominator, class_name: "User", foreign_key: :nominator_id
end
