#encoding: utf-8
require File.expand_path 'app/cases/shared/action'
class PaymentPage < Lol::Page
  include Action
  page_url "#{$config.host}report/payment/index"

  button :click_search, :value=> "search"
  select_list :set_paid, :id => "PaymentForm_paid"
  text_field :set_keywords, :id=> "PaymentForm_projectName"
  link :referral_fee, :href=> "/report/consultantpayment/index"
  #click change currency link
  link :currency_link, :xpath=> "//tr/td[20]/a"
  #select currency
  select_list :select_currency, :xpath=>"//div/div/select"
  #click save currency btn
  button :save_currency_btn, :xpath=>"//div/div/div[2]/button"


  text_field :reservation, :id=> "reservation"
  td :SetDate, :xpath=> "//div[2]/table/tbody/tr/td"

  label :ChangePaidStatus, :xpath=> "//div[@id='client-summary-report']/table/tbody/tr/td/div/div/label"
  def set_date
    self.reservation_element.when_present.click
    self.SetDate_element.when_present.click
  end

  def change_paid_status
    self.ChangePaidStatus_element.when_present.click
  end

  def verify_paid
	message = self.alert do
  		self.change_paid_status
	end
    if message
		  message.should == "The action will send payment notice to consultant, are you sure you have paid to the consultant?"
    else
		  puts "no alert~"
    end   
  end
end






