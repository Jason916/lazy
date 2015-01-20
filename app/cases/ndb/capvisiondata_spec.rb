#encoding:utf-8
require File.expand_path 'app/cases/spec_helper'
require File.expand_path 'app/cases/shared/action'


describe 'capvisiondata page', :capvisiondata do 

	let(:project_page) do 
		  home_page = $navi.goto_home_page
			login_page = home_page.direct_to_login_page
			home_page = login_page.login "admin","1234"
			project_page = home_page.direct_to_project_page
    end
      #进入capvision data service list页面
    	it 'go to capvision data service list page' do
            project_page.capvisiondataList
            sleep 1
            # project_page.wait_until do
            #   project_page.title.should eql 'Data Service - Capvision'
            # end
    	end
    	#创建capvision data项目
    	it 'should create capvision data page' do
            project_page.create_dataservice_project
           #  project_page.wait_until do
           #    project_page.text.should include "ATcapvisiondata_test"
    	      # end
    	end
    	#根据status和keywords进入搜索
    	it 'status and keywords search data' do
            project_page.allstatus_keywords_search
            # project_page.wait_until do
            #   project_page.title.should include "Data Service - Capvision"
            # end
      end
      #更改capvision data项目为in process
    	it 'change the capvision data project to inprocess' do
            project_page.update_inprocess
            # project_page.wait_until do
            #   project_page.title.should include "Data Service - Capvision"
            # end
    	end
    	#更改capvision data项目为on hold
    	it 'change the capvision data project to onhold' do
            project_page.update_onhold
           #  project_page.wait_until do
           #    project_page.title.should include "Data Service - Capvision"
    	      # end
    	end
    	#更改capvision data项目为invalid
    	it 'change the capvision data project to invalid' do
            project_page.update_invalid
           #  project_page.wait_until do
           #    project_page.title.should include "Data Service - Capvision"
    	      # end
    	end
    	#更改capvision data项目为complete
    	it 'change the capvision data project to complete' do
           project_page.update_complete
           #  project_page.wait_until do
           #    project_page.title.should include "Data Service - Capvision"
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
            # message = project_page.alert do
            #   project_page.update_project
            # end
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
            # message = project_page.alert do
            #   project_page.update_project
            # end
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
            # message = project_page.alert do
            #   project_page.update_project
            # end
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
            project_page.update_payment_cash_element.when_present.click
            sleep 2
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
            project_page.edit_billing_notes
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
                project_page.edit_mkt_notes_contact_element.when_present.click
                sleep 1
                project_page.clear_date_element.when_present.click
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
            if project_page.edit_mkt_notes_element.text != "Empty" && project_page.edit_billing_notes_element.text != "Empty"
                project_page.check_first_contact_task
                project_page.task_action = "Completed"
                project_page.task_update
            else
                project_page.edit_mkt_notes_element.when_present.click
                project_page.save_mkt_notes_element.when_present.click
                project_page.edit_cash_element.when_present.click
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
     ###########################################0814##############################################
     #capvision data list页面项目中存在complete的task的删除限制验证
     it 'delete project' do
      project_page.capvisiondataList
      sleep 1
      project_page.search_status = 'All Status'
      project_page.search_element.when_present.click
      message = project_page.alert do
        project_page.delete_project_element.when_present.click
      end
      project_page.manager_text_element.when_present.click
     end 
     #建项目step1必填项验证 
     it 'step1' do
      project_page.capvisiondataList
      sleep 1
      project_page.create_capvisiondata
      project_page.next
     end 
     #建项目step1 [Consultants Requested]纯数字输入验证
     it 'validate consultants requested' do
      project_page.validate_consultants_requested
     end
     #建项目step1 [Consultants Expected]纯数字输入验证
     it 'validate consultants expected' do
      project_page.validate_consultants_expected
     end
     #建项目step1 [price]文本框纯数字输入验证
     it 'validate price' do
      project_page.validate_price
     end
     #capvision data project info页面编辑basic info
     it 'edit project info page basic info' do
      project_page.goto_project_info
      project_page.edit_basic_info
     end
     #capvision data project info页面编辑basic info必填项验证
     it 'edit project info page basic info verification is empty' do
      project_page.goto_project_info
      project_page.verification_edit_basic_info_empty
     end
     #capvision data project info页面编辑basic info中start date & end date时序验证
     it 'validate start time more than end time' do
      project_page.goto_project_info
      project_page.starttime_more_than_endtime
     end
     #capvision data project info页面project team信息编辑
     it 'edit project team' do
      project_page.goto_project_info
      project_page.edit_project_team
     end
     #capvision data list页面不选中任何项目执行update操作
     it 'do not select any project execution update operation' do
        project_page.capvisiondataList
        sleep 1
        project_page.search_status = "All Status"
        project_page.search_element.when_present.click
        message = project_page.alert do
          project_page.update_project_element.when_present.click
        end
     end
     #capvision data list页面on hold操作原因必填验证
     it 'validate on hold notes message' do
        project_page.capvisiondataList
        sleep 1
        project_page.search_status = 'All Status'
        project_page.search
        sleep 1
        project_page.check_grid1
        project_page.actionType = 'On Hold'
        project_page.update_project_element.when_present.click
        message = project_page.alert do
          project_page.save_project_element.when_present.click
        end
     end
     #capvision data list页面on hold弹窗下拉菜单选取other出现文本输入框
     it 'choose other display the text field' do
      project_page.choose_other_onholdnotes
     end
     #再次添加顾问到capvision data项目
      it 'add consultant to consultant task page again' do
        project_page.add_consultant_task
      end
     #capvision data consultant tasks页面点击upload上传txt文档
     it 'upload .txt file' do
      project_page.upload_txt
     end
     #上传大于20mb的文档
     it 'upload .docx > 20mb file' do
      project_page.upload_docx_20MB
     end
     #上传正常大小的文档上传成功
     it 'upload the normal document'do
      project_page.upload_docx
     end
     #consultant task页面不选中task执行update操作显示提示信息
     it 'consultant task page not select task perform a update operation to display a message' do
      project_page.click_consultant_task_updatebutton
     end
     #capvision data consultant tasks页面选中任意task后点击update
     it 'consultant task page select task click update button' do
      project_page.choose_consultant_task_update
     end
     #capvision data consultant tasks页面对单个task执行Deleted操作
     it 'consultant task page the deleted operation is performed on a single task' do
      project_page.delete_single_consultant_task
     end
     #capvision data consultant tasks页面对多个task执行Deleted操作
     it 'consultant task page a plurality of task Deleted operations' do
      project_page.delete_multiple_consultant_task
     end
     #capvision data contact tasks页面不选中任何task执行任意状态的update操作
     it 'contact task page not select task perform a update operation to display a message ' do
      project_page.click_contact_task_updatebutton
     end
     #capvision data contact tasks页面选中任意task后点击update
     it 'contact task page select task click update button' do
      project_page.choose_contact_task_update
     end
     #capvision data contact tasks页面对单个task执行Not Contacted操作
     it 'contact task page the Not Contacted operating performance of a single task' do
      project_page.update_single_contact_task
     end
     #capvision data contact tasks页面对多个task执行Not Contacted操作
     it 'contact task page the Not Contacted operation to perform multiple task' do
      project_page.update_multiple_contact_task
     end
     #capvision data contact tasks页面对单个task执行Deleted操作
     it 'contact task page the deleted operation is performed on a single task' do
      project_page.delete_single_contact_task
     end
     #capvision data contact tasks页面对多个task执行Deleted操作
     it 'contact task page a plurality of task Deleted operations' do
      project_page.delete_multiple_contact_task
     end
     #============================================0818===============================================
     #capvision data list页面capvision data search by user
     it 'capvision data search by user' do
      project_page.capvisiondataList
      sleep 2
      project_page.click_to_select_user_element.when_present.click
      project_page.select_user_to_search_element.when_present.click
      project_page.search_element.when_present.click
     end
     #capvision data list页面consultation search by paticipates
     it 'capvision data search by paticipates' do
      project_page.capvisiondataList
      sleep 2
      project_page.search_byparticipant = "KM Support"
      project_page.search
     end
     #capvision data list页面consultation search by industry
     it 'capvision data search by industry' do
      project_page.capvisiondataList
      sleep 2
      project_page.search_byindustry = "Agriculture - 农业"
      project_page.search
     end
     #capvision data list页面consultation search by keyword(name)
     it 'capvision data search by keyword (name)' do
      project_page.capvisiondataList
      sleep 2
      project_page.keywords_project = "ATcapvisiondata"
      project_page.search
     end
     #capvision data list页面consultation search by keyword(description)
     it 'capvision data search by keyword (description)' do
      project_page.capvisiondataList
      sleep 2
      project_page.keywords_project = "lol"
      project_page.search
     end
     #capvision data list页面查看图标跳转
     it 'capvision data view icon' do
      project_page.capvisiondataList
      sleep 2
      project_page.search
      sleep 2
      project_page.view_project
     end
     #capvision data list页面项目列表点击Project字段排序验证
     it 'list page click project link sort field ' do
      project_page.capvisiondataList
      sleep 2
      project_page.search
      sleep 2
      project_page.sort_project
      sleep 2
     end
     #capvision data list页面项目列表点击Priority字段排序验证
     it 'list page click priority link sort field'do
      project_page.capvisiondataList
      sleep 2
      project_page.search
      sleep 2
      project_page.sort_priority
      sleep 2
     end
     #capvision data list页面项目列表点击Start Date字段排序验证
     it 'list page click start date link sort field' do
      project_page.capvisiondataList
      sleep 2
      project_page.search
      sleep 2
      project_page.sort_startdate
      sleep 2
     end
     #capvision data list页面项目列表点击Status字段排序验证
     it 'list page click status link sort field' do
      project_page.capvisiondataList
      sleep 2
      project_page.search
      sleep 2
      project_page.sort_status
      sleep 2
     end
     #capvision data consultant tasks页面Status字段排序验证
     it 'consultant task page click status link sort field' do
      project_page.consultant_sort_status
     end
     #capvision data consultant tasks页面Date字段排序验证
     it 'consultant task page click date link sort field' do
      project_page.consultant_sort_date
     end
     #capvision data consultant tasks页面Co.H字段排序验证
     it 'consultant task page click coh link sort field' do
      project_page.consultant_sort_coh
     end
     #capvision data consultant tasks页面Co.C字段排序验证
     it 'consultant task page click coc link sort field' do
      project_page.consultant_sort_coc
     end
     #capvision data consultant tasks页面Manager字段排序验证
     it 'consultant task page click manager link sort field' do
      project_page.consultant_sort_manager
     end
     #capvision data contact tasks页面Status字段排序验证
     it 'contact task page click status link sort field' do
      project_page.contact_sort_status
     end
     #capvision data contact tasks页面Cl.H字段排序验证
     it 'contact task page click clh link sort field' do
      project_page.contact_sort_clh
     end
     #capvision data contact tasks页面Cl.C字段排序验证
     it 'contact task page click clc link sort field' do
      project_page.contact_sort_clc
     end
end