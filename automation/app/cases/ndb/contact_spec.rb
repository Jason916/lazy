#encoding: utf-8
require File.expand_path 'app/cases/spec_helper'
require File.expand_path 'app/cases/shared/action'
require File.expand_path 'app/cases/shared/main.rb'

describe 'contact page', :contact do 
  
  let(:contact_page)do 
      home_page = $navi.goto_home_page
      login_page = home_page.direct_to_login_page
      home_page = login_page.login "admin","1234"
      client_page = home_page.direct_to_client_page
      contact_page = client_page.direct_to_contact_page
    end
    
    it 'should direct to contact page ' do
      contact_page.wait_until do
        contact_page.contact_title.should eql "Contacts"
      end
    end
    

    it 'should filter contacts by Consulting Firm status '  do
      contact_page.type="Consulting Firm"
      contact_page.filter
      # contact_page.contact_list_element[contact_page.num.to_i][4].text.should eql "Consulting Firm"
    end

    it 'should filter contacts by Private Equity status ' do
       contact_page.type="Private Equity"
       contact_page.filter
       # contact_page.contact_list_element[contact_page.num.to_i][4].text.should eql "Private Equity"
    end
    
    it 'should filter contacts by Hedge Fund status ' do
       contact_page.type="Hedge Fund"
       contact_page.filter
       # contact_page.contact_list_element[contact_page.num.to_i][4].text.should eql "Hedge Fund"
    end
    
    it 'should filter contacts by Venture Capital status ' do
       contact_page.type="Venture Capital"
       contact_page.filter
       # contact_page.contact_list_element[contact_page.num.to_i][4].text.should eql "Venture Capital"
    end
    
    it 'should filter contacts by Mutual Fund status ' do
       contact_page.type="Mutual Fund"
       contact_page.filter
       # contact_page.contact_list_element[contact_page.num.to_i][4].text.should eql "Mutual Fund"
    end

    it 'should filter contacts by Corporate status ' do
      contact_page.type="Corporate"
      contact_page.filter
      # contact_page.contact_list_element[contact_page.num.to_i][4].text.should eql "Corporate"
    end
    
    it 'should filter contacts by Financial Firm status ' do
       contact_page.type="Financial Firm"
       contact_page.filter
       # contact_page.contact_list_element[contact_page.num.to_i][4].text.should eql "Financial Firm"
    end
    
    it 'should filter contacts by Others status ' do
       contact_page.type="Others"
       contact_page.filter
       # contact_page.contact_list_element[contact_page.num.to_i][4].text.should eql "Others"
    end
    
    it 'should filter contacts by location ' do
      contact_page.go_contact_page 
      # contact_page.wait_until do
      #   contact_page.contact_title.should eql "Contacts"
      # end
      contact_page.filter_by_location  
    end
    
    it 'contact page edit contact information' do
      contact_page.goto_contacts_profile_page 
      # contact_page.wait_until do
      #   contact_page.title.should eql "test_grass - Capvision"
      # end
      contact_page.edit_contacts_mobile
      sleep 3
      contact_page.edit_contacts_tel
      sleep 3
      contact_page.edit_contacts_email
    end
    
    it 'contact page add project function' do
      contact_page.km_login
      contact_page.goto_contacts_profile_page 
      # contact_page.wait_until do
      #   contact_page.title.should eql "test_grass - Capvision"
      # end
      sleep 2
      contact_page.add_project "模板"
    end
    
    it 'contact_profile_page delete note information' do
      contact_page.goto_contacts_profile_page 
      contact_page.delete_note_information
      # contact_page.wait_until do
      #   contact_page.title.should include "Capvision"
      # end
    end
    
    it 'contact_profile_page add note information' do
      contact_page.goto_contacts_profile_page
      contact_page.add_note_information="AT_testing @#!~djadkj_ das_"
      contact_page.click_submit_btn
      # contact_page.wait_until do
      #   contact_page.text.should include "AT_testing @"
      # end
    end
    
    it 'contact_profile_page edit basic information' do
      contact_page.goto_contacts_profile_page
      contact_page.edit_basic_information
      # contact_page.wait_until do
      #   sleep 2
      #   contact_page.text.should include "蜘蛛侠"
      # end
    end
    
    it 'contact_profile_page edit preference' do
      contact_page.goto_contacts_profile_page
      contact_page.edit_preference
      # contact_page.wait_until do
      #   contact_page.title.should include "Capvision"
      # end
    end
    
    it 'contact_profile_page add other contact type' do
      contact_page.goto_contacts_profile_page
      sleep 2
      contact_page.add_other_contact
      # contact_page.wait_until do
      #   contact_page.text.should include "MSN"
      # end
    end
    
    it 'contact_profile_page transfer verification of client alert' do
      contact_page.goto_contacts_profile_page 
      contact_page.click_transfer_btn
      contact_page.contact_transfer_email="1@1#{rand(10000)}.com"
      contact_page.save
      # contact_page.transfer_alert.should eql "Transfer to same or empty client is invalid."
    end
    
    it 'contact_profile_page transfer verification of email alert' do
      contact_page.goto_contacts_profile_page 
      contact_page.click_transfer_btn
      contact_page.contact_transfer_client "asd"
      contact_page.save
      # contact_page.transfer_alert.should eql "Email can not be empty."
    end
    
    it 'contact_profile_page send web account' do
      contact_page.goto_contact_page "293"
      contact_page.click_send_webaccount_btn
      sleep 2
      contact_page.click_send_btn
      sleep 2
      # contact_page.text.should include "Capvision"
    end
    
    it 'contact_profile_page send web invitation function' do
      contact_page.goto_contact_page "224"
      sleep 1
      contact_page.click_web_invitation_btn
      sleep 2
      # contact_page.wait_until do
      #   contact_page.text.should include "Send Web Invitation"
      # end
    end
    
    it 'contact_search_page filter by mobile' do
      contact_page.input_keyword="15618886543"
      contact_page.filter
      sleep 2
      # contact_page.wait_until do
      #   contact_page.text.should include "15618886543"
      # end
    end
    
    it 'contact_search_page filter by email' do
      contact_page.input_keyword="钢铁侠"
      contact_page.filter
      sleep 2
      # contact_page.wait_until do
      #   contact_page.text.should include "钢铁侠"
      # end
    end
            
end
