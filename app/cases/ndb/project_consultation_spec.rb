#encoding: utf-8
require File.expand_path 'app/cases/spec_helper'
require File.expand_path 'app/cases/shared/action'


describe 'consultation page', :consultation do 
  
    let(:project_consultation_page)do 
      home_page = $navi.goto_home_page
      login_page = home_page.direct_to_login_page
      home_page = login_page.login "admin","1234"
      project_consultation_page = home_page.direct_to_consultation_page
    end
    #进入consultation页面
  it 'should go to consultation page' do
      project_consultation_page.wait_until do
        sleep 2
        project_consultation_page.title.should eql "Consultation Projects - Capvision"
      end
    end
  
   #consultation页面进行默认搜索
  it 'search by default on consultation page ' do
      project_consultation_page.filter
      project_consultation_page.wait_until do
    sleep 2
        project_consultation_page.title.should eql "Consultation Projects - Capvision"
      end
    end
    
    #consultation list页面consultation search by user
  it 'search by user on consultation page' do
    project_consultation_page.select_consultation_user_element.when_present.click
    project_consultation_page.click_consultation_user_element.when_present.click
    project_consultation_page.filter
    project_consultation_page.consultation_manager_element.when_present.text.should eql "test_km1"
  end
    
  #consultation list页面consultation search by paticipates
  it 'search by paticipates on consultation page' do
    project_consultation_page.select_consultation_participant_element.when_present.select "KM Support"
    project_consultation_page.filter
    project_consultation_page.filter_element.when_present.text.should eql "Search"
  end
  
  #consultation list页面consultation search by client
  it 'search by client on consultation page' do
    project_consultation_page.click_consultation_client_element.when_present.click
    project_consultation_page.select_client_element.when_present.click
    project_consultation_page.filter
    project_consultation_page.consultation_client_element.when_present.text.should eql "cash"
  end

  #consultation list页面consultation search by keyword(name)
  it 'search by keyword(name) on consultation page' do
    project_consultation_page.input_keywords_element.when_present.set "AT_"
    project_consultation_page.filter
    project_consultation_page.first_project.should include "_"
  end
  
  #consultation list页面consultation search by keyword(info requirements)
  it 'search by keyword(info requirements) on consultation page' do
    project_consultation_page.input_keywords_element.when_present.set "xtest"
    project_consultation_page.filter
    project_consultation_page.first_project.should include "xtest"
  end
  
  #consultation list页面consultation search by keyword(description)
  it 'search by keyword(description) on consultation page' do
    project_consultation_page.input_keywords_element.when_present.set "at_test"
    project_consultation_page.filter
    project_consultation_page.first_project.should include "_"
  end
    
    #按行业搜索consultation
  it 'search by the industry of aerospace on consultation page ' do
      project_consultation_page.project_industry = "Aerospace - 航空"
      project_consultation_page.filter
      project_consultation_page.wait_until do
        sleep 2
        project_consultation_page.title.should eql "Consultation Projects - Capvision"
      end
    end

    #按in process状态搜索consultation
    it 'search by the status of in process on consultation page ' do
      project_consultation_page.project_status = "In Process"
      project_consultation_page.filter
      project_consultation_page.wait_until do
    sleep 2
        project_consultation_page.title.should eql "Consultation Projects - Capvision"
      end
    end

     #按on hold状态搜索consultation
    it 'search by the status of on hold on consultation page ' do
      project_consultation_page.project_status = "On Hold"
      project_consultation_page.filter
      project_consultation_page.wait_until do
    sleep 2
        project_consultation_page.title.should eql "Consultation Projects - Capvision"
      end
    end
     #按complete状态搜索consultation
    it 'search by the status of complete on consultation page ' do
      project_consultation_page.project_status = "Complete"
      project_consultation_page.filter
      project_consultation_page.wait_until do
    sleep 2
        project_consultation_page.title.should eql "Consultation Projects - Capvision"
      end
    end
  
    #按invalid状态搜索consultation
    it 'search by the status of invalid on consultation page ' do
      project_consultation_page.project_status = "Invalid"
      project_consultation_page.filter
      project_consultation_page.wait_until do
    sleep 2
        project_consultation_page.title.should eql "Consultation Projects - Capvision"
      end
    end
   #consultation页面删除项目
   #consultation list页面项目删除图标弹窗
  it 'consultation project deleted ' do
      project_consultation_page.project_status = "Complete"
      project_consultation_page.filter
      sleep 2
      project_consultation_page.delete_project
    end
  
   #创建consultation功能
  it 'create consultation on consultation page' do
      project_consultation_page.project_create_btn
      project_consultation_page.project_name = "AT_我叫weijun"
      project_consultation_page.project_description = "attest_consultation adad@!#!@3  123"
      project_consultation_page.select_industry = "Agriculture - 农业"
      project_consultation_page.select_consultation_type_element.when_present.select "China Project"
      project_consultation_page.next
      project_consultation_page.choose_client
      project_consultation_page.select_project_pm_element.when_present.select "test_km1"
      project_consultation_page.select_project_skm_element.when_present.select "test_km4"
      project_consultation_page.key_questions = "at_瓦达西瓦weijun捏死"
      project_consultation_page.save
      project_consultation_page.wait_until do
      sleep 2
        project_consultation_page.consultation_title.include? "AT_我叫weijun"
      end
    end
  
    #在consultation页面编辑项目信息
    #consultation project info页面client&contact编辑 
    #consultation project info页面project team信息编辑
    it 'edit project info on consultation page' do
      project_consultation_page.filter
      first_project = project_consultation_page.first_project
      project_consultation_page.view_projectinfo
      sleep 1
      project_consultation_page.attach_to_window(:title=> first_project+" - Capvision")
      project_consultation_page.hidden_element
      project_consultation_page.edit_project_info
      sleep 2
      project_consultation_page.title.should eql first_project+" - Capvision"
    end
  
   #consultation project info页面编辑basic info必填项验证
   it 'consultation project info page verify basic info' do
     project_consultation_page.filter
     first_project = project_consultation_page.first_project
     project_consultation_page.view_projectinfo
     project_consultation_page.attach_to_window(:title=> first_project+" - Capvision")
     project_consultation_page.hidden_element
     project_consultation_page.project_basic_edit_element.when_present.click
     project_consultation_page.project_description_element.when_present.clear
     project_consultation_page.project_basic_edit_element.when_present.click
     project_consultation_page.verify_alert_element.when_present.text.should include "Project Description cannot be blank."
   end
  
   #consultation project info页面project requirements信息栏必填项验证
   it 'consultation project info page verify project requirements info' do
      project_consultation_page.filter
      first_project = project_consultation_page.first_project
      project_consultation_page.view_projectinfo
      project_consultation_page.attach_to_window(:title=> first_project+" - Capvision")
      project_consultation_page.hidden_element
      project_consultation_page.edit_project_requirements_element.when_present.click
      project_consultation_page.consultation_key_questions_element.when_present.set ""
      project_consultation_page.edit_project_requirements_element.when_present.click
      project_consultation_page.project_info_requirement_alert_element.when_present.text.should eql "Key Questions cannot be blank."
   end
  
    #进入client info页面
    it 'should go to client info on consultation page' do
      project_consultation_page.filter
      first_project=project_consultation_page.first_project
      project_consultation_page.choose_project_element.when_present.click
      project_consultation_page.attach_to_window(:title=> first_project+" - Task List - Capvision")
      project_consultation_page.go_to_project_clientinfo_page
      sleep 2
      project_consultation_page.title.should eql "Client Info - "+first_project+" - Capvision"
    end
  
    #进入client contact页面
    it 'should go to client contact on consultation page' do
      project_consultation_page.filter
      first_project=project_consultation_page.first_project
      project_consultation_page.choose_project_element.when_present.click
      project_consultation_page.attach_to_window(:title=> first_project+" - Task List - Capvision")
      project_consultation_page.go_to_project_clientcontacts_page
      sleep 2
      project_consultation_page.title.should eql "Client Contacts - AT_我叫weijun - Capvision"
    end
  
    #consultation client contact info页面点击client contact链接
    it 'consultation client contact page click the client contact link' do
      project_consultation_page.filter
      first_project=project_consultation_page.first_project
      project_consultation_page.choose_project_element.when_present.click
      project_consultation_page.attach_to_window(:title=> first_project+" - Task List - Capvision")
      project_consultation_page.go_to_project_clientcontacts_page
      project_consultation_page.first_client_contact_element.when_present.click
      client_contact = project_consultation_page.first_client_contact_element.when_present.text
      project_consultation_page.attach_to_window(:title=>client_contact+" - Capvision")
    end
  
    #进入email页面
    it 'should go to email on consultation page' do
      project_consultation_page.filter
      first_project=project_consultation_page.first_project
      project_consultation_page.choose_project_element.when_present.click
      project_consultation_page.attach_to_window(:title=> first_project+" - Task List - Capvision")
      project_consultation_page.go_to_project_emails_page
      sleep 2
      project_consultation_page.title.should eql "Emails - AT_我叫weijun - Capvision"
    end
    
    #consultation communication email页面点击communication-email
    it 'should go to email on consultation page' do
      project_consultation_page.filter
      first_project=project_consultation_page.first_project
      project_consultation_page.choose_project_element.when_present.click
      project_consultation_page.attach_to_window(:title=> first_project+" - Task List - Capvision")
      project_consultation_page.go_to_project_emails_page
      project_consultation_page.go_to_project_emails_page_element.when_present.click
      sleep 2
      project_consultation_page.title.should eql "Emails - AT_我叫weijun - Capvision"
    end
  
      #进入sms页面
    it 'should go to sms on consultation page' do
      project_consultation_page.filter
      first_project=project_consultation_page.first_project
      project_consultation_page.choose_project_element.when_present.click
      project_consultation_page.attach_to_window(:title=> first_project+" - Task List - Capvision")
      project_consultation_page.go_to_project_sms_page
      sleep 2
      project_consultation_page.title.should eql "SMS - AT_我叫weijun - Capvision"
    end
  
    #consultation communication email页面点击communication-sms
    it 'consultation communication email page click the communication-sms link' do
      project_consultation_page.filter
      first_project=project_consultation_page.first_project
      project_consultation_page.choose_project_element.when_present.click
      project_consultation_page.attach_to_window(:title=> first_project+" - Task List - Capvision")
      project_consultation_page.go_to_project_sms_page
      project_consultation_page.go_to_project_sms_page_element.when_present.click
      sleep 2
      project_consultation_page.title.should eql "SMS - AT_我叫weijun - Capvision"
    end
  
     #进入compliance页面
    it 'should go to compliance on consultation page' do
      project_consultation_page.filter
      first_project=project_consultation_page.first_project
      project_consultation_page.choose_project_element.when_present.click
      project_consultation_page.attach_to_window(:title=> first_project+" - Task List - Capvision")
      project_consultation_page.go_to_project_compliance_page
    sleep 2
      project_consultation_page.title.should eql "Compliance - "+first_project+" - Capvision"
    end
  
     #改变consultation状态为in process
    it 'consultation project update_status in process' do
      project_consultation_page.filter
      project_consultation_page.check_project_checkbox
      project_consultation_page.choose_action = "In Process"
      project_consultation_page.project_update_btn
      sleep 2
      project_consultation_page.alert_success.should eql project_consultation_page.first_project+" status changed successfully."
    end
    #consultation list页面对多个项目执行in process操作
    it 'two consultation projects update_status in process' do   
      project_consultation_page.filter
      project_consultation_page.check_project_checkbox
      project_consultation_page.check_second_project_checkbox
      project_consultation_page.choose_action = "In Process"
      project_consultation_page.project_update_btn
    end 
    #consultation list页面对多个项目执行on hold操作
    it 'two consultation projects update_status on hold' do
      project_consultation_page.filter
      project_consultation_page.check_project_checkbox
      project_consultation_page.check_second_project_checkbox
      project_consultation_page.choose_action = "On Hold"
      sleep 2
      message = project_consultation_page.alert do
        project_consultation_page.project_update_btn_element.when_present.click
      end
      message.should == "You cannot choose multi-project for this operation."
    end
     #consultation list页面对多个项目执行invalid操作
    it 'two consultation projects update_status invalid' do
      project_consultation_page.filter
      project_consultation_page.check_project_checkbox
      project_consultation_page.check_second_project_checkbox
      project_consultation_page.choose_action = "Invalid"
      sleep 2
      message = project_consultation_page.alert do
        project_consultation_page.project_update_btn_element.when_present.click
      end
      message.should == "You cannot choose multi-project for this operation."
    end
     #consultation list页面对多个项目执行complete操作
    it 'two consultation projects update_status complete' do
      project_consultation_page.filter
      project_consultation_page.check_project_checkbox
      project_consultation_page.check_second_project_checkbox
      project_consultation_page.choose_action = "Complete"
      sleep 2
      message = project_consultation_page.alert do
        project_consultation_page.project_update_btn_element.when_present.click
      end
      message.should == "You cannot choose multi-project for this operation."
    end
   #consultation页面查看项目功能
  it 'consultation_project view function' do
    project_consultation_page.filter
    project_consultation_page.view_projectinfo
    sleep 2
    project_consultation_page.attach_to_window(:title=> project_consultation_page.first_project+" - Capvision")
    project_consultation_page.wait_until do
    sleep 2
      project_consultation_page.text.should include "Project Description"
    end
  end
  
  #consultation list页面点击feedback图标弹窗
  #consultation list页面项目反馈图标弹窗
  #consultation list页面项目反馈信息保存
  it 'consultation_project feedback function' do
    project_consultation_page.filter
    project_consultation_page.project_feedback
    project_consultation_page.project_choosefeedback_element.when_present.select "5-Very Helpful"
    sleep 2
    message = project_consultation_page.confirm(true) do
      sleep 1
      project_consultation_page.feedback_save_element.when_present.click
    end
    sleep 2
    message.should == "Save Successful!"
  end
  
  #consultation task list添加顾问功能
  #consultation task list页面成功添加顾问提示弹窗点击go to this project list
  #consultation task list页面成功添加顾问提示弹窗点击ok
  it 'task list_page add consultant to consultation project' do
    project_consultation_page.filter
    project_consultation_page.select_project_element.when_present.click
    project_consultation_page.attach_to_window(:title=> project_consultation_page.first_project+" - Task List - Capvision")
    sleep 2
    project_consultation_page.add_consultant
  end

  #consultation task list complete页面未经过recommend和arrange的task执行complete验证
  it 'task list_page update the task which unrecommand and unarranged to completed' do
    project_consultation_page.filter
    project_consultation_page.select_project_element.when_present.click
    project_consultation_page.attach_to_window(:title=> project_consultation_page.first_project+" - Task List - Capvision")
    project_consultation_page.first_task_checkbox_element.when_present.click
    project_consultation_page.choose_taskaction_element.when_present.select "Completed"
    project_consultation_page.update_taskstatus_element.when_present.click
    project_consultation_page.alert_error_info_element.when_present.text.should include "You cannot complete this task before it has been recommended and arranged."
  end
  
  #consultation task list页面send CA链接跳转
  it 'consultation task list page click the send ca link' do
    project_consultation_page.filter
    project_consultation_page.select_project_element.when_present.click
    project_consultation_page.attach_to_window(:title=> project_consultation_page.first_project+" - Task List - Capvision")
    project_consultation_page.change_ca_to_signment
    project_consultation_page.task_list
    project_consultation_page.link_of_send_ca_element.when_present.click
    project_consultation_page.consultation_title_element.when_present.text.should eql "Send"
  end
  
  #consultation task list页面Rate1500以上高费率顾问标识验证
  it 'consultation task list_page verify the consultant which rate above 1500' do
    project_consultation_page.filter
    project_consultation_page.select_project_element.when_present.click
    project_consultation_page.attach_to_window(:title=> project_consultation_page.first_project+" - Task List - Capvision")
    project_consultation_page.verify_high_rate
  end
  
  #consultation task need compliance approve页面对需要client approve的task执行arrange操作
  it 'task list_page update the task which unrecommand and unarranged to arrange' do
    project_consultation_page.filter
    project_consultation_page.select_project_element.when_present.click
    project_consultation_page.attach_to_window(:title=> project_consultation_page.first_project+" - Task List - Capvision")
    project_consultation_page.first_task_checkbox_element.when_present.click
    project_consultation_page.choose_taskaction_element.when_present.select "Arranged"
    project_consultation_page.update_taskstatus_element.when_present.click
    project_consultation_page.alert_error_info_element.when_present.text.should include "The tasks cannot be arranged because it should be recommended first."
  end
  
  #consultation task list recommend页面CA不符要求的提示弹窗点击cancel
  it 'consultation task list page recommend task without ca then click cancel btn' do
    project_consultation_page.filter
    project_consultation_page.select_project_element.when_present.click
    project_consultation_page.attach_to_window(:title=> project_consultation_page.first_project+" - Task List - Capvision")
    project_consultation_page.first_task_checkbox_element.when_present.click
    project_consultation_page.choose_taskaction_element.when_present.select "Recommended"
    project_consultation_page.update_taskstatus_element.when_present.click
    project_consultation_page.cancel_updatetask_element.when_present.click
  end
  
  #非recommend状态的task无法执行arrange操作验证
  it 'consultation task list page unrecommand task update status to arranged' do
    project_consultation_page.filter
    project_consultation_page.select_project_element.when_present.click
    project_consultation_page.attach_to_window(:title=> project_consultation_page.first_project+" - Task List - Capvision")
    project_consultation_page.first_task_checkbox_element.when_present.click
    project_consultation_page.choose_taskaction_element.when_present.select "Arranged"
    project_consultation_page.update_taskstatus_element.when_present.click
    project_consultation_page.alert_error_info_element.when_present.text.should include "The tasks cannot be arranged because it should be recommended first."
  end
  
  ##recommend step1:warning bar无内容显示为空
  it 'consultation task list page recommend task verify warning bar' do
    project_consultation_page.filter
    project_consultation_page.select_project_element.when_present.click
    project_consultation_page.attach_to_window(:title=> project_consultation_page.first_project+" - Task List - Capvision")
    project_consultation_page.first_task_checkbox_element.when_present.click
    project_consultation_page.choose_taskaction_element.when_present.select "Recommended"
    project_consultation_page.update_taskstatus_element.when_present.click
    project_consultation_page.recommend_warning_bar_info_element.when_present.text.should include " CA does not match project requirement"
  end
  
  #recommend step1:warning bar内容显示红色字体
  it 'consultation task list page recommend task verify red warning' do
    project_consultation_page.filter
    project_consultation_page.select_project_element.when_present.click
    project_consultation_page.attach_to_window(:title=> project_consultation_page.first_project+" - Task List - Capvision")
    project_consultation_page.first_task_checkbox_element.when_present.click
    project_consultation_page.choose_taskaction_element.when_present.select "Completed"
    project_consultation_page.update_taskstatus_element.when_present.click
    project_consultation_page.alert_error_info_element.when_present.text.should include "You cannot complete this task before it has been recommended and arranged"
  end  
  
  #recommend step1:consultant链接点击
  it 'consultation task list page task recommend click consultant link' do
    project_consultation_page.filter
    project_consultation_page.select_project_element.when_present.click
    project_consultation_page.attach_to_window(:title=> project_consultation_page.first_project+" - Task List - Capvision")
    project_consultation_page.click_consultant_link_element.when_present.click
    project_consultation_page.attach_to_window(:title=> "Han - Capvision")
    project_consultation_page.consultation_title_element.when_present.text.should eql "Han"
  end
  
   #consultants tasks页面不更改任何内容，将tasks状态更改为completed
    it 'consultation project complete task without fill any data' do
      project_consultation_page.filter
      project_consultation_page.select_project_element.when_present.click
      project_consultation_page.attach_to_window(:title=> project_consultation_page.first_project+" - Task List - Capvision")
      project_consultation_page.first_task_checkbox_element.when_present.click
      project_consultation_page.choose_taskaction_element.when_present.select("Completed")
      project_consultation_page.update_taskstatus_element.when_present.click
      #project_consultation_page.text.should include "You cannot complete this task before it has been recommended and arranged"
    end
    #consultants tasks页面填写date,将tasks状态更改为completed
    it 'consultation project fill date then complete task' do
      project_consultation_page.filter
      project_consultation_page.select_project_element.when_present.click
      project_consultation_page.attach_to_window(:title=> project_consultation_page.first_project+" - Task List - Capvision")
      project_consultation_page.update_task_link_element.when_present.click
      project_consultation_page.input_consultation_date="2015-07-01"
      sleep 2
      project_consultation_page.save_consultaion_element.when_present.click
      project_consultation_page.first_task_checkbox_element.when_present.click
      project_consultation_page.choose_taskaction_element.when_present.select("Completed")
      project_consultation_page.update_taskstatus_element.when_present.click
      project_consultation_page.alert_error_info_element.when_present.text.should include "You cannot complete this task before it has been recommended and arranged"
    end
    #consultants tasks页面填写date，consultant hour,将task状态更改为completed
    it 'consultation project fill date and consultant hour then complete task' do
      project_consultation_page.filter
      project_consultation_page.select_project_element.when_present.click
      project_consultation_page.attach_to_window(:title=> project_consultation_page.first_project+" - Task List - Capvision")
      project_consultation_page.update_task_link_element.when_present.click
      project_consultation_page.input_consultation_date="2015-07-01"
      sleep 2
      project_consultation_page.input_consultation_hour="1"
      project_consultation_page.save_consultaion_element.when_present.click
      project_consultation_page.first_task_checkbox_element.when_present.click
      project_consultation_page.choose_taskaction_element.when_present.select("Completed")
      project_consultation_page.update_taskstatus_element.when_present.click
      project_consultation_page.alert_error_info_element.when_present.text.should include "You cannot complete this task before it has been recommended and arranged"
    end
  
  #consultation task list页面T&C不满足项目要求标红验证
    it 'consultation task list page verify the T&C requirement' do
      project_consultation_page.filter
      project_consultation_page.select_project_element.when_present.click
      project_consultation_page.attach_to_window(:title=> project_consultation_page.first_project+" - Task List - Capvision")
      project_consultation_page.verify_row_is_red.should eql "red"
    end
    
    #consultation task list页面CA不满足项目要求标红验证
    it 'consultation task list page verify the CA requirement' do
      project_consultation_page.filter
      project_consultation_page.select_project_element.when_present.click
      project_consultation_page.attach_to_window(:title=> project_consultation_page.first_project+" - Task List - Capvision")
      project_consultation_page.verify_row_is_red.should eql "red"
    end
    
    #consultation task list页面Training不满足项目要求标红验证
    it 'consultation task list page verify the Training requirement' do
      project_consultation_page.filter
      project_consultation_page.select_project_element.when_present.click
      project_consultation_page.attach_to_window(:title=> project_consultation_page.first_project+" - Task List - Capvision")
      project_consultation_page.verify_row_is_red.should eql "red"
    end

  #consultation task edit页面点击cancel取消编辑
  it 'consultation task list page edit task then click cancel btn' do
    project_consultation_page.filter
    project_consultation_page.select_project_element.when_present.click
    project_consultation_page.attach_to_window(:title=> project_consultation_page.first_project+" - Task List - Capvision")
    project_consultation_page.update_task_link_element.when_present.click
    project_consultation_page.cancel_btn_element.when_present.click
  end
  
  #更改task状态为recommend
  #consultation task list recommend页面CA不符要求的提示弹窗点击确认
  it 'task list_page update task status to recommend' do
    project_consultation_page.filter
    project_consultation_page.select_project_element.when_present.click
    project_consultation_page.attach_to_window(:title=> project_consultation_page.first_project+" - Task List - Capvision")
    project_consultation_page.change_recommended
  end
  #改变ca为null
  it 'task list_page update change ca to null' do
    project_consultation_page.filter
    project_consultation_page.select_project_element.when_present.click
    project_consultation_page.attach_to_window(:title=>project_consultation_page.first_project+" - Task List - Capvision")
    project_consultation_page.change_ca_to_NA
  end
  
  #recommend step1 :ID必填验证
  it 'consultation task list page recommend task step 1 verify ID' do
    project_consultation_page.filter
    project_consultation_page.select_and_update_task "Recommended"
    project_consultation_page.input_recommend_id_element.when_present.clear
    project_consultation_page.next_step_element.when_present.click
    project_consultation_page.verify_recommand_ID_element.when_present.text.should include "ID 不可为空白"
  end
  
  #recommend step1 :company编辑图标点击
  it 'consultation task list page recommend task step 1 verify company and position link' do
    project_consultation_page.filter
    project_consultation_page.select_and_update_task "Recommended"
    project_consultation_page.choose_position_element.when_present.click
  end
  
  #recommend step1 :工作经历编辑弹窗点击确认
  it 'consultation task list page recommend task step 1 edit position' do
    project_consultation_page.filter
    project_consultation_page.select_and_update_task "Recommended"
    project_consultation_page.choose_position_element.when_present.click
    project_consultation_page.ok_btn_element.when_present.click
  end
  
  #recommend step1 ：工作经历编辑弹窗点击取消
  it 'consultation task list page recommend task step 1 edit position then click cancel' do
    project_consultation_page.filter
    project_consultation_page.select_and_update_task "Recommended"
    project_consultation_page.choose_position_element.when_present.click
    project_consultation_page.cancel_updatetask_element.when_present.click
  end
  
  #recommend step1：填写完整信息点击next
  it 'consultation task list page recommend task step 1 edit info then click next' do
    project_consultation_page.filter
    project_consultation_page.select_and_update_task "Recommended"
    project_consultation_page.next_step_element.when_present.click
  end
  
  #recommend step1：填写完整信息点击cancel
  it 'consultation task list page recommend task step 1 edit info then click cancel' do
    project_consultation_page.filter
    project_consultation_page.select_and_update_task "Recommended"
    project_consultation_page.cancel_updatetask_element.when_present.click
  end
  
  #recommend step2: 点击previous
  it 'consultation task list page recommend task step 2 click previous btn' do
    project_consultation_page.filter
    project_consultation_page.select_and_update_task "Recommended"
    project_consultation_page.next_step_element.when_present.click
    project_consultation_page.previous_btn_element.when_present.click
    #project_consultation_page.next_step_element.when_present.text.should eql "Next"
  end
  
  #recommend step2: check弹窗点击cancel
  it 'consultation task list page recommend task step 2 click cancel btn on the popup' do
    project_consultation_page.filter
    project_consultation_page.select_and_update_task "Recommended"
    project_consultation_page.next_step_element.when_present.click
    project_consultation_page.input_mail_to_element.when_present.click
    project_consultation_page.select_email_element.when_present.click
    project_consultation_page.send_email_element.when_present.click
    project_consultation_page.cancel_send_mail_element.when_present.click
    project_consultation_page.previous_btn_element.when_present.text.should eql "Previous"
  end
  
  #recommend step2: check弹窗点击continue
  it 'consultation task list page recommend task step 2 click continue btn on the popup' do
    project_consultation_page.filter
    project_consultation_page.select_and_update_task "Recommended"
    project_consultation_page.next_step_element.when_present.click
    project_consultation_page.input_mail_to_element.when_present.click
    project_consultation_page.select_email_element.when_present.click
    project_consultation_page.send_email_element.when_present.click
    project_consultation_page.continue_send_mail_element.when_present.click
    project_consultation_page.consultation_title_element.when_present.text.should include "CON"
  end
  
  #consultation task list页面项目不存在CA要求时task list不显示send CA
  it 'task list_page no link of send ca on task list page' do
    project_consultation_page.filter
    project_consultation_page.select_project_element.when_present.click
    project_consultation_page.attach_to_window(:title=> project_consultation_page.first_project+" - Task List - Capvision")
    project_consultation_page.verify_link_of_send_ca
  end

  #更改task状态为arrange
  it 'task list_page update task status to arrange' do
    project_consultation_page.filter
    project_consultation_page.select_project_element.when_present.click
    project_consultation_page.attach_to_window(:title=>project_consultation_page.first_project+" - Task List - Capvision")
    project_consultation_page.change_recommend_to_arrange
  end
  
  #arrange step1：顾问名链接点击
  it 'task list_page arrange step1 click the consultant link' do
    project_consultation_page.filter
    project_consultation_page.select_and_update_task "Arranged"
    project_consultation_page.consultant_link_when_arrange_element.when_present.click
    project_consultation_page.attach_to_window(:title=>"Han - Capvision")
    project_consultation_page.consultation_title_element.when_present.text.should include "Han"
  end

  #arrange step1：访谈时间必填验证
  it 'task list_page arrange step1 verify consultant date should not be null' do
    project_consultation_page.filter
    project_consultation_page.select_and_update_task "Arranged"
    project_consultation_page.consultant_date_element.when_present.clear
    project_consultation_page.consultant_date_element.when_present.set ""
    project_consultation_page.change_status_element.when_present.click
    #project_consultation_page.consultant_date_element.when_present.text.should include "00:00"
  end 
  
  #arrange step1：nick name必填验证
  it 'task list_page arrange step1 verify nick name should not be null' do
    project_consultation_page.filter
    project_consultation_page.select_and_update_task "Arranged"
    project_consultation_page.nick_name_element.when_present.clear
    project_consultation_page.change_status_element.when_present.click
    project_consultation_page.verify_nick_name_element.when_present.text.should include "请填写 Nick Name"
  end
  
  #arrange step1:填写完整信息点击next
  it 'task list_page arrange step1 fill all data and click next btn' do
    project_consultation_page.filter
    project_consultation_page.select_and_update_task "Arranged"
    project_consultation_page.next_step_element.when_present.click
    #project_consultation_page.previous_btn_element.when_present.text.should eql "Previous"
  end
  
  #arrange step1:填写完整信息点击cancel
  it 'task list_page arrange step1 fill all data and click cancel btn' do
    project_consultation_page.filter
    project_consultation_page.select_and_update_task "Arranged"
    project_consultation_page.cancel_updatetask_element.when_present.click
    project_consultation_page.consultation_title_element.when_present.text.should include "CON"
  end
  
  #arrange step1：填写完整信息点击change status
  it 'task list_page arrange step1 fill all data and click change status btn' do
    project_consultation_page.filter
    project_consultation_page.select_and_update_task "Arranged"
    project_consultation_page.change_status_element.when_present.click
  end
  
  #arrange step2:勾选send calendar to client选框
  it 'task list_page arrange step2 check the send calendar to client' do
    project_consultation_page.filter
    project_consultation_page.select_and_update_task "Arranged"
    project_consultation_page.next_step_element.when_present.click
    project_consultation_page.send_calendar_email_element.when_present.click
  end

  it 'task list_page arrange step2 click the previous btn' do
    project_consultation_page.filter
    project_consultation_page.select_project_element.when_present.click
    project_consultation_page.attach_to_window(:title=>project_consultation_page.first_project+" - Task List - Capvision")
    project_consultation_page.change_ca_to_NA
  end  
  
  #arrange step2: 点击previous
  it 'task list_page arrange step2 click the previous btn' do
    project_consultation_page.filter
    project_consultation_page.select_and_update_task "Arranged"
    project_consultation_page.next_step_a_element.when_present.click
    sleep 2
    project_consultation_page.previous_btn_element.when_present.click
    project_consultation_page.next_step_element.when_present.text.should eql "Next"
  end  
  
  #arrange step2: 点击cancel
  it 'task list_page arrange step2 click the cancel btn' do
    project_consultation_page.filter
    project_consultation_page.select_and_update_task "Arranged"
    project_consultation_page.next_step_element.when_present.click
    sleep 2
    project_consultation_page.cancel_arrange_step2_element.when_present.click
    #project_consultation_page.consultation_title_element.when_present.text.should include "C"
  end  
  
  #consultation task edit页面start time大于end time提示验证
  it 'consultation task edit page verify alert (start time more than end time)' do
    project_consultation_page.filter
    project_consultation_page.select_project_element.when_present.click
    project_consultation_page.attach_to_window(:title=>project_consultation_page.first_project+" - Task List - Capvision")
    project_consultation_page.update_task_link_after_calender_element.when_present.click
    project_consultation_page.input_start_time_element.when_present.set "23:59"
    project_consultation_page.input_end_time_element.when_present.set ""
    project_consultation_page.save_consultaion_element.when_present.click
    project_consultation_page.verify_alert_element.when_present.text.should include "Start Date不能大于End Date"
  end

  #consultation task list页面send calendar功能验证
  it 'task list_page send calendar to client when task is arranged' do
    project_consultation_page.filter
    project_consultation_page.select_project_element.when_present.click
    sleep 1
    project_consultation_page.attach_to_window(:title=>project_consultation_page.first_project+" - Task List - Capvision")
    project_consultation_page.send_calendar
  end
  
  #consultation task list页面cancel calendar功能验证
  it 'task list_page cancel calendar when task is arranged' do
    project_consultation_page.filter
    project_consultation_page.select_project_element.when_present.click
    project_consultation_page.attach_to_window(:title=>project_consultation_page.first_project+" - Task List - Capvision")
    project_consultation_page.send_calendar
    sleep 2
    project_consultation_page.cancel_calendar
  end
  #consultation task list页面选中单个task点击send sms按钮
  it 'task list_page send SMS to consultant(arrange task)' do
    project_consultation_page.filter
    project_consultation_page.select_project_element.when_present.click
    project_consultation_page.attach_to_window(:title=>project_consultation_page.first_project+" - Task List - Capvision")
    project_consultation_page.send_sms_arrange
  end

  #consultation task list页面选中多个task点击send sms按钮
  it 'task list_page send SMS to two consultants(arrange task)' do
    project_consultation_page.filter
    project_consultation_page.select_project
    sleep 1
    project_consultation_page.attach_to_window(:title=>project_consultation_page.first_project+" - Task List - Capvision")
    project_consultation_page.add_consultant
    project_consultation_page.change_second_task "Recommended"
    project_consultation_page.change_second_task "Arranged"
    project_consultation_page.send_sms_arrange
  end

  #添加两个顾问
  it 'task list_page add two consultants' do
    project_consultation_page.filter
    project_consultation_page.select_project_element.when_present.click
    project_consultation_page.attach_to_window(:title=>project_consultation_page.first_project+" - Task List - Capvision")
    project_consultation_page.add_two_consultants
    project_consultation_page.add_consultant_alert_element.when_present.text.should eql "These consultants have been added successfully."
  end
  #consultation task list 页面对单个task执行complete操作
  it 'task list_page update task status to complete' do
    project_consultation_page.filter
    project_consultation_page.select_project_element.when_present.click
    project_consultation_page.attach_to_window(:title=>project_consultation_page.first_project+" - Task List - Capvision")
    project_consultation_page.change_arrange_to_complete
  end
  
  #consultation task list complete页面consultation date必填验证
  it 'consultation task list page verify consultation date when update task to complete' do
    project_consultation_page.filter
    project_consultation_page.select_and_update_task "Completed"
    project_consultation_page.input_consultation_date_element.when_present.clear
    project_consultation_page.save_complete_page_btn_element.when_present.click
    #project_consultation_page.verify_alert_element.when_present.text.should include "Consultation Date cannot be blank."
  end
  
  #consultation task list complete页面访谈时间大于当前时间验证
  #consultation task list complete页面start time大于end time提示验证
  it 'consultation task list page verify consultation date when update task to complete' do
    project_consultation_page.filter
    project_consultation_page.select_and_update_task "Completed"
    project_consultation_page.input_end_time_element.when_present.clear
    project_consultation_page.input_start_time_element.when_present.set "23:59"
    project_consultation_page.save_complete_page_btn_element.when_present.click
    project_consultation_page.verify_alert_element.when_present.text.should include "Start Date不能大于End Date"
  end
  
  #consultation task list complete页面type of interview必填验证
  it 'consultation task list page verify type of interview when update task to complete' do
    project_consultation_page.filter
    project_consultation_page.select_and_update_task "Completed"
    project_consultation_page.consultation_task_type_of_interview_element.when_present.select "-Please choose-"
    project_consultation_page.save_complete_page_btn_element.when_present.click
    project_consultation_page.verify_alert_element.when_present.text.should include "Type Of Interview cannot be blank."
  end

  #consultation task list complete页面client hour必填验证
  it 'consultation task list page verify client hour when update task to complete' do
    project_consultation_page.filter
    project_consultation_page.select_and_update_task "Completed"
    project_consultation_page.input_task_receipts_hours_element.when_present.clear
    sleep 2
    project_consultation_page.save_complete_page_btn1_element.when_present.click
    project_consultation_page.verify_alert_element.when_present.text.should include "Client Hour cannot be blank."
  end

  #consultation task list complete页面client hour纯数字验证
  it 'consultation task list page verify client hour should be a number when update task to complete' do
    project_consultation_page.filter
    project_consultation_page.select_and_update_task "Completed"
    project_consultation_page.input_task_receipts_hours_element.when_present.set "1a.00"
    project_consultation_page.save_complete_page_btn_element.when_present.click
    project_consultation_page.verify_alert_element.when_present.text.should include "Client Hour must be a number."
  end

  #consultation task list complete页面billing note必填验证
  it 'consultation task list page verify billing note when update task to complete' do
    project_consultation_page.filter
    project_consultation_page.select_and_update_task "Completed"
    project_consultation_page.input_task_receipts_billnotes_element.when_present.clear
    sleep 2
    project_consultation_page.save_complete_page_btn1_element.when_present.click
    project_consultation_page.verify_alert_element.when_present.text.should include "Billing Notes cannot be blank."
  end

  #consultation task list complete页面consultant hour必填验证
  it 'consultation task list page verify consultant hour when update task to complete' do
    project_consultation_page.filter
    project_consultation_page.select_and_update_task "Completed"
    project_consultation_page.input_task_payment_hours_element.when_present.clear
    sleep 2
    project_consultation_page.save_complete_page_btn_element.when_present.click
    project_consultation_page.verify_alert_element.when_present.text.should include "Consultant Hour cannot be blank."
  end

  #consultation task list complete页面consultant hour纯数字验证
  it 'consultation task list page verify consultant hour should be a number when update task to complete' do
    project_consultation_page.filter
    project_consultation_page.select_and_update_task "Completed"
    project_consultation_page.input_task_payment_hours_element.when_present.set "1a.00"
    sleep 2
    project_consultation_page.save_complete_page_btn_element.when_present.click
    project_consultation_page.verify_alert_element.when_present.text.should include "Consultant Hour must be a number."
  end
  
  #consultation task list complete页面send feedback Email To Client勾选框验证
  it 'consultation task list page check the send feedback email to chient checkbox' do
    project_consultation_page.filter
    project_consultation_page.select_and_update_task "Completed"
    project_consultation_page.send_mail_client_box_element.when_present.click
    project_consultation_page.send_mail_client_box_element.when_present.checked?.should eql true
  end
  
  #consultation task list complete页面点击cancel
  it 'consultation task list compelte page click the cancel btn' do
    project_consultation_page.filter
    project_consultation_page.select_and_update_task "Completed"
    project_consultation_page.cancel_updatetask_element.when_present.click
    project_consultation_page.consultation_title_element.when_present.text.should include "C"
  end

  #consultant task list unsuccessful interview页面对多个task执行unsuccessful操作
  it 'consultation task list page update two tasks to unsuccessful interview' do
    project_consultation_page.filter
    project_consultation_page.select_project_element.when_present.click
    project_consultation_page.attach_to_window(:title=>project_consultation_page.first_project+" - Task List - Capvision")
    project_consultation_page.first_task_checkbox_element.when_present.click
    project_consultation_page.second_task_checkbox_element.when_present.click
    project_consultation_page.choose_taskaction_element.when_present.select "Unsuccessful interview"
    project_consultation_page.update_taskstatus_element.when_present.click
    project_consultation_page.alert_error_info_element.when_present.text.should include "You cannot choose multiple tasks."
  end
  
  #consultant task list unsuccessful interview页面对单个task执行unsuccessful操作
  it 'consultation task list page update task to unsuccessful interview' do
    project_consultation_page.filter
    project_consultation_page.select_and_update_task "Unsuccessful interview"
    project_consultation_page.consultation_title_element.when_present.text.should eql "Consultation Unsuccessful"
  end

  #consultant task list unsuccessful interview页面Send Feedback Email To Consultant勾选验证
  it 'consultation task list unsuccessful interview page check send feedback email to consultant box' do
    project_consultation_page.filter
    project_consultation_page.select_and_update_task "Unsuccessful interview"
    project_consultation_page.send_mail_consultant_box_element.when_present.click
    project_consultation_page.send_mail_consultant_box_element.when_present.checked?.should eql true
  end

  #consultant task list unsuccessful interview页面Cancel点击
  it 'consultation task list unsuccessful interview page click the cancel btn' do
    project_consultation_page.filter
    project_consultation_page.select_and_update_task "Unsuccessful interview"
    project_consultation_page.cancel_updatetask_element.when_present.click
    project_consultation_page.consultation_title_element.when_present.text.should include "CON"
  end

  #consultant task list unsuccessful interview页面submit点击
  
  #consultation task edit页面compete状态task的client hour必填验证
  it 'consultation task edit page verify client hour when task is completed' do
    project_consultation_page.filter
    project_consultation_page.select_and_update_task "Completed"
    project_consultation_page.input_task_receipts_hours_element.when_present.clear
    sleep 2
    project_consultation_page.complete_task_button_element.when_present.click
    project_consultation_page.verify_alert_element.when_present.text.should include "Client Hour cannot be blank."
  end
  
  #consultation task edit页面compete状态task的billing notes必填验证
  it 'consultation task edit page verify billing notes when task is completed' do
    project_consultation_page.filter
    project_consultation_page.select_and_update_task "Completed"
    project_consultation_page.input_task_receipts_billnotes_element.when_present.clear
    sleep 2
    project_consultation_page.complete_task_button_element.when_present.click
    project_consultation_page.verify_alert_element.when_present.text.should include "Billing Notes cannot be blank."
  end

  #consultation task edit页面compete状态task的consultant hour必填验证
  it 'consultation task edit page verify consultant hour when task is completed' do
    project_consultation_page.filter
    project_consultation_page.select_and_update_task "Completed"
    project_consultation_page.input_task_payment_hours_element.when_present.clear
    project_consultation_page.complete_task_button_element.when_present.click
    project_consultation_page.verify_alert_element.when_present.text.should include "Consultant Hour cannot be blank."
  end

  #删除状态为complete的consultation项目
  it 'delete consultation project when task status is completed' do
    project_consultation_page.filter
    project_consultation_page.select_project_element.when_present.click
    project_consultation_page.attach_to_window(:title=>project_consultation_page.first_project+" - Task List - Capvision")
    project_consultation_page.delete_completed_project
  end
  #task list页面删除completed task
  it 'task list_page delete completed task' do
    project_consultation_page.filter
    project_consultation_page.select_project_element.when_present.click
    project_consultation_page.attach_to_window(:title=>project_consultation_page.first_project+" - Task List - Capvision")
    project_consultation_page.change_completed_to_deleted
  end
  
  #consultation task edit页面点击save保存task编辑
  it 'task list_page update task information' do 
    project_consultation_page.filter
    project_consultation_page.select_project_element.when_present.click
    project_consultation_page.attach_to_window(:title=>project_consultation_page.first_project+" - Task List - Capvision")
    project_consultation_page.add_consultant
    project_consultation_page.update_task
  end
  
  #在not approve情况下将selected状态的task变为arranged状态
  it 'task list_page update selected task to arranged without approve' do 
    project_consultation_page.filter
    project_consultation_page.select_project_element.when_present.click
    project_consultation_page.attach_to_window(:title=>project_consultation_page.first_project+" - Task List - Capvision")
    project_consultation_page.change_seleted_to_arranged
  end

    #consultation task list页面CA发送后显示sign CA链接
  it 'task list_page send CA with client agreement' do 
    project_consultation_page.filter
    project_consultation_page.select_project_element.when_present.click
    project_consultation_page.attach_to_window(:title=>project_consultation_page.first_project+" - Task List - Capvision")
    project_consultation_page.link_to_compliance_element.when_present.click
    project_consultation_page.client_agreement
    project_consultation_page.task_list
    project_consultation_page.send_ca
  end
  
  #consultation task list页面未上传文档点击sign CA链接1
  it 'task list_page sign CA without uploading document' do 
    project_consultation_page.filter
    first_project = project_consultation_page.first_project
    project_consultation_page.select_project_element.when_present.click
    project_consultation_page.attach_to_window(:title=>first_project+" - Task List - Capvision")
    project_consultation_page.sign_ca_no_document
  end
  
  #consultation task list页面上传CA文档后点击sign CA链接
  #consultation task list页面CA发送后显示resend CA链接
  it 'task list_page resend CA with client agreement' do 
    project_consultation_page.filter
    project_consultation_page.select_project_element.when_present.click
    project_consultation_page.attach_to_window(:title=>project_consultation_page.first_project+" - Task List - Capvision")
    project_consultation_page.resend_ca 
  end
  #在tasklist页面更新文件
  it 'task list_page upload doc normal document to task' do 
    project_consultation_page.filter
    project_consultation_page.select_project_element.when_present.click
    project_consultation_page.attach_to_window(:title=>project_consultation_page.first_project+" - Task List - Capvision")
    project_consultation_page.upload_docnormal
  end

  #上传大于20M的文件
  it 'task list_page upload >20M doc document to task' do 
    project_consultation_page.filter
    project_consultation_page.select_project_element.when_present.click
    project_consultation_page.attach_to_window(:title=>project_consultation_page.first_project+" - Task List - Capvision")
    project_consultation_page.upload_dayu20m
  end
  
  #上传exe文件
  it 'task list_page upload .exe document to task' do 
    project_consultation_page.filter
    project_consultation_page.select_project_element.when_present.click
    project_consultation_page.attach_to_window(:title=>project_consultation_page.first_project+" - Task List - Capvision")
    project_consultation_page.upload_exe
  end
  
  #consultation task list页面document列文档删除功能验证
  it 'task list_page delete uploaded document' do 
    project_consultation_page.filter
    project_consultation_page.select_project_element.when_present.click
    project_consultation_page.attach_to_window(:title=>project_consultation_page.first_project+" - Task List - Capvision")
      project_consultation_page.delete_document
    
  end
  
  #task list页面反馈功能
  it 'task list_page feedback task' do
    project_consultation_page.filter
    project_consultation_page.select_project_element.when_present.click
    project_consultation_page.attach_to_window(:title=>project_consultation_page.first_project+" - Task List - Capvision")
    project_consultation_page.task_feedback
  end
  
  #task list页面更新KM notes
  it 'task list_page update KM notes' do
    project_consultation_page.filter
    project_consultation_page.select_project_element.when_present.click
    project_consultation_page.attach_to_window(:title=>project_consultation_page.first_project+" - Task List - Capvision")
    project_consultation_page.kmnotes
  end
  #consultation更新状态为on hold
  #consultation list页面on hold弹窗下拉菜单选取other出现文本输入框
  it 'consultation project update_status on hold ' do
      project_consultation_page.filter
      project_consultation_page.check_project_checkbox
      project_consultation_page.choose_action = "On Hold"
      project_consultation_page.project_update_btn
      project_consultation_page.onhold_note
      #sleep 2
      #project_consultation_page.alert_success.should include "status changed successfully."
  end
  #consultation list页面on hold操作原因必填验证
  it 'consultation project update_status on hold with no reason' do
      project_consultation_page.filter
      project_consultation_page.check_project_checkbox
      project_consultation_page.choose_action = "On Hold"
      project_consultation_page.project_update_btn
      sleep 2
      message = project_consultation_page.alert do
        sleep 2
        project_consultation_page.save_onhold_note_element.when_present.click
      end
      message.should == "Please choose a reason"
  end
   #consultation更新状态为invalid
  it 'consultation project update_status invalid ' do
      project_consultation_page.filter
      project_consultation_page.check_project_checkbox
      project_consultation_page.choose_action_element.when_present.select "Invalid"
      project_consultation_page.project_update_btn
      sleep 2
      project_consultation_page.input_invalid_note_element.when_present.set "at_wei_jun_da_ye_aaaaaaa"
      project_consultation_page.save_note_element.when_present.click
      sleep 2
      project_consultation_page.alert_success.should include "status changed successfully."
  end
  #cc
  #consultation更新状态为complete
  it 'consultation project update_status complete' do
    #project_consultation_page.project_status = "Invalid"
    #project_consultation_page.filter
    #project_consultation_page.check_project_checkbox
    #project_consultation_page.choose_action = "In Process"
    #project_consultation_page.project_update_btn
    #sleep 2
    project_consultation_page.project_status = "In Process"
    sleep 2
    project_consultation_page.filter
    project_consultation_page.check_project_checkbox
    project_consultation_page.choose_action = "Complete"
    project_consultation_page.project_update_btn_element.when_present.click
    sleep 2
    project_consultation_page.complete_save_note_element.when_present.click
    project_consultation_page.text.include? "status changed successfully"
  end
  
  #consultation list页面项目反馈信息必填项验证
  it 'consultation list page feedback' do
    project_consultation_page.filter
    project_consultation_page.project_feedback_link
    project_consultation_page.project_choosefeedback_element.when_present.select "-Please Choose Score-"
    message = project_consultation_page.alert do
      project_consultation_page.save_project_feedback_element.when_present.click
    end
    message.should == "please choose service quality"
  end
  
  #consultation list页面取消项目删除操作
  it 'consultation list page' do
    project_consultation_page.filter
    message = project_consultation_page.confirm(false) do
      project_consultation_page.delete_project_element.when_present.click
    end
  end

  #create consultation页面建项目step2必填项验证
  it 'create consultation page verify step1' do
    project_consultation_page.project_create_btn_element.when_present.click
    project_consultation_page.project_name_element.when_present.set "AT_我叫weijun"
    project_consultation_page.project_description_element.when_present.set "attest_consultation adad@!#!@3  123"
    project_consultation_page.select_industry_element.when_present.select "Agriculture - 农业"
    project_consultation_page.next_element.when_present.click
    project_consultation_page.save_element.when_present.click
    project_consultation_page.verify_alert_element.when_present.text.should include "Client cannot be blank."
  end
  
  #create consultation页面建项目step1 [Consultants Requested]纯数字输入验证
  it 'create consultation page verify step1 consultants requested' do
    project_consultation_page.project_create_btn_element.when_present.click
    project_consultation_page.input_consultants_requested_element.when_present.set "6d"
    project_consultation_page.next_element.when_present.click
    project_consultation_page.verify_alert_element.when_present.text.should include "Consultants Requested must be a number."
  end

  #create consultation页面建项目step1 [Consultants Expected]纯数字输入验证
  it 'create consultation page verify step1 consultants expected' do
    project_consultation_page.project_create_btn_element.when_present.click
    project_consultation_page.input_consultants_expected_element.when_present.set "6d"
    project_consultation_page.next_element.when_present.click
    project_consultation_page.verify_alert_element.when_present.text.should include "Consultants Expected must be a number."
  end

  #create consultation页面建项目step1 [price]文本框纯数字输入验证
  it 'create consultation page verify step1 price' do
    project_consultation_page.project_create_btn_element.when_present.click
    project_consultation_page.input_consultants_price_element.when_present.set "6d"
    project_consultation_page.next_element.when_present.click
    project_consultation_page.verify_alert_element.when_present.text.should include "Price must be a number."
  end
  
  #create consultation页面建项目step1 [price]单位选项验证
  it 'create consultation page verify step1 the selection of price type' do
    project_consultation_page.project_create_btn_element.when_present.click
    project_consultation_page.select_currency_element.when_present.select "RMB"
    project_consultation_page.select_currency_element.when_present.select "USD"
  end

  #create consultation页面建项目step1 [cancel]取消创建项目操作验证
  it 'create consultation page step1 click cancel btn' do
    project_consultation_page.project_create_btn_element.when_present.click
    project_consultation_page.cancel_btn
  end

  #consultation list页面不选中任何项目执行update操作
  it 'consultation list page update project without select project' do
    project_consultation_page.filter
    project_consultation_page.choose_action_element.when_present.select "In Process"
    message = project_consultation_page.alert do
      project_consultation_page.project_update_btn_element.when_present.click
    end
    message.should == "No projects selected."
  end

  #consultation list页面选中单个项目不选中执行动作点击update
  it 'consultation list page update project without select action' do
    project_consultation_page.filter
    project_consultation_page.project_checkbox_element.when_present.click
    message = project_consultation_page.alert do
      project_consultation_page.project_update_btn_element.when_present.click
    end
    message.should == "Please choose Action."
  end

  #consultation task list页面不选中任何项目执行update操作
  it 'consultation task list page update project without select project' do
    project_consultation_page.filter
    project_consultation_page.select_project_element.when_present.click
    project_consultation_page.attach_to_window(:title=>project_consultation_page.first_project+" - Task List - Capvision")
    project_consultation_page.choose_taskaction_element.when_present.select "Arranged"
    project_consultation_page.update_taskstatus_element.when_present.click
    project_consultation_page.alert_error_info_element.when_present.text.should include "You must select a task."
  end

  #consultation task list页面不选中任何task点击send sms按钮
  it 'consultation task list page send sms without select task' do
    project_consultation_page.filter
    project_consultation_page.select_project_element.when_present.click
    project_consultation_page.attach_to_window(:title=>project_consultation_page.first_project+" - Task List - Capvision")
    message= project_consultation_page.alert do
      project_consultation_page.send_sms_element.when_present.click
    end
    message.should == "You must select a task."       
  end

  #consultation task list页面sms发送页面点击cancel
  it 'consultation task list page send sms then click cancel btn' do
    project_consultation_page.filter
    project_consultation_page.select_project_element.when_present.click
    project_consultation_page.attach_to_window(:title=>project_consultation_page.first_project+" - Task List - Capvision")
    project_consultation_page.first_task_checkbox_element.when_present.click
    project_consultation_page.send_sms_element.when_present.click
    project_consultation_page.close_btn_element.when_present.click
  end
   
end