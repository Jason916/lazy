#encoding: utf-8

require File.expand_path 'app/cases/spec_helper'
require File.expand_path 'app/cases/shared/action'

describe 'HR page', :HR do
  let(:project_HR_page) do
    home_page = $navi.goto_home_page
    login_page = home_page.direct_to_login_page
    home_page = login_page.login "admin","1234"
    project_HR_page = home_page.direct_to_HR_page
  end
    #跳转到HRS项目页面
    it 'should visit HR project' do
      sleep 1
      project_HR_page.wait_until do
        sleep 1
        project_HR_page.title.should eql "HR Service - Capvision"
        end
      end
      #按照默认条件进行搜索
    it 'HR Service_project  search  all by default' do
      project_HR_page.search_default
      # project_HR_page.wait_until do
      #   project_HR_page.text.include? "In Process"
      # end
    end
    
    #按照users--bobo team进行搜索
    it 'HR Service_project  search  all users by Bobo team' do
      project_HR_page.search_users_element.when_present.click
      project_HR_page.click_users_element.when_present.click
      project_HR_page.search_default
      # sleep 3
      # project_HR_page.wait_until do
      #   project_HR_page.text.include? "In Process"
      # end
    end
    
    #按照participants--KM lead进行搜索
    it 'HR Service_project  search  participants by KM lead' do
      project_HR_page.search_participants_element.when_present.select "KM Lead"
      project_HR_page.search_default
      #project_HR_page.wait_until do
        sleep 2
        project_HR_page.text.include? "In Process"
      #end
    end
    #按照industry--energy进行搜索
    it 'HR Service_project  search industry by energy' do
      project_HR_page.search_industry_element.when_present.select "Energy - 能源"
      project_HR_page.search_default
      # project_HR_page.wait_until do
      #   project_HR_page.text.include? "In Process"
      # end
    end
    #按照status--open project进行搜索
    it 'HR Service_project  search status by open projects' do
      project_HR_page.search_status_element.when_present.select "Open Projects"
      sleep 1
      project_HR_page.search_default
      # project_HR_page.wait_until do
      #   project_HR_page.text.include? "In Process"
      # end
    end
    #按照project name进行搜索
    it 'HR Service_project  search project name' do
      project_HR_page.search_name_element.when_present.append "AT-HR-project1"
      project_HR_page.search_default
      # project_HR_page.wait_until do
      #   project_HR_page.text.include? "In Process"
      # end
    end
    #删除醒目
    it 'HR Service_project deleted' do
      project_HR_page.search_status_element.when_present.select "Invalid"
      project_HR_page.search_default
      project_HR_page.delete_project
    end
    #建项目填写完整信息创建项目验证
    it 'HR Service_project create HR Service function' do
      project_HR_page.create_HR
      project_HR_page.HR_name = "AT-HR-project1"
      project_HR_page.HR_description = "this is HR automation test"
      project_HR_page.HR_industry = "Aerospace - 航空"
      project_HR_page.HR_requested = "8"
      project_HR_page.HR_expected = "10"
      project_HR_page.HR_price = "1000"
      project_HR_page.HR_timeframe = "In one week"
      project_HR_page.HR_next
      sleep 1
      project_HR_page.choose_client_input_element.when_present.click
      sleep 2
      project_HR_page.choose_client_content_element.when_present.click
      project_HR_page.project_manager_element.when_present.select "test_km1"
      project_HR_page.recruit_position = "AT-HR"
      project_HR_page.recurit_note = "this is automation test"
      sleep 1
      project_HR_page.recruite_function_input_element.when_present.click
      sleep 2
      project_HR_page.recruite_function_content_element.when_present.click
      project_HR_page.recruit_salary = "面议"
      project_HR_page.recruit_gender = "All"
      project_HR_page.recruit_workyear = "2"
      #project_HR_page.recruit_degree = "Undergraduate"
      #project_HR_page.recruit_job = "this is job test"
      project_HR_page.recruit_save
      # project_HR_page.wait_until do
      #   project_HR_page.text.include? "AT-HR-project1"
      # end
    end
    #查看项目信息
    it 'HR Service_project view function' do
      project_HR_page.search_default
      project_HR_page.view_project_element.click
      sleep 2
      project_HR_page.attach_to_window(:title =>project_HR_page.first_project+" - Capvision")
      project_HR_page.text.include? "this is HR automation test"
    end
    #编辑基本信息--basic information
    it 'project info_page basic information edit' do
      project_HR_page.search_default
      project_HR_page.view_project
      sleep 3
      project_HR_page.attach_to_window(:title=>project_HR_page.first_project+" - Capvision")
      project_HR_page.edit_basicinfo
      project_HR_page.text.include? "edit basic information"
    end
    #编辑项目基本信息--recruite requirements
    it 'project info_page recruiting requirements edit' do
      project_HR_page.search_default
      project_HR_page.view_project
      project_HR_page.attach_to_window(:title=>project_HR_page.first_project+" - Capvision")
      project_HR_page.edit_recruite
      project_HR_page.text.include? "edit recruite note"
    end
    #编辑项目基本信息--client&contact
    it 'project info_page client&contact edit' do
      project_HR_page.search_default
      project_HR_page.view_project
      sleep 3
      project_HR_page.attach_to_window(:title=>project_HR_page.first_project+" - Capvision")
      project_HR_page.edit_client
      sleep 2
      project_HR_page.text.include? "ryan"
    end
    #编辑项目基本信息--project team
    it 'project info_page  project team edit' do
      project_HR_page.search_default
      project_HR_page.view_project
      sleep 3
      project_HR_page.attach_to_window(:title=>project_HR_page.first_project+" - Capvision")
      project_HR_page.team_edit_icon_element.click
      sleep 2
      project_HR_page.team_edit_icon_element.click
      sleep 3
      project_HR_page.text.include? "Alex Tang"
    end
    #添加consultant task
    it 'add consultant to consultant tasks' do
      project_HR_page.goto_project
      project_HR_page.attach_to_window(:title=>project_HR_page.first_project+" - Task List - Capvision")
      project_HR_page.add_consultant
      #project_HR_page.text.include? "Not Contacted"
    end
    #hrs task list arrange页面非recommend状态的task无法执行arrange操作验证
    it 'update task status to arrange without recommended task ' do
      project_HR_page.goto_project
      sleep 2
      project_HR_page.attach_to_window(:title=>project_HR_page.first_project+" - Task List - Capvision")
      project_HR_page.check_click_firsttask
      project_HR_page.change_task_action = "Arranged"
      project_HR_page.update_task_status_element.click
      sleep 3 
      project_HR_page.text.include? "Arranged"
    end
    #hrs task list recommend页面对多个task执行recommend操作
    it 'update some tasks status to recommend with consultant enrolled' do
      project_HR_page.goto_project
      project_HR_page.attach_to_window(:title=>project_HR_page.first_project+" - Task List - Capvision")
      project_HR_page.add_consultant
      project_HR_page.check_click_firsttask
      project_HR_page.check_click_secondtask
      project_HR_page.change_task_action = "Recommended"
      project_HR_page.update_task_status_element.click
      sleep 3
      project_HR_page.recommend_change_status_element.click
      #sleep 2
      #project_HR_page.text.include? "Recommended"
        end
        #hrs task list recommend页面对单个task执行recommend操作
    it 'update task status to recommend' do
      project_HR_page.goto_project
      sleep 2
      project_HR_page.attach_to_window(:title=>project_HR_page.first_project+" - Task List - Capvision")
      project_HR_page.check_click_firsttask
      project_HR_page.change_task_action = "Recommended"
      project_HR_page.update_task_status_element.click
      sleep 3
      project_HR_page.recommend_change_status_element.click
      sleep 3
      project_HR_page.text.include? "Recommended"
    end
    #recommend step2: 点击send email to client
    it 'update task status to recommend with sending email to client' do
      project_HR_page.goto_project
      sleep 2
      project_HR_page.attach_to_window(:title=>project_HR_page.first_project+" - Task List - Capvision")
      project_HR_page.check_click_firsttask
      project_HR_page.change_task_action = "Recommended"
      project_HR_page.update_task_status_element.click
      sleep 3
      project_HR_page.recommend_next_element.click
      sleep 3
      project_HR_page.recommend_email_element.when_present.click
      project_HR_page.recommend_emailselect
      project_HR_page.recommend_sendemail_element.click
      sleep 3
      project_HR_page.update_task_status_element.when_present.text.should eql "Update"
    end
    #hrs task list arrange页面对单个task执行arrange操作
    it 'update task status to arrange' do 
      project_HR_page.goto_project
      sleep 2
      project_HR_page.attach_to_window(:title=>project_HR_page.first_project+" - Task List - Capvision")
      project_HR_page.check_click_firsttask
      project_HR_page.change_task_action = "Arranged"
      project_HR_page.update_task_status_element.click
      sleep 3
      project_HR_page.arrange_time = "23:55"
      project_HR_page.arrange_changestatus_element.click
      sleep 3
      project_HR_page.text.include? "Arranged"
    end
