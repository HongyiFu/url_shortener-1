require 'rails_helper'

RSpec.describe "urls/index.html.erb", type: :feature do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
	let(:valid_url) { "http://nezumiapp.com/" }
  describe "shorten new long url process" do
  	before do
  		visit '/'
  	end

    it "clicking on Shorten URL brings me to #new" do
      click_link 'Shorten URL now!'
      expect(page).to have_current_path(new_url_path)
    end

    it "expects /urls/new to have form" do
    	click_link 'Shorten URL now!'
			expect(page).to have_selector("[name='url[long_url]']")
		end

  	it "expects a valid long url to be saved and be brought to urls page" do
  		click_link 'Shorten URL now!'
  		fill_in('url[long_url]', with:valid_url)
  		click_button('Create Url')
  		expect(page).to have_current_path(urls_path)
  	end

  	it "expects to find long url in urls page now" do
  		click_link 'Shorten URL now!'
  		fill_in('url[long_url]', with:valid_url)
  		click_button('Create Url')
  		expect(page).to have_content(valid_url)
  	end

  	it "expects to find short url now in urls page now" do
  		click_link 'Shorten URL now!'
  		fill_in('url[long_url]', with:valid_url)
  		click_button('Create Url')
  		short_url = Url.find_by(long_url:valid_url).short_url
  		expect(page).to have_link(short_url)
  	end

  	it "expects to to be able to click on the short url link" do
  		click_link 'Shorten URL now!'
  		fill_in('url[long_url]', with:valid_url)
  		click_button('Create Url')
  		short_url = Url.find_by(long_url:valid_url).short_url
 			click_link short_url
  		expect(current_url).to eq valid_url 
  	end
  end
end


