#encoding: utf-8
require File.expand_path 'app/cases/spec_helper'
require File.expand_path 'app/cases/shared/action'



describe 'client page', :client do 
  
  let(:client_page) do 
      home_page = $navi.goto_home_page
      login_page = home_page.direct_to_login_page
      home_page = login_page.login "admin","1234"
      client_page = home_page.direct_to_client_page
    end

    it 'should direct to client page ' do
      sleep 3
      client_page.wait_until do
        client_page.title.should eql "Clients - Capvision"
      end
    end
    
    it 'make sure the default search function' do
      # client_page.click_search_button
      client_page.search_element.when_present.click
      # client_page.wait_until do
      #   client_page.client_list_element[2][0].text.should_not == ''
      # end
    end
    
    it 'should search clients by keywords' do
      client_page.keywords = "ATconvey"
      client_page.search
      # client_page.wait_until do
      #   client_page.client_list_element[2][0].text.should include "ATconvey"
      # end
    end
    
    it 'should search clients by Prospect status ' do
      client_page.status="Prospect"
      client_page.search
      # client_page.wait_until do
      #   client_page.client_list_element[client_page.num.to_i][6].text.should eql "Prospect" 
      # end 
    end
          
    it 'should search clients by Engage status ' do  
      client_page.status="Engage"
      client_page.search
      # client_page.wait_until do
      #   client_page.client_list_element[client_page.num.to_i][6].text.should eql "Engage"
      # end
    end
    
    it 'should search clients by Discover status ' do      
      client_page.status="Discover"
      client_page.search
      # client_page.wait_until do
      #   client_page.client_list_element[client_page.num.to_i][6].text.should eql "Discover"
      # end
    end
    
    it 'should search clients by Trial status ' do      
      client_page.status="Trial"
      client_page.search
      # client_page.wait_until do
      #   client_page.client_list_element[client_page.num.to_i][6].text.should eql "Trial"      
      # end
    end
    
    it 'should search clients by Confirm status ' do
      client_page.status="Confirm"
      client_page.search
      # client_page.wait_until do
      #   client_page.client_list_element[9][6].text.should eql "Confirm"      
      # end
    end
    
    it 'should search clients by Annual status ' do  
      client_page.status="Annual"
      client_page.search
      # client_page.wait_until do
      #   client_page.client_list_element[client_page.num.to_i][6].text.should eql "Annual"     
      # end
    end
    
    it 'should search clients by Project status ' do  
      client_page.status="Project"
      client_page.search
      # client_page.wait_until do
      #   client_page.client_list_element[client_page.num.to_i][6].text.should eql "Project"     
      # end
    end

    it 'should search clients by the type of Consulting Firm' do
      client_page.types="Consulting Firm"
      client_page.search
      # client_page.wait_until do
      #   client_page.client_list_element[client_page.num.to_i][5].text.should eql "Consulting Firm" 
      # end
    end
     
    it 'should search clients by the type of Private Equity' do
      client_page.types="Private Equity"
      client_page.search
      # client_page.wait_until do
      #   client_page.client_list_element[client_page.num.to_i][5].text.should eql "Private Equity"
      # end
    end
     
    it 'should search clients by the type of Hedge Fund' do
      client_page.types="Hedge Fund"
      client_page.search
      # client_page.wait_until do
      #   client_page.client_list_element[client_page.num.to_i][5].text.should eql "Hedge Fund"
      # end
    end
     
    it 'should search clients by the type of Venture Capital' do
      client_page.types="Venture Capital"
      client_page.search
      # client_page.wait_until do
      #   client_page.client_list_element[client_page.num.to_i][5].text.should eql "Venture Capital"
      # end
    end
     
    it 'should search clients by the type of Mutual Fund' do 
      client_page.types="Mutual Fund"
      client_page.search
      # client_page.wait_until do
      #   client_page.client_list_element[client_page.num.to_i][5].text.should eql "Mutual Fund"
      # end
    end
     
    it 'should search clients by the type of Corporate' do 
      client_page.types="Corporate"
      client_page.search
      # client_page.wait_until do
      #   client_page.client_list_element[client_page.num.to_i][5].text.should eql "Corporate"
      # end
    end
     
    it 'should search clients by the type of Financial Firm' do
      client_page.types="Financial Firm"
      client_page.search
      # client_page.wait_until do
      #   client_page.client_list_element[2][5].text.should eql "Financial Firm"
      # end
    end
     
    it 'should search clients by the type of Others' do
      client_page.types="Others"
      client_page.search
      # client_page.wait_until do
      #   client_page.client_list_element[2][5].text.should eql "Others"
      # end
    end
     
    it 'make sure the create client function'  do
      sleep 1
      client_page.create_client
      # client_page.wait_until do
      #   client_page.text.should include "at_test"
      # end
    end
    
    it 'client contacts page deactivate contacts' do
      client_page.goto_client_contacts_page
      client_page.check_choose_first_contact
      client_page.inactive_btn
      # client_page.alert_verify_element.when_present.text.should eql "Set Inactive Success"
    end
     
    it 'client contacts page activate contacts' do
      client_page.goto_client_contacts_page
      client_page.client_contact_status="Inactive"
      client_page.search_client_contact
      client_page.check_choose_first_contact
      client_page.active_btn
      # client_page.alert_verify_element.when_present.text.should eql "Set Active Success"
    end
     
    it 'client contacts page search contacts by Promoter status' do
      client_page.goto_client_contacts_page
      client_page.client_contact_nps="Promoter"
      client_page.search_client_contact
      # client_page.wait_until do
      #   client_page.text.should include "Promoter"
      # end
    end
     
    it 'client contacts page search contacts by Neutral status' do
      client_page.goto_client_contacts_page
      client_page.client_contact_nps="Neutral"
      client_page.search_client_contact
      # client_page.wait_until do
      #   client_page.text.should include "Neutral"
      # end
    end
     
    it 'client contacts page search contacts by Detractor status' do
      client_page.goto_client_contacts_page
      client_page.client_contact_nps="Detractor"
      client_page.search_client_contact
      # client_page.wait_until do
      #   client_page.text.should include "Detractor"
      # end
    end
     
    it 'client contacts page search contacts by Unsent status' do
      client_page.goto_client_contacts_page
      client_page.client_contact_registration="Unsent"
      client_page.search_client_contact
      # client_page.wait_until do
      #   client_page.title.should include "Client Contacts"
      # end
    end

    it 'client contacts page search contacts by Sent status' do
      client_page.goto_client_contacts_page
      client_page.client_contact_registration="Sent"
      client_page.search_client_contact
      # client_page.wait_until do
      #   client_page.title.should include "Client Contacts"
      # end
    end

    it 'client contacts page search contacts by Registered status' do
      client_page.goto_client_contacts_page
      client_page.client_contact_registration="Registered"
      client_page.search_client_contact
      # client_page.wait_until do
      #   client_page.title.should include "Client Contacts"
      # end
    end

    it 'client contacts page search contacts by keywords' do
      client_page.goto_client_contacts_page
      client_page.client_contact_keywords="at_"
      client_page.search_client_contact
      # client_page.wait_until do
      #   client_page.text.should include "at_"
      # end
    end

    it 'client_profile_page change type and verify on client page' do
      client_page.goto_client_contacts_page
      client_page.goto_client_subpage "Profile"
      client_page.change_client_type "Mutual Fund"
      client_page.backto_client_page
      client_page.keywords = "湿嗒嗒大"
      client_page.search
      # client_page.wait_until do
      #   client_page.client_list_element[2][5].text.should eql "Mutual Fund"
      # end    
      # client_page.goto_client_contacts_page
      # client_page.goto_client_subpage "Profile"
      # client_page.change_client_type "Venture Capital"
    end

    it 'client page sale notes page edit sale note' do
      client_page.goto_client_contacts_page
      client_page.goto_client_subpage "Sale Notes"
      client_page.edit_sale_notes
      # client_page.wait_until do
      #   client_page.text.should include "Email"
      # end  
    end

    it 'client page sale notes page delete sale note' do
      client_page.goto_client_contacts_page
      client_page.goto_client_subpage "Sale Notes"
      client_page.create_sale_note
      message = client_page.confirm(true) do
        client_page.delete_sale_notes_element.click
      end
      # client_page.wait_until do
      #   client_page.title.should include "Sale Notes"
      # end
    end
    
end
