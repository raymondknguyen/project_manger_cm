require 'rails_helper'

RSpec.describe "welcome index page", type: :feature do
  describe "as a a visitor do" do
    it "has welcome page" do
      visit '/'
      expect(page).to have_content("Welcome")
    end
    it "has link to profile" do
      visit "/"

      click_on "About Collin Morgan" 

      expect(current_path).to eq("/about")
    end
  end
end