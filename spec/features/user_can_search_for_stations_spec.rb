require 'rails_helper'

describe 'a user' do
  visits 'root page' do
    it 'can search for staions' do
      user = create(:user)

      visit '/'
      # And I fill in the search form with 80203 (Note: Use the existing search form)
      fill_in('q', with: 80203)
      # And I click "Locate"
      click_on "Locate"
      # Then I should be on page "/search"
      expect(current_path).to eq(search_path)
      # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
      expect(page).to_have css(".stations", count: 10)
      # And the stations should be limited to Electric and Propane

      # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
      within(first.(".station")) do
        expect(page).to_have css(".name")
        expect(page).to_have css(".address")
        expect(page).to_have css(".fuel types")
        expect(page).to_have css(".distance")
        expect(page).to_have css(".access times")
      end
    end
  end
end
