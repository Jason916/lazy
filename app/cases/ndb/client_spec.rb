#encoding: utf-8
require File.expand_path 'app/cases/spec_helper'
require File.expand_path 'app/cases/shared/action'

describe 'client page', :client  do 
  
  let(:client_page) do 
      home_page = $navi.goto_home_page
      login_page = home_page.direct_to_login_page
      home_page = login_page.login "admin","1234"
      client_page = home_page.direct_to_client_page
    end

    #进入client页面
    it 'should direct to client page ' do
        client_page.create_client_button_element.when_present.text.should include "Create Client"
        client_page.title.should eql "Clients - Capvision"
    end
    
    it 'make sure the default search function' do
      # client_page.click_search_button
      client_page.search_element.when_present.click
    end
    
    
    #关键字查询
    it 'should filter clients by keywords' do
      client_page.keywords = "ATconvey"
      client_page.search
      client_page.wait_until do
        client_page.client_table_list_keyword.should include "ATconvey" 
      end
    end

    #按prospect status搜索
    it 'should filter clients by Prospect status' do
      client_page.status_element.when_present.select "Prospect"
      client_page.search
      client_page.wait_until do
        client_page.client_table_list_status.should eql "Prospect" 
      end 
    end

    #按 Engage status搜索     
    it 'should filter clients by Engage status' do  
      client_page.status_element.when_present.select "Engage"
      client_page.search
      client_page.wait_until do
        client_page.client_table_list_status.should eql "Engage"
      end
    end

    #按Discover status搜索
    it 'should filter clients by Discover status' do      
      client_page.status_element.when_present.select "Discover"
      client_page.search
      client_page.wait_until do
        client_page.client_table_list_status.should eql "Discover"
      end
    end

    #按Trial status搜索
    it 'should filter clients by Trial status' do      
      client_page.status_element.when_present.select "Trial"
      client_page.search
      client_page.wait_until do
        client_page.client_table_list_status.should eql "Trial"      
      end
    end

    #按Confirm status搜索
    it 'should filter clients by Confirm status ' do
      client_page.status_element.when_present.select "Confirm"
      client_page.search
      client_page.wait_until do
        client_page.client_table_list_status.should eql "Confirm"      
      end
    end

    #按Annual status搜索
    it 'should filter clients by Annual status ' do  
      client_page.status_element.when_present.select "Annual"
      client_page.search
      client_page.wait_until do
        client_page.client_table_list_status.should eql "Annual"     
      end
    end

    #按Project status搜索
    it 'should filter clients by Project status ' do  
      client_page.status_element.when_present.select "Project"
      client_page.search
      client_page.wait_until do
        client_page.client_table_list_status.should eql "Project"     
      end
    end
    #根据type+status进行搜索
    it 'should filter clients by status and type ' do  
      client_page.status_element.when_present.select "Prospect"
      client_page.types_element.when_present.select "Consulting Firm"
      client_page.filter
      client_page.client_table_list_type1.should eql "Consulting Firm"
    end
    
    #根据am+all lead source location进行搜索
    it 'should filter clients by status all lead source and location ' do
      client_page.select_client_am_element.when_present.click
      client_page.click_selected_client_am_element.when_present.click
      client_page.select_client_leadsource_element.when_present.select "Others"
      client_page.hidden_element
      client_page.select_location_element.when_present.click
      client_page.location_link_element.when_present.click
      client_page.filter
      client_page.client_table_list_am.should include "test_am1"
    end
    
    #按Consulting Firm类型搜索
    it 'should filter clients by the type of Consulting Firm' do
      client_page.types_element.when_present.select "Consulting Firm"
      client_page.search
      client_page.wait_until do
        client_page.client_table_list_type.should eql "Consulting Firm" 
      end
    end

     #按Private Equity类型搜索
    it 'should filter clients by the type of Private Equity' do
      client_page.types_element.when_present.select "Private Equity"
      client_page.search
      client_page.wait_until do
        client_page.client_table_list_type.should eql "Private Equity"
      end
    end

     #按Hedge Fund类型索索
    it 'should filter clients by the type of Hedge Fund' do
      client_page.types_element.when_present.select "Hedge Fund"
      client_page.search
      client_page.wait_until do
        client_page.client_table_list_type.should eql "Hedge Fund"
      end
    end

     #按Venture Capital类型搜索
    it 'should filter clients by the type of Venture Capital' do
      client_page.types_element.when_present.select "Venture Capital"
      client_page.search
      client_page.wait_until do
        client_page.client_table_list_type.should eql "Venture Capital"
      end
    end

     #按Mutual Fund类型搜索
    it 'should filter clients by the type of Mutual Fund' do 
      client_page.types_element.when_present.select "Mutual Fund"
      client_page.search
      client_page.wait_until do
        client_page.client_table_list_type.should eql "Mutual Fund"
      end
    end

     #按Corporate类型搜索
    it 'should filter clients by the type of Corporate' do 
      client_page.types_element.when_present.select "Corporate"
      client_page.search
      client_page.wait_until do
        client_page.client_table_list_type.should eql "Corporate"
      end
    end

     #按Financial Firm类型搜索
    it 'should filter clients by the type of Financial Firm' do
      client_page.types_element.when_present.select "Financial Firm"
      client_page.search
      client_page.wait_until do
        client_page.client_table_list_type1.should eql "Financial Firm"
      end
    end

     #按Others类型搜索
    it 'should filter clients by the type of Others' do
      client_page.types_element.when_present.select "Others"
      client_page.search
      client_page.wait_until do
        client_page.client_table_list_type1.should eql "Others"
      end
    end

    #client创建页面不填写任何内容，点击create
    it 'create client without data' do
      client_page.create_client_button_element.when_present.click
      client_page.create_button_element.when_present.click 
    end
    #client创建页面不填写name,点击create
    it 'create client without name' do
      client_page.create_client_button_element.when_present.click
      client_page.client_name_element.when_present.append "at_test_ac"
      client_page.create_button_element.when_present.click 
    end
    #client创建页面不填写am，点击create
    it 'create client without select am' do
      client_page.create_client_button_element.when_present.click
      client_page.client_am_element.when_present.click
      client_page.select_am_element.when_present.click
      client_page.create_button_element.when_present.click 
    end
    #client创建页面不填写CRM status，点击create
    it 'create client without select CRM status' do
      client_page.create_client_button_element.when_present.click
      client_page.client_relation_status_element.when_present.select("Project")
      client_page.create_button_element.when_present.click 
    end
    #client创建页面填写客户名字（有重复），点击create
    it 'create client fill the same client name' do
      client_page.create_client_button_element.when_present.click
      client_page.hidden_element
      client_page.client_name_element.when_present.append "123"
      client_page.create_button_element.when_present.click
      client_page.client_name_alert.should include "The client already exists:"
    end
    #client创建页面am percentage填写-1%，点击create
    it 'create client fill am percentage with -1%' do
      client_page.create_client_button_element.when_present.click
      client_page.client_am_percentage_element.when_present.append "-1%"
      client_page.create_button_element.when_present.click 
      client_page.client_percentage_alert.should include "Split Percentage must between 0 and 100"
    end
    #client创建页面创建两个am，百分比分别为60,40，点击create
    it 'create client create two ams with percentage 60 and 40' do
      client_page.create_client_button_element.when_present.click
      client_page.client_am_element.when_present.click
      client_page.select_am_element.when_present.click
      client_page.client_am_percentage_element.when_present.append "60"
      client_page.add_edit_am_element.when_present.click
      client_page.client_am_add_element.when_present.click
      client_page.select_am_add_element.when_present.click
      client_page.client_am_add_percentage_element.when_present.append "40"
      client_page.create_button_element.when_present.click 
    end
    #client创建页面CRM status选择trial，不填写end date,点击保存
    it 'create client select crm status to traial and without date' do
      client_page.create_client_button_element.when_present.click
      client_page.client_relation_status_element.when_present.select("Trial")
      client_page.create_button_element.when_present.click 
      client_page.client_enddate_alert.should include "Trial End Date is required."
    end
    #client创建页面CRM status选择trial，end date填写小于今天，点击保存
    it 'create client select crm status to traial and set the date early' do
      client_page.create_client_button_element.when_present.click
      client_page.client_relation_status_element.when_present.select("Trial")
      client_page.input_trial_enddate_element.when_present.append "06/22/2014"
      client_page.create_button_element.when_present.click 
      client_page.client_trial_enddate_alert.should include "Trial end date can not before today"
    end
    #client创建页面CRM status选择trial，end date填写大于今天，点击保存
    it 'create client select crm status to traial and set the date later' do
      client_page.create_client_button_element.when_present.click
      client_page.client_relation_status_element.when_present.select("Trial")
      client_page.input_trial_enddate_element.when_present.append "10/22/2015"
      client_page.create_button_element.when_present.click 
    end
    #client创建页面CRM status选择trial，end date填写今天，点击保存
    it 'create client select crm status to traial and set the date today' do
      client_page.create_client_button_element.when_present.click
      client_page.client_relation_status_element.when_present.select("Trial")
      client_page.input_trial_enddate_element.when_present.click
      client_page.select_today
      client_page.create_button_element.when_present.click 
    end
    #client创建页面CRM status选择trial，amount填写-6，点击保存
    it 'create client select crm status to traial and input trail amount with -6' do
      client_page.create_client_button_element.when_present.click
      client_page.client_relation_status_element.when_present.select("Trial")
      client_page.input_trail_amount_element.when_present.clear
      client_page.input_trail_amount_element.when_present.append "-6"
      client_page.create_button_element.when_present.click 
      client_page.client_trial_enddate_alert.should include "Trial Amount must be larger than 0"
    end
    #client创建页面CRM status选择trial，amount填写97.4，点击保存
    it 'create client select crm status to traial and input trail amount with 97.4' do
      client_page.create_client_button_element.when_present.click
      client_page.client_relation_status_element.when_present.select("Trial")
      client_page.input_trail_amount_element.when_present.clear
      client_page.input_trail_amount_element.when_present.append "97.4"
      client_page.create_button_element.when_present.click 
      client_page.client_trial_enddate_alert.should include "Trial Amount must be an integer."
    end
    #client创建页面CRM status选择trial，amount填写100，点击保存
    it 'create client select crm status to traial and input trail amount with 100' do
      client_page.create_client_button_element.when_present.click
      client_page.client_relation_status_element.when_present.select("Trial")
      client_page.input_trail_amount_element.when_present.clear
      client_page.input_trail_amount_element.when_present.append "100"
      client_page.create_button_element.when_present.click 
    end
    #client创建页面填写所有必填项目，点击cancel
    it 'click cancel btn after fill the client' do
      client_page.create_client_button_element.when_present.click  
      client_page.fill_basic_information
      client_page.fill_account_manager
      client_page.fill_crm
      client_page.fill_contract_information
      client_page.cancel_btn_element.when_present.click
    end
    
     #client创建页面填写所有必填项目，点击create 
    it 'make sure the create client function' do
      sleep 1
      client_page.create_client
      # client_page.wait_until do
      #   client_page.text.should include "at_test"
      # end
    end
    
    #client contacts页面筛选多个客户联系人，点击deactive
    it 'client contacts page deactivate contacts' do
      client_page.goto_client_contacts_page
      client_page.check_choose_first_contact
      client_page.inactive_btn
      #client_page.alert_verify_element.when_present.text.should eql "Set Inactive Success"
    end
    
    #client contacts页面筛选多个inactive客户联系人，点击active 
    it 'client contacts page activate contacts' do
      client_page.goto_client_contacts_page
      client_page.client_contact_status="Inactive"
      client_page.search_client_contact
      client_page.check_choose_first_contact
      client_page.active_btn
      client_page.alert_verify_element.when_present.text.should eql "Set Active Success"
    end

     #客户联系人页面按Promoter状态搜索
    it 'client contacts page filter contacts by Promoter status' do
      client_page.goto_client_contacts_page
      client_page.client_contact_nps="Promoter"
      client_page.search_client_contact
      # client_page.wait_until do
      #   client_page.text.should include "Promoter"
      # end
    end

     #客户联系人页面按Neutral状态搜索
    it 'client contacts page filter contacts by Neutral status' do
      client_page.goto_client_contacts_page
      client_page.client_contact_nps="Neutral"
      client_page.search_client_contact
      #client_page.wait_until do
      #  client_page.text.should include "Neutral"
      #end
    end

     #客户联系人页面按Detractor状态搜索
    it 'client contacts page filter contacts by Detractor status' do
      client_page.goto_client_contacts_page
      client_page.client_contact_nps="Detractor"
      client_page.search_client_contact
      #client_page.wait_until do
      #  client_page.text.should include "Detractor"
      #end
    end

     #客户联系人页面按Unsent状态搜索
    it 'client contacts page filter contacts by Unsent status' do
      client_page.goto_client_contacts_page
      client_page.client_contact_registration="Unsent"
      client_page.search_client_contact
      #client_page.wait_until do
      #  client_page.title.should include "Client Contacts"
      #end
    end

     #客户联系人页面按Sent状态搜索
    it 'client contacts page filter contacts by Sent status' do
      client_page.goto_client_contacts_page
      client_page.client_contact_registration="Sent"
      client_page.search_client_contact
      #client_page.wait_until do
      #  client_page.title.should include "Client Contacts"
      #end
    end

    #客户联系人页面按Registered状态搜索
    it 'client contacts page filter contacts by Registered status' do
      client_page.goto_client_contacts_page
      client_page.client_contact_registration="Registered"
      client_page.search_client_contact
      #client_page.wait_until do
      #  client_page.title.should include "Client Contacts"
      #end
    end

    #客户联系人页面按关键字搜索
    it 'client contacts page filter contacts by keywords' do
      client_page.goto_client_contacts_page
      client_page.client_contact_keywords="at_"
      client_page.search_client_contact
      #client_page.wait_until do
      #  client_page.text.should include "at_"
      #end
    end
    #客户页面改变客户类型并验证
    it 'client_profile_page change type and verify on client page' do
      client_page.goto_client_contacts_page
      client_page.goto_client_subpage "Profile"
      client_page.hidden_element
      client_page.change_client_type "Mutual Fund"
      client_page.backto_client_page
      client_page.keywords_element.when_present.set "湿嗒嗒大"
      client_page.search_element.when_present.click
      client_page.wait_until do
        client_page.client_table_list_type1.should eql "Mutual Fund"
      end    
      # client_page.goto_client_contacts_page
      # client_page.goto_client_subpage "Profile"
      # client_page.change_client_type "Venture Capital"
    end
    #客户的sale notes页面编辑sale notes
    it 'client page sale notes page edit sale note' do
      client_page.goto_client_contacts_page
      client_page.goto_client_subpage "Sale Notes"
      client_page.edit_sale_notes
      #client_page.wait_until do
       # client_page.text.should include "Email"
      #end  
    end
    #客户的sale notes页面删除sale notes
    it 'client page sale notes page delete sale note' do
      client_page.goto_client_contacts_page
      client_page.goto_client_subpage "Sale Notes"
      client_page.hidden_element
      client_page.create_sale_note
      client_page.delete_sale_note
      client_page.sale_note_link_element.when_present.text.should eql "Sale Notes"
    end
    
end
