class EmailAdress < ApplicationRecord
  belongs_to :person, optional: true
end
