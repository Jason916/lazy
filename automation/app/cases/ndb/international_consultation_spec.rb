# encoding: utf-8
require File.expand_path 'app/cases/spec_helper'


describe 'international page',:international do

	  let(:international_page)do 
    	home_page = $navi.goto_home_page
    	login_page = home_page.direct_to_login_page
    	home_page = login_page.login "admin","1234"
    	international_page = home_page.direct_to_international_page
    end
    it 'create an I-consultation' do
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
      # international_page.text.should include "Icon for ryan"
      #通过项目名进行验证
   	end
    
   	it 'change one I-consultation status to [on hold]' do
      international_page.search_by_status_element.when_present.select "All Status"
      international_page.button_search_element.when_present.click
      international_page.project_checkbox0_element.click
      international_page.action_element.when_present.select "On Hold"
      international_page.button_update_element.when_present.click
      international_page.on_hold_note_element.when_present.select "Change of project direction"
      international_page.pop_up_save_element.when_present.click
      sleep 2
      # international_page.text.should include "status changed successfully"
   	end

   	it 'change several I-consultations status to [on hold]' do
      international_page.search_by_status_element.when_present.select "All Status"
      international_page.button_search_element.when_present.click
      international_page.project_checkbox0_element.click
      international_page.project_checkbox1_element.click
      international_page.action_element.when_present.select "On Hold"
      message = international_page.alert do
        international_page.button_update_element.when_present.click
      end
      # message.should == "You cannot choose multi-project for this operation."
   	end	

    it 'change one I-consultation status to [invalid]' do
      international_page.search_by_status_element.when_present.select "All Status"
      international_page.button_search_element.when_present.click
      international_page.project_checkbox0_element.click
      international_page.action_element.when_present.select "Invalid"
      international_page.button_update_element.when_present.click
      international_page.invalid_note_element.when_present.set "test"
      international_page.pop_up_save_element.when_present.click
      sleep 2
      # international_page.text.should include "status changed successfully"
   	end

   	it 'change several I-consultations status to [invalid]' do
      international_page.search_by_status_element.when_present.select "All Status"
      international_page.button_search_element.when_present.click
      international_page.project_checkbox0_element.click
      international_page.project_checkbox1_element.click
      international_page.action_element.when_present.select "Invalid"
      message = international_page.alert do
        international_page.button_update_element.when_present.click
      end
      # message.should == "You cannot choose multi-project for this operation."
   	end

   	it 'change one I-consultation status to [complete]' do
      international_page.search_by_status_element.when_present.select "All Status"
      international_page.button_search_element.when_present.click
      international_page.project_checkbox0_element.click
      international_page.action_element.when_present.select "Complete"
      international_page.button_update_element.when_present.click
      international_page.complete_note_element.when_present.set "test"
      international_page.complete_email_confirm_element.when_present.click
      international_page.complete_contact_element.when_present.set "test"
      international_page.pop_up_save_element.when_present.click
      # sleep 5
      # international_page.text.should include "status changed successfully"
   	end

   	it 'change several I-consultations status to [complete]' do
      international_page.search_by_status_element.when_present.select "All Status"
      international_page.button_search_element.when_present.click
      international_page.project_checkbox0_element.click
      international_page.project_checkbox1_element.click
      international_page.action_element.when_present.select "Complete"
      message = international_page.alert do
        international_page.button_update_element.when_present.click
      end
      # message.should == "You cannot choose multi-project for this operation."
   	end

    it 'change one I-consultation status to [in process]' do
      international_page.search_by_status_element.when_present.select "All Status"
      international_page.button_search_element.when_present.click
      international_page.project_checkbox0_element.click
      international_page.action_element.when_present.select "In Process"
      international_page.button_update_element.when_present.click
      sleep 2
      # international_page.text.should include "status changed successfully"
    end

    it 'change several I-consultations status to [in process]' do
      international_page.search_by_status_element.when_present.select "All Status"
      international_page.button_search_element.when_present.click
      international_page.project_checkbox0_element.click
      international_page.project_checkbox1_element.click
      international_page.action_element.when_present.select "In Process"
      international_page.button_update_element.when_present.click
      sleep 2
      # international_page.text.should include "status changed successfully"
    end

    it 'set project CA to NA' do
      international_page.button_search_element.when_present.click
      international_page.select_project
      international_page.attach_to_window(:title=>international_page.first_project+" - Task List - Capvision")
      international_page.compliance_info_element.when_present.click
      international_page.compliance_ca_element.when_present.click
      international_page.ca_element.when_present.select "N/A"
      international_page.ca_save_element.when_present.click
    end

    it 'add consultants to I-consultation' do
      international_page.button_search_element.when_present.click
      # first_project = international_page.first_project
      international_page.select_project
      international_page.attach_to_window(:title=>international_page.first_project+" - Task List - Capvision")
      international_page.add_consultant
    end

   	it 'change several I-consultation tasks status to [recommended]' do
      international_page.button_search_element.when_present.click
      international_page.select_project
      international_page.attach_to_window(:title=>international_page.first_project+" - Task List - Capvision")
      international_page.add_consultant
      international_page.task_checkbox0_element.when_present.click
      international_page.task_checkbox1_element.when_present.click
      international_page.task_action_element.when_present.select "Recommended"
      international_page.task_update_element.when_present.click
      international_page.change_status_element.when_present.click
      sleep 2
      # international_page.text.should include "Change task status successfully"
   	end
   	it 'change several I-consultation tasks status to [arranged]' do
      international_page.button_search_element.when_present.click
      international_page.select_project
      international_page.attach_to_window(:title=>international_page.first_project+" - Task List - Capvision")
      international_page.task_checkbox0_element.when_present.click
      international_page.task_checkbox1_element.when_present.click
      international_page.task_action_element.when_present.select "Arranged"
      international_page.task_update_element.when_present.click
      international_page.arrange_date0_element.when_present.set "23:59"
      international_page.nick_name0_element.when_present.set "Ryan"
      international_page.type_of_interview0_element.when_.select "Phone"
      international_page.arrange_date1_element.when_present.set "23:59"
      international_page.nick_name1_element.set "Ryan"
      international_page.type_of_interview1_element.select "Phone"
      international_page.change_status_element.when_present.click
      sleep 2
      # international_page.text.should include "Change task status successfully"
   	end

   	it 'change several I-consultation tasks status to [completed]' do
      international_page.button_search_element.when_present.click
      international_page.select_project
      international_page.task_checkbox0_element.when_present.click
      international_page.task_checkbox1_element.when_present.click
      international_page.task_action_element.when_present.select = "Completed"
      international_page.task_update_element.when_present.click
      # international_page.
   	end

   	it 'change one I-consultation task status to [unsuccessful interview]' do
      international_page.button_search_element.when_present.click
      international_page.select_project
      international_page.attach_to_window(:title=>international_page.first_project+" - Task List - Capvision")
      international_page.task_checkbox0_element.when_present.click
      international_page.task_action_element.when_present.select "Unsuccessful interview"
      international_page.task_update_element.when_present.click
      international_page.submit_element.when_present.click
   	end

   	it 'change several I-consultation tasks status to [unsuccessful interview]' do
      international_page.button_search_element.when_present.click
      international_page.select_project
      international_page.attach_to_window(:title=>international_page.first_project+" - Task List - Capvision")
      international_page.task_checkbox0_element.when_present.click
      international_page.task_checkbox1_element.when_present.click
      international_page.task_action_element.when_present.select "Unsuccessful interview"
      international_page.task_update_element.when_present.click
      # international_page.text.should include "You cannot choose multiple tasks."
   	end

   	it 'change one I-consultation task status to [pending]' do
      international_page.button_search_element.when_present.click
      international_page.select_project
      international_page.attach_to_window(:title=>international_page.first_project+" - Task List - Capvision")
      international_page.task_checkbox0_element.when_present.click
      international_page.task_action_element.when_present.select "Pending"
      international_page.task_update_element.when_present.click
      international_page.send_email0
      international_page.submit
      # international_page.text.should include "Change task status successfully"
   	end

   	it 'change several I-consultation tasks status to [pending]' do
      international_page.button_search_element.when_present.click
      international_page.select_project
      international_page.attach_to_window(:title=>international_page.first_project+" - Task List - Capvision")
      international_page.task_checkbox0_element.when_present.click
      international_page.task_checkbox1_element.when_present.click
      international_page.task_action_element.when_present.select "Pending"
      international_page.task_update_element.when_present.click
      international_page.send_email0_element.when_present.click
      international_page.send_email1_element.when_present.click
      international_page.submit_element.when_present.click
      # international_page.text.should include "Change task status successfully"
   	end

   	it 'recommend a not enrolled consultant' do
      international_page.button_search_element.when_present.click
      international_page.select_project
      international_page.attach_to_window(:title=>international_page.first_project+" - Task List - Capvision")
      international_page.add_consultant_not_enrolled
      international_page.select_all_element.when_present.click
      international_page.task_action_element.when_present.set "Recommended"
      international_page.task_update_element.when_present.click
      sleep 2
      # international_page.text.should include "cannot be recommended because the status is not"
   	end

    it 'arrange a task to client by sending email' do
      international_page.button_search_element.when_present.click
      international_page.select_project
      international_page.attach_to_window(:title=>international_page.first_project+" - Task List - Capvision")
      international_page.task_checkbox0_element.when_present.click
      international_page.task_action_element.when_present.select "Arranged"
      international_page.task_update_element.when_present.click
      international_page.arrange_date0_element.when_present.set "23:59"
      international_page.nick_name0_element.when_present.set "Ryan"
      international_page.type_of_interview0_element.select "Phone"
      international_page.arrange_next_element.when_present.click
      international_page.send_email_to_client_element.when_present.click
      # international_page.text.should include "The arrangement email has been successfully sent to the client; do you want to send an arrangement email to the consultant?"
    end
   	it 'recommend a consultant which is not proper for project T&C' do
      international_page.button_search_element.when_present.click
      international_page.select_project
      international_page.attach_to_window(:title=>international_page.first_project+" - Task List - Capvision")
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
      
   	it 'recommend a consultant which is not proper for project CA' do
      international_page.button_search_element.when_present.click
      international_page.select_project
      international_page.attach_to_window(:title=>international_page.first_project+" - Task List - Capvision")
      #international_page.add_five_consultants
      international_page.compliance_info_element.when_present.click
      international_page.compliance_tnc_element.when_present.click
      international_page.tnc_element.when_present.select "N/A"
      international_page.tnc_save_element.when_present.click
      international_page.compliance_ca_element.when_present.click
      international_page.ca_element.when_present.select "ryanca"
      international_page.ca_save_element.when_present.click
      international_page.task_list_element.when_present.click
      international_page.select_all_element.when_present.click
      international_page.task_action_element.when_present.select "Recommended"
      international_page.task_update_element.when_present.click
   	end

   	# it 'sign red background for T&C' do
   	# end
   	# it 'sign red background for CA' do
   	# end
   	# it 'sign red background for Training' do
   	# end
end