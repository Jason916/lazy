#encoding: utf-8
require File.expand_path 'app/cases/spec_helper'
require File.expand_path 'app/cases/shared/action'

describe 'conference page', :conference do

  let(:project_conference_page) do
    home_page = $navi.goto_home_page
    login_page = home_page.direct_to_login_page
    home_page = login_page.login "admin","1234"
    project_conference_page = home_page.direct_to_conference_page
  end
      #跳转到conference project页面
      it 'should visit conference project' do
        project_conference_page.title.include? 'Conference'
      end

      #按照默认条件进行搜索a
      it 'conference_project  search all by default' do
        project_conference_page.search_default
        project_conference_page.search_default_element.when_present.text.should include "Search"
      end

      #按照users--bobo team进行搜索
      it 'conference_project  search  all users by Bobo team' do
        project_conference_page.select_users_element.when_present.click
        project_conference_page.click_users_element.when_present.click
        project_conference_page.search_default
        project_conference_page.search_default_element.when_present.text.should include "Search"
      end

      #按照participants--KM lead进行搜索
      it 'conference_project  search  participants by KM lead' do
        project_conference_page.select_participants = "KM Lead"
        project_conference_page.search_default
        project_conference_page.search_default_element.when_present.text.should include "Search"
      end

      #按照industry--energy进行搜索
      it 'conference_project  search industry by energy' do
        project_conference_page.select_industry = "Energy - 能源"
        project_conference_page.search_default
        project_conference_page.search_default_element.when_present.text.should include "Search"
      end

      #按照status--open status进行搜索
      it 'conference_project  search status by open projects' do
        project_conference_page.select_status = "Open Projects"
        project_conference_page.search_default
        project_conference_page.search_default_element.when_present.text.should include "Search"
      end

      #按照project type--tele60进行搜索
      it 'conference_project  search project type by tele60' do
        project_conference_page.select_type = "Tele60"
        project_conference_page.search_default
        project_conference_page.search_default_element.when_present.text.should include "Search"
      end

      #按照project name进行搜索
      it 'conference_project  search by project name' do
        project_conference_page.search_keywords = "ATconference_project"
        project_conference_page.search_default
        project_conference_page.search_default_element.when_present.text.should include "Search"
      end

      #项目搜索页面根据industry+project status点击搜索
      it 'conference_project search by industry and project status' do
        project_conference_page.select_industry = "Aerospace - 航空"
        project_conference_page.select_status = "Open Projects"
        project_conference_page.search_default
        project_conference_page.search_default_element.when_present.text.should include "Search"
      end

      #删除conference project
      it 'conference_project deleted' do
        project_conference_page.select_status = "Invalid"
        project_conference_page.search_default
        project_conference_page.delete_project
      end

      #项目创建页面不填写任何内容，点击create
      it 'create conference with nothing then click create button' do
        project_conference_page.conference_create
        project_conference_page.conference_next
        project_conference_page.all_alerts_element.when_present.text.should include "Please fix the following input errors"
      end

      #项目创建页面不填写project name,点击create
      it 'create conference without project name and then click create button' do 
        project_conference_page.conference_create
        project_conference_page.conference_description = 'automation test'
        project_conference_page.conference_industry = 'Food & Beverage - 食品饮料'
        project_conference_page.conference_next
        project_conference_page.all_alerts_element.when_present.text.should include "Name cannot be blank"
      end
      #项目创建页面不填写project description,点击create
      it 'create conference without project description and then click  create button' do
        project_conference_page.conference_create
        project_conference_page.conference_name = "ATconference_project"
        project_conference_page.conference_industry = 'Food & Beverage - 食品饮料'
        project_conference_page.conference_next
        project_conference_page.all_alerts_element.when_present.text.should include "Project Description cannot be blank"
      end
      #项目创建页面不填写industry，点击create
      it 'create conference without industry and then click  create button' do
        project_conference_page.conference_create
        project_conference_page.conference_name = "ATconference_project"
        project_conference_page.conference_description = 'automation test'
        project_conference_page.conference_next
        project_conference_page.all_alerts_element.when_present.text.should include "Industry cannot be blank"
      end
      #项目创建页面consultants requested填写5.5，点击create
      it 'create conference with consultants requested is 5.5' do
        project_conference_page.conference_create
        project_conference_page.conference_request = '5.5'
        project_conference_page.conference_next
        project_conference_page.all_alerts_element.when_present.text.should include "Consultants Requested must be an integer"
      end
      #项目创建页面consultants expected填写5.5，点击create
      it 'create conference with consultants expected is 5.5' do
        project_conference_page.conference_create
        project_conference_page.conference_expect = '5.5'
        project_conference_page.conference_next
        project_conference_page.all_alerts_element.when_present.text.should include "Consultants Expected must be an integer"
      end
      #项目创建页面price填写88.8，点击create
      it 'create conference with price is 88.8' do
        project_conference_page.conference_create
        project_conference_page.conference_price_element.when_present.set '88.8'
        project_conference_page.conference_next
        project_conference_page.all_alerts_element.when_present.text.should include "Price must be an integer"
      end
      #项目创建页面conference 创建第一步内容填写正确，点击cancel
      it 'create conferece with correct content and then click cancel' do
        project_conference_page.conference_create_element.when_present.click
        project_conference_page.conference_cancel_element.when_present.click
        #project_conference_page.title.should eql "Conference Projects - Capvision"
      end
      #创建conference project
      it 'conference_project create conference function' do
        project_conference_page.create_project
      end

      #编辑项目basic information
      it 'project info_page basic information edit' do
        project_conference_page.goto_project
        project_conference_page.edit_basicinfomation
      end

      #编辑项目基本信息---project team
      it 'project info_page  project team edit' do
        project_conference_page.goto_project
        project_conference_page.edit_projectteam
        project_conference_page.project_team_info_element.when_present.text.should include "test_km1"
      end
