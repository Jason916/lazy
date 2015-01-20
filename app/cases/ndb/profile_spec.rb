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

    #创建compliace notes,点击保存
    it 'client_profile_page add compliance notes function' do      
       profile_page.select_random_client
       profile_page.text.should include "Compliance Notes"      
       profile_page.add_compliance_notes    
       profile_page.save_compliance_note1_element.when_present.click
    end
    #创建compliance notes,点击取消
    it 'client_profile_page add compliance notes then click cancel btn' do      
       profile_page.select_random_client
       profile_page.text.should include "Compliance Notes"     
       profile_page.add_compliance_notes  
       profile_page.cancel_compliance_note_element.when_present.click
    end
    #删除已存在的compliance notes，弹框点no
    it 'client_profile_page delete compliance notes then click no' do
       profile_page.select_random_client
       profile_page.text.should include "Compliance Notes"
       profile_page.cancel_delete_compliance_notes
    end
    #创建compliance notes,大于三行，点击保存
    it 'client_profile_page create compliance notes and input more than three rows' do
       profile_page.select_random_client
       profile_page.text.should include "Compliance Notes"
       profile_page.add_compliance_note_element.when_present.click
       profile_page.input_client_compliance_message_element.when_present.clear
       profile_page.input_client_compliance_message_element.when_present.append "1@_ q2%$## -#1@_ q2%$## -#1@_ q2%$## 1@_ q2%$## -#1@_ q2%$## -#1@_ q2%$## -#1@_ q2%$## -#1@_ q2%$## -#-# 1@_ q2%$## -# 1@_ q2%$## -# 1@_ q2%$## -# 1@_ q2%$## -#"
       profile_page.save_compliance_note1_element.when_present.click
    end
    #删除已存在cash note
    it 'client_profile_page delete cash note' do 
       profile_page.select_random_client
       profile_page.hidden_element
       profile_page.delete_cash_note
    end
    #创建cash notes，不填写amount、date,点击save
    it 'client_profile_page add cash without amount and date' do
       profile_page.select_random_client
       profile_page.hidden_element
       profile_page.add_cash " "
       profile_page.add_cash_alert_test.when_present.text.should include "请更正下列输入错误:"&&"Date must be a number."
    end
    #amount填写44.4，点击save
    it 'client_profile_page add cash with amount is 44.4' do
       profile_page.select_random_client
       profile_page.hidden_element
       profile_page.add_cash "44.4"
       profile_page.add_cash_alert_test.when_present.text.should include "Amount must be an integer."&&"Date must be a number."
    end
    #amount填写gr,点击save
    it 'client_profile_page add cash with amount is gr' do
       profile_page.select_random_client
       profile_page.hidden_element
       profile_page.add_cash "gr"
       profile_page.add_cash_alert_test.when_present.text.should include "Amount must be an integer."&&"Date must be a number."
    end
    #创建cash note，正确填写amount、date，点击cancel
    it 'client_profile_page fill cash note then cancel' do
        profile_page.select_random_client
        profile_page.hidden_element
        profile_page.add_cash_note_element.when_present.click
        profile_page.input_cash_note_element.when_present.clear
        profile_page.input_cash_note_element.when_present.append "188"
        profile_page.select_cash_date
        profile_page.cancel_edit_btn_element.when_present.click
    end
    #创建cash notes,填写date，不填写amount，点击save
    it 'client_profile_page add cash without amount' do
       profile_page.select_random_client
       profile_page.hidden_element
       profile_page.add_cash_note_element.when_present.click
       profile_page.input_cash_date_element.when_present.click
       profile_page.select_cash_date
       profile_page.save_cash_note_element.when_present.click
       profile_page.add_cash_alert_test.when_present.text.should include "Amount must be larger than 0."
    end
    
    #创建cash note,正确填写amount、date，点击save
    it 'client_profile_page add cash function' do      
       profile_page.select_random_client
       profile_page.hidden_element
       profile_page.add_cash "18757"
       profile_page.add_cash_alert_test.when_present.text.should include "请更正下列输入错误:"&&"Date must be a number."
    end
     #客户页面编辑
    it 'client_profile_page edit basic information' do            
       profile_page.select_random_client
       profile_page.text.should include "Basic Information"
       profile_page.edit_basic_information "100-499人","Venture Capital","若风"
    end
      #客户页面编辑crm
    it 'client_profile_page edit crm ' do
       profile_page.select_random_client
       profile_page.text.should include "CRM"
       profile_page.edit_crm_information "Annual","阿斯达睡觉哦的——ad@dsa","adad adad@ _da #!","21213 2131"
    end
      #客户页面编辑contract information
    it 'client_profile_page edit contract information ' do
       profile_page.select_random_client
       profile_page.text.should include "Contract Information"
       sleep 1
       profile_page.edit_contract_information "1"
    end
     #客户页面编辑account information
    it 'client_profile_page edit account information ' do
       profile_page.select_random_client 
       profile_page.text.should include "Account Manager"
       profile_page.edit_account_information "100"
    end
     #客户页面account information增加am功能
    it 'client_profile_page account information add am function' do
       profile_page.select_random_client
       profile_page.add_am "test_am2","100","off"
    end   

      #客户联系人创建页面不填写任何内容，点击create
    it 'client_client contacts page create contact without data' do
       profile_page.select_random_client  
       profile_page.go_clent_contacts
       profile_page.create_contact_btn_element.when_present.click
       profile_page.create_contact_save_button_element.when_present.click
       profile_page.client_contact_error_alert_element.when_present.text.should include "Name cannot be blank."
    end 
    #客户联系人创建页面mobile填写sfs34534,点击create
    it 'client_client contacts page fill mobile with sfs34534' do
       profile_page.select_random_client  
       profile_page.go_clent_contacts
       profile_page.create_contact_btn_element.when_present.click
       profile_page.input_mobile_element.when_present.append "sfs34534"
       profile_page.create_contact_save_button_element.when_present.click
       profile_page.mobile_alert_element.when_present.text.should include "Mobile must be number."
    end 
    #客户联系人创建页面area code填写ds34，点击create
    it 'client_client contacts page fill area code with ds34' do
       profile_page.select_random_client  
       profile_page.go_clent_contacts
       profile_page.create_contact_btn_element.when_present.click
       profile_page.input_area_code_element.when_present.append "ds34"
       profile_page.create_contact_save_button_element.when_present.click
       profile_page.client_contact_error_alert_element.when_present.text.should include "Name cannot be blank."
    end
    #客户联系人创建页面telephone填写sdf25353,点击create
    it 'client_client contacts page fill telephone with sdf25353' do
       profile_page.select_random_client  
       profile_page.go_clent_contacts
       profile_page.create_contact_btn_element.when_present.click
       profile_page.input_telephone_element.when_present.append "sdf25353"
       profile_page.create_contact_save_button_element.when_present.click
       profile_page.mobile_alert_element.when_present.text.should include "Tel must be number."
    end
    #客户联系人创建页面点击add other type of contact,点击create
    it 'client_client contacts page add other type of contact and click create' do
       profile_page.select_random_client  
       profile_page.go_clent_contacts
       profile_page.create_contact_btn_element.when_present.click
       profile_page.click_add_other_contact_element.when_present.click
       profile_page.create_contact_save_button_element.when_present.click
       #profile_page.verify_other_contact_info_element.when_present.text.should include "QQ"
    end
    #客户联系人创建页面正确填写create contact信息，点击cancel
    it 'client_client contacts page create contact function' do
       profile_page.select_random_client  
       profile_page.go_clent_contacts
       profile_page.create_contact_btn_element.when_present.click
       profile_page.input_contact_chinesename_element.when_present.append "at_weijun"
       profile_page.input_contact_firstname_element.when_present.append "at_weijun"
       profile_page.input_contact_lastname_element.when_present.append "at_weijun"
       profile_page.input_contact_mobilephone_element.when_present.append "1519577#{rand(10000)}"
       profile_page.input_tel_citycode_element.when_present.append "20#{rand(10000)}"
       profile_page.input_tel_telephone_element.when_present.append "5128#{rand(10000)}"
       profile_page.input_tel_extension_element.when_present.append "23"
       profile_page.input_email_other_element.when_present.append "weijun#{rand(10000)}@163.com"
       profile_page.input_weixin_other_element.when_present.append "12313123123"
       profile_page.add_another_contact_element.when_present.click
       profile_page.input_contact_content_element.when_present.append "573654323"
       profile_page.input_contact_position_element.when_present.append "业务经理"
       profile_page.select_contact_nps_element.when_present.select("Promoter")
       profile_page.select_contact_rem_element.when_present.click
       profile_page.click_client_contact_rem_element.when_present.click
       profile_page.select_contact_nps_element.when_present.select("Promoter")
       profile_page.cancel_create_contact_btn_element.when_present.click
    end 
    #client contacts页面删除未做过项目，未注册官网的客户联系人
    it 'client_client contacts page delete client contact' do
       profile_page.select_random_client  
       profile_page.go_clent_contacts
       profile_page.delete_client_contact
    end  
    #client sale notes页面不填写任何内容，点击save
    it 'client_client sale note page save sale note without data' do
       profile_page.select_random_client
       profile_page.go_sale_notes
       profile_page.add_sale_note_element.when_present.click
       profile_page.add_sale_note_element.when_present.click
       #profile_page.client_contact_error_alert_element.when_present.text.should include "Please fix the following input errors:"
    end
    #client sale notes页面不填写date，点击save
    it 'client_client sale note page save sale note without input date' do
       profile_page.select_random_client
       profile_page.go_sale_notes
       profile_page.add_sale_note_element.when_present.click
       profile_page.input_salenotes_element.when_present.append "at_akdjasljd_aks;oldaks@"
       profile_page.input_salenotes_nextstep_element.when_present.append "at_akdjasljd_aks;oldaks@"
       profile_page.add_sale_note_element.when_present.click
       profile_page.client_contact_error_alert_element.when_present.text.should include "Date cannot be blank."
    end
    
    #client sale notes页面不填写sale notes,点击save
    it 'client_client sale note page save sale note without input sale notes' do
       profile_page.select_random_client
       profile_page.go_sale_notes
       profile_page.add_sale_note_element.when_present.click
       profile_page.input_salenotes_date_element.when_present.click
       profile_page.select_salenotes_date_element.when_present.click
       profile_page.input_salenotes_nextstep_element.when_present.append "at_akdjasljd_aks;oldaks@"
       profile_page.add_sale_note_element.when_present.click
       profile_page.client_contact_error_alert_element.when_present.text.should include "Sale Notes cannot be blank."
    end
    #client sale notes页面不填写next step，点击save
    it 'client_client sale note page save sale note without input next step' do
       profile_page.select_random_client
       profile_page.go_sale_notes
       profile_page.add_sale_note_element.when_present.click
       profile_page.input_salenotes_date_element.when_present.click
       profile_page.select_salenotes_date_element.when_present.click
       profile_page.input_salenotes_element.when_present.append "at_akdjasljd_aks;oldaks@"
       profile_page.add_sale_note_element.when_present.click
       profile_page.client_contact_error_alert_element.when_present.text.should include "Next step cannot be blank."
    end
    #client sale notes页面删除sale note,点击no
    it 'client_client sale note page delete sale notes and click no btn' do
       profile_page.select_random_client
       profile_page.go_sale_notes
       profile_page.delete_sale_notes
    end
    
    #客户页面创建联系人功能
    it 'client_client contacts page create contact function' do
       profile_page.select_random_client  
       profile_page.hidden_element
       profile_page.create_contact 
       profile_page.title_text_element.when_present.text.should eql "Basic Information"
    end 
    #客户联系人创建页面填写客户邮箱，该邮箱为重复邮箱，点击create
    it 'client_client contacts page create contact with the email has already used' do
       profile_page.select_random_client  
       profile_page.hidden_element
       profile_page.client_contacts
       profile_page.create_contact_button
       profile_page.client_contact_email= "capvision_1c@163.com"
       profile_page.create_contact_save_button
       sleep 1
       profile_page.text.should include "This Email is already being used by the following client contact"
    end
    #客户页面创建sale note功能
    it 'client_sale notes page create sale note function' do
       profile_page.select_random_client 
       profile_page.hidden_element
       profile_page.create_sale_note 
    end
    #客户页面项目链接测试
    it 'client_profile_page the links of projects test' do
       profile_page.select_random_client 
       profile_page.hidden_element 
       profile_page.projects_link_test 
       profile_page.text.should include "International Consultation"
    end
      #客户页面account information am百分比大于100
    it 'client_profile_page account information percentage greater than 100' do
       profile_page.select_random_client
       profile_page.hidden_element
       profile_page.edit_account_information "101"
       profile_page.error_info("1").should eql "Split Percentage must between 0 and 100"
       profile_page.error_info("2").should eql "percentage和必须为100"
    end
      #客户页面account information am百分比小于100
    it 'client_profile_page account information percentage less than 100' do
       profile_page.select_random_client
       profile_page.hidden_element
       profile_page.edit_account_information "99"
       profile_page.error_info("1").should eql "percentage和必须为100"
    end
    #客户页面account information am百分比的和大于100
    it 'client_profile_page account information the total of percentage greater than 100' do
       profile_page.select_random_client
       profile_page.hidden_element
       profile_page.edit_account_information "90"
       profile_page.add_am "kidd","90","on"
       sleep 2
       profile_page.am_alert_info_element.when_present.text.should include "percentage和必须为100"
    end
    #客户页面account information am百分比的和小于100
    it 'client_profile_page account information the total of percentage less than 100' do
       profile_page.select_random_client
       profile_page.hidden_element
       profile_page.edit_account_information "45"
       profile_page.add_am "kidd","45","on"
       profile_page.am_alert_info_element.when_present.text.should include "percentage和必须为100"
    end
     #客户页面account information am不能重复
    it 'client_profile_page account information AM should unique' do
       profile_page.select_random_client
       profile_page.hidden_element
       profile_page.edit_account_information "50"
       profile_page.add_am "test_am1","50","on"
       sleep 3
       profile_page.error_info("1").should eql "AM不能重复"
    end
    #客户页面编辑compliance note
    it 'client_profile_page edit compliance notes' do
       profile_page.select_random_client
       profile_page.hidden_element
       profile_page.edit_compliance_notes "AT_testing 1@_ q #"
       profile_page.compliance.should include "AT_testing"
    end
    #客户页面删除compliance note
    it 'client_profile_page delete compliance notes' do
       profile_page.select_random_client
       profile_page.hidden_element
       profile_page.delete_compliance_notes
       # profile_page.wait_until do
       #   profile_page.title.should include "Capvision"
       # end
    end
    #编辑已存在cash note
    it 'client_profile_page edit cash note' do
       profile_page.select_random_client
       profile_page.hidden_element
       profile_page.edit_cash_note "123456789"
       profile_page.wait_until do
         profile_page.cash_note.should eql "$123456789"
       end
    end
    #客户页面选择T&C
    it 'client_profile_page choose the T&C' do
       profile_page.select_random_client
       profile_page.hidden_element
       profile_page.choose_tnc
       profile_page.wait_until do
         profile_page.tnc.text.should eql "凯盛专家网络条款协议_V4.0"
       end
    end
    
    #创建cash note,正确填写amount、date，点击save
    it 'client_profile_page create cash note' do      
       profile_page.select_random_client
       profile_page.hidden_element
       profile_page.add_date
    end
    
    #点击reveal client name
    it 'client_profile_page click the reveal client name ' do
      profile_page.select_random_client
      profile_page.hidden_element
      profile_page.click_reveal_client_name_element.when_present.click
      profile_page.click_reveal_client_name_element.when_present.click
    end
    
    #点击special requirement
    it 'client_profile_page click the special requirement ' do
      profile_page.select_random_client
      profile_page.hidden_element
      profile_page.click_special_requirement_element.when_present.click
      profile_page.click_special_requirement_element.when_present.click
    end

    
    
    
end
