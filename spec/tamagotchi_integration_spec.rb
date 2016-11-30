require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the Tamagotchi path', {:type => :feature}) do
  before() do
    Tamagotchi.clear()
  end

  it('takes the user input and creates a tamagotchi') do
    visit('/')
    fill_in('form_name', :with => 'lil dragon')
    click_button("Create my Tamagotchi!")
    expect(page).to have_content('lil dragon')
  end

  it('displays the stats of a single Tamagotchi object') do
    visit('/')
    fill_in('form_name', :with => 'lil dragon')
    click_button("Create my Tamagotchi!")
    click_link("lil dragon")
    expect(page).to have_content('100')
  end
end
