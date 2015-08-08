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
    
	it 'should go to consultation page ' do
      project_consultation_page.wait_until do
        sleep 2
        project_consultation_page.title.should eql "Consultation Projects - Capvision"
      end
    end
	
	
	it 'search by default on consultation page ' do
      project_consultation_page.filter
  #     project_consultation_page.wait_until do
		# sleep 2
  #       project_consultation_page.title.should eql "Consultation Projects - Capvision"
  #     end
    end
 
	it 'search by the industry of aerospace on consultation page ' do
      project_consultation_page.project_industry = "Aerospace - 航空"
      project_consultation_page.filter
      # project_consultation_page.wait_until do
      #   sleep 2
      #   project_consultation_page.title.should eql "Consultation Projects - Capvision"
      # end
    end

    
    it 'search by the status of in process on consultation page ' do
      project_consultation_page.project_status = "In Process"
      project_consultation_page.filter
   #    project_consultation_page.wait_until do
	  # sleep 2
   #      project_consultation_page.title.should eql "Consultation Projects - Capvision"
   #    end
    end

	
	it 'search by the status of on hold on consultation page ' do
      project_consultation_page.project_status = "On Hold"
      project_consultation_page.filter
   #    project_consultation_page.wait_until do
	  # sleep 2
   #      project_consultation_page.title.should eql "Consultation Projects - Capvision"
   #    end
    end
	
    it 'search by the status of complete on consultation page ' do
      project_consultation_page.project_status = "Complete"
      project_consultation_page.filter
   #    project_consultation_page.wait_until do
	  # sleep 2
   #      project_consultation_page.title.should eql "Consultation Projects - Capvision"
   #    end
    end
	
    
    it 'search by the status of invalid on consultation page ' do
      project_consultation_page.project_status = "Invalid"
      project_consultation_page.filter
   #    project_consultation_page.wait_until do
	  # sleep 2
   #      project_consultation_page.title.should eql "Consultation Projects - Capvision"
   #    end
    end
	
	it 'consultation project deleted ' do
      project_consultation_page.project_status = "Complete"
      project_consultation_page.filter
	    sleep 2
      project_consultation_page.delete_project
    end
	
	
	it 'create consultation on consultation page ' do
      project_consultation_page.project_create_btn
      project_consultation_page.project_name = "AT_我叫weijun"
      project_consultation_page.project_description = "attest_consultation adad@!#!@3  123"
      project_consultation_page.select_industry = "Agriculture - 农业"
      project_consultation_page.next
      project_consultation_page.choose_client
      project_consultation_page.key_questions = "at_瓦达西瓦weijun捏死"
      project_consultation_page.save
     #  project_consultation_page.wait_until do
	    # sleep 2
     #    project_consultation_page.consultation_title.include? "AT_我叫weijun"
     #  end
    end
	
    
    it 'edit project info on consultation page ' do
      project_consultation_page.filter
      first_project = project_consultation_page.first_project
      project_consultation_page.view_projectinfo
      sleep 1
      project_consultation_page.attach_to_window(:title=> first_project+" - Capvision")
      project_consultation_page.edit_project_info
	    sleep 2
      # project_consultation_page.title.should eql first_project+" - Capvision"
    end
	
	
	  it 'should go to client info on consultation page ' do
      project_consultation_page.filter
      first_project=project_consultation_page.first_project
      project_consultation_page.choose_project_element.when_present.click
      project_consultation_page.attach_to_window(:title=> first_project+" - Task List - Capvision")
      project_consultation_page.go_to_project_clientinfo_page
	    sleep 2
      # project_consultation_page.title.should eql "Client Info - "+first_project+" - Capvision"
    end
	
    
    it 'should go to client contact on consultation page ' do
      project_consultation_page.filter
      first_project=project_consultation_page.first_project
      project_consultation_page.choose_project_element.when_present.click
      project_consultation_page.attach_to_window(:title=> first_project+" - Task List - Capvision")
      project_consultation_page.go_to_project_clientcontacts_page
	    sleep 2
      # project_consultation_page.title.should eql "Client Contacts - AT_我叫weijun - Capvision"
    end
	
    
    it 'should go to email on consultation page ' do
      project_consultation_page.filter
      first_project=project_consultation_page.first_project
      project_consultation_page.choose_project_element.when_present.click
      project_consultation_page.attach_to_window(:title=> first_project+" - Task List - Capvision")
      project_consultation_page.go_to_project_emails_page
	    sleep 2
      # project_consultation_page.title.should eql "Emails - AT_我叫weijun - Capvision"
    end
	
    
    it 'should go to sms on consultation page ' do
      project_consultation_page.filter
      first_project=project_consultation_page.first_project
      project_consultation_page.choose_project_element.when_present.click
      project_consultation_page.attach_to_window(:title=> first_project+" - Task List - Capvision")
      project_consultation_page.go_to_project_sms_page
	    sleep 2
      # project_consultation_page.title.should eql "SMS - AT_我叫weijun - Capvision"
    end
	
	
	  it 'should go to compliance on consultation page ' do
      project_consultation_page.filter
      first_project=project_consultation_page.first_project
      project_consultation_page.choose_project_element.when_present.click
      project_consultation_page.attach_to_window(:title=> first_project+" - Task List - Capvision")
      project_consultation_page.go_to_project_compliance_page
	  sleep 2
      # project_consultation_page.title.should eql "Compliance - "+first_project+" - Capvision"
    end
	
	
    it 'consultation project update_status in process' do
      project_consultation_page.filter
      project_consultation_page.check_project_checkbox
      project_consultation_page.choose_action = "In Process"
      project_consultation_page.project_update_btn
	  sleep 2
      # project_consultation_page.alert_success.should eql project_consultation_page.first_project+" status changed successfully."
    end
    
    it 'two consultation projects update_status in process' do   
      project_consultation_page.filter
      project_consultation_page.check_project_checkbox
      project_consultation_page.check_second_project_checkbox
      project_consultation_page.choose_action = "In Process"
      project_consultation_page.project_update_btn
      sleep 2
      # project_consultation_page.alert_success.should include "status changed successfully."
    end 
    
    it 'two consultation projects update_status on hold' do
      project_consultation_page.filter
      project_consultation_page.check_project_checkbox
      project_consultation_page.check_second_project_checkbox
      project_consultation_page.choose_action = "On Hold"
      sleep 2
      message = project_consultation_page.alert do
        project_consultation_page.project_update_btn_element.when_present.click
      end
      # message.should == "You cannot choose multi-project for this operation."
    end
	
	it 'two consultation projects update_status invalid' do
      project_consultation_page.filter
      project_consultation_page.check_project_checkbox
      project_consultation_page.check_second_project_checkbox
      project_consultation_page.choose_action = "Invalid"
      sleep 2
      message = project_consultation_page.alert do
        project_consultation_page.project_update_btn_element.when_present.click
      end
      # message.should == "You cannot choose multi-project for this operation."
    end
    
    it 'two consultation projects update_status complete' do
      project_consultation_page.filter
      project_consultation_page.check_project_checkbox
      project_consultation_page.check_second_project_checkbox
      project_consultation_page.choose_action = "Complete"
      sleep 2
      message = project_consultation_page.alert do
        project_consultation_page.project_update_btn_element.when_present.click
      end
      # message.should == "You cannot choose multi-project for this operation."
    end
	
	it 'consultation_project view function' do
		project_consultation_page.filter
		project_consultation_page.view_projectinfo
		sleep 2
		project_consultation_page.attach_to_window(:title=> project_consultation_page.first_project+" - Capvision")
		# project_consultation_page.wait_until do
		# sleep 2
		#   project_consultation_page.text.should include "Project Description"
		# end
	end
	
	
	it 'consultation_project feedback function' do
		project_consultation_page.filter
		project_consultation_page.project_feedback
		project_consultation_page.project_choosefeedback = "5-Very Helpful"
		sleep 2
		message = project_consultation_page.alert do
		  sleep 1
  		project_consultation_page.feedback_save
		end
		sleep 2
		# message.should == "Save Successful!"
	end
	

	
	#	it 'task list_page update completed task status to 10 mins test',:test do
	#	project_consultation_page.filter
	#	project_consultation_page.select_project
	#	sleep 1
	#	project_consultation_page.attach_to_window(:title=>"AT_我叫weijun - Task List - Capvision")
	#	project_consultation_page.add_consultant
	#	project_consultation_page.change_recommended
	#	project_consultation_page.attach_to_window(:title=>"Compliance - AT_我叫weijun - Capvision")
	#	project_consultation_page.change_ca_to_NA
	#	project_consultation_page.task_list
	#	project_consultation_page.change_recommend_to_arrange
	#	project_consultation_page.change_arrange_to_complete
	#	project_consultation_page.change_completed_to_10minstest
	#	project_consultation_page.change_completed_to_deleted
	#end
	
	it 'task list_page add consultant to consultation project' do
		project_consultation_page.filter
		project_consultation_page.select_project
		sleep 2
		project_consultation_page.attach_to_window(:title=> project_consultation_page.first_project+" - Task List - Capvision")
		sleep 2
		project_consultation_page.add_consultant
	end
	
	#it 'task list_page update change ca to not null' do
	#	project_consultation_page.filter
	#	project_consultation_page.select_project
	#	sleep 2
	#	project_consultation_page.attach_to_window(:title=>"AT_我叫weijun - Task List - Capvision")
	#	project_consultation_page.change_ca_to_signment
	#end
	
	it 'consultation project complete task without fill any data' do
      project_consultation_page.filter
      project_consultation_page.select_project
      sleep 1
      project_consultation_page.attach_to_window(:title=> project_consultation_page.first_project+" - Task List - Capvision")
      project_consultation_page.first_task_checkbox_element.when_present.click
      project_consultation_page.choose_taskaction_element.when_present.select("Completed")
      project_consultation_page.update_taskstatus_element.when_present.click
      # project_consultation_page.text.should include "You cannot complete this task before it has been recommended and arranged"
    end
    
    it 'consultation project fill date then complete task' do
      project_consultation_page.filter
      project_consultation_page.select_project
      sleep 1
      project_consultation_page.attach_to_window(:title=> project_consultation_page.first_project+" - Task List - Capvision")
      project_consultation_page.update_task_link_element.when_present.click
      project_consultation_page.input_consultation_date="2015-07-01"
      sleep 2
      project_consultation_page.save_consultaion_element.when_present.click
      project_consultation_page.first_task_checkbox_element.when_present.click
      project_consultation_page.choose_taskaction_element.when_present.select("Completed")
      project_consultation_page.update_taskstatus_element.when_present.click
      # project_consultation_page.text.should include "You cannot complete this task before it has been recommended and arranged"
    end
    
    it 'consultation project fill date and consultant hour then complete task' do
      project_consultation_page.filter
      project_consultation_page.select_project
      sleep 1
      project_consultation_page.attach_to_window(:title=> project_consultation_page.first_project+" - Task List - Capvision")
      project_consultation_page.update_task_link_element.when_present.click
      project_consultation_page.input_consultation_date="2015-07-01"
      sleep 2
      project_consultation_page.input_consultation_hour="1"
      project_consultation_page.save_consultaion_element.when_present.click
      project_consultation_page.first_task_checkbox_element.when_present.click
      project_consultation_page.choose_taskaction_element.when_present.select("Completed")
      project_consultation_page.update_taskstatus_element.when_present.click
      # project_consultation_page.text.should include "You cannot complete this task before it has been recommended and arranged"
    end
	
	
	it 'task list_page update task status to selected without compliance requirement' do
		project_consultation_page.filter
		project_consultation_page.select_project
		sleep 1
		project_consultation_page.attach_to_window(:title=> project_consultation_page.first_project+" - Task List - Capvision")
		sleep 2
		project_consultation_page.change_selected_without_compliace
	end
	
	
	it 'task list_page update task status to recommend' do
		project_consultation_page.filter
		project_consultation_page.select_project
		sleep 1
		project_consultation_page.attach_to_window(:title=> project_consultation_page.first_project+" - Task List - Capvision")
		project_consultation_page.change_recommended
	end

	it 'task list_page update change ca to null' do
		project_consultation_page.filter
		project_consultation_page.select_project
		sleep 2
		project_consultation_page.attach_to_window(:title=>project_consultation_page.first_project+" - Task List - Capvision")
		project_consultation_page.change_ca_to_NA
	end
	
	it 'task list_page update task status to arrange' do
    project_consultation_page.filter
    project_consultation_page.select_project
    sleep 1
    project_consultation_page.attach_to_window(:title=>project_consultation_page.first_project+" - Task List - Capvision")
    project_consultation_page.change_recommend_to_arrange
  end
	
	
	it 'task list_page send calendar to client when task is arranged' do
		project_consultation_page.filter
		project_consultation_page.select_project
		sleep 1
		project_consultation_page.attach_to_window(:title=>project_consultation_page.first_project+" - Task List - Capvision")
		project_consultation_page.send_calendar
	end
	
	
	it 'task list_page cancel calendar when task is arranged' do
		project_consultation_page.filter
		project_consultation_page.select_project
		sleep 1
		project_consultation_page.attach_to_window(:title=>project_consultation_page.first_project+" - Task List - Capvision")
		project_consultation_page.send_calendar
		sleep 2
		project_consultation_page.cancel_calendar
	end
	
	it 'task list_page send SMS to consultant(arrange task)' do
		project_consultation_page.filter
		project_consultation_page.select_project
		sleep 1
		project_consultation_page.attach_to_window(:title=>project_consultation_page.first_project+" - Task List - Capvision")
		project_consultation_page.send_sms_arrange
	end
	
	it 'task list_page update task status to pending' do
    project_consultation_page.filter
    project_consultation_page.select_project
    sleep 1
    project_consultation_page.attach_to_window(:title=>project_consultation_page.first_project+" - Task List - Capvision")
    project_consultation_page.change_pending
    # project_consultation_page.text.should include "Send Unselected Notice"
  end
	
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
  
  it 'task list_page update two tasks status to pending' do
    project_consultation_page.filter
    project_consultation_page.select_project
    sleep 1
    project_consultation_page.attach_to_window(:title=>project_consultation_page.first_project+" - Task List - Capvision")
    project_consultation_page.change_pending
    # project_consultation_page.text.should include "Send Unselected Notice"
  end
  
  it 'task list_page add two consultants' do
    project_consultation_page.filter
    project_consultation_page.select_project
    sleep 1
    project_consultation_page.attach_to_window(:title=>project_consultation_page.first_project+" - Task List - Capvision")
    project_consultation_page.add_two_consultants
    project_consultation_page.add_consultant_alert_element.when_present.text.should eql "These consultants have been added successfully."
  end
	
	it 'task list_page update task status to complete' do
		project_consultation_page.filter
		project_consultation_page.select_project
		sleep 1
		project_consultation_page.attach_to_window(:title=>project_consultation_page.first_project+" - Task List - Capvision")
		project_consultation_page.change_arrange_to_complete
	end

  it 'delete consultation project when task status is complete' do
    project_consultation_page.filter
    project_consultation_page.select_project
    project_consultation_page.attach_to_window(:title=>project_consultation_page.first_project+" - Task List - Capvision")
    if project_consultation_page.task_status_element.when_present.text == "Completed"
      project_consultation_page.attach_to_window(:title=>"Consultation Projects - Capvision")
      message = project_consultation_page.alert do
        project_consultation_page.del_project
      end
      message.should == "You can not delete this project, because it has completed tasks."
    else
      puts "Warning:task status is not complete"
    end
  end
	
	it 'task list_page delete completed task' do
		project_consultation_page.filter
		project_consultation_page.select_project
		sleep 1
		project_consultation_page.attach_to_window(:title=>project_consultation_page.first_project+" - Task List - Capvision")
		project_consultation_page.change_completed_to_deleted
	end
	
	
	
	
	it 'task list_page update task information' do 
		project_consultation_page.filter
		project_consultation_page.select_project
		sleep 1
		project_consultation_page.attach_to_window(:title=>project_consultation_page.first_project+" - Task List - Capvision")
		project_consultation_page.add_consultant
		project_consultation_page.update_task
	end
	
	
	it 'task list_page update no contact task to selected with all compliance approve' do 
		project_consultation_page.filter
		project_consultation_page.select_project
		sleep 1
		first_project = project_consultation_page.first_project
		project_consultation_page.attach_to_window(:title=>first_project+" - Task List - Capvision")
		project_consultation_page.tc
		project_consultation_page.attach_to_window(:title=>"Compliance - "+first_project+" - Capvision")
		project_consultation_page.client_agreement
		project_consultation_page.training
		project_consultation_page.capvision_approval
		project_consultation_page.client_approval
	end
  
	it 'task list_page update recommend task to selected with all compliance approve' do 
		project_consultation_page.filter
		project_consultation_page.select_project
		sleep 1
		project_consultation_page.attach_to_window(:title=>project_consultation_page.first_project+" - Task List - Capvision")
		project_consultation_page.change_recommended
		project_consultation_page.change_to_selected
	end
	
	
	it 'task list_page update selected task to arranged without approve' do 
		project_consultation_page.filter
		project_consultation_page.select_project
		sleep 1
		project_consultation_page.attach_to_window(:title=>project_consultation_page.first_project+" - Task List - Capvision")
		project_consultation_page.change_seleted_to_arranged
	end

		
	it 'task list_page send CA with client agreement' do 
		project_consultation_page.filter
		project_consultation_page.select_project
		sleep 1
		project_consultation_page.attach_to_window(:title=>project_consultation_page.first_project+" - Task List - Capvision")
		project_consultation_page.send_ca
	end
	
	
	
	it 'task list_page sign CA without uploading document' do 
		project_consultation_page.filter
		first_project = project_consultation_page.first_project
		project_consultation_page.select_project
		sleep 1
		project_consultation_page.attach_to_window(:title=>first_project+" - Task List - Capvision")
		project_consultation_page.sign_ca_no_document
	end
	
	
	it 'task list_page resend CA with client agreement' do 
		project_consultation_page.filter
		project_consultation_page.select_project
		sleep 1
		project_consultation_page.attach_to_window(:title=>project_consultation_page.first_project+" - Task List - Capvision")
		project_consultation_page.resend_ca 
	end
	
	it 'task list_page upload  doc normal  document to task' do 
		project_consultation_page.filter
		project_consultation_page.select_project
		sleep 1
		project_consultation_page.attach_to_window(:title=>project_consultation_page.first_project+" - Task List - Capvision")
		project_consultation_page.upload_docnormal
	end

	
	it 'task list_page upload >20M doc document to task' do 
		project_consultation_page.filter
		project_consultation_page.select_project
		sleep 1
		project_consultation_page.attach_to_window(:title=>project_consultation_page.first_project+" - Task List - Capvision")
		project_consultation_page.upload_dayu20m
	end
	
	
	it 'task list_page upload .exe document to task' do 
		project_consultation_page.filter
		project_consultation_page.select_project
		sleep 1
		project_consultation_page.attach_to_window(:title=>project_consultation_page.first_project+" - Task List - Capvision")
		project_consultation_page.upload_exe
	end
	
	
	it 'task list_page delete uploaded document' do 
		project_consultation_page.filter
		project_consultation_page.select_project
		sleep 1
		project_consultation_page.attach_to_window(:title=>project_consultation_page.first_project+" - Task List - Capvision")
  		project_consultation_page.delete_document
		
	end
	
	
	it 'task list_page feedback task ' do
		project_consultation_page.filter
		project_consultation_page.select_project
		sleep 1
		project_consultation_page.attach_to_window(:title=>project_consultation_page.first_project+" - Task List - Capvision")
		project_consultation_page.task_feedback
	end
	
	
	it 'task list_page update KM notes' do
		project_consultation_page.filter
		project_consultation_page.select_project
		sleep 1
		project_consultation_page.attach_to_window(:title=>project_consultation_page.first_project+" - Task List - Capvision")
		project_consultation_page.kmnotes
	end
	
  it 'consultation project update_status on hold ' do
      project_consultation_page.filter
      project_consultation_page.check_project_checkbox
      project_consultation_page.choose_action = "On Hold"
      project_consultation_page.project_update_btn
      project_consultation_page.onhold_note
      sleep 2
      project_consultation_page.alert_success.should include "status changed successfully."
  end
	
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
   
  it 'consultation project update_status invalid ' do
      project_consultation_page.filter
      project_consultation_page.check_project_checkbox
      project_consultation_page.choose_action = "Invalid"
      project_consultation_page.project_update_btn
      sleep 2
      project_consultation_page.input_invalid_note = "at_wei_jun_da_ye_aaaaaaa"
      project_consultation_page.save_note
      sleep 2
      project_consultation_page.alert_success.should include "status changed successfully."
  end
	
	
	it 'consultation project update_status complete' do
		project_consultation_page.project_status = "Invalid"
		project_consultation_page.filter
		project_consultation_page.check_project_checkbox
		project_consultation_page.choose_action = "In Process"
		project_consultation_page.project_update_btn
		sleep 2
		project_consultation_page.project_status = "In Process"
		sleep 2
		project_consultation_page.filter
		project_consultation_page.check_project_checkbox
		project_consultation_page.choose_action = "Complete"
		project_consultation_page.project_update_btn
		sleep 2
		project_consultation_page.complete_save_note
		project_consultation_page.text.include? "status changed successfully"
	end
	
	
	
	

	
end