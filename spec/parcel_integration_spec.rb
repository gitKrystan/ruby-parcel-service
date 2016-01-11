require('capybara/rspec')
require('./app')
require('launchy')
Capybara.app = Sinatra::Application
Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end
Capybara.javascript_driver = :chrome
Capybara.current_driver = Capybara.javascript_driver

set(:show_exceptions, false)

describe('the parcel calculator path', {:type => :feature}) do
  it('processes the user entry and returns the proper shipping cost') do
    visit('/')
    fill_in('zip1', :with => '98682')
    fill_in('zip2', :with => '33708')
    fill_in('length', :with => '12')
    fill_in('width', :with => '12')
    fill_in('height', :with => '12')
    fill_in('weightLbs', :with => '1')
    fill_in('weightOzs', :with => '0')
    choose('shipNextDay')
    click_button('Calculate')
    expect(page).to(have_content('$32.88'))
  end
end