#标记
    #hrs task list complete页面billing note必填验证
    #hrs task list complete页面client hour必填验证
    it 'hrs task list page complete project then verify consultation date' do
       project_HR_page.goto_hrs_task_list_page
       # project_HR_page.client_cash_link_element.when_present.click
       # project_HR_page.input_client_message_element.when_present.clear
       # project_HR_page.input_client_message_element.when_present.append "1000"
       # project_HR_page.save_client_message_element.when_present.click
       # project_HR_page.client_billing_notes_link_element.when_present.click
       # project_HR_page.input_client_message_element.when_present.clear
       # project_HR_page.input_client_message_element.when_present.append "abc"
       # project_HR_page.save_client_message_element.when_present.click
       project_HR_page.click_firsttask_element.when_present.click
       project_HR_page.change_task_action_element.when_present.select "Completed"
       project_HR_page.update_task_status_element.when_present.click
       project_HR_page.client_error_info_element.when_present.text.should eql "Client hour,Client Cash,Billing Notes can't be all empty."
    end
    #hrs task list complete页面client hour纯数字验证
     it 'hrs task list page client hour must be number' do
       project_HR_page.goto_hrs_task_list_page
       project_HR_page.client_hour_link_element.when_present.click
       project_HR_page.input_client_message_element.when_present.clear
       project_HR_page.input_client_message_element.when_present.append "1sd"
       project_HR_page.save_client_message_element.when_present.click
       project_HR_page.cash_hour_verify_element.when_present.text.should eql "Client Hour must be number"
     end
    #hrs task list complete页面client cash纯数字验证
    it 'hrs task list page client cash must be number' do
       project_HR_page.goto_hrs_task_list_page
       project_HR_page.client_cash_link_element.when_present.click
       project_HR_page.input_client_message_element.when_present.clear
       project_HR_page.input_client_message_element.when_present.append "1sd"
       project_HR_page.save_client_message_element.when_present.click
       project_HR_page.cash_hour_verify_element.when_present.text.should eql "Client Cash must be number"
    end
    
    
    #it 'update task status to complete' do
    # project_HR_page.goto_project
    #project_HR_page.attach_to_window(:title=>project_HR_page.first_project+" - Task List - Capvision")
    # project_HR_page.change_task_completed
    #end
    
    #hrs list页面对单个项目执行in process操作
    it 'HR Service_project update_status in process' do
      project_HR_page.search_default
      project_HR_page.check_click_firstproject
      project_HR_page.change_action = "In Process"
      project_HR_page.update_action
      # project_HR_page.wait_until do
      #   sleep 2
      #   project_HR_page.text.include? project_HR_page.first_project+" status changed successfully."
      # end
    end
    #hrs list页面对多个项目执行in process操作
    it 'HR Service_project update_status in process for some tasks' do
      project_HR_page.search_default
      project_HR_page.check_click_firstproject
      project_HR_page.check_click_secondproject
      project_HR_page.change_action = "In Process"
      project_HR_page.update_action
      sleep 3
      project_HR_page.text.include? "status changed successfully. "
    end
    #hrs list页面对单个项目执行on hold操作
    it 'HR Service_project update_status on hold' do
      project_HR_page.search_default
      project_HR_page.check_click_firstproject
      project_HR_page.change_action = "On Hold"
      project_HR_page.update_action
      sleep 3
      project_HR_page.onhold_note_element.when_present.select "Change of project direction"
      project_HR_page.onhold_save_element.when_present.click
    end
    #hrs list页面对多个项目执行on hold操作
    it 'HR Service_project update_status on hold for some tasks' do
      project_HR_page.search_default
      project_HR_page.check_click_firstproject
      project_HR_page.check_click_secondproject
      project_HR_page.change_action = "On Hold"
      message = project_HR_page.alert do
        project_HR_page.update_action
      end
      sleep 2
      message.should == "You cannot choose multi-project for this operation."

    end
    #hrs list页面对单个项目执行invalid操作
    it 'HR Service_project update_status invalid' do
      project_HR_page.search_default
      project_HR_page.check_click_firstproject
      project_HR_page.change_action = "Invalid"
      project_HR_page.update_action
      sleep 2
      project_HR_page.invalid_note = "automation test"
      project_HR_page.invalid_save
      sleep 1
      project_HR_page.search_status = "Invalid"
      project_HR_page.search_default_element.when_present.click
    end
    #hrs list页面对多个项目执行invalid操作
    it 'HR Service_project update_status invalid for some tasks' do
      project_HR_page.search_default
      project_HR_page.check_click_firstproject
      project_HR_page.check_click_secondproject
      project_HR_page.change_action = "Invalid"
      message = project_HR_page.alert do
        project_HR_page.update_action
      end
      sleep 2
      message.should == "You cannot choose multi-project for this operation."
    end
    #hrs list页面对多个项目执行complete操作
    it 'HR Service_project update_status complete for some tasks' do
      project_HR_page.search_default
      project_HR_page.check_click_firstproject
      project_HR_page.check_click_secondproject
      project_HR_page.change_action = "Complete"
      message = project_HR_page.alert do
        project_HR_page.update_action
      end
      sleep 2
      message.should == "You cannot choose multi-project for this operation."
    end
