require 'rails_helper'

describe 'the person view', type: :feature do

  let(:person) { Person.create(first_name: 'John', last_name: 'Doe') }

  describe 'the phone_numbers view', type: :feature do
    before(:each) do
      person.phone_numbers.create(number: "555-1234")
      person.phone_numbers.create(number: "555-5678")
      visit person_path(person)
    end

    it 'shows the phone numbers' do
      person.phone_numbers.each do |phone|
        expect(page).to have_content(phone.number)
      end
    end

    it 'has a link to add a new phone number' do
      expect(page).to have_link('Add phone number', href: new_phone_number_path(person_id: person.id))
    end

    it 'adds a new phone number' do
      page.click_link('Add phone number')
      page.fill_in('Number', with: '555-8888')
      page.click_button('Create Phone number')
      expect(current_path).to eq(person_path(person))
      expect(page).to have_content('555-8888')
    end

    it 'has links to edit phone numbers' do
      person.phone_numbers.each do |phone|
        expect(page).to have_link('edit', href: edit_phone_number_path(phone))
      end
    end

    it 'edits a phone number' do
      phone = person.phone_numbers.first
      old_number = phone.number

      first(:link, 'edit').click
      page.fill_in('Number', with: '555-9191')
      page.click_button('Update Phone number')
      expect(current_path).to eq(person_path(person))
      expect(page).to have_content('555-9191')
      expect(page).to_not have_content(old_number)
    end

    it 'has links to delete phone number' do
      person.phone_numbers.each do |p|
        expect(page).to have_link('delete', href: phone_number_path(p))
      end
    end

    it 'delete a phone number' do
      phone = person.phone_numbers.first
      old_number = phone.number

      first(:link, 'delete').click    
      expect(current_path).to eq(person_path(person))
       expect(page).to_not have_content(old_number)
      # expect(page).to have_content('555-9191')
      # expect(page).to_not have_content(old_number)
    end
  end

  describe 'the email_adresses view', type: :feature do
    before(:each) do
      person.email_adresses.create(adress: "q@q.com")
      person.email_adresses.create(adress: "w@w.com")
      visit person_path(person)
    end

    it 'has a link to add a new email_adress' do
      expect(page).to have_link('Add email adress', href: new_email_adress_path(person_id: person.id))
    end

    it 'adds a new email adress' do
      page.click_link('Add email adress')
      page.fill_in('Adress', with: 'j@j.j')
      page.click_button('Create Email adress')
      expect(current_path).to eq(person_path(person))
      expect(page).to have_content('j@j.j')
    end

    it 'has links to edit email adress' do
      person.email_adresses.each do |a|
        expect(page).to have_link('edit', href: edit_email_adress_path(a))
      end
    end

    it 'edits an email adress' do
      mail = person.email_adresses.first
      old_mail = mail.adress

      first(:link, 'edit').click
      page.fill_in('Adress', with: 'z@z.z')
      page.click_button('Update Email adress')
      expect(current_path).to eq(person_path(person))
      expect(page).to have_content('z@z.z')
      expect(page).to_not have_content(old_mail)
    end

    it 'has links to delete email adress' do
      person.email_adresses.each do |a|
        expect(page).to have_link('delete', href: email_adress_path(a))
      end
    end

    it 'delete an email adress' do
      mail = person.email_adresses.first
      old_mail = mail.adress

      first(:link, 'delete').click    
      expect(current_path).to eq(person_path(person))
      expect(page).to_not have_content(old_mail)
      # expect(page).to have_content('555-9191')
      # expect(page).to_not have_content(old_number)
    end
  end 
end