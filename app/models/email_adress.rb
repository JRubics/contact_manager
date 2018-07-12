class EmailAdress < ApplicationRecord
  belongs_to :person, optional: true
  validates :adress, :person_id, presence: true  
end
