require 'rails_helper'

RSpec.describe EmailAdress, type: :model do
  let(:email_adress) { EmailAdress.new(adress:"a@a.com", person_id: 1) }

  it 'is valid' do
    expect(email_adress).to be_valid
  end

  it 'is invalid without an adress' do
    email_adress.adress = nil
    expect(email_adress).to_not be_valid
  end

  it 'is invalid without a person' do
    email_adress.person_id = nil
    expect(email_adress).to_not be_valid
  end
  
end
