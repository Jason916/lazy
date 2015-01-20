# encoding: utf-8
require File.expand_path 'app/cases/spec_helper'

describe 'international page', :international do

	let(:international_page)do 
    	home_page = $navi.goto_home_page
    	login_page = home_page.direct_to_login_page
    	home_page = login_page.login "admin","1234"
    	international_page = home_page.direct_to_international_page
   end
   it 'create an I-consultation' do
      #建项目填写完整信息创建项目验证
    	international_page.create_int
      sleep 2
      international_page.h1_element.when_present.text.should include "xtest_INT_ryan"
      #通过项目名进行验证
   end
   it "INT delete cancel" do
         international_page.button_search_element.when_present.click
         message = international_page.confirm(false) do
         international_page.delete_first_project_element.when_present.click
         end
         message.should == "Are you sure you wish to delete this project?"
   end
   it "INT delete comfirm" do
         international_page.button_search_element.when_present.click
         message = international_page.alert do
         international_page.delete_first_project_element.when_present.click
         end
         message.should == "Are you sure you wish to delete this project?"
   end
   it "INT include completed task can not be deleted" do
      #包含completed task的项目无法被删除，有相应的提示
         international_page.search_by_status_element.when_present.select "Complete"
         international_page.button_search_element.when_present.click
         message = international_page.alert do
         international_page.delete_first_project_element.when_present.click
         end
         message.should == "You can not delete this project, because it has completed tasks."
   end
   it 'create an I-consultation' do
      international_page.create_int
      sleep 2
      international_page.h1_element.when_present.text.should include "xtest_INT_ryan"
   end
   #编辑contact
   it 'edit client & contact' do
      international_page.enter_int_task_list
      international_page.project_info_element.when_present.click
      international_page.edit_client_with_contact
   end  
   it 'change one I-consultation status to [on hold]' do
      #international consultation list页面对单个项目执行on hold操作
      international_page.search_all_status_int
      international_page.project_checkbox0_element.click
      international_page.list_project_action_element.when_present.select "On Hold"
      international_page.button_update_element.when_present.click
      international_page.on_hold_note_element.when_present.select "Change of project direction"
      international_page.pop_up_save_element.when_present.click
      #sleep 2
      #international_page.ident_change_status_element.when_present.text.should include "changed successfully"
   end
   it 'change several I-consultations status to [on hold]' do
      #international consultation list页面对多个项目执行on hold操作
      international_page.search_all_status_int
      international_page.project_checkbox0_element.click
      international_page.project_checkbox1_element.click
      international_page.list_project_action_element.when_present.select "On Hold"
      message = international_page.alert do
        international_page.button_update_element.when_present.click
      end
      message.should == "You cannot choose multi-project for this operation."
   end	
   it 'change one I-consultation status to [invalid]' do
      #international consultation list页面对单个项目执行invalid操作
      international_page.search_all_status_int
      international_page.project_checkbox0_element.click
      international_page.list_project_action_element.when_present.select "Invalid"
      international_page.button_update_element.when_present.click
      international_page.invalid_note_element.when_present.set "test"
      international_page.pop_up_save_element.when_present.click
      #sleep 2
      #international_page.ident_change_status_element.when_present.text.should include "changed successfully"
   end
   it 'change several I-consultations status to [invalid]' do
      #international consultation list页面对多个项目执行invalid操作
      international_page.search_all_status_int
      international_page.project_checkbox0_element.click
      international_page.project_checkbox1_element.click
      international_page.list_project_action_element.when_present.select "Invalid"
      message = international_page.alert do
        international_page.button_update_element.when_present.click
      end
      message.should == "You cannot choose multi-project for this operation."
   end
   it 'change one I-consultation status to [complete]' do
      #international consultation list页面对单个项目执行complete操作
      international_page.search_all_status_int
      international_page.project_checkbox0_element.click
      international_page.list_project_action_element.when_present.select "Complete"
      international_page.button_update_element.when_present.click
      international_page.complete_note_element.when_present.set "test"
      international_page.complete_email_confirm_element.when_present.click
      international_page.complete_contact_element.when_present.set "test"
      international_page.pop_up_save_element.when_present.click
      # sleep 5
      # international_page.text.should include "status changed successfully"
   end
   it 'change several I-consultations status to [complete]' do
      #international consultation list页面对多个项目执行complete操作
      international_page.search_all_status_int
      international_page.project_checkbox0_element.click
      international_page.project_checkbox1_element.click
      international_page.list_project_action_element.when_present.select "Complete"
      message = international_page.alert do
        international_page.button_update_element.when_present.click
      end
      message.should == "You cannot choose multi-project for this operation."
   end
   it 'change one I-consultation status to [in process]' do
      #international consultation list页面对单个项目执行in process操作
      international_page.search_all_status_int
      international_page.project_checkbox0_element.click
      international_page.list_project_action_element.when_present.select "In Process"
      international_page.button_update_element.when_present.click
      #international_page.ident_change_status_element.when_present.text.should include "status changed successfully"
   end
   it 'change several I-consultations status to [in process]' do
      #international consultation list页面对多个项目执行in process操作
      international_page.search_all_status_int
      international_page.project_checkbox0_element.click
      international_page.project_checkbox1_element.click
      international_page.list_project_action_element.when_present.select "In Process"
      international_page.button_update_element.when_present.click
   end
   it 'set project CA to NA' do
      #将项目的CA设为NA
      international_page.clear_project_ca
   end
   it 'add consultants to I-consultation' do
      #添加一个顾问到国际化项目
      international_page.enter_int_task_list
      international_page.add_consultant_operation
   end
   it 'click consultant link' do
      international_page.enter_int_task_list
      international_page.search_for_definite_consultant
      international_page.consultant_link0_element.when_present.click
      sleep 2
      international_page.attach_to_window(:title=>"Han - Capvision")
   end

   it 'compliance approve action' do
      international_page.enter_int_task_list
      international_page.set_ca
      international_page.task_list_element.when_present.click
      international_page.add_consultant_operation
      #message = international_page.alert do
      #international_page.approval_icon_element.when_present.click
      #end
      #message.should == "Are you sure this task is approved?"
   end
   it 'change several I-consultation tasks status to [recommended]' do
      #consultation task list recommend页面对多个task执行recommend操作
      international_page.clear_project_ca
      international_page.task_list_element.when_present.click
      international_page.task_checkbox0_element.when_present.click
      international_page.task_checkbox1_element.when_present.click
      international_page.task_action_element.when_present.select "Recommended"
      international_page.task_update_element.when_present.click
      international_page.change_status_element.when_present.click
      #sleep 2
      #international_page.text.should include "Change task status successfully"
   end
   it 'arg1 consultant name identy' do
      #安排访谈step1页面顾问名链接验证
      international_page.goto_first_task_arg1_page
      international_page.arg_step1_consultant_namelink_element.when_present.click
      international_page.attach_to_window(:title=>"Han - Capvision")
   end
   it 'arg1 consultation date necessary identy' do
      #安排访谈step1页面访谈时间必填验证
      international_page.goto_first_task_arg1_page
      international_page.arg1_consultation_date_clear
      international_page.btn_arg1_next_element.when_present.click
      international_page.arg1_consultation_date_alert_element.when_present.text.should include "Date"
   end
   it 'arg1 consultation date must be set in future' do
      #安排访谈step1页面访谈时间必须是将来时间
      international_page.goto_first_task_arg1_page
      international_page.arg1_consultation_date_setToPast
      international_page.btn_arg1_change_status_element.when_present.click
      international_page.arg1_consultation_date_past_alert_element.when_present.text.should include "Date can not sooner than now."
   end
   it 'arg1 nick name necessary identy' do
      #安排访谈step1，Nick name必填
      international_page.goto_first_task_arg1_page
      international_page.nick_name0_element.when_present.clear
      international_page.btn_arg1_change_status_element.when_present.click
      international_page.arg1_nickname_alert_element.when_present.text.should include "can not be empty."
   end
   it 'arg1 type of interview necessary identy' do
      #安排访谈step1，type of interview必填
      international_page.goto_first_task_arg1_page
      international_page.arg1_typeOfInterview_element.when_present.select "-Please choose-"
      international_page.btn_arg1_change_status_element.when_present.click
      international_page.arg1_typeOfInterview_alert_element.when_present.text.should include "Interview Type"
   end
   it 'arg1 filling completed info and click cancel' do
      #安排访谈step1，取消访谈安排
      international_page.goto_first_task_arg1_page
      international_page.fillin_arrange_option
      international_page.btn_arg1_cancel_element.when_present.click
      international_page.verify_task_list_element.when_present.text.should include "Task List"
   end
   it 'arg1 filling completed info and click change status' do
      #安排访谈step1，改变访谈状态到arrange
      international_page.goto_first_task_arg1_page
      international_page.fillin_arrange_option
      international_page.btn_arg1_change_status_element.when_present.click
      international_page.verify_task_list_element.when_present.text.should include "Task List"
   end
   it 'arg1 filling completed info and click next' do
      #安排访谈step1，填写完整信息并点击next
      international_page.goto_first_task_arg1_page
      international_page.fillin_arrange_option
      international_page.btn_arg1_next_element.when_present.focus
      international_page.btn_arg1_next_element.when_present.click
      international_page.email_to_element.when_present.text.should eql "Email To:"
   end
   it 'arg2 send calendar checkbox identy' do
      #安排访谈step2，发送calendar选框点击验证
      international_page.goto_arg2_page
      international_page.arg2_sendCalendar_element.when_present.click
      international_page.arg2_sendCalendar_element.when_present.click
      international_page.arg2_calendarTo_element.when_present.text.should include "Calendar"
   end
   it 'arg2 btn previous identy' do
      #安排访谈step2，回到上一步操作
      international_page.goto_arg2_page
      international_page.btn_arg2_previous_element.when_present.click
      #international_page.previous_identy_element.when_present.text.should include "Consultant:"
   end
   it 'arg2 btn cancel identy' do
      #安排访谈step2，取消访谈安排操作
      international_page.goto_arg2_page
      international_page.btn_arg2_cancel_element.when_present.click
      #international_page.verify_task_list_element.when_present.text.should include "Task List"
   end
   it 'arg2 btn send email identy' do
      #安排访谈step2，点击发送邮件
      international_page.goto_arg2_page
      international_page.choose_mail_to_send
      international_page.btn_arg2_sendEmailToClient_element.when_present.click
      international_page.btn_arg2_popup_ok_element.when_present.click
      international_page.arg2_toConsultant_alert_element.when_present.text.should include "Consultant:"
   end 
   it 'arg2 checkbox [send email to consultant] identy' do
      #安排访谈step2，发送邮件给顾问选框点击验证
      international_page.goto_arg2_page
      international_page.choose_mail_to_send
      international_page.btn_arg2_sendEmailToClient_element.when_present.click
      international_page.btn_arg2_popup_ok_element.when_present.click
      international_page.arg2_toConsultant_byEmail_element.when_present.click
      international_page.arg2_toConsultant_byEmail_alert_element.when_present.text.should eql "Email To:"
   end
   it 'arg2 cancel [send email to consultant] identy' do
      #安排访谈step2，取消发送邮件给顾问
      international_page.goto_arg2_page
      international_page.choose_mail_to_send
      international_page.btn_arg2_sendEmailToClient_element.when_present.click
      international_page.btn_arg2_popup_ok_element.when_present.click
      international_page.arg2_toConsultant_byEmail_element.when_present.click
      international_page.btn_arg2_toConsultant_cancel_element.when_present.click
      international_page.verify_task_list_element.when_present.text.should include "Task List"
   end 
   it 'arg2 submit [send email to consultant] identy' do
      #安排访谈step2，发送邮件给顾问
      international_page.goto_arg2_page
      international_page.choose_mail_to_send
      international_page.btn_arg2_sendEmailToClient_element.when_present.click
      international_page.btn_arg2_popup_ok_element.when_present.click
      international_page.arg2_toConsultant_byEmail_element.when_present.click
      international_page.btn_arg2_toConsultant_submit_element.when_present.click
      international_page.arg2_toConsultant_sendEmailSuc_alert_element.when_present.text.should include "Email send successfully."
   end
   it 'complete task consultation date necessary identy' do
      #关闭访谈，访谈时间必填
      international_page.goto_complete_page
      international_page.complete_consultationDate_element.when_present.clear
      sleep 2
      international_page.btn_complete_submit_element.when_present.click
      international_page.all_alerts_element.when_present.text.should include "Consultation Date cannot be blank."
   end
   it 'complete task time order' do
      #关闭访谈，时序验证
      international_page.goto_complete_page
      international_page.set_startAndEndTime
      international_page.btn_complete_submit_element.when_present.click
   end
   it 'complete task type of interview necessary identy' do
      #关闭访谈，type of interview必填
      international_page.goto_complete_page
      international_page.complete_typeOfInterview_element.when_present.select "-Please choose-"
      international_page.btn_complete_submit_element.when_present.click
      international_page.all_alerts_element.when_present.text.should include "Type Of Interview cannot be blank."
   end
   it 'complete task client hour necessary identy' do
      international_page.goto_complete_page
      international_page.complete_clientHour_element.when_present.clear
      sleep 2
      international_page.btn_complete_submit1_element.when_present.click
      international_page.all_alerts_element.when_present.text.should include "Client Hour cannot be blank."
   end
   it 'complete task client hour only for number identy' do
      international_page.goto_complete_page
      international_page.complete_clientHour = "ABC"
      international_page.btn_complete_submit_element.when_present.click
      international_page.complete_clientHour_alert_element.when_present.text.should include "Client Hour must be a number."
   end 
   it 'complete task billing notes necessary identy' do
      international_page.goto_complete_page
      international_page.complete_billingNotes_element.when_present.clear
      sleep 2
      international_page.btn_complete_submit_element.when_present.click
      sleep 3
      international_page.all_alerts_element.when_present.text.should include "Billing Notes cannot be blank."
   end 
   it 'complete task consultant hour necessary identy' do
      international_page.goto_complete_page
      international_page.complete_consultantHour_element.when_present.clear
      sleep 2
      international_page.btn_complete_submit_element.when_present.click
      international_page.all_alerts_element.when_present.text.should include "Consultant Hour cannot be blank."
   end
   it 'complete task consultant hour only for number identy' do
      international_page.goto_complete_page
      international_page.complete_consultantHour_element.when_present.set "ABC"
      international_page.btn_complete_submit_element.when_present.click
      international_page.all_alerts_element.when_present.text.should include "Consultant Hour must be a number."
   end
   it 'complete task cancel identy' do
      international_page.goto_complete_page
      international_page.complete_with_necInfo
      international_page.btn_complete_cancel_element.when_present.click
      international_page.verify_task_list_element.when_present.text.should include "Task List"
   end
   it 'complete task submit identy' do
      international_page.goto_complete_page
      international_page.hidden_element
      international_page.complete_with_necInfo
      international_page.client_rate_element.when_present.set "1000"
      international_page.btn_complete_submit_element.when_present.click
      international_page.task_status_alert_element.when_present.text.should include "Completed"
   end  
   it 'complete task check send feedback email to client' do
      international_page.goto_complete_page
      international_page.complete_with_necInfo
      international_page.chb_sendFebakEmailToClient_element.when_present.click
      international_page.btn_complete_submit_element.when_present.click
      #international_page.sendFebakEmailToClient_alert_element.when_present.text.should include "Send Feedback Email Successful."
   end   
   it 'unsuccessful task cancel submit' do
      international_page.goto_unsuccessful
      international_page.btn_unsuccessful_cancel_element.when_present.click
      international_page.verify_task_list_element.when_present.text.should include "Task List"
   end
   it 'unsuccessful task check send feedback email to consultant' do
      international_page.goto_unsuccessful
      international_page.chb_sendFebakEmailToConsultant_element.when_present.click
      international_page.btn_unsuccessful_submit_element.when_present.click
      #international_page.sendFebakEmailToConsultant_alert_element.when_present.text.should include "Send Email Successful. "
   end
   it 'pending page consultant name link' do
      international_page.enter_int_task_list
      international_page.search_for_definite_consultant
      international_page.goto_pending
      international_page.pendingPage_consultantLink_element.when_present.click
      international_page.attach_to_window(:title=>"Han - Capvision")
   end
   it 'cancel pending' do
      international_page.enter_int_task_list
      international_page.goto_pending
      international_page.btn_pendingPage_cancel_element.when_present.click
      international_page.verify_task_list_element.when_present.text.should include "Task List"
   end
   it 'submit pending with sending email' do
      international_page.enter_int_task_list
      international_page.goto_pending
      international_page.chb_pendingPage_sendEmailToConsultant_element.when_present.click
      international_page.btn_pendingPage_submit_element.when_present.click
      #international_page.pendingPage_sendEmailToConsultant_alert_element.when_present.text.should include "Change task status successfully."
   end
   it 'change one task to other status' do
      international_page.change_status_other
      international_page.task_action_element.when_present.select "Not Contacted"
      international_page.task_update_element.when_present.click
      international_page.task_checkbox0_element.when_present.click
      international_page.task_action_element.when_present.select "10mins test"
      international_page.task_update_element.when_present.click
      international_page.task_status_element.when_present.text.should include "10mins test"
      international_page.task_checkbox0_element.when_present.click
      international_page.task_action_element.when_present.select "Client canceled"
      international_page.task_update_element.when_present.click
      international_page.task_status_element.when_present.text.should include "Client canceled"
      international_page.task_checkbox0_element.when_present.click
      international_page.task_action_element.when_present.select "Consultant canceled"
      international_page.task_update_element.when_present.click
      international_page.task_status_element.when_present.text.should include "Consultant canceled"
      international_page.task_checkbox0_element.when_present.click
      international_page.task_action_element.when_present.select "Not interviewed"
      international_page.task_update_element.when_present.click
      international_page.task_status_element.when_present.text.should include "Not interviewed"
      international_page.task_checkbox0_element.when_present.click
      international_page.task_action_element.when_present.select "Rescheduled"
      international_page.task_update_element.when_present.click
      international_page.task_status_element.when_present.text.should include "Rescheduled"
   end
   it 'change several I-consultation tasks status to [arranged]' do
      #consultation task list arrange页面对多个task执行arrange操作
      international_page.enter_int_task_list
      international_page.task_checkbox0_element.when_present.click
      international_page.task_checkbox1_element.when_present.click
      international_page.task_action_element.when_present.select "Arranged"
      international_page.task_update_element.when_present.click
      international_page.arrange_date0_element.when_present.clear
	   international_page.arrange_date0_element.when_present.append "23:59"
	   international_page.nick_name0_element.when_present.clear
	   international_page.nick_name0_element.when_present.append "Ryan"
      international_page.type_of_interview0_element.when_present.select "Phone"
      international_page.arrange_date1_element.when_present.set "23:59"
      international_page.nick_name1_element.set "Ryan"
      international_page.type_of_interview1_element.select "Phone"
      international_page.change_status_element.when_present.click
      #sleep 2
      #international_page.text.should include "Change task status successfully"
   end

   it 'change several I-consultation tasks status to [completed]' do
      #consultation task list complete页面对多个task执行complete操作
      international_page.enter_int_task_list
      international_page.task_checkbox0_element.when_present.click
      international_page.task_checkbox1_element.when_present.click
      international_page.task_action_element.when_present.select "Completed"
      international_page.task_update_element.when_present.click
   end
   it 'completed task necessary consulation date identification' do
      international_page.goto_complete_page
      international_page.consultation_date_element.when_present.set "2015-10-10"
      international_page.complete_int_btn_element.when_present.click
      international_page.verify_task_list_element.when_present.text.should include "Task List"
   end
   #节点处理
   it 'completed task necessary type of interview identification verify' do
      international_page.enter_int_task_list
      international_page.task_checkbox0_element.when_present.click
      international_page.task_action_element.when_present.select "Recommended"
      international_page.task_update_element.when_present.click
      international_page.change_status_element.when_present.focus
      international_page.change_status_element.when_present.click
      international_page.task_checkbox0_element.when_present.click
      international_page.task_action_element.when_present.select "Arranged"
      international_page.task_update_element.when_present.click
      international_page.arrange_date0_element.when_present.set "00:00"
      international_page.nick_name0_element.when_present.set "test_abc"
      international_page.type_of_interview0_element.when_present.select "Phone"
      international_page.change_status_element.when_present.focus
      international_page.change_status_element.when_present.click
      international_page.task_checkbox0_element.when_present.click
      international_page.task_action_element.when_present.select "Completed"
      international_page.task_update_element.when_present.click
      international_page.complete_with_necInfo
      international_page.submit_element.when_present.click
   end

   it 'completed task necessary type of interview identification' do
      international_page.goto_complete_page
      international_page.type_of_interview_element.when_present.select "-Please choose-"
      international_page.task_start_time_element.when_present.set "00:00"
      international_page.complete_int_btn_element.when_present.click
      international_page.all_alerts_element.when_present.text.should include "Type Of Interview cannot be blank."
   end
   it 'completed task necessary client hour identification' do
      international_page.goto_complete_page
      international_page.task_start_time_element.when_present.set "00:00"
      international_page.client_hour_element.when_present.clear
      international_page.complete_int_btn_element.when_present.click
      international_page.all_alerts_element.when_present.text.should include "Client Hour cannot be blank"
   end
   it 'completed task necessary billing notes identification' do
      international_page.goto_complete_page
      international_page.task_start_time_element.when_present.set "00:00"
      international_page.billing_notes_element.when_present.clear
      international_page.complete_int_btn_element.when_present.click
      international_page.all_alerts_element.when_present.text.should include "cannot be blank"
   end
   it 'completed task necessary consultant hour identification' do
      international_page.goto_complete_page
      international_page.task_start_time_element.when_present.set "00:00"
      international_page.consultant_hour_element.when_present.clear
      international_page.complete_int_btn_element.when_present.click
      international_page.all_alerts_element.when_present.text.should include "cannot be blank"
   end
   it 'edit task and save' do
      international_page.goto_complete_page
      international_page.type_of_interview_element.when_present.select "In-Person"
      international_page.client_hour_element.when_present.set"2"
      international_page.billing_notes_element.when_present.set"test"
      international_page.consultant_hour_element.when_present.set"2"
      international_page.complete_int_btn_element.when_present.click
   end
   
   it 'edit task and cancel' do
      international_page.goto_complete_page
      international_page.type_of_interview_element.when_present.select "In-Person"
      international_page.client_hour = "2"
      international_page.billing_notes = "test"
      international_page.consultant_hour_element.when_present.set"2"
      international_page.cancel_int_btn_element.when_present.click
   end
   
   it 'recommend consultant not proper for training alert' do
      international_page.enter_int_task_list
      international_page.set_training
      international_page.task_checkbox1_element.when_present.click
      international_page.recommend_task
      #international_page.recommend_alert_element.when_present.text.should include "Training does not match"
   end
   it 'recommend consultant step1 namelink' do
      international_page.goto_first_task_rec1_page
      international_page.rec_step1_consultant_namelink_element.when_present.click
      international_page.attach_to_window(:title=>"Han - Capvision")
   end
   it 'recommend step1 id necessary identy' do
      international_page.goto_first_task_rec1_page
      international_page.rec_step1_id_element.when_present.clear
      international_page.change_status_element.when_present.click
      international_page.id_alert_element.when_present.text.should include "ID"
   end
   # it 'recommend step id necessary identy' do
   #    international_page.enter_int_task_list
   #    international_page.task_checkbox0_element.when_present.click
   #    international_page.recommend_task
   #    international_page.rec_step1_id = "111"
   #    international_page.change_status_element.when_present.click
   #    #international_page.id_alert_element.when_present.text.should include "ID"
   # end
   it 'recommend step1 choose work exp' do
      international_page.goto_first_task_rec1_page
      international_page.rec1_choose_workexp_element.when_present.click
      international_page.other_workexp_element.when_present.click
      international_page.workexp_pop_ok_element.when_present.click
   end
   it 'recommend step1 choose work exp' do
      international_page.goto_first_task_rec1_page
      international_page.rec1_choose_workexp_element.when_present.click
      international_page.other_workexp_element.when_present.click
      international_page.workexp_pop_cancel_element.when_present.click
   end
   it 'rec1 cancel button identy' do
      international_page.goto_first_task_rec1_page
      international_page.btn_rec1_cancel_element.when_present.click
      international_page.verify_task_list_element.when_present.text.should include "Task List"
   end
   it 'rec1 change status button identy' do
      international_page.goto_first_task_rec1_page
      international_page.btn_rec1_change_status_element.when_present.click
      international_page.verify_task_list_element.when_present.text.should include "Task List"
   end
   it 'rec1 next button identy' do
      international_page.goto_first_task_rec1_page
      international_page.btn_rec1_next_element.when_present.click
      international_page.email_to_element.when_present.text.should eql "Email To:"
   end
   it 'rec2 previous btn identy' do
      international_page.goto_first_task_rec2_page
      sleep 2
      international_page.btn_rec2_previous_element.when_present.click
      international_page.previous_identy_element.when_present.text.should include "Consultant:"
   end
   it 'rec2 cancel btn identy' do
      international_page.goto_first_task_rec2_page
      international_page.btn_rec2_cancel_element.when_present.focus
      international_page.btn_rec2_cancel_element.when_present.click
      sleep 2
      international_page.verify_task_list_element.when_present.text.should include "Task List"
   end
   it 'send email to popup identy' do
      international_page.goto_first_task_rec2_page
      international_page.rec2_send_email_to
      international_page.btn_rec2_popup_continue_element.when_present.text.should include "Continue"
   end   
   it 'send email to popup cancel' do
      international_page.goto_first_task_rec2_page
      international_page.rec2_send_email_to
      international_page.btn_rec2_popup_cancel_element.when_present.click
      international_page.email_to_element.when_present.text.should eql "Email To:"
   end
   it 'send email to popup continue' do
      international_page.goto_first_task_rec2_page
      international_page.rec2_send_email_to
      international_page.btn_rec2_popup_continue_element.when_present.click
      international_page.verify_task_list_element.when_present.text.should include "Task List"
   end
   it 'change one I-consultation task status to [unsuccessful interview]' do
      #consultant task list unsuccessful interview页面对单个task执行unsuccessful操作
      international_page.enter_int_task_list
      international_page.task_checkbox0_element.when_present.click
      international_page.task_action_element.when_present.select "Unsuccessful interview"
      international_page.task_update_element.when_present.click
      international_page.submit_element.when_present.click
   end
   it 'change several I-consultation tasks status to [unsuccessful interview]' do
      #consultant task list unsuccessful interview页面对多个task执行unsuccessful操作
      international_page.enter_int_task_list
      international_page.task_checkbox0_element.when_present.click
      international_page.task_checkbox1_element.when_present.click
      international_page.task_action_element.when_present.select "Unsuccessful interview"
      international_page.task_update_element.when_present.click
      international_page.text.should include "You cannot choose multiple tasks."
   end
   it 'change one I-consultation task status to [pending]' do
      #consultation task list pending页面对单个task执行pending操作
      international_page.enter_int_task_list
      international_page.task_checkbox0_element.when_present.click
      international_page.task_action_element.when_present.select "Pending"
      international_page.task_update_element.when_present.click
      international_page.send_email0_element.when_present.click
      international_page.submit_element.when_present.click
   end
   it 'change several I-consultation tasks status to [pending]' do
      #consultation task list pending页面对多个task执行pending操作
      international_page.enter_int_task_list
      international_page.task_checkbox0_element.when_present.click
      international_page.task_checkbox1_element.when_present.click
      international_page.task_action_element.when_present.select "Pending"
      international_page.task_update_element.when_present.click
      international_page.send_email0_element.when_present.click
      international_page.send_email1_element.when_present.click
      international_page.submit_element.when_present.click
      #international_page.text.should include "Change task status successfully"
   end
   it 'recommend a not enrolled consultant' do
      #consultation task list recommend页面选取非enrolled状态的顾问执行recommend操作
      international_page.enter_int_task_list
      international_page.add_consultant_not_enrolled
      international_page.select_all_element.when_present.click
      international_page.task_action_element.when_present.select "Recommended"
      international_page.task_update_element.when_present.click
      sleep 2
      international_page.text.should include "cannot be recommended because the status is not"
   end
   it 'arrange a task to client by sending email' do
      #arrange step2: 点击send email to client
      international_page.enter_int_task_list
      international_page.task_checkbox0_element.when_present.click
      international_page.task_action_element.when_present.select "Deleted"
      international_page.task_update_element.when_present.click
      international_page.task_checkbox0_element.when_present.click
      international_page.task_action_element.when_present.select "Recommended"
      international_page.task_update_element.when_present.click
      international_page.change_status_element.when_present.click
      international_page.task_checkbox0_element.when_present.click
      international_page.task_action_element.when_present.select "Arranged"
      international_page.task_update_element.when_present.click
	  international_page.arrange_date0_element.when_present.clear
      international_page.arrange_date0_element.when_present.append "23:59"
	  international_page.nick_name0_element.when_present.clear
      international_page.nick_name0_element.when_present.append "Ryan"
      international_page.type_of_interview0_element.select "Phone"
      international_page.arrange_next_element.when_present.click
      international_page.choose_mail_to_send
      international_page.send_email_to_client_element.when_present.click
      #international_page.text.should include "The arrangement email has been successfully sent to the client; do you want to send an arrangement email to the consultant?"
   end  
   it 'recommend a consultant which is not proper for project T&C' do
      #consultation task list recommend页面选取包含不满足项目T&C要求的顾问执行多个recommend操作
      international_page.enter_int_task_list
      international_page.add_five_consultants
      international_page.compliance_info_element.when_present.click
      international_page.compliance_tnc_element.when_present.click
      international_page.tnc_element.when_present.select "Capvision version A"
      international_page.tnc_save_element.when_present.click
      international_page.task_list_element.when_present.click
      international_page.select_all_element.when_present.click
      international_page.task_action_element.when_present.select "Recommended"
      message=international_page.alert do
      international_page.task_update_element.when_present.click
      end
      # message.should == "Han's T&C does not match project requirement .
      #                    Kun Hsu's T&C does not match project requirement .
      #                    小白2号's T&C does not match project requirement .
      #                    Ryan's T&C does not match project requirement .
      #                    任发政's T&C does not match project requirement .
      #                    Are you sure you wish to continue? . "
   end
   it 'cancel recommend a consultant which is not proper for project CA' do
      international_page.create_int
      international_page.add_consultant_operation
      international_page.select_first_task_element.when_present.click
      international_page.task_action_element.when_present.select "Recommended"
      message = international_page.confirm(false) do
      international_page.task_update_element.when_present.click
      end
   end
   it 'sign red background for T&C' do
      #红色背景标记T&C不符合项目要求的顾问task
      international_page.enter_int_task_list
   end
   it 'sign red background for CA' do
      #红色背景标记CA不符合项目要求的顾问task
      international_page.enter_int_task_list
      international_page.compliance_info_element.when_present.click
      international_page.compliance_tnc_element.when_present.click
      international_page.tnc_element.when_present.select "N/A"
      international_page.compliance_ca_element.when_present.click
      international_page.ca_element.when_present.select "ryanca"
      international_page.ca_element.when_present.select "ryanca"
      international_page.ca_save_element.when_present.click
      international_page.task_list_element.when_present.click
      international_page.verify_row_is_red.should eql "red"
   end
   it 'sign red background for Training' do
      #红色背景标注Training不符合项目要求的顾问task
         international_page.enter_int_task_list
         international_page.compliance_info_element.when_present.click
         international_page.compliance_ca_element.when_present.click
         international_page.ca_element.when_present.select "ryanca"
         international_page.ca_save_element.when_present.click
         international_page.compliance_training_element.when_present.click
         international_page.task_list_element.when_present.click
         international_page.verify_row_is_red.should eql "red"
   end
   it "project feedback icon identification" do
      #项目feedback图标点击弹窗验证
      international_page.button_search_element.when_present.click
      international_page.feedback_element.when_present.click
      international_page.popup_title_element.when_present.text.should include "Feedback"
   end
   it "project feedback save info" do
         #项目feedback信息填写保存
         international_page.button_search_element.when_present.click
         international_page.feedback_element.when_present.click
         international_page.popup_service_quality_element.when_present.select "5-Very Helpful"
         message = international_page.alert do
         international_page.feedback_save_element.when_present.click
         end
         message.should == "Save Successful!"
         international_page.feedback_element.when_present.click
         international_page.popup_service_quality_element.when_present.attribute_value("value").should eql "5"
   end
   it "feedback necessary option identification" do
      #feedback必填验证
         international_page.button_search_element.when_present.click
         international_page.feedback_element.when_present.click
         international_page.popup_service_quality_element.when_present.select "-Please Choose Score-"
         # international_page.feedback_save_element.when_present.click
         
         message = international_page.alert do
         international_page.feedback_save_element.when_present.click
         end
         message.should == "please choose service quality"

         #international_page.popup_service_quality_element.when_present.attribute_value("value").should eql "5"
   end
   it "INT task feedback popup" do
      international_page.enter_int_task_list
      international_page.task_feedback_element.when_present.click
      international_page.task_feedback_popup_element.when_present.text.should include "Feedback"
   end
   it "INT task feedback necessary option" do
      international_page.enter_int_task_list
      international_page.task_feedback_element.when_present.click
      message = international_page.alert do
      international_page.task_feedback_save1_element.when_present.click
      end
      message.should == "please complete data"
   end
   it "INT task feedback necessary option" do
      international_page.enter_int_task_list
      international_page.task_feedback_element.when_present.click
      international_page.task_feedback_info_fillin
   end

   it "create INT button page turning" do
      #创建INT按钮页面跳转
         international_page.button_create_element.when_present.click
         international_page.h1_element.when_present.text.should eql "Create International Consultation - Basic"
   end
   it 'INT create step 1 required option verification' do
      #创建INTstep1必填项验证
         international_page.button_create_element.when_present.click
         international_page.step1_next_element.when_present.click
         international_page.text.should include "Name cannot be blank."
         international_page.text.should include "Industry cannot be blank."
         international_page.text.should include "Project Description cannot be blank."
   end
   it 'INT create step 2 required option verification' do
      #创建INTstep2必填项验证
         international_page.button_create_element.when_present.click
         international_page.international_name = "AT-INT-Ryan"
         international_page.international_description = "this is INT automation test"
         international_page.international_industry = "Aerospace - 航空"
         international_page.step1_next_element.when_present.click
         international_page.step2_save_element.when_present.click
         international_page.all_alerts_element.when_present.text.should include "Client cannot be blank."
   end
   it 'INT create step 1 [consultant requested] number input verification' do
      #创建INTstep1顾问要求数量输入纯数字验证
         international_page.button_create_element.when_present.click
         international_page.edit_consultants_requested_element.when_present.set "test"
         international_page.step1_next_element.when_present.click
         international_page.all_alerts_element.when_present.text.should include "Consultants Requested must be a number."
   end
   it 'INT create step 1 [consultant expected] number input verification' do
      #创建INTstep1顾问期望数量输入纯数字验证
         international_page.button_create_element.when_present.click
         international_page.edit_consultants_expected_element.when_present.set "test"
         international_page.step1_next_element.when_present.click
         international_page.all_alerts_element.when_present.text.should include "Consultants Expected must be a number."
   end
   it 'INT create step 1 [price] number input verification' do
      #创建INTstep1 price纯数字输入验证
         international_page.button_create_element.when_present.click
         international_page.edit_project_price_element.when_present.set "test"
         international_page.step1_next_element.when_present.click
         international_page.text.should include "Price must be a number."
   end
   it 'INT create step 1 [cancel] button verification' do
      #创建INTstep1 cancel按钮效果验证
         international_page.button_create_element.when_present.click
         international_page.step1_cancel_element.when_present.click
         international_page.button_search_element.when_present.text.should eql "Search"
   end
   it 'INT project info_page basic information edition' do
      #编辑项目基本信息
         international_page.button_search_element.when_present.click
         international_page.first_int_element.when_present.click
         international_page.attach_to_window(:title=>international_page.first_project+" - Task List - Capvision")
         international_page.project_info_element.when_present.click
         international_page.basic_edit_icon_element.when_present.click
         international_page.project_description_element.when_present.set "ryan test description"
         international_page.basic_edit_icon_element.when_present.click
         sleep 2
         international_page.project_description_display_element.when_present.text.should eql "ryan test description"
   end
   it 'INT basic info edition required option verification' do
      #编辑基本信息时，必填项验证
         international_page.enter_int_task_list
         international_page.project_info_element.when_present.click
         international_page.basic_edit_icon_element.when_present.click
         international_page.clear_basic
         international_page.basic_edit_icon_element.when_present.click
         international_page.error_alert_element.when_present.text.should include "Name cannot be blank."
         international_page.error_alert_element.when_present.text.should include "Start Date cannot be blank."
         international_page.error_alert_element.when_present.text.should include "Industry cannot be blank."
         international_page.error_alert_element.when_present.text.should include "Project Description cannot be blank."
   end
   it 'INT project team edition' do
      #编辑项目参与人员
         international_page.enter_int_task_list
         international_page.project_info_element.when_present.click
         international_page.edit_project_team_element.when_present.click
         international_page.project_manager_edit_element.when_present.select "hamburgerKM"
         international_page.edit_project_team_element.when_present.click
         sleep 5
         international_page.project_manager_display_element.when_present.text.should eql "hamburgerKM"
   end
   it 'INT list update without select item' do
      #不选取项目执行action操作
         international_page.list_project_action_element.when_present.select "In Process"
         # international_page.project_list_update_element.when_present.click
         # international_page.text.should include "No projects selected."
         message = international_page.alert do
         international_page.button_update_element.when_present.click
         end
         message.should == "No projects selected."
   end
   it 'INT list update within select one item & without select action' do
      #对一个项目执行操作，不选取对应的action
         international_page.button_search_element.when_present.click
         international_page.int_checkbox0_element.when_present.click
         # international_page.project_list_update_element.when_present.click
         # international_page.text.should include "Please choose Action."
         message = international_page.alert do
         international_page.button_update_element.when_present.click
            end
         message.should == "Please choose Action."
   end
   it 'INT list on hold reason required verification' do
      #on hold原因必填验证
         international_page.button_search_element.when_present.click
         international_page.int_checkbox0_element.click
         international_page.list_project_action_element.when_present.select "On Hold"
         international_page.button_update_element.when_present.click
         # international_page.text.should include "Please choose a reason"
         message = international_page.alert do
         international_page.popup_save_element.when_present.click
            end
         message.should == "Please choose a reason"
   end
   it 'INT click [task list] link' do
      #task list点击跳转验证
         international_page.enter_int_task_list
         international_page.verify_task_list_element.when_present.text.should include "Task List"
   end
   it 'INT task update without select any item' do
      #不选取任何task执行action操作
         international_page.enter_int_task_list
         international_page.task_action_element.when_present.select "Not Contacted"
         international_page.task_update_element.when_present.click
         international_page.task_alert_element.when_present.text.should eql "You must select a task."
   end
   it 'INT task list click add consultant to project' do
      #添加顾问到项目页面跳转验证
         international_page.enter_int_task_list
         international_page.add_consultant_element.when_present.click
         international_page.search_tips_element.when_present.text.should eql "Can't find it?Look here!"
   end
   it 'INT add consultant as task' do
      #成功添加一个顾问到项目
         international_page.enter_int_task_list
         international_page.add_consultant_operation
         international_page.task_status_element.when_present.text.should include"Not Contacted"
   end
   it 'INT add successfully tip' do
      #成功添加顾问到项目的提示语验证
         international_page.enter_int_task_list
         international_page.add_consultant_element.when_present.click
         international_page.search_consultant_element.when_present.click
         international_page.select_consultant_element.when_present.click
         international_page.button_add_consultant_to_project_element.when_present.click
         international_page.add_successfully_element.when_present.text.should include "These consultants have been added successfully."
   end
   it 'arrange a task not recommended' do
      international_page.enter_int_task_list
      international_page.task_checkbox0_element.when_present.click
      international_page.arrange_first_task
   end
   it 'complete a task not recommend' do
      international_page.enter_int_task_list
      international_page.task_checkbox0_element.when_present.click
      international_page.complete_first_task
   end
   it 'INT go to project list identification' do
      #添加顾问成功后点击去到项目访谈列表页面
         international_page.enter_int_task_list
         international_page.add_consultant_element.when_present.click
         international_page.search_consultant_element.when_present.click
         international_page.select_consultant_element.when_present.click
         international_page.button_add_consultant_to_project_element.when_present.click
         international_page.goto_task_list_element.when_present.click
         international_page.verify_task_list_element.when_present.text.should eql "Task List"
   end   
   it 'INT add successfully OK identification' do
      #添加顾问成功后点击OK按钮留在顾问搜索页面
         international_page.enter_int_task_list
         international_page.add_consultant_element.when_present.click
         international_page.search_consultant_element.when_present.click
         international_page.select_consultant_element.when_present.click
         international_page.button_add_consultant_to_project_element.when_present.click
         international_page.btn_ok_element.when_present.click
         international_page.search_tips_element.when_present.text.should eql "Can't find it?Look here!"
   end
   it 'INT km notes submit' do
      #填写KMnotes并正确保存
         international_page.enter_int_task_list
         international_page.km_note_element.when_present.click
         international_page.enter_value_element.when_present.set "notes"
         international_page.btn_submit_notes_element.when_present.click
         international_page.verify_task_list_element.when_present.click
         international_page.km_note_element.when_present.text.should eql "notes"
   end 
      # it 'INT consultant name link' do
      #    international_page.button_search_element.when_present.click
      #    international_page.first_int_element.when_present.click
      #    international_page.attach_to_window(:title=>international_page.first_project+" - Task List - Capvision")
      #    international_page.first_consultant_name_element.when_present.click

      # end       
   it 'high rate consultant signal' do
      #高费率顾问在访谈列表中的标识
         international_page.enter_int_task_list
         international_page.high_rate_element.when_present.attribute_value("title").should eql "This is high rate consultant"
   end

   it 'INT task list upload icon verification' do
      #上传文档弹窗验证
         international_page.button_search_element.when_present.click
         international_page.first_int_element.when_present.click
         international_page.attach_to_window(:title=>international_page.first_project+" - Task List - Capvision")
         international_page.upload_file_element.when_present.click
         international_page.ndb_file_upload_btn_element.when_present.text.should eql "Upload"
   end
   it 'INT task list upload file format verification' do
      #上传文档格式验证
         international_page.enter_int_task_list
         international_page.upload_exe
   end
   it 'INT task list upload file size verification' do
      #上传文档大小验证
         international_page.enter_int_task_list
         international_page.upload_dayu20m
   end
   it 'INT task list upload file successfully' do
      #成功上传文档
         international_page.enter_int_task_list
         international_page.upload_docnormal
   end
   it 'download file' do
      international_page.enter_int_task_list
      international_page.download_file_element.when_present.click
      # international_page.
   end
   it 'delete uploaded file' do
      international_page.enter_int_task_list
      message = international_page.alert do
      international_page.delete_file_element.when_present.click
      end
      message.should == "Are you sure you wanna delete this document?"
   end
   #cc
   it 'create an I-consultation' do
      #建项目填写完整信息创建项目验证
      international_page.button_create_element.when_present.click
      international_page.international_name_element.when_present.set "Icon for ryan"
      international_page.international_description_element.when_present.set "test"
      international_page.international_industry_element.when_present.select "Aerospace - 航空"
      sleep 2
      international_page.international_subindustry_element.when_present.select "航空 - Airlines"
      international_page.button_next_element.when_present.click
      international_page.select_client
      international_page.button_save_element.when_present.click
      sleep 2
      international_page.text.should include "Icon for ryan"
      #通过项目名进行验证
   end
   it 'add consultants to I-consultation' do
      #添加一个顾问到国际化项目
      international_page.enter_int_task_list
      international_page.add_consultant_operation
   end
   # it 'INT compliance info link identification' do
   #    international_page.enter_int_task_list
   #    international_page.compliance_info_element.when_present.click
   #    international_page.compliance_identy_element.when_present.text.should eql "T&C:" 
   # end
   it 'INT task list no send ca signal' do
         international_page.enter_int_task_list 
         international_page.compliance_info_element.when_present.click
         international_page.compliance_ca_element.when_present.click
         international_page.ca_element.when_present.select "N/A"
         international_page.ca_save_element.when_present.click
         international_page.task_list_element.when_present.click
         # international_page.operation_icons_element.when_present.text.should not include "Send CA"               
   end
   it 'INT task list send CA icon identification' do
         international_page.enter_int_task_list
         international_page.compliance_info_element.when_present.click
         international_page.compliance_ca_element.when_present.click
         international_page.ca_element.when_present.select "ryanca"
         international_page.btn_submit_notes_element.when_present.click
         international_page.task_list_element.when_present.click
         international_page.send_ca_element.when_present.click
         international_page.btn_send_ca_element.when_present.click
         international_page.ident_ca_send_element.when_present.text.should eql "Send Email Successful."
   end
   it 'INT task list resend CA icon identification' do
         international_page.enter_int_task_list
         international_page.resend_ca_element.when_present.click
         international_page.btn_send_ca_element.when_present.click
         international_page.verify_task_list_element.when_present.text.should eql "Task List"
   end
   it 'INT task list after send ca display [resend]' do
         international_page.create_int
         international_page.add_five_consultants
         international_page.send_ca_element.when_present.click
         international_page.btn_send_ca_element.when_present.click
         #验证resend ca和sign CA 链接
         # international_page.enter_int_task_list
         # international_page.resend_display_element.when_present.attribute_value("data-original-title").should eql "Resend CA"
   end   
      # it 'INT task list approval icon popup identification' do
      #    international_page.button_search_element.when_present.click
      #    international_page.first_int_element.when_present.click
      #    international_page.attach_to_window(:title=>international_page.first_project+" - Task List - Capvision")
      #    international_page.approval_icon_element.when_present.click
      #    international_page.text.should include "Are you sure this task is approved?"
      # end

   it 'INT task list sign ca icon without upload file identification' do
         international_page.enter_int_task_list
         message = international_page.alert do
         international_page.sign_ca_element.when_present.click
         end
         message.should == "You must first upload the email file containing the CA signed by this consultant."
   end
   it 'INT task list upload ca' do
         international_page.enter_int_task_list
         international_page.upload_ca
   end
   it 'INT task list sign ca within upload file' do
         international_page.enter_int_task_list
         international_page.alert do
         international_page.sign_ca_element.when_present.click
         end
   end  
   it 'INT task list approval icon identification' do
         international_page.create_int
         international_page.add_five_consultants
         message = international_page.confirm(false) do
         international_page.approval_icon_element.when_present.click
         end
         message.should == "Are you sure this task is approved?"
         #点击取消
   end    
   it 'INT task list approval icon identification' do
         international_page.create_int
         international_page.add_five_consultants
         message = international_page.alert do
         international_page.approval_icon_element.when_present.click
         end
         message.should == "Are you sure this task is approved?"
   end

   it 'INT task list keyword rank' do
         international_page.enter_int_task_list
         international_page.id_link_element.when_present.click
         international_page.verify_task_list_element.when_present.text.should include "Task List"
         international_page.status_link_element.when_present.click
         international_page.verify_task_list_element.when_present.text.should include "Task List"
   end
   it 'INT project compliance' do
         international_page.enter_int_task_list
         international_page.compliance_info_element.when_present.click
         international_page.compliance_req_element.when_present.text.should eql "Client Approval:"        
   end
   it 'INT compliance cap&client approval identification' do
         international_page.enter_int_task_list
         international_page.compliance_approval
         international_page.task_grid_element.when_present.text.should include "Approval"
   end   
   it 'INT compliance T&C' do
         international_page.enter_int_task_list
         international_page.compliance_info_element.when_present.click
         international_page.compliance_tnc_element.when_present.click
         international_page.tnc_element.when_present.select "Capvision version A"
         international_page.btn_submit_notes_element.when_present.click
         international_page.task_list_element.when_present.click
         international_page.compliance_info_element.when_present.click
         international_page.compliance_tnc_element.when_present.text.should eql "Capvision version A"
   end  
   it 'INT compliance CA' do
         international_page.enter_int_task_list
         international_page.set_ca
         international_page.task_list_element.when_present.click
         international_page.compliance_info_element.when_present.click
         international_page.compliance_ca_element.when_present.text.should eql "N/A"
   end       
   it 'INT client info' do
         international_page.enter_int_task_list
         international_page.client_info_element.when_present.click
   end    
   it 'INT task type of interview' do
         international_page.enter_int_task_list
         international_page.update_icon_element.when_present.click
         international_page.type_of_interview_element.when_present.text.should eql "-Please choose-\nPhone\nIn-Person\nRoadshow\nPhone Exchange\nPhone Conference\nData\nAccompany Survey"
   end 
   # it 'INT ' do
   # end
end
