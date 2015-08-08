#encoding:utf-8
require File.expand_path 'app/cases/spec_helper'
require File.expand_path 'app/cases/shared/action'



describe 'capvisiondata page',:capvisiondata do 

	let(:project_page) do 

		    home_page = $navi.goto_home_page
			login_page = home_page.direct_to_login_page
			home_page = login_page.login "admin","1234"
			project_page = home_page.direct_to_project_page
    end

    	it 'go to capvision data service list page' do
            project_page.capvisiondataList
            sleep 1
            # project_page.wait_until do
            #   project_page.title.should include ("Capvision Data Services")
            # end
    	end
    	
    	it 'should create capvision data page' do
            project_page.capvisiondataList
            sleep 1
            project_page.create_capvisiondata
            project_page.capdataName = "ATcapvisiondata_test#{rand(1000)}"
            project_page.description = "lol---------"
            project_page.priority_element[1].click
            project_page.industry_element[13].click
            project_page.requestconsultants = "#{rand(10000)}"
            project_page.expectedconsultants = "#{rand(10000)}"
            project_page.price = "#{rand(1000)}"
            project_page.next
            project_page.projectManager_element[3].click
            project_page.save
           #  project_page.wait_until do
           #    project_page.text.should include "ATcapvisiondata_test"
    	      # end
    	end
    	
    	it 'status and keywords search data' do
            project_page.capvisiondataList
            sleep 1
            project_page.search_status_element[2].click
            project_page.keywords_project = "ATcapvisiondata_test"
            project_page.search
            # project_page.wait_until do
            #   project_page.title.should include "Capvision"
            # end
      end

    	it 'change the capvision data project to inprocess' do
            project_page.capvisiondataList
            sleep 1
            project_page.search_status = 'All Status'
            project_page.search
            sleep 1
            project_page.check_grid1
            project_page.actionType = 'In Process'
            project_page.update_project
            # project_page.wait_until do
            #   project_page.title.should include "Capvision Data Services Projects"
            # end
    	end
    	
    	it 'change the capvision data project to onhold' do
            project_page.capvisiondataList
            sleep 1
            project_page.search_status = 'All Status'
            project_page.search
            sleep 1
            project_page.check_grid1
            project_page.actionType = 'On Hold'
            project_page.update_project
            sleep 1
            project_page.onholdnote = 'Change of project direction'
            project_page.save_project

            sleep 1
           #  project_page.wait_until do
           #    project_page.title.should include "Capvision Data Services Projects"
    	      # end
    	end
    	
    	it 'change the capvision data project to invalid' do
            project_page.capvisiondataList
            sleep 1
            project_page.search_status = 'All Status'
            project_page.search
            sleep 1
            project_page.check_grid1
            project_page.actionType = 'Invalid'
            project_page.update_project
            sleep 2
            project_page.invalidnote = "ATtestinvalidnotes~~~~~~~~~~~~~~"
            project_page.save_project
            sleep 1
           #  project_page.wait_until do
           #    project_page.title.should include "Capvision Data Services Projects"
    	      # end

    	end
    	
    	it 'change the capvision data project to complete' do
            project_page.capvisiondataList
            sleep 1
            project_page.search_status = 'All Status'
            project_page.search
            sleep 1
            project_page.check_grid1
            project_page.actionType = 'Complete'
            project_page.update_project
            sleep 1
            project_page.completenote = "ATtestcompletenotes~~~~~~~~~~~~~~"
            project_page.save_project
           #  project_page.wait_until do
           #    project_page.title.should include "Capvision Data Services Projects"
    	      # end
    	end

      
