#encoding: utf-8
require File.expand_path 'app/cases/spec_helper'
require File.expand_path 'app/cases/shared/action'


describe 'profile page', :profile  do 
#此profile默认为client的profile

  let(:profile_page)do 
      home_page = $navi.goto_home_page
      login_page = home_page.direct_to_login_page
      home_page = login_page.login "admin","1234"
      profile_page = home_page.direct_to_profile_page
    end

    it 'client_profile_page add compliance notes function' do      
       profile_page.select_random_client
       profile_page.text.should include "Compliance Notes"
       rand_num= [*'a'..'z',*'0'..'9',*'A'..'Z'].sample(8).join      
       profile_page.add_compliance_notes "at 1@_ q #{rand_num} %$## -"      
    end
    

    it 'client_profile_page add cash function' do      
       profile_page.select_random_client
       profile_page.add_cash "18757"
       profile_page.add_cash_alert_test.when_present.text.should include "请更正下列输入错误:"&&"Date must be a number."
    end
      
    it 'client_profile_page edit basic information' do            
       profile_page.select_random_client
       profile_page.text.should include "Basic Information"
       profile_page.edit_basic_information "100-499人","Venture Capital","若风"
    end

    it 'client_profile_page edit crm ' do
       profile_page.select_random_client
       profile_page.text.should include "CRM"
       profile_page.edit_crm_information "Annual","阿斯达睡觉哦的——ad@dsa","adad adad@ _da #!","21213 2131"
    end

    it 'client_profile_page edit contract information ' do
       profile_page.select_random_client
       profile_page.text.should include "Contract Information"
       sleep 1
       profile_page.edit_contract_information "1"
    end
     
    it 'client_profile_page edit account information ' do
       profile_page.select_random_client 
       profile_page.text.should include "Account Manager"
       profile_page.edit_account_information "100"
    end
     
    it 'client_profile_page account information add am function' do
       profile_page.select_random_client
       profile_page.add_am "test_am2","100","off"
    end   

    it 'client_client contacts page create contact function' do
       profile_page.select_random_client  
       profile_page.create_contact 
       # profile_page.text.should include "Basic Information"
    end 
    
    it 'client_client contacts page create contact with the email has already used' do
       profile_page.select_random_client  
       profile_page.client_contacts
       profile_page.create_contact_button
       profile_page.client_contact_email= "capvision_1c@163.com"
       profile_page.create_contact_save_button
       sleep 1
       # profile_page.text.should include "This Email is already being used by the following client contact"
    end
   
    it 'client_sale notes page create sale note function' do
       profile_page.select_random_client 
       profile_page.create_sale_note 
    end

    it 'client_profile_page the links of projects test' do
       profile_page.select_random_client  
       profile_page.projects_link_test 
       # profile_page.text.should include "International Consultation"
    end
  
    it 'client_profile_page account information percentage greater than 100' do
       profile_page.select_random_client
       profile_page.edit_account_information "101"
       # profile_page.error_info("1").should eql "Split Percentage must between 0 and 100"
       # profile_page.error_info("2").should eql "percentage和必须为100"
    end

    it 'client_profile_page account information percentage less than 100' do
       profile_page.select_random_client
       profile_page.edit_account_information "99"
       # profile_page.error_info("1").should eql "percentage和必须为100"
    end
    
    it 'client_profile_page account information the total of percentage greater than 100' do
       profile_page.select_random_client
       profile_page.edit_account_information "90"
       profile_page.add_am "kidd","90","on"
       sleep 2
       # profile_page.error_info("1").should eql "percentage和必须为100"
    end
    
    it 'client_profile_page account information the total of percentage less than 100' do
       profile_page.select_random_client
       profile_page.edit_account_information "45"
       profile_page.add_am "kidd","45","on"
       # profile_page.error_info("1").should eql "percentage和必须为100"
    end

    it 'client_profile_page account information AM should unique' do
       profile_page.select_random_client
       profile_page.edit_account_information "50"
       profile_page.add_am "test_am1","50","on"
       sleep 1
       # puts profile_page.error_info("1").should eql "AM不能重复"
    end
    
    it 'client_profile_page edit compliance notes' do
       profile_page.select_random_client
       profile_page.edit_compliance_notes "AT_testing 1@_ q #"
       # profile_page.compliance.should include "AT_testing"
    end
    
    it 'client_profile_page delete compliance notes' do
       profile_page.select_random_client
       profile_page.delete_compliance_notes
       # profile_page.wait_until do
       #    profile_page.title.should include "Capvision"
       # end
    end
    
    it 'client_profile_page edit cash note' do
       profile_page.select_random_client
       profile_page.edit_cash_note "123456789"
       # profile_page.wait_until do
       #   profile_page.cash_note.should eql "$123456789"
       # end
    end

    it 'client_profile_page choose the T&C' do
       profile_page.select_random_client
       profile_page.choose_tnc
       # profile_page.wait_until do
       #   profile_page.tnc.text.should eql "凯盛专家网络条款协议_V4.0"
       # end
    end
    
    it 'client_profile_page create cash note' do      
       profile_page.select_random_client
       profile_page.add_date
    end
end
