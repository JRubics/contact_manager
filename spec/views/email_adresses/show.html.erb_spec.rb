require 'rails_helper'

RSpec.describe "email_adresses/show", type: :view do
  before(:each) do
    @email_adress = assign(:email_adress, EmailAdress.create!(
      :adress => "Adress",
      :person_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Adress/)
    expect(rendered).to match(/2/)
  end
end
