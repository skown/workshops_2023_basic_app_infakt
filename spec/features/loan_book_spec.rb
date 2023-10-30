require 'rails_helper'

describe 'Log in', type: :feature do
  user = FactoryBot.create(:user)
  let!(:book) { create(:book) }

  before do
    login_as(user)
    visit root_path
  end

  context 'loans a book' do
    it 'loans a book' do
        visit books_path
        click_button 'Loan'

        expect(page).to have_content('Book Loan was successfully created.')
        end
    end
end