#标记
    #hrs search by client
    it 'HR Service_project search by client' do
      project_HR_page.click_client_to_search_element.when_present.click
      project_HR_page.select_client_name_for_search_element.when_present.click     
      project_HR_page.search_default
    end
    #hrs search by status
    it 'HR Service_project search by status' do
      project_HR_page.search_status="In Process"    
      project_HR_page.search_default
      project_HR_page.wait_until do
        project_HR_page.hrs_table_list_status.should eql "In Process"
      end
    end
    #hrs search by keyword(name)
    it 'HR Service_project search by keyword(name)' do
      project_HR_page.search_name_element.when_present.append "AT-HR"   
      project_HR_page.search_default
      project_HR_page.wait_until do
        project_HR_page.first_hr_project_element.when_present.text.should include "AT-HR"
      end
    end
    #hrs search by keyword(description)
    it 'HR Service_project search by keyword(description)' do
      project_HR_page.search_name_element.when_present.append "this is"   
      project_HR_page.search_default
      project_HR_page.wait_until do
        project_HR_page.first_hr_project_element.when_present.text.should include "AT-HR"
      end
    end
    #根据多个组合筛选项搜索hrs
    it 'HR Service_project search by keyword(description)' do
      project_HR_page.search_name_element.when_present.append "this is"   
      project_HR_page.search_default
      project_HR_page.wait_until do
        project_HR_page.first_hr_project_element.when_present.text.should include "AT-HR"
      end
    end
    #项目删除图标弹窗
    it 'HR Service_project delete project display the popup' do 
      project_HR_page.search_default
      message = project_HR_page.confirm(false) do
        project_HR_page.delete_project_link_element.when_present.click
      end
      message.should =="Are you sure you wish to delete this project?"
    end
    #项目名链接打开项目验证
    it 'HR Service_project click project link to verify the project name' do 
      project_HR_page.goto_hrs_task_list_page
      project_HR_page.hrs_project_title_element.when_present.text.should include "AT-HR-project1"
    end
    #hrs task list页面改为deleted状态的task不再显示在list页面
    it 'HR Service_project make sure deleted status is not in task list page' do 
      project_HR_page.goto_hrs_task_list_page
      project_HR_page.hrs_project_title_element.when_present.text.should_not include "Deleted"
    end
    #hrs task list页面点击add consultant按钮页面跳转
    it 'HR Service_project click add consultant btn on hrs task list page' do 
      project_HR_page.goto_hrs_task_list_page
      project_HR_page.add_consultant_task_element.when_present.click
      project_HR_page.add_consultant_button_element.when_present.text.should eql "Add Consultant To Project"
    end
    #hrs task list页面成功添加顾问提示弹窗点击ok
    it 'HR Service_project hrs task list click the ok btn on popup' do 
      project_HR_page.goto_hrs_task_list_page
      project_HR_page.add_consultant_task_element.when_present.click
      project_HR_page.search_default
      project_HR_page.select_first_consultant_element.when_present.click
      project_HR_page.add_consultant_button_element.when_present.click
      project_HR_page.ok_btn_element.when_present.click
      project_HR_page.title.should eql "Consultants search - Capvision"
    end
    #hrs task list页面点击km notes进行编辑
    it 'HR Service_project hrs task list page edit km notes' do
      project_HR_page.goto_hrs_task_list_page
      project_HR_page.edit_km_note_element.when_present.click
      project_HR_page.input_km_notes_element.when_present.set "1010"
      project_HR_page.save_km_notes_element.when_present.click
    end
    #hrs task list页面点击顾问名打开顾问profile页面
    it 'HR Service_project hrs task list page click consultant link' do
      project_HR_page.goto_hrs_task_list_page
      project_HR_page.consultant_link_element.when_present.click
      project_HR_page.attach_to_window(:title=>"Han - Capvision")
      project_HR_page.add_points_btn_element.when_present.text.should eql "Add Points"
    end


end