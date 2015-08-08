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
	#describe 'should HR project' do
		it 'should visit HR project' do
			sleep 1
			project_HR_page.wait_until do
			  sleep 1
			  project_HR_page.title.should eql "HR Service - Capvision"
		    end
	  	end
	  	
		it 'HR Service_project  search  all by default' do
			project_HR_page.search_default
		# 	project_HR_page.wait_until do
		# 	  project_HR_page.text.include? "In Process"
		# 	end
		end

		it 'HR Service_project  search  all users by Bobo team' do
			project_HR_page.search_users_element.when_present.select "Bobo_team"
			project_HR_page.search_default
			sleep 3
			# project_HR_page.wait_until do
			#   project_HR_page.text.include? "In Process"
			# end
		end

		it 'HR Service_project  search  participants by KM lead' do
			project_HR_page.search_participants_element.when_present.select "KM Lead"
			project_HR_page.search_default
			#project_HR_page.wait_until do
			  sleep 2
			  # project_HR_page.text.include? "In Process"
			#end
		end

		it 'HR Service_project  search industry by energy' do
			project_HR_page.search_industry_element.when_present.select "Energy - 能源"
			project_HR_page.search_default
			# project_HR_page.wait_until do
			#   project_HR_page.text.include? "In Process"
			# end
		end

		it 'HR Service_project  search status by open projects' do
			project_HR_page.search_status_element.when_present.select "Open Projects"
			sleep 1
			project_HR_page.search_default
			# project_HR_page.wait_until do
			#   project_HR_page.text.include? "In Process"
			# end
		end

		it 'HR Service_project  search project name' do
			project_HR_page.search_name_element.when_present.append "AT-HR-project1"
			project_HR_page.search_default
			# project_HR_page.wait_until do
			#   project_HR_page.text.include? "In Process"
			# end
		end

		it 'HR Service_project deleted' do
      		project_HR_page.search_status_element.when_present.select "Invalid"
      		project_HR_page.search_default
			project_HR_page.delete_project
		end
		
		it 'HR Service_project  create  HR Service  function' do
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
		
		it 'HR Service_project view function' do
			project_HR_page.search_default
			project_HR_page.view_project_element.click
			sleep 2
			project_HR_page.attach_to_window(:title =>project_HR_page.first_project+" - Capvision")
			# project_HR_page.text.include? "this is HR automation test"
		end
		
		it 'project info_page basic information edit' do
			project_HR_page.search_default
			project_HR_page.view_project
			sleep 3
			project_HR_page.attach_to_window(:title=>project_HR_page.first_project+" - Capvision")
			project_HR_page.edit_basicinfo
			# project_HR_page.text.include? "edit basic information"
		end
		
		it 'project info_page recruiting requirements edit' do
			project_HR_page.search_default
			project_HR_page.view_project
			project_HR_page.attach_to_window(:title=>project_HR_page.first_project+" - Capvision")
			project_HR_page.edit_recruite
			# project_HR_page.text.include? "edit recruite note"
		end

		it 'project info_page client&contact edit' do
			project_HR_page.search_default
			project_HR_page.view_project
			sleep 3
			project_HR_page.attach_to_window(:title=>project_HR_page.first_project+" - Capvision")
			project_HR_page.edit_client
			sleep 2
			# project_HR_page.text.include? "cece"
		end
		#有问题

		it 'project info_page  project team edit' do
			project_HR_page.search_default
			project_HR_page.view_project
			sleep 3
			project_HR_page.attach_to_window(:title=>project_HR_page.first_project+" - Capvision")
			project_HR_page.team_edit_icon_element.click
			sleep 2
			project_HR_page.team_edit_icon_element.click
			sleep 3
			# project_HR_page.text.include? "Alex Tang"
		end

		it 'add consultant to consultant tasks' do
			project_HR_page.goto_project
			project_HR_page.attach_to_window(:title=>project_HR_page.first_project+" - Task List - Capvision")
			project_HR_page.add_consultant
			# project_HR_page.text.include? "Not Contacted"
		end

		it 'update task status to arrange without recommended task ' do
			project_HR_page.goto_project
			sleep 2
			project_HR_page.attach_to_window(:title=>project_HR_page.first_project+" - Task List - Capvision")
			project_HR_page.check_click_firsttask
			project_HR_page.change_task_action = "Arranged"
			project_HR_page.update_task_status_element.click
			sleep 3	
			# project_HR_page.text.include? "Arranged"
		end

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
			sleep 2
			# project_HR_page.text.include? "Recommended"
        end

		it 'update task status to recommend' do
			project_HR_page.goto_project
			sleep 2
			project_HR_page.attach_to_window(:title=>project_HR_page.first_project+" - Task List - Capvision")
			project_HR_page.check_click_firsttask
			project_HR_page.change_task_action = "Recommended"
			project_HR_page.update_task_status_element.click
			sleep 3
			project_HR_page.recommend_change_status_element.click
			sleep 2
			# project_HR_page.text.include? "Recommended"
		end

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
			project_HR_page.recommend_emailselect_element.when_present.click
			project_HR_page.recommend_sendemail_element.click
			sleep 3
			# project_HR_page.text.include? "Success to send email. "
		end

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
			# project_HR_page.text.include? "Arranged"
		end

		#it 'update task status to complete' do
		#	project_HR_page.goto_project
		#project_HR_page.attach_to_window(:title=>project_HR_page.first_project+" - Task List - Capvision")
		#	project_HR_page.change_task_completed
		#end
		
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

		it 'HR Service_project update_status in process for some tasks' do
			project_HR_page.search_default
			project_HR_page.check_click_firstproject
			project_HR_page.check_click_secondproject
			project_HR_page.change_action = "In Process"
			project_HR_page.update_action
			sleep 3
			# project_HR_page.text.include? "status changed successfully. "
		end

		it 'HR Service_project update_status on hold' do
			project_HR_page.search_default
			project_HR_page.check_click_firstproject
			project_HR_page.change_action = "On Hold"
			project_HR_page.update_action
			sleep 3
			project_HR_page.onhold_note = "Change of project direction"
			project_HR_page.onhold_save
      		sleep 1
  #     		project_HR_page.wait_until do      
		# 	  project_HR_page.text.include? project_HR_page.first_project+" status changed successfully."
		# 	end
		end

		it 'HR Service_project update_status on hold for some tasks' do
			project_HR_page.search_default
			project_HR_page.check_click_firstproject
			project_HR_page.check_click_secondproject
			project_HR_page.change_action = "On Hold"
			message = project_HR_page.alert do
				project_HR_page.update_action
			end
			sleep 2
			# message.should == "You cannot choose multi-project for this operation."

		end
		it 'HR Service_project  update_status  invalid' do
			project_HR_page.search_default
			project_HR_page.check_click_firstproject
			project_HR_page.change_action = "Invalid"
			project_HR_page.update_action
			sleep 2
			project_HR_page.invalid_note = "automation test"
			project_HR_page.invalid_save
			sleep 1
			project_HR_page.search_status = "Invalid"
			project_HR_page.search_default
			# project_HR_page.wait_until do
			#   project_HR_page.text.include? "AT-HR-project1"
			# end
		end
		it 'HR Service_project update_status invalid for some tasks' do
			project_HR_page.search_default
			project_HR_page.check_click_firstproject
			project_HR_page.check_click_secondproject
			project_HR_page.change_action = "Invalid"
			message = project_HR_page.alert do
				project_HR_page.update_action
			end
			sleep 2
			# message.should == "You cannot choose multi-project for this operation."
		end

		it 'HR Service_project update_status complete for some tasks' do
			project_HR_page.search_default
			project_HR_page.check_click_firstproject
			project_HR_page.check_click_secondproject
			project_HR_page.change_action = "Complete"
			message = project_HR_page.alert do
				project_HR_page.update_action
			end
			sleep 2
			# message.should == "You cannot choose multi-project for this operation."

		end

end