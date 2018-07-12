require 'rails_helper'

RSpec.describe "email_adresses/edit", type: :view do
  before(:each) do
    @email_adress = assign(:email_adress, EmailAdress.create!(
      :adress => "MyString",
      :person_id => 1
    ))
  end

  it "renders the edit email_adress form" do
    render

    assert_select "form[action=?][method=?]", email_adress_path(@email_adress), "post" do

      assert_select "input[name=?]", "email_adress[adress]"

      assert_select "input[name=?]", "email_adress[person_id]"
    end
  end
end
