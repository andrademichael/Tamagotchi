require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the Tamagotchi path', {:type => :feature}) do
  it('takes the user input and creates a tamagotchi') do
    visit('/')
    puts("found root")
    fill_in('form_name', :with => 'lil dragon')
    puts("spec filled in form_name")
    click_button("Create my Tamagotchi!")
    expect(page).to have_content('lil dragon')
  end
end