########========================================2014-07-07==========================================================
      #capvision data list页面对多个项目执行in process操作
      it 'capvision data list page change several projects status to in process' do
            project_page.capvisiondataList
            sleep 1
            project_page.search_status = 'All Status'
            project_page.search
            sleep 1
            project_page.check_grid1
            project_page.check_grid2
            project_page.actionType = 'In Process'
            project_page.update_project
            # project_page.wait_until do
            #   project_page.title.should include "Data Service - Capvision"
            # end
      end
      #capvision data list页面对多个项目执行on hold操作
      it 'capvision data list page change several projects status to on hold' do
            project_page.capvisiondataList
            sleep 1
            project_page.search_status = 'All Status'
            project_page.search
            sleep 1
            project_page.check_grid1
            project_page.check_grid2
            project_page.actionType = 'On Hold'
            message = project_page.alert do
              project_page.update_project
            end
            # project_page.wait_until do
            #   message.should eql "You cannot choose multi-project for this operation."
            # end
      end
      #capvision data list页面对多个项目执行invalid操作
      it 'capvision data list page change several projects status to invalid' do
            project_page.capvisiondataList
            sleep 1
            project_page.search_status = 'All Status'
            project_page.search
            sleep 1
            project_page.check_grid1
            project_page.check_grid2
            project_page.actionType = 'Invalid'
            message = project_page.alert do
              project_page.update_project
            end
            # project_page.wait_until do
            #   message.should eql "You cannot choose multi-project for this operation."
            # end
      end
      #capvision data list页面对多个项目执行complete操作
      it 'capvision data list page change several projects status to complete' do
            project_page.capvisiondataList
            sleep 1
            project_page.search_status = 'All Status'
            project_page.search
            sleep 1
            project_page.check_grid1
            project_page.check_grid2
            project_page.actionType = 'Complete'
            message = project_page.alert do
              project_page.update_project
            end
            # project_page.wait_until do
            #   message.should eql "You cannot choose multi-project for this operation."
            # end
      end
      #consultant tasks页面点击mkt notes进行编辑
      it 'consultant tasks page edit mkt notes by click' do
            project_page.add_consultant_task
            sleep 1
            project_page.edit_mkt_notes
            project_page.input_mkt_notes = "mkt notes"
            project_page.save_mkt_notes
            # project_page.wait_until do
            #   project_page.edit_mkt_notes_element.text.should eql 'mkt notes'
            # end
      end
      #consultant tasks页面点击Date进行编辑
      it 'consultant tasks page edit date by click' do
            project_page.add_consultant_task
            sleep 1
            project_page.edit_date
            project_page.save_date
            # project_page.wait_until do
            #   project_page.edit_date_element.text.should include '2014'
            # end
      end
      #consultant tasks页面点击Co.h进行编辑
      it 'consultant tasks page edit Co.h by click' do
            project_page.add_consultant_task
            sleep 1
            project_page.edit_hours
            project_page.input_hours = "2.00"
            project_page.save_hours
            # project_page.wait_until do
            #   project_page.edit_hours_element.text.should eql '2.00'
            # end
      end

      #consultant tasks页面点击Co.c以设置payment cash
      it 'consultant tasks page edit Co.C to set payment cash' do
            project_page.add_consultant_task
            sleep 1
            project_page.edit_cash
            sleep 1
            project_page.input_cash = "1000"
            sleep 1
            project_page.save_cash
            # project_page.wait_until do
            #   project_page.edit_cash_element.text.should eql '1000.00'
            # end
      end

      #consultant tasks页面点击payment notes进行编辑
      it 'consultant tasks page edit payment notes by click' do
            project_page.add_consultant_task
            sleep 1
            project_page.edit_notes
            sleep 1
            project_page.input_notes = "notes"
            sleep 1
            project_page.save_notes
            # project_page.wait_until do
            #       project_page.edit_notes_element.text.should eql 'notes'
            # end
      end

      #consultant tasks页面对填写date并填写Co.H的task执行complete操作
      it 'consultant tasks page complete task which have date and Co.H ' do
            project_page.add_consultant_task
            sleep 1
            if project_page.edit_date_element.text != "Empty" && project_page.edit_hours_element.text != "0.00"
                  project_page.check_first_task
                  project_page.task_action = "Completed"
                  project_page.task_update
            else 
                  project_page.edit_date
                  project_page.save_date
                  project_page.edit_hours
                  project_page.input_hours = "2"
                  project_page.save_hours
                  project_page.check_first_task
                  project_page.task_action = "Completed"
                  project_page.task_update
            end
            # project_page.wait_until do
            #   project_page.message_element.text.should eql "You can't complete this task before it has be Recommended and Arranged"
            # end
      end
      #consultant tasks页面对填写date并填写Co.C的task执行complete操作
      it 'consultant tasks page complete task which have date and Co.C' do
            project_page.add_consultant_task
            sleep 1
            if project_page.edit_date_element.text != "Empty" && project_page.edit_cash_element.text != "0.00"
                  project_page.check_first_task
                  project_page.task_action = "Completed"
                  project_page.task_update
            else
                  project_page.edit_date
                  project_page.save_date
                  sleep 1
                  project_page.edit_cash
                  sleep 1
                  project_page.input_cash = "800"
                  sleep 1
                  project_page.save_cash
                  sleep 1
                  project_page.check_first_task
                  project_page.task_action = "Completed"
                  project_page.task_update
            end
            # project_page.wait_until do
            #   project_page.message_element.text.should eql "You can't complete this task before it has be Recommended and Arranged"
            # end
      end
      #consultant tasks页面对填写date并填写Payment Notes的task执行complete操作
      it 'consultant tasks page complete task which have date and payment notes' do
            project_page.add_consultant_task
            sleep 1
            if project_page.edit_date_element.text != "Empty" && project_page.edit_notes_element.text != "Empty"
                  project_page.check_first_task
                  project_page.task_action = "Completed"
                  project_page.task_update
            else
                  project_page.edit_date
                  project_page.save_date
                  project_page.edit_notes
                  project_page.input_notes = "payment notes"
                  project_page.save_notes
                  project_page.check_first_task
                  project_page.task_action = "Completed"
                  project_page.task_update
            end
            # project_page.wait_until do
            #   project_page.message_element.text.should eql "You can't complete this task before it has be Recommended and Arranged"
            # end
      end
      #contact tasks页面点击km notes进行编辑
      it 'contact tasks page edit km notes by click' do
            project_page.add_contact_task
            sleep 1
            project_page.edit_contact_km_notes
            sleep 1
            project_page.input_contact_km_notes = "contact notes"
            sleep 1
            project_page.save_contact_km_notes
            # project_page.wait_until do
            #   project_page.edit_contact_km_notes_element.text.should eql 'contact notes'
            # end
      end

      #contact tasks页面点击Date进行编辑
      it 'contact tasks page edit date by click' do
            project_page.add_contact_task
            sleep 1
            #contact task中的date跟consultant task中的mkt notes字段是一样的xpath
            project_page.edit_mkt_notes
            sleep 1
            project_page.save_mkt_notes
            # project_page.wait_until do
            #   project_page.edit_mkt_notes_element.text.should include '2014'
            # end
      end
      #contact tasks页面点击Cl.h进行编辑
      it 'contact tasks page edit Cl.h by click' do
            project_page.add_contact_task
            sleep 2
            #contact task中的Cl.h跟consultant task中的date字段是一样的xpath
            project_page.edit_date
            sleep 1
            project_page.input_contact_client_hours = "3"
            sleep 1
            project_page.save_date
            # project_page.wait_until do
            #   project_page.edit_date_element.text.should eql "3.00"
            # end
      end
      #contact tasks页面点击Cl.c进行编辑
      it 'contact tasks page edit Cl.c by click' do
            project_page.add_contact_task
            sleep 2
            #contact task中的Cl.c跟consultant task中的consultant hours字段是一样的xpath
            project_page.edit_hours
            sleep 1
            project_page.input_hours = "850"
            sleep 1
            project_page.save_hours
            # project_page.wait_until do
            #   project_page.edit_hours_element.text.should eql "850"
            # end
      end
      #contact tasks页面点击billing notes进行编辑
      it 'contact tasks page edit billing notes by click' do
            project_page.add_contact_task
            sleep 2
            #contact task中的billnotes跟consultant task中的consultant cash字段是一样的xpath
            project_page.edit_cash
            sleep 1
            project_page.input_contact_billnotes = "bill notes"
            sleep 1
            project_page.save_contact_bill_notes
            # project_page.wait_until do
            #   project_page.edit_cash_element.text.should eql "bill notes"
            # end
      end
      #contact tasks页面对未填写date的task执行complete操作
      it 'contact tasks page task complete without date' do
            project_page.add_contact_task
            sleep 2
            if project_page.edit_mkt_notes_element.text == "Empty"
                project_page.check_first_contact_task
                project_page.task_action = "Completed"
                sleep 1
                project_page.task_update
            else
                project_page.edit_mkt_notes
                sleep 1
                project_page.clear_date
                sleep 1
                project_page.save_mkt_notes
                sleep 1
                project_page.check_first_contact_task
                project_page.task_action = "Completed"
                sleep 1
                project_page.task_update
            end
            # project_page.wait_until do
            #    project_page.contact_message_element.text.should eql "consultation date can't be empty."
            # end
      end
      #contact tasks页面填写date未填写Cl.H和Cl.C以及Billing Notes的task执行complete操作
      it 'contact tasks page filling in the date of a task and complete it without filling in Cl.H,Cl.C,Billing Notes ' do
            project_page.add_contact_task
            sleep 2
            if project_page.edit_mkt_notes_element.text != "Empty" && project_page.edit_date_element.text == "0.00" && project_page.edit_hours_element.text == "0" && project_page.edit_cash_element.text == "Empty"
                project_page.check_first_contact_task
                project_page.task_action = "Completed"
                project_page.task_update
            else
                project_page.edit_mkt_notes
                project_page.save_mkt_notes
                project_page.check_first_contact_task
                project_page.task_action = "Completed"
                project_page.task_update
            end
            # project_page.wait_until do
            #    project_page.contact_message_element.text.should eql "Client hour,Client Cash,Billing Notes can't be all empty."
            # end
      end
      #contact tasks页面填写date并填写Cl.H的task执行complete操作
      it 'contact tasks page complete task which have date and Cl.H' do
            project_page.add_contact_task
            sleep 2
            if project_page.edit_mkt_notes_element.text != "Empty" && project_page.edit_date_element.text != "0.00"
                project_page.check_first_contact_task
                project_page.task_action = "Completed"
                project_page.task_update
            else
                project_page.edit_mkt_notes
                project_page.save_mkt_notes
                project_page.edit_date
                project_page.input_contact_client_hours = "4"
                project_page.save_date
                project_page.check_first_contact_task
                project_page.task_action = "Completed"
                project_page.task_update
            end
            # project_page.wait_until do
            #       project_page.contact_message_element.text.should eql "Change task status successfully."
            # end
      end
      #contact tasks页面填写date and Cl.C的task执行complete操作
      it 'contact tasks page complete task which have date and Cl.C' do
            project_page.add_contact_task
            sleep 4
            if project_page.edit_mkt_notes_element.text != "Empty" && project_page.edit_hours_element.text != "0"
                project_page.check_first_contact_task
                project_page.task_action = "Completed"
                project_page.task_update
            else
                project_page.edit_mkt_notes
                project_page.save_mkt_notes
                sleep 1
                project_page.edit_hours
                project_page.input_hours = "450"
                project_page.save_hours
                project_page.check_first_contact_task
                project_page.task_action = "Completed"
                project_page.task_update
            end
            # project_page.wait_until do
            #       project_page.contact_message_element.text.should eql "Change task status successfully."
            # end
      end

      #contact tasks page填写date and Billing Notes的task执行complete操作
      it 'contact tasks page complete task which have date and Billing Notes' do
            project_page.add_contact_task
            sleep 2
            if project_page.edit_mkt_notes_element.text != "Empty" && project_page.edit_cash_element.text != "Empty"
                project_page.check_first_contact_task
                project_page.task_action = "Completed"
                project_page.task_update
            else
                project_page.edit_mkt_notes
                project_page.save_mkt_notes
                project_page.edit_cash
                project_page.input_contact_billnotes = "notes"
                project_page.save_contact_bill_notes
                project_page.check_first_contact_task
                project_page.task_action = "Completed"
                project_page.task_update
            end
            # project_page.wait_until do
            #       project_page.contact_message_element.text.should eql "Change task status successfully."
            # end
      end

end