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
		
		it 'should visit convey project' do
		  sleep 2
		  project_convey_page.wait_until do
			  project_convey_page.title.include? 'GES ConVey'
			end
		end
		
		it 'Convey_project  search  all by default' do
			project_convey_page.search_default
			# project_convey_page.wait_until do
			#   project_convey_page.text.include? "In Process"
			# end
		end

		it 'Convey_project  search  all users by Bobo team' do
			project_convey_page.search_users = "Bobo_team"
			project_convey_page.search_default
			# project_convey_page.wait_until do
			#   project_convey_page.text.include? "In Process"
			# end
		end

		it 'Convey_project  search  participants by KM lead' do
			project_convey_page.search_participants = "KM Lead"
			project_convey_page.search_default
			# project_convey_page.wait_until do
			#   project_convey_page.text.include? "In Process"
			# end
		end

		it 'Convey_project  search industry by energy' do
			project_convey_page.search_industry = "Aerospace - 航空"
			project_convey_page.search_default
			# project_convey_page.wait_until do
			#   project_convey_page.text.include? "In Process"
			# end
		end

		it 'Convey_project  search status by open projects' do
			project_convey_page.search_status = "Open Projects"
			project_convey_page.search_default
			# project_convey_page.wait_until do
			#   project_convey_page.text.include? "In Process"
			# end
		end

		it 'Convey_project  search project type by capvision survey' do
			project_convey_page.search_type = "Capvision Survey"
			project_convey_page.search_default
			# project_convey_page.wait_until do
			#   project_convey_page.text.include? "In Process"
			# end
		end

		it 'Convey_project  search project name' do
			project_convey_page.search_keywords = "test"
			project_convey_page.search_default
			# project_convey_page.wait_until do
			#   project_convey_page.text.include? "In Process"
			# end
		end 

		it 'Convey_project  deleted' do
      		project_convey_page.search_status = "Invalid"
      		project_convey_page.search_default
      		project_convey_page.delete_project
    	end		

		it 'change status to in process for some projects' do
			project_convey_page.search_status = "On Hold"
			project_convey_page.search_default
			project_convey_page.check_click_firstproject
			sleep 2
			project_convey_page.check_click_secondproject
			project_convey_page.change_action = "In Process"
			project_convey_page.update_action
			sleep 2
		end

		it 'change status to on hold for some projects' do
			project_convey_page.search_default
			project_convey_page.check_click_firstproject
			sleep 1
			project_convey_page.check_click_secondproject
			project_convey_page.change_action = "On Hold"
			message = project_convey_page.alert do
  				project_convey_page.update_action
			end
			sleep 2
			# message.should == "You cannot choose multi-project for this operation."
		end

		it 'change status to invalid for some projects' do
			project_convey_page.search_default
			project_convey_page.check_click_firstproject
			sleep 1
			project_convey_page.check_click_secondproject
			project_convey_page.change_action = "Invalid"
			message = project_convey_page.alert do
				project_convey_page.update_action
			end
			sleep 2
			# message.should == "You cannot choose multi-project for this operation."
		end

		it 'change status to complete for some projects' do
			project_convey_page.search_default
			project_convey_page.check_click_firstproject
			sleep 1
			project_convey_page.check_click_secondproject
			project_convey_page.change_action = "Complete"
			message = project_convey_page.alert do
				project_convey_page.update_action
			end
			sleep 2
			# message.should == "You cannot choose multi-project for this operation."
		end

		it 'Convey_project  create  Convey  function' do
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
			# project_convey_page.wait_until do
			#   project_convey_page.text.include? "AT-Convey-project"
			# end
		end

		it 'Convey_project  view  function' do
			project_convey_page.search_default
			project_convey_page.view_project_link
			# project_convey_page.text.include? "this is automation test"
		end

		it 'project info_page basic information edit' do
			project_convey_page.search_default
			project_convey_page.view_project_link
			project_convey_page.edit_basicinfo
			# project_convey_page.text.include? "edit basic information"
		end

		it 'project info_page  project team edit' do
			project_convey_page.search_default
			project_convey_page.view_project_link
			project_convey_page.edit_team
			# project_convey_page.text.include? "hamburgerKM"
		end

		it 'add consultants to consultant task' do
			project_convey_page.goto_project
			project_convey_page.add_consultant
			# project_convey_page.text.include? "Not Contacted"
		end

		it 'consultants_task_list edit date' do
			project_convey_page.goto_project
			project_convey_page.task_list_date_element.click
			project_convey_page.date_yes_element.click
			sleep 2
			# project_convey_page.text.include? "2014"
		end

		it 'consultants_task_list edit consultant hour' do
			project_convey_page.goto_project
			project_convey_page.task_list_cohour_element.click
			project_convey_page.cohour_input = "6"
			project_convey_page.cohour_yes_element.click
			sleep 2
			# project_convey_page.text.include? "6"
		end

		it 'consultants_task_list edit consultant cash' do
			project_convey_page.goto_project
			project_convey_page.task_list_cocash_element.click
			sleep 3
			project_convey_page.cocash_input = "1000"
			project_convey_page.cocash_save_element.click
			sleep 2
			# project_convey_page.text.include? "1000"
		end

		it 'consultant task deleted' do
			project_convey_page.goto_project
			project_convey_page.check_click_firsttask
			project_convey_page.change_task_action = "Deleted"
			project_convey_page.update_task_button_element.click
		end

		it 'add contacts to contact task' do
			project_convey_page.goto_project
			project_convey_page.add_contacts
			sleep 3
			# project_convey_page.text.include? "Not Contacted"
		end

		it 'contact_task update_status complete without date' do
			project_convey_page.goto_project
			project_convey_page.contact_task_element.click
			project_convey_page.check_click_firsttask
			project_convey_page.change_task_action = "Completed"
			project_convey_page.update_task_button_element.click
			sleep 2
			# project_convey_page.text.include? "consultation date can't be empty. "
		end

		it 'contact_task update_status complete with date_yes hour_cash_notes_no' do
			project_convey_page.goto_project
			project_convey_page.contact_task_element.click
			project_convey_page.contact_task_date_element.click
			sleep 2
			project_convey_page.date_yes_element.click
			project_convey_page.check_click_firsttask
			project_convey_page.change_task_action = "Completed"
			project_convey_page.update_task_button_element.click
			sleep 2
			# project_convey_page.text.include? "Client hour,Client Cash,Billing Notes can't be all empty. "

		end

		it 'contact_task update_status complete with date_hour_yes' do
			project_convey_page.goto_project
			project_convey_page.contact_task_element.click
			project_convey_page.contact_task_date_element.click
			sleep 2
			project_convey_page.date_yes_element.click
			project_convey_page.contact_task_hour_element.click
			project_convey_page.contact_hour_input = "8"
			project_convey_page.clhour_yes_element.click
			project_convey_page.check_click_firsttask
			project_convey_page.change_task_action = "Completed"
			project_convey_page.update_task_button_element.click
			sleep 2
			# project_convey_page.text.include? "Change task status successfully. "
		end

		it 'contact_task update_status complete with date_cash_yes' do
			project_convey_page.goto_project
			project_convey_page.contact_task_element.click
			project_convey_page.contact_task_date_element.click
			sleep 2
			project_convey_page.date_yes_element.click

			project_convey_page.contact_task_cash_element.click
			project_convey_page.contact_cash_input = "2000"
			project_convey_page.clcash_yes_element.click

			project_convey_page.check_click_firsttask
			project_convey_page.change_task_action = "Completed"
			project_convey_page.update_task_button_element.click
			sleep 2
			# project_convey_page.text.include? "Change task status successfully. "
		end

		it 'contact_task update_status complete with date_notes_yes' do
			project_convey_page.goto_project
			project_convey_page.contact_task_element.click
			project_convey_page.contact_task_date_element.click
			sleep 2
			project_convey_page.date_yes_element.click

			project_convey_page.contact_billing_notes_element.click
			project_convey_page.contact_billnotes_input = "billing notes"
			project_convey_page.clbillnotes_yes_element.click

			project_convey_page.check_click_firsttask
			project_convey_page.change_task_action = "Completed"
			project_convey_page.update_task_button_element.click
			sleep 2
			# project_convey_page.text.include? "Change task status successfully. "
		end

		it 'contacts_task_list edit km notes' do
			project_convey_page.goto_project
			project_convey_page.contact_task_element.click

			project_convey_page.contact_kmnotes_element.click
			project_convey_page.contact_kmnotes_input = "contact km notes"
			project_convey_page.contact_kmnotes_yes_element.click

			sleep 2
			# project_convey_page.text.include? "contact km notes"

		end

		it 'contacts_task_list edit date' do
			project_convey_page.goto_project
			project_convey_page.contact_task_element.click

			project_convey_page.contact_task_date_element.click
			sleep 2
			project_convey_page.date_yes_element.click
			sleep 1
			# project_convey_page.text.include? "2014"
		end

		it 'contacts_task_list edit client hour' do
			project_convey_page.goto_project
			project_convey_page.contact_task_element.click

			project_convey_page.contact_task_hour_element.click
			project_convey_page.contact_hour_input = "10"
			project_convey_page.clhour_yes_element.click
			sleep 1
			# project_convey_page.text.include? "10"
		end

		it 'contacts_task_list edit client cash' do
			project_convey_page.goto_project
			project_convey_page.contact_task_element.click

			project_convey_page.contact_task_cash_element.click
			project_convey_page.contact_cash_input = "3333"
			project_convey_page.clcash_yes_element.click
			sleep 1
			# project_convey_page.text.include? "3333"
		end

		it 'contacts_task_list edit billing notes' do
			project_convey_page.goto_project
			project_convey_page.contact_task_element.click

			project_convey_page.contact_billing_notes_element.click
			project_convey_page.contact_billnotes_input = "billing notes1"
			project_convey_page.clbillnotes_yes_element.click
			sleep 1
			# project_convey_page.text.include? "billing notes1"
		end

		it 'contact task deleted' do
			project_convey_page.goto_project
			project_convey_page.contact_task_element.click
			project_convey_page.check_click_firsttask
			project_convey_page.change_task_action = "Deleted"
			project_convey_page.update_task_button_element.click
		end

		it 'Convey_project  update_status  in process' do
			project_convey_page.search_default
			project_convey_page.check_click_firstproject
			project_convey_page.change_action = "In Process"
			project_convey_page.update_action
		end

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
			# message.should == "Please choose a reason"
		end

		it 'Convey_project  update_status  on hold',:test do
			project_convey_page.search_default
			project_convey_page.check_click_firstproject
			project_convey_page.change_action = "On Hold"
			project_convey_page.update_action
			sleep 2
			project_convey_page.onhold_note = "Change of project direction"
			project_convey_page.onhold_save
			sleep 2
			# project_convey_page.text.include? "status changed successfully." 
		end
		
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
		
	

end