# encoding: utf-8
require File.expand_path 'app/cases/spec_helper'
#require File.expand_path 'app/casesd/action'

describe 'invoicing page', :invoicing do

	let(:invoicing_page)do 
    	home_page = $navi.goto_home_page
    	login_page = home_page.direct_to_login_page
    	home_page = login_page.login "admin","1234"
    	invoicing_page = home_page.direct_to_invoicing_page
    end

    
    it 'search directly on invoicing page' do
    	invoicing_page.click_search
    	sleep 3
    	# invoicing_page.wait_until do
    	#  invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	# end
    end

    it 'search by date on invoicing page' do      
    	invoicing_page.set_date
    	invoicing_page.click_search
    	sleep 3
    	# invoicing_page.wait_until do
    	#  invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	# end
    end

    it 'search by client on invoicing page' do
    	invoicing_page.set_client 'cash'
    	invoicing_page.click_search
    	sleep 3
    	# invoicing_page.wait_until do
    	# invoicing_page.text.should include 'cash'
    	# end
	 end

	it 'search by project type on invoicing page' do
		invoicing_page.set_project_type = 'Consultation'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.text.should include "Consultation"
    	end
    	invoicing_page.set_project_type = 'Capvision Data'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.text.should include "Capvision Data"
    	end
    	invoicing_page.set_project_type = 'GES ConVey TM'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.text.should include "Capvision Survey"
    	end
    	invoicing_page.set_project_type = '--Capvision Survey'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.text.should include 'Capvision Survey'
    	end
    	invoicing_page.set_project_type = '--Investigative Due Diligence'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.text.should include "Investigative Due Diligence"
    	end
    	invoicing_page.set_project_type = 'Conference'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.text.should include "Newstalk"
    	end
    	invoicing_page.set_project_type = '--Newstalk'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.text.should include "Newstalk"
    	end
    	invoicing_page.set_project_type = '--Tele60'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.text.should include "Tele60"
    	end
    	invoicing_page.set_project_type = '--Capvision Live'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.text.should include "Capvision Live"
    	end
    	invoicing_page.set_project_type = '--Events'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.text.should include "Events"
    	end
    	invoicing_page.set_project_type = 'Hr Service'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.text.should include "Hr Service"
    	end
    	invoicing_page.set_project_type = 'International Consultation'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.text.should include "International Consultation"
    	end
	end

	it 'search by keywords on invoicing page' do
		invoicing_page.set_keywords = "test"
    	invoicing_page.click_search
    	sleep 3
    	# invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	# invoicing_page.wait_until do
    	# invoicing_page.text.should include "test"
    	# end
	end

	it 'search by date & client on invoicing page' do
		invoicing_page.set_date
		invoicing_page.set_client 'cash'
    	invoicing_page.click_search
    	sleep 3
    	# invoicing_page.wait_until do
    	# invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	# end
	end

	it 'search by date & project type on invoicing page' do
		invoicing_page.set_date
		invoicing_page.set_project_type = 'Consultation'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = 'Capvision Data'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = 'GES ConVey TM'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = '--Capvision Survey'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = '--Investigative Due Diligence'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = 'Conference'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	invoicing_page.set_project_type = '--Newstalk'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = '--Tele60'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = '--Capvision Live'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = '--Events'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = 'Hr Service'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = 'International Consultation'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
	end
    #test data problem
	it 'search by date & keywords on invoicing page' do
		  invoicing_page.set_date
		  invoicing_page.set_keywords = 'AT'
    	invoicing_page.click_search
    	sleep 3
    	# invoicing_page.wait_until do
    	#   invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	# end
	end

	it 'search by client & project type on invoicing page' do
		invoicing_page.set_client 'cash'
		invoicing_page.set_project_type = 'Consultation'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.text.should include "Consultation"
    	end
    	invoicing_page.set_project_type = 'Capvision Data'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.text.should include "Capvision Data"
    	end
    	invoicing_page.set_project_type = 'GES ConVey TM'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.text.should include "Capvision Survey"
    	end
    	invoicing_page.set_project_type = '--Capvision Survey'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.set_project_type = '--Investigative Due Diligence'
    	invoicing_page.click_search
    	sleep 3
    	
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = 'Conference'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = '--Newstalk'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = '--Tele60'
    	invoicing_page.click_search
    	sleep 3
    	
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = '--Capvision Live'
    	invoicing_page.click_search
    	sleep 3
    	
    	
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = '--Events'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = 'Hr Service'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = 'International Consultation'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
	end

	it 'search by client & keywords on invoicing page' do
		invoicing_page.set_client 'cash'
		invoicing_page.set_keywords = 'test'
    	invoicing_page.click_search
    	sleep 3
    	# invoicing_page.wait_until do
    	#  invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	# end
	end

	it 'search by project type & keywords on invoicing page' do
		invoicing_page.set_keywords = 'test'
		invoicing_page.set_project_type = 'Consultation'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = 'Capvision Data'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = 'GES ConVey TM'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = '--Capvision Survey'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = '--Investigative Due Diligence'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = 'Conference'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = '--Newstalk'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = '--Tele60'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = '--Capvision Live'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = '--Events'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = 'Hr Service'
    	invoicing_page.click_search
    	sleep 3
    	#此处已有等待验证
    	invoicing_page.wait_until do
    	 invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = 'International Consultation'
    	invoicing_page.click_search
    	sleep 3
    	#已验证
    	invoicing_page.wait_until do
    	 invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
	end

	it 'search by date & client & project type on invoicing page' do
		invoicing_page.set_date
		invoicing_page.set_client 'cash'
		invoicing_page.set_project_type = 'Consultation'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	invoicing_page.set_project_type = 'Capvision Data'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	invoicing_page.set_project_type = 'GES ConVey TM'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	invoicing_page.set_project_type = '--Capvision Survey'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	invoicing_page.set_project_type = '--Investigative Due Diligence'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	invoicing_page.set_project_type = 'Conference'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	invoicing_page.set_project_type = '--Newstalk'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	invoicing_page.set_project_type = '--Tele60'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	invoicing_page.set_project_type = '--Capvision Live'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	invoicing_page.set_project_type = '--Events'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	invoicing_page.set_project_type = 'Hr Service'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	invoicing_page.set_project_type = 'International Consultation'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	 invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
	end

	it 'search by date & client & keywords on invoicing page' do
		invoicing_page.set_date
		invoicing_page.set_client 'cash'
		invoicing_page.set_keywords = 'test'
    	invoicing_page.click_search
    	sleep 3
    	# invoicing_page.wait_until do
    	#  invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	# end
	end

	it 'search by date & project type & keywords on invoicing page' do
		invoicing_page.set_date
		invoicing_page.set_keywords = 'test'
    	invoicing_page.set_project_type = 'Consultation'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = 'Capvision Data'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = 'GES ConVey TM'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = '--Capvision Survey'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = '--Investigative Due Diligence'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = 'Conference'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = '--Newstalk'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = '--Tele60'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = '--Capvision Live'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = '--Events'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = 'Hr Service'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = 'International Consultation'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	 invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
	end

	it 'search by client & project type & keywords on invoicing page' do
		invoicing_page.set_client 'cash'
		invoicing_page.set_keywords = 'test'
    	invoicing_page.set_project_type = 'Consultation'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = 'Capvision Data'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = 'GES ConVey TM'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = '--Capvision Survey'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = '--Investigative Due Diligence'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = 'Conference'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = '--Newstalk'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = '--Tele60'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = '--Capvision Live'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = '--Events'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = 'Hr Service'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	invoicing_page.set_project_type = 'International Consultation'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	 invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
	end

	it 'search by all option on invoicing page' do
		invoicing_page.set_date
		invoicing_page.set_client 'cash'
		invoicing_page.set_keywords = 'test'
    	invoicing_page.set_project_type = 'Consultation'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = 'Capvision Data'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = 'GES ConVey TM'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = '--Capvision Survey'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = '--Investigative Due Diligence'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = 'Conference'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = '--Newstalk'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = '--Tele60'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = '--Capvision Live'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = '--Events'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = 'Hr Service'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    	invoicing_page.set_project_type = 'International Consultation'
    	invoicing_page.click_search
    	sleep 3
    	invoicing_page.wait_until do
    	 invoicing_page.title.should eql 'Invoicing Report - Capvision'
    	end
    end

end

