class Nomination < ActiveRecord::Base
  belongs_to :nominator, class_name: "User", foreign_key: :nominator_id
  belongs_to :nominee, class_name: "User", foreign_key: :nominee_id

  validates :content, presence: { message: "Nomination can't be blank."}
  validate :nominator_cannot_be_nominee

  def nominator_cannot_be_nominee
    if nominee == nominator
      errors[:nominator] << "cannot be nominee!"
    end
  end
end
