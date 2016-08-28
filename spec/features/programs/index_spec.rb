require 'rails_helper'

RSpec.feature "Contact", :type => :feature do
  scenario "Visit program page" do
    visit(root_path)
    expect(page).to have_text("Let's dance")
  end
end