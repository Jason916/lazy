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
    #进入contact页面
    it 'should direct to contact page ' do
      contact_page.wait_until do
        contact_page.contact_title.should eql "Contacts"
      end
    end

    #按Consulting Firm状态搜索联系人
    it 'should filter contacts by Consulting Firm status ' do
      contact_page.type="Consulting Firm"
      contact_page.filter
      contact_page.contact_table_list_status.should eql "Consulting Firm"
    end

    #按Private Equity状态搜索联系人
    it 'should filter contacts by Private Equity status ' do
      contact_page.type="Private Equity"
      contact_page.filter
      contact_page.contact_table_list_status.should eql "Private Equity"
    end
    #按Hedge Fund状态搜索联系人
    it 'should filter contacts by Hedge Fund status ' do
      contact_page.type="Hedge Fund"
      contact_page.filter
      contact_page.contact_table_list_status.should eql "Hedge Fund"
    end
    #按Venture Capital状态搜索联系人
    it 'should filter contacts by Venture Capital status ' do
      contact_page.type="Venture Capital"
      contact_page.filter
      contact_page.contact_table_list_status.should eql "Venture Capital"
    end
    #按Mutual Fund状态搜索联系人
    it 'should filter contacts by Mutual Fund status ' do
      contact_page.type="Mutual Fund"
      contact_page.filter
      contact_page.contact_table_list_status.should eql "Mutual Fund"
    end

    #按Corporate状态搜索联系人
    it 'should filter contacts by Corporate status ' do
      contact_page.type="Corporate"
      contact_page.filter
      contact_page.contact_table_list_status.should eql "Corporate"
    end
    #按Financial Firm状态搜索联系人
    it 'should filter contacts by Financial Firm status ' do
      contact_page.type="Financial Firm"
      contact_page.filter
      contact_page.contact_table_list_status.should eql "Financial Firm"
    end
    #按Others状态搜索联系人
    it 'should filter contacts by Others status ' do
      contact_page.type="Others"
      contact_page.filter
      contact_page.contact_table_list_status.should eql "Others"
    end
    #按照地理位置搜索联系人
    it 'should filter contacts by location ' do
      contact_page.go_contact_page 
      contact_page.wait_until do
        contact_page.contact_title.should eql "Contacts"
      end
      contact_page.filter_by_location  
    end
    
    #client profile页面添加一条contract information
    it 'contact page edit contact information' do
      contact_page.goto_contacts_profile_page 
      contact_page.wait_until do
        contact_page.title.should eql "test_grass - Capvision"
      end
      contact_page.edit_contacts_mobile
      sleep 3
      contact_page.edit_contacts_tel
      sleep 3
      contact_page.edit_contacts_email
    end
    
    #contact profile页面将客户联系人加入项目add to project
    # it 'contact page add project function',:test do
    #   contact_page.km_login
    #   contact_page.goto_contacts_profile_page 
    #   contact_page.wait_until do
    #     contact_page.title.should eql "test_grass - Capvision"
    #   end
    #   sleep 2
    #   contact_page.add_project "test_0709_DS1407090008"
    # end
    #联系人页面删除note信息
    it 'contact_profile_page delete note information' do
      contact_page.goto_contacts_profile_page 
      contact_page.delete_note_information
      contact_page.wait_until do
        contact_page.title.should include "Capvision"
      end
    end
    #联系人页面添加note信息
    it 'contact_profile_page add note information' do
      contact_page.goto_contacts_profile_page
      contact_page.add_note_information="AT_testing @#!~djadkj_ das_"
      contact_page.click_submit_btn
      contact_page.wait_until do
        contact_page.text.should include "AT_testing @"
      end
    end
    #联系人页面编辑基本信息
    it 'contact_profile_page edit basic information' do
      contact_page.goto_contacts_profile_page
      contact_page.edit_basic_information
      contact_page.wait_until do
        sleep 2
        contact_page.text.should include "蜘蛛侠"
      end
    end
    #联系人页面编辑preference
    it 'contact_profile_page edit preference' do
      contact_page.goto_contacts_profile_page
      contact_page.edit_preference
      contact_page.wait_until do
        contact_page.title.should include "Capvision"
      end
    end
    #联系人页面添加其他联系类型
    it 'contact_profile_page add other contact type' do
      contact_page.goto_contacts_profile_page
      sleep 2
      contact_page.add_other_contact
      contact_page.wait_until do
        contact_page.text.should include "MSN"
      end
    end
    #联系人transfer时的客户未填的alert信息
    it 'contact_profile_page transfer verification of client alert' do
      contact_page.goto_contacts_profile_page 
      contact_page.click_transfer_btn
      contact_page.contact_transfer_email="1@1#{rand(10000)}.com"
      contact_page.save
      contact_page.transfer_alert.should eql "Transfer to same or empty client is invalid."
    end
    #联系人transfer时的客户未填的email信息
    it 'contact_profile_page transfer verification of email alert' do
      contact_page.goto_contacts_profile_page 
      contact_page.click_transfer_btn
      contact_page.contact_transfer_client "asd"
      contact_page.save
      contact_page.transfer_alert.should eql "Email can not be empty."
    end
    #contact profile页面发送web account
    it 'contact_profile_page send web account' do
      contact_page.goto_contact_page "571"
      contact_page.click_send_webaccount_btn_element.when_present.click
      sleep 2
      contact_page.click_send_btn_element.when_present.click
      sleep 2
      contact_page.text.should include "Capvision"
    end
    #contact profile页面发送客户联系人激活邮件
    it 'contact_profile_page send web invitation function' do
      contact_page.goto_contact_page "224"
      sleep 1
      contact_page.click_web_invitation_btn
      sleep 2
      contact_page.wait_until do
        contact_page.text.should include "Send Web Invitation"
      end
    end
    #contact profile页面编辑preference,选择多个industry coverage，点击保存
    it 'contact_profile_page edit preference and select some industry coverages' do
      contact_page.goto_contacts_profile_page 
      contact_page.edit_contact_preference_element.when_present.click
      contact_page.contact_industry_coverage_element.when_present.click
      contact_page.select_industry_element.when_present.click
      contact_page.contact_industry_coverage_element.when_present.click
      contact_page.select_other_industry_element.when_present.click
      contact_page.edit_contact_preference_element.when_present.click
    end
    #contact profile页面编辑preference，adept language选择或取消多个语言，点击保存
    it 'contact_profile_page edit preference and select two adept languages' do
      contact_page.goto_contacts_profile_page
      contact_page.edit_contact_preference_element.when_present.click
      contact_page.select_adept_language_element.when_present.click
      contact_page.select_other_adept_language_element.when_present.click
      contact_page.edit_contact_preference_element.when_present.click
    end  
  
    #contact profile页面创建note information（多于三行）
    it 'contact_profile_page create note information with more than three rows' do
      contact_page.goto_contacts_profile_page 
      contact_page.add_note_information_element.when_present.append "asdas asdas asdas dasdas asdas dasdas asdasda sdas asdas dasdas asdasd asdas asdasda sdas asda sdasdas asdas dasdas asda sdasdas"
      contact_page.click_submit_btn_element.when_present.click
    end  
    
    #contact profile页面点击more（大于三行的note information）
    it 'contact_profile_page click more link at note information' do
      contact_page.goto_contacts_profile_page 
      contact_page.click_more_or_packup_link_element.when_present.click
      contact_page.click_more_or_packup_link_element.when_present.text.should eql "Pack up"
    end
    
    #contact profile页面点击packup(大于三行的note information)
    it 'contact_profile_page click packup link at note information' do 
      contact_page.goto_contacts_profile_page 
      contact_page.click_more_or_packup_link_element.when_present.click
      contact_page.click_more_or_packup_link_element.when_present.click
      contact_page.click_more_or_packup_link_element.when_present.text.should eql "More"
    end
    
    #按照mobile搜索联系人
    it 'contact_search_page filter by mobile' do
      contact_page.input_keyword="15618886543"
      contact_page.filter
      sleep 2
      contact_page.wait_until do
        contact_page.text.should include "15618886543"
      end
    end
    #按照email搜索联系人
    it 'contact_search_page filter by email' do
      contact_page.input_keyword="钢铁侠"
      contact_page.filter
      sleep 2
      contact_page.wait_until do
        contact_page.text.should include "钢铁侠"
      end
    end
            
end