#################################################################################################################################
      #添加consultant task
      it 'add consultant to consultant tasks' do
        project_conference_page.goto_project
        project_conference_page.add_consultant
      end
      #consultants tasks页面删除not contacted状态的task
      it 'consultants_tasks delete task which status is not Contacted' do
        project_conference_page.goto_project
        project_conference_page.check_click_firsttask
        project_conference_page.select_task_status = "Deleted"
        project_conference_page.update_task_status_element.click
        #验证没写
      end
      #consultants tasks页面不更改任何内容，将tasks状态更改为completed
      it 'consultants_tasks update status to completed without anything' do 
        project_conference_page.goto_project
        project_conference_page.add_consultant
        project_conference_page.check_click_firsttask
        project_conference_page.select_task_status = "Completed"
        project_conference_page.update_task_status_element.click
        sleep 2
        project_conference_page.text.include? "consultation date can't be empty."
      end
      #consultants tasks页面填写date,将tasks状态更改为completed
      it 'consultants_tasks update status to completed with date_yes' do 
        project_conference_page.goto_project
        project_conference_page.consultant_task_date_element.click
        project_conference_page.date_yes_element.click
        project_conference_page.check_click_firsttask
        project_conference_page.select_task_status = "Completed"
        project_conference_page.update_task_status_element.click
        sleep 2
        project_conference_page.text.include? "Consultant hour, Consultant Cash, Payment Notes can't be all empty."
      end
      #consultants tasks页面填写date，consultant hour,将task状态更改为completed
      it 'consultants_tasks update status to completed with date_yes consultanthour_yes' do
        project_conference_page.goto_project
        project_conference_page.consultant_task_hour_element.click
        project_conference_page.consultant_hour_input = "8"
        project_conference_page.cohour_yes_element.click
        project_conference_page.check_click_firsttask
        project_conference_page.select_task_status = "Completed"
        project_conference_page.update_task_status_element.click
        sleep 2
        project_conference_page.text.include? "Change task status successfully."
      end
      #consultants tasks页面编辑MKT notes
      it 'consultants_tasks edit mkt notes' do
        project_conference_page.goto_project
        project_conference_page.consultant_task_notes_element.when_present.click
        project_conference_page.consultant_notes_input = "mkt notes"
        project_conference_page.notes_yes_element.click
        project_conference_page.text.include? "mkt notes"

      end
      #consultants tasks页面编辑consultant cash，点击cancel--------------------有点问题
      it 'consultants_tasks edit consultant cash----click cancel' do
        project_conference_page.goto_project
        project_conference_page.consultant_task_cash_element.when_present.click
        project_conference_page.consultant_task_cash_element.when_present.click
        project_conference_page.consultant_cash_input_element.when_present.set "1000"
        project_conference_page.cocash_cancel_element.when_present.click
      end
      #consultants tasks页面编辑consultant cash，点击save
      it 'consultants_tasks edit consultant cash----click save' do
        project_conference_page.goto_project
        project_conference_page.consultant_task_cash_element.when_present.click
        project_conference_page.consultant_task_cash_element.when_present.click
        project_conference_page.consultant_cash_input_element.when_present.set "1000"
        project_conference_page.cocash_save_element.click
        project_conference_page.text.include? "1000"
      end
      
      #consultants tasks页面上传pdf(大于20M)文件，点击upload
      it 'consultants_tasks_page upload >20M doc document' do
        project_conference_page.goto_project
        project_conference_page.upload_pdfdayu20
        project_conference_page.text.include? "dayu20M.pdf"
      end
      #consultants tasks页面上传doc(小于20m)文件，点击upload
      it 'consultants_tasks_page upload <20M doc document' do
        project_conference_page.goto_project
        project_conference_page.upload_normal_doc
        project_conference_page.text.include? "NDB-Tables.doc"
      end
      #consultants tasks页面删除上传的文件
      it 'consultants_tasks_page deleted document uploaded' do
        project_conference_page.goto_project
        project_conference_page.delete_document
      end
      #consultants tasks页面上传docx(小于20m)文件，点击upload
      it 'consultants_tasks_page upload <20M docx document' do
        project_conference_page.goto_project
        project_conference_page.upload_normal_docx
        project_conference_page.text.include? "sprint1.docx"
      end
      #consultants tasks页面上传xls(小于20m)文件，点击upload
      it 'consultants_tasks_page upload <20M xls document' do
        project_conference_page.goto_project
        project_conference_page.upload_normal_xls
        project_conference_page.text.include? "xls.xls"
      end
      #consultants tasks页面上传xlsx(小于20m)文件，点击upload
      it 'consultants_tasks_page upload <20M xlsx document' do
        project_conference_page.goto_project
        project_conference_page.upload_normal_xlsx
        project_conference_page.text.include? "xlsx.xlsx"
      end
      #consultants tasks页面上传msg(小于20m)文件，点击upload
      it 'consultants_tasks_page upload <20M msg document' do
        project_conference_page.goto_project
        project_conference_page.upload_normal_msg
        project_conference_page.text.include? "test_msg_file.msg"
      end
      #consultants tasks页面上传ppt小于20m)文件，点击upload
      it 'consultants_tasks_page upload <20M ppt document' do
        project_conference_page.goto_project
        project_conference_page.upload_normal_ppt
        project_conference_page.text.include? "test.ppt"
      end
      #consultants tasks页面上传pptx(小于20m)文件，点击upload
      it 'consultants_tasks_page upload <20M pptx document' do
        project_conference_page.goto_project
        project_conference_page.upload_normal_pptx
        project_conference_page.text.include? "test.pptx"
      end
      #consultants tasks页面上传exe文件，点击upload
      it 'consultants_tasks_page upload <20M exe document' do
        project_conference_page.goto_project
        project_conference_page.upload_normal_exe
        project_conference_page.text.include? "EXE.exe"
      end

      #consultants tasks页面不上传任何内容，点击upload------------------------N/A（页面没有变动，无法验证）


      #consultants tasks页面删除completed状态的task
      it 'consultants_tasks delete task which status is completed' do
        project_conference_page.goto_project
        project_conference_page.check_click_firsttask
        project_conference_page.select_task_status = "Deleted"
        project_conference_page.update_task_status_element.when_present.click
      end

      #consultants tasks页面创建多个task，查看total consultant hour
      it 'consultants_tasks view total consultant hour' do
        project_conference_page.goto_project
        project_conference_page.add_consultant
        sleep 5
        project_conference_page.add_consultant
        sleep 5
        project_conference_page.consultant_task_hour_element.when_present.click
        project_conference_page.consultant_hour_input_element.when_present.set "8"
        project_conference_page.cohour_yes_element.when_present.click

        project_conference_page.consultant_task_hour1_element.when_present.click
        project_conference_page.consultant_hour_input_element.when_present.set "7"
        project_conference_page.cohour_yes_element.when_present.click
        project_conference_page.text.include? "15"
      end
      #consultants tasks页面创建多个task，查看total consultant cash
      it 'consultants_tasks view total consultant cash' do
        project_conference_page.goto_project
        project_conference_page.hidden_element
        project_conference_page.consultant_task_cash_element.when_present.click
        project_conference_page.consultant_task_cash_element.when_present.click
        project_conference_page.consultant_cash_input_element.when_present.set "1000"
        project_conference_page.cocash_save_element.when_present.click
        sleep 2
        project_conference_page.consultant_task_cash1_element.when_present.click
        project_conference_page.consultant_task_cash1_element.when_present.click
        sleep 3
        project_conference_page.consultant_cash_input_element.when_present.set "2000"
        project_conference_page.cocash_save_element.when_present.click

        project_conference_page.text.include? "3000"
      end

      #添加contact task
      it 'add contact to contacts tasks' do
        project_conference_page.goto_project
        project_conference_page.add_contacts
        project_conference_page.text.include? "Not Contacted" 
      end
      #contacts tasks页面删除not contacted状态的task
      it 'contacts_tasks delete not contacted task' do
        project_conference_page.goto_contacts_tasks
        project_conference_page.check_click_firsttask
        project_conference_page.select_task_status = "Deleted"
        project_conference_page.update_task_status_element.click
      end
      #contacts tasks页面不更改任何内容，将tasks状态更改为completed
      it 'contacts_tasks update task to completed without anything' do
        project_conference_page.goto_project
        project_conference_page.add_contacts
        project_conference_page.hidden_element
        project_conference_page.click_firsttask_element.when_present.click
        project_conference_page.select_task_status = "Completed"
        project_conference_page.update_task_status_element.when_present.click
      end
      #contacts tasks页面填写date，将tasks状态更改为completed
      it 'contacts_tasks update task to completed with date_yes' do
        project_conference_page.goto_contacts_tasks
        project_conference_page.contact_task_date_element.click
        project_conference_page.date_yes_element.click
        project_conference_page.check_click_firsttask
        project_conference_page.select_task_status = "Completed"
        project_conference_page.update_task_status_element.click
        project_conference_page.text.include? "Client hour,Client Cash,Billing Notes can't be all empty. "
      end
      

      #contacts tasks页面填写date，contact hour，将task状态更改为completed
      it 'contacts_tasks update task to completed with date_yes contacthour_yes' do
        project_conference_page.goto_contacts_tasks
        project_conference_page.contact_task_hour_element.click
        project_conference_page.contact_hour_input = "8"
        project_conference_page.clhour_yes_element.click
        project_conference_page.check_click_firsttask
        project_conference_page.select_task_status = "Completed"
        project_conference_page.update_task_status_element.click
        sleep 3
        project_conference_page.text.include? "Change task status successfully."
      end
      #contacts tasks页面删除completed状态的task
      it 'contacts_tasks delete completed task' do
        project_conference_page.goto_contacts_tasks
        project_conference_page.contact_tasks_element.when_present.click
        project_conference_page.check_click_firsttask
        project_conference_page.select_task_status = "Deleted"
        project_conference_page.update_task_status_element.click
      end
      #contacts tasks页面创建多个task，查看total contact hour
      it 'contacts_tasks view total contact hour' do
        project_conference_page.goto_project
        project_conference_page.add_contacts
        project_conference_page.add_contacts
        project_conference_page.contact_task_hour_element.when_present.click
        project_conference_page.contact_hour_input_element.when_present.set"8"
        project_conference_page.clhour_yes_element.when_present.click
        project_conference_page.contact_task_hour1_element.when_present.click
        project_conference_page.contact_hour_input_element.when_present.set"7"
        project_conference_page.clhour_yes_element.click
        project_conference_page.text.include? "15"
      end
      #contacts tasks页面创建多个task，查看total contact cash
      it 'contacts_tasks view total contact cash' do
        project_conference_page.goto_contacts_tasks
        project_conference_page.contact_task_cash_element.when_present.click
        project_conference_page.contact_cash_input_element.when_present.set"1000"
        project_conference_page.clcash_yes_element.when_present.click
        project_conference_page.contact_task_cash1_element.click
        project_conference_page.contact_cash_input_element.when_present.set"2000"
        project_conference_page.clcash_yes_element.when_present.click
        project_conference_page.text.include? "3000"
      end
      #contacts tasks页面编辑KM notes
      it 'contacts_tasks edit KM notes' do
        project_conference_page.goto_contacts_tasks
        project_conference_page.contact_task_kmnotes_element.click
        project_conference_page.contact_kmnotes_input = "KM NOTES YAO"
        project_conference_page.kmnotes_yes_element.click
        project_conference_page.text.include? "KM NOTES YAO"
      end

      #对单个项目执行in process操作
      it 'conference_project update_status in process' do
        project_conference_page.search_default
        project_conference_page.check_click_firstpro
        project_conference_page.select_action = "In Process"
        project_conference_page.action_update
        sleep 3
        project_conference_page.select_status = "In Process"
        project_conference_page.search_default
        project_conference_page.search_default_element.when_present.text.should include "Search"
      end
      #对单个项目执行 on hold 操作
      it 'conference_project update_status on hold' do
        project_conference_page.search_default
        project_conference_page.check_click_firstpro
        project_conference_page.select_action = "On Hold"
        project_conference_page.action_update
        sleep 3
        project_conference_page.onhold_list = "Change of project direction"
        sleep 1
        project_conference_page.onhold_save
        sleep 2
        project_conference_page.select_status = "On Hold"
        project_conference_page.search_default
        project_conference_page.search_default_element.when_present.text.should include "Search"
      end

      #对单个项目执行invalid操作
      it 'conference_project update_status invalid' do
        project_conference_page.search_default
        project_conference_page.check_click_firstpro
        project_conference_page.select_action = "Invalid"
        project_conference_page.action_update
        sleep 3
        project_conference_page.invalid_note = "change status to invalid"
        sleep 1
        project_conference_page.invalid_save
        sleep 2
        project_conference_page.select_status = "Invalid"
        project_conference_page.search_default
        project_conference_page.search_default_element.when_present.text.should include "Search"

      end     
  end
