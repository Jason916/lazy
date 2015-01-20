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
	describe 'should conference project' do
		 
			it 'should visit conference project' do
			  sleep 2
			  project_conference_page.wait_until do
				  project_conference_page.title.include? 'Conference'
				end
			end
			
			it 'conference_project deleted' do
        		project_conference_page.select_status = "Invalid"
        		project_conference_page.search_default
        		project_conference_page.delete_project
      		end
      
			it 'conference_project  create  conference  function' do
				project_conference_page.conference_create
				project_conference_page.title.include? 'Create Conference'
				project_conference_page.conference_name = "ATconference_project"
				project_conference_page.conference_description = 'automation test'
				project_conference_page.conference_priority = 'High'
				project_conference_page.conference_industry = 'Food & Beverage - 食品饮料'
				project_conference_page.conference_request = '10'
				project_conference_page.conference_expect = '12'
				project_conference_page.conference_price ='888'
				project_conference_page.conference_timeframe = 'In one month'
				project_conference_page.conference_next
				project_conference_page.title.include? 'Advance'
				project_conference_page.conference_save
				# project_conference_page.wait_until do
				#   project_conference_page.text.include? 'ATconference_project'
			 #  end
			end
			it 'project info_page basic information edit ' do
				project_conference_page.goto_project
				project_conference_page.attach_to_window(:title=>project_conference_page.first_project+" - Task List - Capvision")
				project_conference_page.edit_basicinfomation
			end

			it 'project info_page  project team edit' do
				project_conference_page.goto_project
				project_conference_page.attach_to_window(:title=>project_conference_page.first_project+" - Task List - Capvision")
				project_conference_page.edit_projectteam
			end

			it 'add consultant to consultant tasks' do
				project_conference_page.goto_project
				project_conference_page.attach_to_window(:title=>project_conference_page.first_project+" - Task List - Capvision")
				project_conference_page.add_consultant
			end

			it 'add contact to contacts tasks' do
				project_conference_page.goto_project
				sleep 2
				project_conference_page.attach_to_window(:title=>project_conference_page.first_project+" - Task List - Capvision")
				project_conference_page.add_contacts	
			end

			it 'conference_project  search  all by default' do
				search_default = project_conference_page.search_default
				# project_conference_page.wait_until do
				#   project_conference_page.text.include? "In Process"
				# end
			end

			it 'conference_project  search  all users by Bobo team' do
				project_conference_page.select_users = "Bobo_team"
				project_conference_page.search_default
				# project_conference_page.wait_until do
				#   project_conference_page.text.include? "In Process"
				# end
			end

			it 'conference_project  search  participants by KM lead' do
				project_conference_page.select_participants = "KM Lead"
				project_conference_page.search_default
				# project_conference_page.wait_until do
				#   project_conference_page.text.include? "In Process"
				# end
			end

			it 'conference_project  search industry by energy' do
				project_conference_page.select_industry = "Energy - 能源"
				project_conference_page.search_default
				# project_conference_page.wait_until do
				#   project_conference_page.text.include? "In Process"
				# end
			end

			it 'conference_project  search status by open projects' do
				project_conference_page.select_status = "Open Projects"
				project_conference_page.search_default
				# project_conference_page.wait_until do
				#   project_conference_page.text.include? "In Process"
				# end
			end

			it 'conference_project  search project type by tele60' do
				project_conference_page.select_type = "Tele60"
				project_conference_page.search_default
				# project_conference_page.wait_until do
				#   project_conference_page.text.include? "In Process"
				# end
			end

			it 'conference_project  search project name' do
				project_conference_page.search_keywords = "ATconference_project"
				project_conference_page.search_default
				# project_conference_page.wait_until do
				#   project_conference_page.text.include? "ATconference_project"
				# end
			end

			it 'conference_project  update_status  in process' do
				project_conference_page.search_default
				project_conference_page.check_click_firstpro
				project_conference_page.select_action = "In Process"
				project_conference_page.action_update
				sleep 3
				project_conference_page.select_status = "In Process"
				project_conference_page.search_default
				# project_conference_page.wait_until do
				#   project_conference_page.text.include? "ATconference_project"
				# end
			end

			it 'conference_project  update_status  on hold' do
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
				# project_conference_page.wait_until do
				#   project_conference_page.text.include? "ATconference_project"
				# end
			end

			it 'conference_project  update_status  invalid' do
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
				# project_conference_page.wait_until do
				#   project_conference_page.text.include? "ATconference_project"
				# end
			end	
			
			#it 'conference_project  update_status complete' do
			#	project_conference_page.select_status = "Invalid"
			#	project_conference_page.search_default
			#	project_conference_page.check_click_firstpro
			#	project_conference_page.select_action = "Complete"
			#	project_conference_page.action_update
			#	sleep 1
			#	project_conference_page.complete_note = "change status to complete"
			#	sleep 1
			#	project_conference_page.complete_save
			#	sleep 2
			##	project_conference_page.select_status = "Complete"
			#	project_conference_page.search_default
			#	project_conference_page.text.include? "ATconference_project"
			#	#删除项目
			#	sleep 1
			#	project_conference_page.delete_project
			#	
			#end
			
	end
end