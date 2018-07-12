require 'rails_helper'

RSpec.describe "email_adresses/index", type: :view do
  before(:each) do
    assign(:email_adresses, [
      EmailAdress.create!(
        :adress => "Adress",
        :person_id => 2
      ),
      EmailAdress.create!(
        :adress => "Adress",
        :person_id => 2
      )
    ])
  end

  it "renders a list of email_adresses" do
    render
    assert_select "tr>td", :text => "Adress".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
