
# encoding: utf-8
require File.expand_path 'app/cases/spec_helper'
#require File.expand_path 'app/casesd/action'

describe 'payment page', :payment do
	
	let(:payment_page)do 
    	home_page = $navi.goto_home_page
    	login_page = home_page.direct_to_login_page
    	home_page = login_page.login "admin","1234"
    	payment_page = home_page.direct_to_payment_page
    end

	it 'search project fee directly on payment page' do
		payment_page.click_search
		sleep 3
		payment_page.wait_until do
		payment_page.title.should eql "Payment Report - Capvision"
		end
	end

	it 'search project fee by date on payment page' do
		payment_page.set_date
        payment_page.click_search
        sleep 3
        payment_page.wait_until do
        payment_page.title.should eql "Payment Report - Capvision"
        end
	end

	it 'search project fee by paid or not on payment page' do
		payment_page.set_paid = 'Yes'
		payment_page.click_search
		sleep 3
		payment_page.wait_until do
        payment_page.title.should eql "Payment Report - Capvision"
    end
		payment_page.set_paid = 'No'
		payment_page.click_search
		sleep 3
		payment_page.wait_until do
        payment_page.title.should eql "Payment Report - Capvision"
      end
	end

	it 'search project fee by keywords on payment page' do
		payment_page.set_keywords = "test"
        payment_page.click_search
        sleep 3
        payment_page.wait_until do
        payment_page.title.should eql "Payment Report - Capvision"
        end
	end

	it 'search project fee by date & paid on payment page' do
		payment_page.set_date
		payment_page.set_paid = 'Yes'
		payment_page.click_search
		sleep 3
		payment_page.wait_until do
        payment_page.title.should eql "Payment Report - Capvision"
      end
	end

	it 'search project fee by date & keyword on payment page' do
		payment_page.set_date
		payment_page.set_keywords = "test"
    	payment_page.click_search
    	sleep 3
    	payment_page.wait_until do
        payment_page.title.should eql "Payment Report - Capvision"
      end
	end

	it 'search project fee by paid & keyword on payment page' do
		payment_page.set_paid = 'Yes'
		payment_page.set_keywords = "test"
		payment_page.click_search
		sleep 3
		payment_page.wait_until do
        payment_page.title.should eql "Payment Report - Capvision"
      end
	end

	it 'search project fee by date & paid & keyword on payment page' do
		payment_page.set_date
		payment_page.set_paid = 'Yes'
		payment_page.set_keywords = "test"
		payment_page.click_search
		sleep 3
		payment_page.wait_until do
        payment_page.title.should eql "Payment Report - Capvision"
      end
	end
	#payment report页面project fee页面cash币种的选择功能
	#it 'change the currency of cash on payment page',:test do
	#  payment_page.click_search
	#  sleep 2
   # #payment_page.currency_link_element
   # payment_page.hidden_element
   # payment_page.hidden_payment_element
   # #sleep 10
	#  payment_page.currency_link_element.when_present.click
   # payment_page.select_currency_element.when_present.select "EUR"
   # sleep 2
   # payment_page.save_currency_btn
   # payment_page.currency_link_element.when_present.text.should eql "EUR"
   # payment_page.currency_link_element.when_present.click
   # payment_page.select_currency_element.when_present.select "RMB"
   # sleep 2
   # payment_page.save_currency_btn
	#end
  #payment report页面project fee页面按paid为yes查询记录
	it 'set yes for project fee on payment page' do
		payment_page.set_paid = 'No'
		payment_page.click_search
		payment_page.click_search_element.when_present.text.should eql "search"
	end               

	#payment report页面project fee页面按paid为no查询记录
	it 'set no for project fee on payment page' do
		payment_page.set_paid = 'Yes'
		payment_page.click_search
		payment_page.click_search_element.when_present.text.should eql "search"
	end

	#payment report页面referral fee页面按默认条件查询记录
	it 'search referral fee by default on payment page' do
	  payment_page.referral_fee
	  payment_page.click_search
	  sleep 2
	  payment_page.title.should eql "Payment Report - Capvision"
	end
	#payment report页面referral fee页面按date查询记录
	it 'search referral fee by date on payment page' do
		payment_page.referral_fee
		payment_page.set_date
		payment_page.click_search
		sleep 3
		payment_page.wait_until do
		payment_page.title.should eql "Payment Report - Capvision"
		end
	end

	it 'search referral fee directly on payment page' do
		payment_page.referral_fee
		payment_page.click_search
		sleep 3
		payment_page.wait_until do
		payment_page.title.should eql "Payment Report - Capvision"
		end
	end

	it 'change status for referral fee on payment page' do
		payment_page.referral_fee
		payment_page.click_search
		sleep 3
	  payment_page.title.should eql "Payment Report - Capvision"
		payment_page.verify_paid
		sleep 3
    payment_page.title.should eql "Payment Report - Capvision" 
	end

end