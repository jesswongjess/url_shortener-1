require 'rails_helper'

# RSpec.describe "urls/new.html.erb", type: :view do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
RSpec.describe "urls/new.html.erb", type: :feature do
  # pending "add some examples to (or delete) #{__FILE__}"
  scenario "Submitting a new url" do
	visit "/urls/new"
	expect(page).to have_content 'Make a url short'
	fill_in 'url[long_url]', with: 'http://google.com'
    click_button 'Shorten URL!'
    expect(page.current_path).to eq("/urls") 
  end
end