#encoding: utf-8
require File.expand_path 'app/cases/spec_helper'
require File.expand_path 'app/cases/shared/action'

describe 'convey page', :convey do
	let(:project_convey_page) do
		home_page = $navi.goto_home_page
		login_page = home_page.direct_to_login_page
		home_page = login_page.login "admin","1234"
		project_convey_page = home_page.direct_to_convey_page
	end
		#跳转到GES Convey项目页面
		it 'should visit convey project' do
			project_convey_page.title.include? 'GES ConVey'
		end
		#默认搜索
		it 'Convey_project  search  all by default' do
			project_convey_page.search_default
			#project_convey_page.text.include? "In Process"
		end
		#按照users--bobo team进行搜索
		it 'Convey_project  search  all users by Bobo team' do
			project_convey_page.search_users_element.when_present.click
			project_convey_page.click_users_element.when_present.click
			project_convey_page.search_default
			#project_convey_page.text.include? "In Process"
		end
		#按照participants--KM lead进行搜索
		it 'Convey_project  search  participants by KM lead' do
			project_convey_page.search_participants = "KM Lead"
			project_convey_page.search_default
			#project_convey_page.text.include? "In Process"
		end
		#按照industry--energy进行搜索
		it 'Convey_project  search industry by energy' do
			project_convey_page.search_industry = "Aerospace - 航空"
			project_convey_page.search_default
			#project_convey_page.text.include? "In Process"
		end
		#按照status--open projects进行搜索
		it 'Convey_project  search status by open projects' do
			project_convey_page.search_status = "Open Projects"
			project_convey_page.search_default
			#project_convey_page.text.include? "In Process"
		end
		#按照project type--capvision survey进行搜索
		it 'Convey_project  search project type by capvision survey' do
			project_convey_page.search_type = "GES Convey"
			project_convey_page.search_default
			#project_convey_page.text.include? "In Process"
		end
		#按照project name进行搜索
		it 'Convey_project  search project name' do
			project_convey_page.search_keywords = "test"
			project_convey_page.search_default
			#project_convey_page.text.include? "In Process"
		end 
		#删除项目		
		it 'Convey_project  deleted' do
      		project_convey_page.search_status = "Invalid"
      		project_convey_page.search_default
      		project_convey_page.delete_project
    	end	
    	#ges list页面不选中任何项目执行update操作
    	it 'project_list update with chosing_project_no' do
    		project_convey_page.search_default
    		message = project_convey_page.alert do
				project_convey_page.update_action
			end
			sleep 2
			message.should == "Please choose Action."
    	end

    	#ges list页面选中单个项目不选中执行动作点击update	
    	it 'project_list update with choosing_project_yes select_status_no' do
    		project_convey_page.search_default
    		project_convey_page.click_firstproject_element.when_present.click
    		message = project_convey_page.alert do
				project_convey_page.update_action_element.when_present.click
			end
			sleep 2
			message.should == "Please choose Action."
    	end
    	it 'change status to on hold' do
			project_convey_page.search_status = "Complete"
			project_convey_page.search_default
			project_convey_page.hidden_element
			project_convey_page.click_firstproject_element.when_present.click
			sleep 2
			project_convey_page.change_action = "On Hold"
			project_convey_page.update_action
			project_convey_page.onhold_note_element.when_present.select "Change of project direction"
			project_convey_page.onhold_save_element.when_present.click
		end

		it 'change status to on hold again' do
			project_convey_page.search_status = "Complete"
			project_convey_page.search_default
			project_convey_page.hidden_element
			project_convey_page.click_firstproject_element.when_present.click
			sleep 2
			project_convey_page.change_action = "On Hold"
			project_convey_page.update_action
			project_convey_page.onhold_note_element.when_present.select "Change of project direction"
			project_convey_page.onhold_save_element.when_present.click
		end

    	#ges list页面对多个项目执行in process操作
		it 'change status to in process for some projects' do
			project_convey_page.search_status = "On Hold"
			project_convey_page.search_default
			project_convey_page.hidden_element
			project_convey_page.click_firstproject_element.when_present.click
			sleep 2
			project_convey_page.click_secondproject_element.when_present.click
			project_convey_page.change_action = "In Process"
			project_convey_page.update_action
		end
		#ges list页面对多个项目执行on hold操作
		it 'change status to on hold for some projects' do
			project_convey_page.search_default
			project_convey_page.hidden_element
			project_convey_page.click_firstproject_element.when_present.click
			sleep 1
			project_convey_page.click_secondproject_element.when_present.click
			project_convey_page.change_action = "On Hold"
			message = project_convey_page.alert do
  				project_convey_page.update_action
			end
			sleep 2
			message.should == "You cannot choose multi-project for this operation."
		end
		#ges list页面对多个项目执行invalid操作
		it 'change status to invalid for some projects' do
			project_convey_page.search_default
			project_convey_page.hidden_element
			project_convey_page.click_firstproject_element.when_present.click
			sleep 1
			project_convey_page.click_secondproject_element.when_present.click
			project_convey_page.change_action = "Invalid"
			message = project_convey_page.alert do
				project_convey_page.update_action
			end
			sleep 2
			message.should == "You cannot choose multi-project for this operation."
		end
		#ges list页面对多个项目执行complete操作
		it 'change status to complete for some projects' do
			project_convey_page.search_default
			project_convey_page.hidden_element
			project_convey_page.click_firstproject_element.when_present.click
			sleep 1
			project_convey_page.click_secondproject_element.when_present.click
			project_convey_page.change_action = "Complete"
			message = project_convey_page.alert do
				project_convey_page.update_action
			end
			sleep 2
			message.should == "You cannot choose multi-project for this operation."
		end
		#建项目step1必填项验证---项目创建页面不填写任何内容，点击next
		it 'create convey with nothing then click next button' do
			project_convey_page.create_convey
			project_convey_page.create_next
			project_convey_page.all_alerts_element.when_present.text.should include "Please fix the following input errors"
		end
		#建项目step1 [Consultants Requested]纯数字输入验证----输入qq#进行验证
		it 'create convey with consultants requested is qq#' do
			project_convey_page.create_convey
			project_convey_page.create_consultants_requested_element.when_present.set "qq#"
			project_convey_page.create_next
			project_convey_page.all_alerts_element.when_present.text.should include "Consultants Requested must be a number."
		end
		#建项目step1 [Consultants Expected]纯数字输入验证----输入qq#进行验证
		it 'create convey with consultants expected is qq#' do
			project_convey_page.create_convey
			project_convey_page.create_consultants_expected = "qq#"
			project_convey_page.create_next
			project_convey_page.all_alerts_element.when_present.text.should include "Consultants Expected must be a number."
		end
		#建项目step1 [price]文本框纯数字输入验证----输入qq#进行验证
		it 'create convey with price is qq#' do
			project_convey_page.create_convey
			project_convey_page.create_price = "qq#"
			project_convey_page.create_next
			project_convey_page.all_alerts_element.when_present.text.should include "Price must be a number."
		end
		#建项目step1 [cancel]取消创建项目操作验证----创建第一步内容填写正确，点击cancel
		it 'create convey with correct content and then click cancel' do
			project_convey_page.create_convey
			project_convey_page.create_cancel
		end
		#建项目step2必填项验证----创建第二步不选择client，点击save
		it 'create step2 click save button with client_no' do
			project_convey_page.create_convey
			project_convey_page.create_name = "AT-Convey-project"
			project_convey_page.create_description = "this is automation test"
			project_convey_page.create_industry = "Aerospace - 航空"
			project_convey_page.create_next
			sleep 1
			project_convey_page.create_save
			project_convey_page.all_alerts_element.when_present.text.should include "Client cannot be blank."
		end
		#建项目填写完整信息创建项目验证
		it 'Convey_project create Convey function' do
			project_convey_page.create_convey
			project_convey_page.create_name = "AT-Convey-project"
			project_convey_page.create_description = "this is automation test"
			project_convey_page.create_industry = "Aerospace - 航空"
			project_convey_page.create_next
			sleep 1
			project_convey_page.choose_client_input_element.when_present.click
			sleep 2
			project_convey_page.choose_client_content_element.when_present.click
			project_convey_page.create_save
		end

		it 'Convey_project vrify create Convey function' do
			project_convey_page.create_convey
			project_convey_page.create_name = "AT-Convey-project"
			project_convey_page.create_description = "this is automation test"
			project_convey_page.create_industry = "Aerospace - 航空"
			project_convey_page.create_next
			sleep 1
			project_convey_page.choose_client_input_element.when_present.click
			sleep 2
			project_convey_page.choose_client_content_element.when_present.click
			project_convey_page.project_manager_element.when_present.select "test_km1"
			project_convey_page.create_save
			project_convey_page.text.include? "AT-Convey-project"
		end
		#查看项目信息
		it 'Convey_project  view  function' do
			project_convey_page.search_default
			project_convey_page.view_project_link
			project_convey_page.text.include? "this is automation test"
		end
		#编辑项目的basic information
		it 'project info_page basic information edit' do
			project_convey_page.search_default
			project_convey_page.view_project_link
			project_convey_page.edit_basicinfo
			project_convey_page.text.include? "edit basic information"
		end
		#ges project info页面编辑basic info必填项验证
		it 'project info_page edit basic info with nothing and then save' do
			project_convey_page.search_default
			project_convey_page.view_project_link
			project_convey_page.basic_edit_icon_element.when_present.click
			project_convey_page.create_description_element.when_present.clear
			project_convey_page.basic_edit_icon_element.when_present.click
			project_convey_page.all_alerts_element.when_present.text.should include "Project Description cannot be blank."
		end
		#ges project info页面编辑basic info中start date & end date时序验证
		it 'project info_page start date is more than end date and then save' do
			project_convey_page.search_default
			project_convey_page.view_project_link
			project_convey_page.basic_edit_icon_element.when_present.click
			project_convey_page.start_date_element.when_present.set "2014-07-01"
			project_convey_page.end_date_element.when_present.set "2014-06-30"
			project_convey_page.basic_edit_icon_element.when_present.click
			project_convey_page.all_alerts_element.when_present.text.should include "Start Date不能大于End Date"
		end
		#编辑项目基本信息页面的project team
		it 'project info_page  project team edit' do
			project_convey_page.search_default
			project_convey_page.view_project_link
			project_convey_page.edit_team
			project_convey_page.text.include? "hamburgerKM"
		end
		#ges consultant task页面点击add consultant按钮页面跳转
		it 'add consultants to consultant task' do
			project_convey_page.goto_project
			project_convey_page.add_consultant
			project_convey_page.text.include? "Not Contacted"
		end
		#ges consultant task页面不选中任何task执行任意状态的update操作
		it 'consultants_task_list update  with task_no' do
			project_convey_page.goto_project
			project_convey_page.update_status_element.when_present.click
			project_convey_page.alerts_on_task_page_element.when_present.text.should include "You must select an action."
		end
		#ges consultant task页面选中任意task后点击update
		it 'consultants_task_list update with task_yes status_no' do
			project_convey_page.goto_project
			project_convey_page.check_click_firsttask
			project_convey_page.update_status_element.when_present.click
			project_convey_page.alerts_on_task_page_element.when_present.text.should include "You must select an action."
		end
		
		#ges consultant task页面点击Date进行编辑
		it 'consultants_task_list edit date' do
			project_convey_page.goto_project
			project_convey_page.task_list_date_element.click
			project_convey_page.date_yes_element.when_present.click
			sleep 2
			project_convey_page.text.include? "2014"
		end
		#ges consultant task页面点击Co.h进行编辑
		it 'consultants_task_list edit consultant hour' do
			project_convey_page.goto_project
			project_convey_page.task_list_cohour_element.when_present.click
			#project_convey_page.clear_num_element.when_present.click
			project_convey_page.cohour_input_element.when_present.set"6"
			project_convey_page.cohour_yes_element.when_present.click
			sleep 2
			project_convey_page.text.include? "6"
		end
		#ges consultant task页面点击mkt notes进行编辑
		it 'consultants_task_list edit mkt notes' do
			project_convey_page.goto_project
			project_convey_page.edit_mktnotes_element.when_present.click
			project_convey_page.mktnotes_input_element.when_present.set"edit notes"
			project_convey_page.mktnotes_save_element.when_present.click
			project_convey_page.text.include? "edit notes"
		end
		#ges consultant task页面点击payment notes进行编辑
		it 'consultants_task_list edit payment notes' do
			project_convey_page.goto_project
			project_convey_page.edit_paymentnotes_element.when_present.click
			project_convey_page.paymentnotes_input_element.when_present.set"edit payment"
			project_convey_page.paymentnotes_save_element.when_present.click
			project_convey_page.text.include? "edit payment"

		end
		#ges consultant task页面点击Co.c以设置payment cash------------------------------N/A(逻辑更改)
		#it 'consultants_task_list edit consultant cash' do
		#	project_convey_page.goto_project
		#	project_convey_page.task_list_cocash_element.when_present.click
		#	sleep 3
		#	project_convey_page.cocash_input = "1000"
		#	project_convey_page.cocash_save_element.when_present.click
		#	sleep 2
		#	project_convey_page.text.include? "1000"
		#end

		#update payment cash弹窗勾选send payment notice to consultant--------------------------N/A(逻辑更改)
		#it 'consultants_task_list update payment cash with click send payment notice to consultant' do
		#
		#end

		#update payment cash弹窗点击顾问名链接-----------------------------------------N/A(逻辑更改)
		#it 'consultants_task_list update payment cash with click consultant name link' do
		#
		#end

		#update payment cash弹窗不同payment way对应不同的支付信息填写-------------------------N/A（逻辑更改）
		#it 'consultants_task_list update payment cash with different payment way' do
		#
		#end

		#ges consultant task页面点击upload图标弹窗---------------------------------N/A(case重复)
		#ges consultant task页面上传文档格式验证
		it 'consultants_task_list upload exe document' do
			project_convey_page.goto_project
			project_convey_page.upload_exe
			project_convey_page.upload_alert_info_element.when_present.text.should include "extension is not allowed"
		end
		#ges consultant task页面上传文档大小上限验证
		it 'consultants_task_list upload dayu20 document' do
			project_convey_page.goto_project
			project_convey_page.upload_pdfdayu20
			project_convey_page.upload_alert_info_element.when_present.text.should include "The maximum upload size is 20 MB."
		end
		#ges consultant task页面upload上传文档
		it 'consultants_task_list upload normal document' do
			project_convey_page.goto_project
			project_convey_page.upload_normal_document
			project_convey_page.text.should include "NDB-Tables.doc"
		end
		##################以下用例逻辑已经更改，去掉############################################
		#ges consultant task页面对未填写date的task执行complete操作----N/A
		#ges consultant task页面对填写date未填写Co.H和Co.C以及Payment Notes的task执行complete操作----N/A
		#ges consultant task页面对填写date并填写Co.H的task执行complete操作----N/A
		#ges consultant task页面对填写date并填写Co.C的task执行complete操作----N/A	
		#ges consultant task页面对单个task执行Not Contacted操作
		#ges consultant task页面对多个task执行Not Contacted操作
		########################################################################################
		#ges consultant task页面对单个task执行Deleted操作
		it 'consultants_task_list delete one task' do
			project_convey_page.goto_project
			project_convey_page.check_click_firsttask
			project_convey_page.change_task_action = "Deleted"
			project_convey_page.update_task_button_element.when_present.click
		end
		#ges consultant task页面对多个task执行Deleted操作
		it 'consultants_task_list delete some tasks' do
			project_convey_page.goto_project
			project_convey_page.add_consultant
			sleep 3
			project_convey_page.add_consultant
			project_convey_page.check_click_firsttask
			project_convey_page.check_click_secondtask
			project_convey_page.change_task_action = "Deleted"
			project_convey_page.update_task_button_element.when_present.click
		end
		#ges consultant task页面Rate1500以上高费率顾问标识验证
		it 'consultants_task_list verify consultant which rate>1500' do
			project_convey_page.goto_project
			project_convey_page.add_consultant
			project_convey_page.high_rate_consultant_element.when_present.attribute_value('title').should eql "This is high rate consultant"
		end
	
	

		#添加contact task
		it 'add contacts to contact task' do
			project_convey_page.goto_project
			project_convey_page.add_contacts
			sleep 3
			project_convey_page.text.include? "Not Contacted"
		end
		#ges contact task页面不选中任何task执行任意状态的update操作
		it 'contacts_task_list update status with task_no' do
			project_convey_page.goto_contacts_tasks
			project_convey_page.select_status_element.when_present.select "Completed"
			project_convey_page.update_status_element.when_present.click
			project_convey_page.alerts_on_task_page_element.when_present.text.should include "You must select a task."
		end
		#ges contact task页面选中任意task后点击update
		it 'contacts_task_list update with task_yes status_no' do
			project_convey_page.goto_contacts_tasks
			project_convey_page.click_firsttask_element.when_present.click
			project_convey_page.update_status_element.when_present.click
			project_convey_page.alerts_on_task_page_element.when_present.text.should include "You must select an action."
		end
		
		#ges contact task页面Rate1500以上高费率顾问标识验证------------------------------------N/A（此条用例不存在）

		#ges contact task页面对未填写date的task执行complete操作
		it 'contact_task update_status complete without date' do
			project_convey_page.goto_contacts_tasks
			project_convey_page.check_click_firsttask
			project_convey_page.change_task_action = "Completed"
			project_convey_page.update_task_button_element.when_present.click
			sleep 2
			project_convey_page.text.include? "consultation date can't be empty. "
		end
		#ges contact task页面对填写date未填写Ci.H和Ci.C以及Billing Notes的task执行complete操作
		it 'contact_task update_status complete with date_yes hour_cash_notes_no' do
			project_convey_page.goto_contacts_tasks
			project_convey_page.contact_task_date_element.when_present.click
			sleep 2
			project_convey_page.date_yes_element.click
			project_convey_page.check_click_firsttask
			project_convey_page.change_task_action = "Completed"
			project_convey_page.update_task_button_element.when_present.click
			sleep 2
			project_convey_page.text.include? "Client hour,Client Cash,Billing Notes can't be all empty. "
		end
		#ges contact task页面对填写date并填写Ci.H的task执行complete操作
		it 'contact_task update_status complete with date_hour_yes' do
			project_convey_page.goto_contacts_tasks
			project_convey_page.contact_task_date_element.when_present.click
			sleep 2
			project_convey_page.date_yes_element.click
			project_convey_page.contact_task_hour_element.when_present.click
			project_convey_page.contact_hour_input = "8"
			project_convey_page.clhour_yes_element.click
			project_convey_page.check_click_firsttask
			project_convey_page.change_task_action = "Completed"
			project_convey_page.update_task_button_element.when_present.click
			sleep 2
			project_convey_page.text.include? "Change task status successfully. "
		end
		#ges contact task页面对填写date并填写Ci.C的task执行complete操作
		it 'contact_task update_status complete with date_cash_yes' do
			project_convey_page.goto_contacts_tasks
			project_convey_page.contact_task_date_element.when_present.click
			sleep 2
			project_convey_page.date_yes_element.when_present.click

			project_convey_page.contact_task_cash_element.when_present.click
			project_convey_page.contact_cash_input = "2000"
			project_convey_page.clcash_yes_element.when_present.click

			project_convey_page.check_click_firsttask
			project_convey_page.change_task_action = "Completed"
			project_convey_page.update_task_button_element.when_present.click
			sleep 2
			project_convey_page.text.include? "Change task status successfully."
		end
		#ges contact task页面对填写date并填写Billing Notes的task执行complete操作
		it 'contact_task update_status complete with date_notes_yes' do
			project_convey_page.goto_contacts_tasks
			project_convey_page.contact_task_date_element.when_present.click
			sleep 2
			project_convey_page.date_yes_element.click

			project_convey_page.contact_billing_notes_element.when_present.click
			project_convey_page.contact_billnotes_input = "billing notes"
			project_convey_page.clbillnotes_yes_element.when_present.click

			project_convey_page.check_click_firsttask
			project_convey_page.change_task_action = "Completed"
			project_convey_page.update_task_button_element.when_present.click
			sleep 2
			project_convey_page.text.include? "Change task status successfully. "
		end
		#ges contact task页面点击km notes进行编辑
		it 'contacts_task_list edit km notes' do
			project_convey_page.goto_contacts_tasks

			project_convey_page.contact_kmnotes_element.when_present.click
			project_convey_page.contact_kmnotes_input = "contact km notes"
			project_convey_page.contact_kmnotes_yes_element.when_present.click
			sleep 2
			project_convey_page.text.include? "contact km notes"

		end
		#ges contact task页面点击Date进行编辑
		it 'contacts_task_list edit date' do
			project_convey_page.goto_contacts_tasks

			project_convey_page.contact_task_date_element.when_present.click
			sleep 2
			project_convey_page.date_yes_element.when_present.click
			sleep 1
			project_convey_page.text.include? "2014"

		end
		#ges contact task页面点击Ci.h进行编辑
		it 'contacts_task_list edit client hour' do
			project_convey_page.goto_contacts_tasks
			project_convey_page.contact_task_hour_element.when_present.click
			project_convey_page.contact_hour_input = "10"
			project_convey_page.clhour_yes_element.when_present.click
			sleep 1
			project_convey_page.text.include? "10"
		end
		#ges contact task页面点击Ci.c进行编辑
		it 'contacts_task_list edit client cash' do
			project_convey_page.goto_contacts_tasks

			project_convey_page.contact_task_cash_element.when_present.click
			project_convey_page.contact_cash_input = "3333"
			project_convey_page.clcash_yes_element.when_present.click
			sleep 1
			project_convey_page.text.include? "3333"
		end
		#ges contact task页面点击billing notes进行编辑
		it 'contacts_task_list edit billing notes' do
			project_convey_page.goto_contacts_tasks

			project_convey_page.contact_billing_notes_element.when_present.click
			project_convey_page.contact_billnotes_input = "billing notes1"
			project_convey_page.clbillnotes_yes_element.when_present.click
			sleep 1
			project_convey_page.text.include? "billing notes1"
		end
		#ges contact task页面对单个task执行Not Contacted操作
		it 'contacts_task_list change status to not contacted for one task' do
			project_convey_page.goto_contacts_tasks
			project_convey_page.check_click_firsttask
			project_convey_page.change_task_action = "Not Contacted"
			project_convey_page.update_task_button_element.when_present.click
			project_convey_page.text.include? "Change task status successfully."
		end
		#删除contact task
		it 'contact task deleted' do
			project_convey_page.goto_contacts_tasks
			project_convey_page.check_click_firsttask
			project_convey_page.change_task_action = "Deleted"
			project_convey_page.update_task_button_element.when_present.click
		end
		#ges contact task页面对多个task执行Not Contacted操作
		it 'contacts_task_list change status to not contacted for some tasks' do
			project_convey_page.goto_project
			project_convey_page.add_contacts
			sleep 3
			project_convey_page.add_contacts
			project_convey_page.check_click_firsttask
			project_convey_page.check_click_secondtask
			project_convey_page.change_task_action = "Not Contacted"
			project_convey_page.update_task_button_element.when_present.click
			sleep 2
			project_convey_page.text.include? "Change task status successfully."
		end
		#ges contact task页面对多个task执行Deleted操作
		it 'contacts_task_list delete some tasks' do
			project_convey_page.goto_contacts_tasks
			project_convey_page.check_click_firsttask
			project_convey_page.check_click_secondtask
			project_convey_page.change_task_action = "Deleted"
			project_convey_page.update_task_button_element.when_present.click
		end
		#ges list页面对单个项目执行in process操作
		it 'Convey_project  update_status  in process' do
			project_convey_page.search_default
			project_convey_page.check_click_firstproject
			project_convey_page.change_action = "In Process"
			project_convey_page.update_action
		end
		#ges list页面on hold操作原因必填验证
		it 'Convey_project  update_status  on hold without reason' do
			project_convey_page.search_default
			project_convey_page.check_click_firstproject
			project_convey_page.change_action = "On Hold"
			project_convey_page.update_action
			message = project_convey_page.alert do
				sleep 3
  				project_convey_page.onhold_save_element.when_present.click
			end
			sleep 4
			message.should == "Please choose a reason"
		end
		#ges list页面对单个项目执行on hold操作
		it 'Convey_project  update_status  on hold' do
			project_convey_page.search_default
			project_convey_page.check_click_firstproject
			project_convey_page.change_action = "On Hold"
			project_convey_page.update_action
			sleep 2
			project_convey_page.onhold_note = "Change of project direction"
			project_convey_page.onhold_save
			sleep 2
			project_convey_page.text.include? "status changed successfully." 
		end
		#ges list页面对单个项目执行invalid操作
		it 'Convey_project  update_status  invalid' do
			project_convey_page.search_default
			project_convey_page.check_click_firstproject
			project_convey_page.change_action = "Invalid"
			project_convey_page.update_action
			sleep 2
			project_convey_page.invalid_note = "automation test"
			project_convey_page.invalid_save
			sleep 1
		end
		#ges list页面对单个项目执行complete操作
		it 'Convey_project update_status complete' do
			project_convey_page.search_default
			project_convey_page.check_click_firstproject
			project_convey_page.change_action = "Complete"
			project_convey_page.update_action
			sleep 2
			project_convey_page.complete_note = "aumation test"
			project_convey_page.complete_save_element.when_present.click
			project_convey_page.text.include? "tatus changed successfully."
		end

end