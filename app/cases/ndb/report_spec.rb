#encoding: utf-8
require File.expand_path 'app/cases/spec_helper'
require File.expand_path 'app/cases/shared/action'


describe 'report page', :report  do 
  
  let(:report_page)do 
      home_page = $navi.goto_home_page
      login_page = home_page.direct_to_login_page
      home_page = login_page.login "admin","1234"
      report_page = home_page.direct_to_report_page
    end
    
    it 'should go to report page' do      
      report_page.wait_until do
        report_page.h1_text_element.when_present.text.should eql "Please Choose One Report"
      end
    end

    it 'search by date on daily page ' do
      report_page.go_subpage "Daily"
      report_page.input_date "Daily"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "search"
      #report_page.text.should include "Date"
    end

    it 'search by the status of recommended on daily page ' do 
      report_page.go_subpage "Daily"
      report_page.daily_status="Recommended"
      report_page.filter
      report_page.wait_until do
        report_page.filter_element.when_present.text.should eql "search"
      end
    end

    it 'search by the status of arranged on daily page '  do 
      report_page.go_subpage "Daily"
      report_page.daily_status="Arranged"
      report_page.filter
      report_page.wait_until do
        report_page.filter_element.when_present.text.should eql "search"
      end
    end
    
    it 'search by the status of completed on daily page '  do 
      report_page.go_subpage "Daily"
      report_page.daily_status="Completed"
      report_page.filter
      report_page.wait_until do
        report_page.filter_element.when_present.text.should eql "search"
      end  
    end
    
    it 'search by the default status  on daily page '  do 
      report_page.go_subpage "Daily"
      report_page.filter
      report_page.wait_until do
        report_page.filter_element.when_present.text.should eql "search"
      end
    end
    
    it 'search by the industry of agriculture on full consultant page '  do 
      report_page.go_subpage "Full Consultant"
      report_page.fullconsultant_industry="Agriculture - 农业"
      report_page.filter
      report_page.wait_until do
        report_page.filter_element.when_present.text.should eql "search"
      end
    end
   
    it 'search by the industry of aerospace on full consultant page '  do 
      report_page.go_subpage "Full Consultant"
      report_page.fullconsultant_industry="Aerospace - 航空" 
      report_page.filter
      report_page.filter_element.when_present.text.should eql "search"
    end
    
    it 'search by the industry of chemicals on full consultant page '  do 
      report_page.go_subpage "Full Consultant"
      report_page.fullconsultant_industry="Chemicals - 化学产品"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "search"
    end
    
    it 'search by the industry of energy on full consultant page '  do 
      report_page.go_subpage "Full Consultant"
      report_page.fullconsultant_industry="Energy - 能源"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "search"
    end
    
    it 'search by the industry of environment on full consultant page '  do 
      report_page.go_subpage "Full Consultant"
      report_page.fullconsultant_industry="Environment - 环保"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "search"
    end
    
    it 'search by the default status on full consultant page '  do 
      report_page.go_subpage "Full Consultant"
      report_page.filter
      report_page.wait_until do
        report_page.filter_element.when_present.text.should eql "search"
      end
    end

    it 'search by date on consultant growth page ' do 
      report_page.go_subpage "Consultant Growth"
      report_page.input_date "ConsultantGrowth"
      report_page.filter
      report_page.wait_until do
        report_page.filter_element.when_present.text.should eql "search"
      end
    end

    it 'search by the default status on consultant growth page '  do 
      report_page.go_subpage "Consultant Growth"
      report_page.filter
      report_page.wait_until do
        report_page.filter_element.when_present.text.should eql "search"
      end
    end
    #client summary页面按close date查询记录
    it 'search by close date on client summary page' do 
      report_page.go_subpage "Client Summary"
      report_page.input_close_date
      report_page.filter
      report_page.wait_until do
        report_page.filter_element.when_present.text.should eql "search"
      end
    end
    #client summary页面按renewal date查询记录  #此功能以被隐藏

    #client summary页面按consulting firm类型查询记录
    it 'search by the type of consulting firm on client summary page ' do 
      report_page.go_subpage "Client Summary"
      report_page.clientsummary_type = "Consulting Firm"
      report_page.filter
      report_page.wait_until do
        report_page.filter_element.when_present.text.should eql "search"
      end
    end   

    #client summary页面按private equity类型查询记录
    it 'search by the type of private equity on client summary page '  do 
      report_page.go_subpage "Client Summary"
      report_page.clientsummary_type = "Private Equity"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "search"
    end
    #client summary页面按hedge fund类型查询记录
    it 'search by the type of hedge fund on client summary page'  do 
      report_page.go_subpage "Client Summary"
      report_page.clientsummary_type_element.when_present.select "Hedge Fund"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "search"
    end
    #client summary页面按venture capital类型查询记录
    it 'search by the type of venture capital on client summary page'  do 
      report_page.go_subpage "Client Summary"
      report_page.clientsummary_type_element.when_present.select "Venture Capital"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "search"
    end
    #client summary页面按mutual fund类型查询记录
    it 'search by the type of mutual fund on client summary page '  do 
      report_page.go_subpage "Client Summary"
      report_page.clientsummary_type = "Mutual Fund"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "search"
    end
    #client summary页面按corporate类型查询记录
    it 'search by the type of corporate on client summary page '  do 
      report_page.go_subpage "Client Summary"
      report_page.clientsummary_type = "Corporate"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "search"
    end
    #client summary页面按financial firm类型查询记录
    it 'search by the type of financial firm client summary page '  do 
      report_page.go_subpage "Client Summary"
      report_page.clientsummary_type = "Financial Firm"
      report_page.filter 
      report_page.filter_element.when_present.text.should eql "search"
    end
    #client summary页面按others类型查询记录
    it 'search by the type of others on client summary page'  do 
      report_page.go_subpage "Client Summary"
      report_page.clientsummary_type = "Others"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "search"
    end
   
    it 'search by the default type on client summary page'  do 
      report_page.go_subpage "Client Summary"
      report_page.filter
      report_page.wait_until do
        report_page.filter_element.when_present.text.should eql "search"
      end
    end
    
    it 'search by date on client cash page'  do 
      report_page.go_subpage "Client Cash"
      report_page.input_date "ClientCash"
      report_page.filter
      report_page.wait_until do
        report_page.filter_element.when_present.text.should eql "search"
      end
    end
    #client cash页面按consulting firm类型查询记录
    it 'search by the type of consulting firm on client cash page'  do 
      report_page.go_subpage "Client Cash"
      report_page.clientcash_type = "Consulting Firm"
      report_page.filter
      report_page.wait_until do
        report_page.filter_element.when_present.text.should eql "search"
      end
    end
    
    it 'search by the default type on client cash page'  do 
      report_page.go_subpage "Client Cash"
      report_page.filter
      report_page.wait_until do
        report_page.filter_element.when_present.text.should eql "search"
      end
    end
    #km project status页面按start date查询记录
    it 'search by date on KM project status page'  do 
      report_page.go_subpage "KM Project Status"
      report_page.input_start_date
      report_page.filter
      report_page.wait_until do
        report_page.filter_element.when_present.text.should eql "search"
      end
    end
    #km project status页面按in process状态查询记录
    it 'search by the status of in process on KM project status page'  do 
      report_page.go_subpage "KM Project Status"
      report_page.kmproject_status = "In Process"
      report_page.filter
      report_page.wait_until do
        report_page.filter_element.when_present.text.should eql "search"
      end
    end
    
    it 'search by the default status on KM project status page'  do 
      report_page.go_subpage "KM Project Status"
      report_page.filter
      report_page.wait_until do
        report_page.filter_element.when_present.text.should eql "search"
      end
    end
    
    it 'search by date on call manager page'  do 
      report_page.go_subpage "Call Manager"
      report_page.input_date "CallManager"
      report_page.filter
      report_page.wait_until do
        report_page.filter_element.when_present.text.should eql "search"
      end
    end
    
    it 'search by default on call manager page'  do 
      report_page.go_subpage "Call Manager"
      report_page.filter
      report_page.wait_until do
        report_page.filter_element.when_present.text.should eql "search"
      end
    end
    
    it 'search by date on compliance check page'  do 
      report_page.go_subpage "Compliance Check"
      report_page.input_compliance_date
      report_page.filter
      report_page.wait_until do
        report_page.filter_element.when_present.text.should eql "search"
      end
    end
    
    it 'search by default on compliance check page'  do 
      report_page.go_subpage "Compliance Check"
      report_page.filter
      report_page.wait_until do
        report_page.filter_element.when_present.text.should eql "search"
      end
    end
    #compliance approval页面按requested time查询记录
    it 'search by requested time on compliance approval page'  do 
      report_page.go_compliance_approval
      report_page.input_compliance_requested_date
      report_page.filter
      report_page.wait_until do
        report_page.filter_element.when_present.text.should eql "search"
      end
    end
    
    it 'search by default on compliance approval page' do 
      report_page.go_compliance_approval
      report_page.filter
      report_page.wait_until do
        report_page.filter_element.when_present.text.should eql "search"
      end
    end
    #compliance approval页面approve的按钮功能
    it 'compliance approval page approve function' do
      report_page.go_compliance_approval
      report_page.compliance_approval_status_element.when_present.select "All Capvision Approval"
      report_page.filter
      report_page.first_checkbox_element.when_present.click
      report_page.approve_btn_element.when_present.click
      sleep 2
      report_page.text.should include "Send To Km Successfully"
    end
    #compliance approval页面direct approve的按钮功能
    it 'compliance approval page direct approve function' do
      report_page.go_compliance_approval
      report_page.compliance_approval_status_element.when_present.select "All Capvision Approval"
      report_page.filter
      report_page.first_checkbox_element.when_present.click
      report_page.direct_approve_btn_element.when_present.click
      sleep 2
      report_page.text.should include "Send To Km Successfully"
    end
    #compliance approval页面external approve的按钮功能
    it 'compliance approval page external approve function' do
      report_page.go_compliance_approval
      report_page.compliance_approval_status_element.when_present.select "All Capvision Approval"
      report_page.filter
      report_page.first_checkbox_element.when_present.click
      report_page.external_approve_btn_element.when_present.click
    end
    #compliance approval页面reject的按钮功能
    it 'compliance approval page reject function' do
      report_page.go_compliance_approval
      report_page.compliance_approval_status_element.when_present.select "All Capvision Approval"
      report_page.filter
      report_page.first_checkbox_element.when_present.click
      report_page.reject_btn_element.when_present.click
      report_page.fill_reject_note_element.when_present.append "at_test_reject_asdsas"
      report_page.reject_save_btn
      sleep 2
    end
    #consultation industry页面按date查询记录
    it 'search by date on consultant industry page' do 
      report_page.go_subpage "Consultation Industry"
      report_page.input_date "ConsultationIndustry"
      report_page.filter
      report_page.wait_until do
        report_page.filter_element.when_present.text.should eql "search"
      end
    end
    
    it 'search by default on consultant industry page'  do 
      report_page.go_subpage "Consultation Industry"
      report_page.filter
      report_page.wait_until do
        report_page.filter_element.when_present.text.should eql "search"
      end
    end
    
    it 'search by default on client project page'  do 
      report_page.go_subpage "Client Project"
      report_page.filter
      report_page.wait_until do
        report_page.filter_element.when_present.text.should eql "Search"
      end  
      report_page.go_subpage "Capvision Data Services"
      report_page.filter
      report_page.wait_until do
        report_page.filter_element.when_present.text.should eql "Search"
      end
      report_page.go_subpage "GES ConVey TM"
      report_page.filter
      report_page.wait_until do
        report_page.filter_element.when_present.text.should eql "Search"
      end  
      report_page.go_subpage "Conference"
      report_page.filter
      report_page.wait_until do
        report_page.filter_element.when_present.text.should eql "Search"
      end
      report_page.go_subpage "HR Service"
      report_page.filter
      report_page.wait_until do
        report_page.filter_element.when_present.text.should eql "Search"
      end
      report_page.go_subpage "International Consultation"
      report_page.filter
      report_page.wait_until do
        report_page.filter_element.when_present.text.should eql "Search"
      end
    end
    #consultation status&feedback页面按date查询记录
    it 'search by date on consultation status&feedback page' do 
      report_page.go_subpage "Consultation Status&Feedback"
      report_page.input_consultation_status_date
      report_page.filter
    end
    
    it 'search by default on consultation status&feedback page' do 
      report_page.go_subpage "Consultation Status&Feedback"
      report_page.filter
    end
    #payment report页面project fee页面cash超过amount后标红-----------------------N/A（难以实现 验证）
    #it 'payment_report_page project_fee_page task masked red when cash is larger than amount ' do
    #end
    #invoicing report页面download按钮功能
    it 'invoicing_report_page download function' do
      report_page.go_subpage "Invoicing"
      report_page.filter_element.when_present.click
      report_page.download_element.when_present.click
    end
    #payment report页面project fee页面payment notes的编辑功能
    # it 'payment_report_page project_fee_page edit payment notes' do
    #   report_page.go_subpage "Payment"
    #   report_page.filter
    #   report_page.payment_notes_element.when_present.click
    #   report_page.paynotes_input_element.when_present.set "payment notes"
    #   report_page.paynotes_save_element.when_present.click
    #   report_page.filter_element.when_present.text.should eql "search"
    # end
    #payment report页面referral fee页面download按钮功能
    it 'payment_report_page referral_fee_page download function' do
      report_page.go_subpage "Payment"
      report_page.goto_referralfee_element.when_present.click
      report_page.filter
      report_page.download_element.when_present.click
    end
    #full consultant页面download按钮功能
    it 'full_consultant_page download function' do
      report_page.go_subpage "Full Consultant"
      report_page.consultant_status = "Communicated"
      report_page.filter
      report_page.download_element.when_present.click
    end
    #consultant growth页面download按钮功能
    it 'consultant_growth_page download function' do
      report_page.go_subpage "Consultant Growth"
      report_page.filter
      report_page.download_element.when_present.click
    end
    #client cash页面download按钮功能
    it 'client_cash_page  download function' do
      report_page.go_subpage "Client Cash"
      report_page.filter
      report_page.download_element.when_present.click
    end
    #km project status页面download按钮功能
    it 'km_project_status_page download function' do
      report_page.go_subpage "KM Project Status"
      report_page.filter
      report_page.download_element.when_present.click
    end
    #call manager页面download按钮功能
    it 'call_manager_page download function' do
      report_page.go_subpage "Call Manager"
      report_page.filter
      report_page.download_element.when_present.click
    end
    #compliance check页面download按钮功能
    it 'compliance_check_page download function' do
      report_page.go_subpage "Compliance Check"
      report_page.filter
      report_page.download_element.when_present.click
    end
    #consultation industry页面download按钮的功能
    it 'consultation_industry_page download function' do
      report_page.go_subpage "Consultation Industry"
      report_page.filter
      report_page.download_element.when_present.click
    end
    #consultation status&feedback页面download按钮功能
    it 'consultation_status_and_feedback_page download function' do
      report_page.go_subpage "Consultation Status&Feedback"
      report_page.filter
      report_page.download_element.when_present.click
    end
    #request summary report页面download按钮功能
    it 'request_summary_report_page download function' do
      report_page.go_subpage "Request Summary Report"
      report_page.filter
      report_page.download_element.when_present.click
    end
    #daily report页面按date查询下个月的记录
    it 'daily_report_page search the next month record by date' do
      report_page.go_subpage "Daily"
      report_page.input_date_daily_element.when_present.click
      report_page.next_month_daily_element.when_present.click
      report_page.next_month_date_daily_element.when_present.click
      report_page.apply_date_daily_element.when_present.click
      report_page.filter_element.when_present.text.should eql "search"
    end
    #daily report页面提示信息上的“here”的链接
    it 'daily_report_page click the link here in promopt information' do
      report_page.go_subpage "Daily"
      report_page.daily_here_element.when_present.click
      report_page.daily_time_element.when_present.text.should eql "Time"
    end
    #daily report页面点击project的链接
    it 'daily_report_page click the link project' do
      report_page.go_subpage "Daily"
      report_page.filter
      report_page.first_project_daily_element.when_present.click
      report_page.attach_to_window(:title=>report_page.first_project_daily_element.when_present.text+" - Task List - Capvision")
      report_page.task_list_element.when_present.text.should eql "Task List"
    end
    #daily report页面跳转至首页的链接
    it 'daily_report_page goto the first page' do
      report_page.go_subpage "Daily"
      report_page.filter
      report_page.last_page_daily_element.when_present.click
      report_page.first_page_daily_element.when_present.click
      report_page.filter_element.when_present.text.should eql "search"
    end
    #daily report页面跳转至末页的链接
    it 'daily_report_page goto the last page' do
      report_page.go_subpage "Daily"
      report_page.filter
      report_page.last_page_daily_element.when_present.click
      report_page.filter_element.when_present.text.should eql "search"
    end
    #daily report页面跳转至任意页的链接
    it 'daily_report_page goto random page' do
      report_page.go_subpage "Daily"
      report_page.filter
      report_page.random_page_daily_element.when_present.click
      report_page.filter_element.when_present.text.should eql "search"
    end
    #daily report页面页码不为数字点击go按钮
    it 'daily_report_page click go button without page number' do
      report_page.go_subpage "Daily"
      report_page.filter_element.when_present.click
      report_page.input_page = "r"
      message = report_page.alert do
        report_page.go_daily_element.when_present.click
      end
      message.should == "must be a number"
    end
    #daily report页面选择date点击clear按钮
    it 'daily_report_page select date and then click clear' do
      report_page.go_subpage "Daily"
      report_page.input_date_daily_element.when_present.click
      report_page.clear_date_daily_element.when_present.click
      report_page.filter_element.when_present.text.should eql "search"
    end
    #invoicing report页面选择date点击clear按钮
    it 'invoicing_report_page select date and then click clear' do
      report_page.go_subpage "Invoicing"
      report_page.input_date_invocing_element.when_present.click
      report_page.clear_button_invocing_element.when_present.click
      report_page.filter_element.when_present.text.should eql "search"
    end
    #invoicing report页面按project name查询记录
    it 'invoicing_report_page search by project name' do
      report_page.go_subpage "Invoicing"
      report_page.invocing_project_name = "test"
      report_page.filter_element.when_present.click
      report_page.company_invocing_element.when_present.text.should eql "Company"
    end
    #invoicing report页面的client的链接
    it 'invoicing_report_page click client link' do
      report_page.go_subpage "Invoicing"
      report_page.filter
      report_page.first_client_invocing_element.when_present.click
      report_page.attach_to_window(:title=>"Profile - "+report_page.first_client_invocing_element.when_present.text+" - Capvision")
      report_page.client_profile_element.when_present.text.should eql "Profile"
    end
    #invoicing report页面的contact的链接 (contact链接不稳定)
     # it 'invoicing_report_page click contact link' do
       # report_page.go_subpage "Invoicing"
       # report_page.filter
       # report_page.first_contact_invocing_element.when_present.click
       # report_page.attach_to_window(:title=>report_page.first_client_invocing_element.when_present.text+" - Capvision")
       # report_page.contact_profile_element.when_present.text.should eql "Profile"
     # end
    #invoicing report页面的project的链接
    it 'invoicing_report_page click project link' do
      report_page.go_subpage "Invoicing"
      report_page.filter_element.when_present.click
      invocing_title = report_page.report_page_invocing_title
      report_page.first_project_invocing_element.when_present.click
      report_page.attach_to_window(:title=>invocing_title+" - Task List - Capvision")
      report_page.task_list_element.when_present.text.should eql "Task List"
    end 
    #invoicing report页面的consultant的链接
    it 'invoicing_report_page click consultant link' do
      report_page.go_subpage "Invoicing"
      report_page.filter_element.when_present.click
      report_page.first_consultant_invocing_element.when_present.click
      report_page.attach_to_window(:title=>report_page.first_consultant_invocing_element.when_present.text+" - Capvision")
      report_page.consultant_profile_element.when_present.text.should eql "Profile"
    end
    #payment report页面project fee页面client链接
    it 'payment_report_page project_fee_page click client link' do
      report_page.go_subpage "Payment"
      report_page.filter_element.when_present.click
      report_page.first_client_projectfee_element.when_present.click
      report_page.attach_to_window(:title=>"Profile - "+report_page.first_client_projectfee_element.when_present.text+" - Capvision")
      report_page.client_profile_element.when_present.text.should eql "Profile"
    end
    #payment report页面project fee页面project链接
    it 'payment_report_page project_fee_page click project link' do
      report_page.go_subpage "Payment"
      report_page.filter
      report_page.first_project_projectfee_element.when_present.click
      report_page.attach_to_window(:title=>report_page.first_project_projectfee_element.when_present.text+" - Task List - Capvision")
      report_page.task_list_element.when_present.text.should eql "Task List"
    end
    #payment report页面project fee页面consultant链接
    it 'payment_report_page project_fee_page click consultant link' do
      report_page.go_subpage "Payment"
      report_page.filter
      report_page.first_consultant_projectfee_element.when_present.click
      report_page.attach_to_window(:title=>report_page.first_consultant_projectfee_element.when_present.text+" - Capvision")
      report_page.consultant_profile_element.when_present.text.should eql "Profile"
    end
    #payment report页面project fee页面mobile链接-----------------------------------------------------N/A(顾问没有mobile)
    # it 'payment_report_page project_fee_page click mobile link' do

    # end
    #payment report页面project fee页面选择date点击clear按钮
    it 'payment_report_page project_fee_page select date and then click clear' do
      report_page.go_subpage "Payment"
      report_page.input_date_fee_element.when_present.click
      report_page.clear_date_fee_element.when_present.click
      report_page.filter_element.when_present.text.should eql "search"
    end
    #payment report页面referral fee页面选择date点击clear按钮
    it 'payment_report_page referral_fee_page select date and then click clear' do
      report_page.go_subpage "Payment"
      report_page.referralfee_link_element.when_present.click
      report_page.input_date_fee_element.when_present.click
      report_page.clear_date_fee_element.when_present.click
      report_page.filter_element.when_present.text.should eql "search"
    end
    #payment report页面referral fee页面consultant链接
    it 'payment_report_page referral_fee_page click consultant link' do
      report_page.go_subpage "Payment"
      report_page.referralfee_link_element.when_present.click
      report_page.filter
      report_page.first_consultant_referfee_element.when_present.click
      report_page.attach_to_window(:title=>report_page.first_consultant_referfee_element.when_present.text+" - Capvision")
      report_page.consultant_profile_element.when_present.text.should eql "Profile"
    end
    
    #payment report页面referral fee页面referral链接
    it 'payment_report_page referral_fee_page click referral link' do
      report_page.go_subpage "Payment"
      report_page.referralfee_link_element.when_present.click
      report_page.filter
      report_page.first_refereal_referfee_element.when_present.click
      report_page.attach_to_window(:title=>report_page.first_refereal_referfee_element.when_present.text+" - Capvision")
      report_page.consultant_profile_element.when_present.text.should eql "Profile"
    end
    
    #payment report页面referral fee页面project链接------------------------------------------------N/A（无法实现 report页面没有case code）
    # it 'payment_report_page referral_fee_page click project link' do
    #   report_page.go_subpage "Payment"
    #   report_page.referralfee_link_element.when_present.click
    #   report_page.filter
    #   report_page.first_project_referfee_element.when_present.click
    #   report_page.attach_to_window(:title=>report_page.first_project_referfee_element.when_present.text+" - Task List - Capvision")
    #   report_page.task_list_element.when_present.text.should eql "Task List"
    # end

    #full consultant页面按enrolled状态查询记录
    it 'full_consultant_page search by enrolled status' do
      report_page.go_subpage "Full Consultant"
      report_page.consultant_status = "Enrolled"
      report_page.filter
    end
    #full consultant页面按communicated状态查询记录
    it 'full_consultant_page search by communicated status' do
      report_page.go_subpage "Full Consultant"
      report_page.consultant_status = "Communicated"
      report_page.filter
    end
    #full consultant页面按not contacted状态查询记录
    it 'full_consultant_page search by not contacted status' do
      report_page.go_subpage "Full Consultant"
      report_page.consultant_status = "Not Contacted"
      report_page.filter
    end
    #full consultant页面按prospect状态查询记录
    it 'full_consultant_page search by prospect status' do
      report_page.go_subpage "Full Consultant"
      report_page.consultant_status = "Prospect"
      report_page.filter
    end
    #full consultant页面按invalid状态查询记录
    it 'full_consultant_page search by invalid status' do
      report_page.go_subpage "Full Consultant"
      report_page.consultant_status = "Invalid"
      report_page.filter
    end
    #full consultant页面按blacklist状态查询记录
    it 'full_consultant_page search by blacklist status' do
      report_page.go_subpage "Full Consultant"
      report_page.consultant_status = "Blacklist"
      report_page.filter
    end
    #full consultant页面顾问的链接
    it 'full_consultant_page click consultant link' do
      report_page.go_subpage "Full Consultant"
      report_page.filter
      report_page.first_consultant_fullc_element.when_present.click
      report_page.attach_to_window(:title=>report_page.first_consultant_fullc_element.when_present.text+" - Capvision")
      #report_page.text.include? "Relationship Summary"
    end
    # #full consultant页面email的链接-----------------------------------------N/A(元素可能定位不到，无法验证)
    # it 'full_consultant_page click email link' do
    # end
    # #full consultant页面mobile的链接----------------------------------------N/A(元素可能定位不到，无法验证)
    # it 'full_consultant_page click mobile link' do
    # end
    # #full consultant页面telephone的链接-------------------------------------N/A(元素可能定位不到，无法验证)
    # it 'full_consultant_page click telephone link' do
    # end
    #consultant growth页面选择date点击clear按钮
    it 'consultant_growth_page select date and then click clear button' do
      report_page.go_subpage "Consultant Growth"
      report_page.input_date_consultantgrowth_element.when_present.click
      report_page.clear_date_consultantgrowth_element.when_present.click
      report_page.filter_element.when_present.text.should eql "search"
    end
    #consultant growth页面点击顾问名字链接
    it 'consultant_growth_page click consultant link' do
      report_page.go_subpage "Consultant Growth"
      report_page.filter
      report_page.first_consultant_cgrowth_element.when_present.click
      report_page.attach_to_window(:title=>report_page.first_consultant_cgrowth_element.when_present.text+" - Capvision")
      report_page.consultant_profile_element.when_present.text.should eql "Profile"
    end
    #consultant growth页面按created by查询记录
    it 'consultant_growth_page search by created by' do
      report_page.go_subpage "Consultant Growth"
      report_page.click_to_select_createby_element.when_present.click
      report_page.select_createby_element.when_present.click
      report_page.filter
      report_page.locate_first_createdby_cgrowth_element.when_present.text.should eql "test_km1"
    end

    #consultant growth页面按enrolled状态查询记录
    it 'consultant_growth_page search by enrolled status' do
      report_page.go_subpage "Consultant Growth"
      report_page.consultant_status_cgrowth = "Enrolled"
      report_page.filter
      report_page.list_status_cgrowth_element.when_present.text.should eql "Enrolled"
    end
    #consultant growth页面按communicated状态查询记录
    it 'consultant_growth_page search by communicated status' do
      report_page.go_subpage "Consultant Growth"
      report_page.consultant_status_cgrowth = "Communicated"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "search"
    end
    #consultant growth页面按not contacted状态查询记录
    it 'consultant_growth_page search by not contacted status' do
      report_page.go_subpage "Consultant Growth"
      report_page.consultant_status_cgrowth = "Not Contacted"
      report_page.filter
      report_page.list_status_cgrowth_element.when_present.text.should eql "Not Contacted"
    end
    #consultant growth页面按prospect状态查询记录
    it 'consultant_growth_page search by prospect status' do
      report_page.go_subpage "Consultant Growth"
      report_page.consultant_status_cgrowth = "Prospect"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "search"
    end
    #consultant growth页面按invalid状态查询记录
    it 'consultant_growth_page search by invalid status' do
      report_page.go_subpage "Consultant Growth"
      report_page.consultant_status_cgrowth = "Invalid"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "search" 
    end
    #consultant growth页面按blacklist状态查询记录
    it 'consultant_growth_page search by blacklist status' do
      report_page.go_subpage "Consultant Growth"
      report_page.consultant_status_cgrowth = "Blacklist"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "search"
    end

    #client summary页面close date点击clear按钮
    it 'client_summary_page select close date and then click clear' do
      report_page.go_subpage "Client Summary"
      report_page.input_closedate_clientsummary_element.when_present.click
      report_page.clear_closedate_clientsummary_element.when_present.click
      report_page.filter_element.when_present.text.should eql "search"
    end
    #client summary页面renewal date点击clear按钮
    it 'client_summary_page select renewal date and then click clear' do
      report_page.go_subpage "Client Summary"
      report_page.input_renewaldate_clientsummary_element.when_present.click
      report_page.clear_renewaldate_clientsummary_element.when_present.click
      report_page.filter_element.when_present.text.should eql "search"
    end
    #client summary页面按am查询记录
    it 'client_summary_page search by am' do
      report_page.go_subpage "Client Summary"
      report_page.select_am_summary = "test_am1"
      report_page.filter
      report_page.am_summary_element.when_present.text.include? "test_am1"
    end
    #client summary页面按prospect状态查询记录
    it 'client_summary_page search by prospect status' do
      report_page.go_subpage "Client Summary"
      report_page.client_status_summary_element.when_present.select "Prospect"
      report_page.filter
      report_page.client_status_summaryreport_element.when_present.text.should eql "Prospect"
    end
    #client summary页面按engage状态查询查询记录
    it 'client_summary_page search by engage status' do
      report_page.go_subpage "Client Summary"
      report_page.client_status_summary_element.when_present.select "Engage"
      report_page.filter
      report_page.client_status_summaryreport_element.when_present.text.should eql "Engage"
    end
    #client summary页面按discover状态查询记录
    it 'client_summary_page search by discover status' do
      report_page.go_subpage "Client Summary"
      report_page.client_status_summary_element.when_present.select "Discover"
      report_page.filter
      report_page.client_status_summaryreport_element.when_present.text.should eql "Discover"
    end
    #client summary页面按trial状态查询记录
    it 'client_summary_page search by trial status' do
      report_page.go_subpage "Client Summary"
      report_page.client_status_summary_element.when_present.select "Trial"
      report_page.filter
      report_page.client_status_summaryreport_element.when_present.text.should eql "Trial"
    end
    #client summary页面按confirm状态查询记录
    it 'client_summary_page search by confirm status' do
      report_page.go_subpage "Client Summary"
      report_page.client_status_summary_element.when_present.select "Confirm"
      report_page.filter
      report_page.client_status_summaryreport_element.when_present.text.should eql "Confirm"
    end
    #client summary页面按annual状态查询记录
    it 'client_summary_page search by annual status' do
      report_page.go_subpage "Client Summary"
      report_page.client_status_summary_element.when_present.select "Annual"
      report_page.filter
      report_page.client_status_summaryreport_element.when_present.text.should eql "Annual"
    end
    #client summary页面按project状态查询记录
    it 'client_summary_page search by project status' do
      report_page.go_subpage "Client Summary"
      report_page.client_status_summary_element.when_present.select "Project"
      report_page.filter
      report_page.client_status_summaryreport_element.when_present.text.should eql "Project"
    end
    #client summary页面按close状态查询记录
    it 'client_summary_page search by close status' do
      report_page.go_subpage "Client Summary"
      report_page.client_status_summary_element.when_present.select "Close"
      report_page.filter
      report_page.client_status_summaryreport_element.when_present.text.should eql "Close"
    end
    #client summary页面点击contacts链接-------------------------------------N/A(不存在此用例)
    # it 'client_summary_page click contacts link' do
    # end
    #client cash页面选择date点击clear按钮
    it 'client_cash_page select date and then click clear' do
      report_page.go_subpage "Client Cash"
      report_page.input_date_clientcash_element.when_present.click
      report_page.clear_date_clientcash_element.when_present.click
      report_page.filter_element.when_present.text.should eql "search"
    end
    #client cash页面按private equity类型查询记录
    it 'client_cash_page search by private equity' do
      report_page.go_subpage "Client Cash"
      report_page.client_cash_type = "Private Equity"
      report_page.filter
      report_page.client_type_cash_element.when_present.text.should eql "Private Equity"
    end
    #client cash页面按hedge fund类型查询记录
    it 'client_cash_page search by hedge fund' do
      report_page.go_subpage "Client Cash"
      report_page.client_cash_type = "Hedge Fund"
      report_page.filter
      report_page.client_type_cash_element.when_present.text.should eql "Hedge Fund"
    end
    #client cash页面按venture captial类型查询记录
    it 'client_cash_page search by venture captial' do
      report_page.go_subpage "Client Cash"
      report_page.client_cash_type = "Venture Capital"
      report_page.filter
      report_page.client_type_cash_element.when_present.text.should eql "Venture Capital"
    end
    #client cash页面按mutual fund类型查询记录
    it 'client_cash_page search by mutual fund' do
      report_page.go_subpage "Client Cash"
      report_page.client_cash_type = "Mutual Fund"
      report_page.filter
      report_page.client_type_cash_element.when_present.text.should eql "Mutual Fund"
    end
    #client cash页面按corporate类型查询记录
    it 'client_cash_page search by corporate' do
      report_page.go_subpage "Client Cash"
      report_page.client_cash_type = "Corporate"
      report_page.filter
      report_page.client_type_cash_element.when_present.text.should eql "Corporate"
    end
    #client cash页面按financial firm类型查询记录
    it 'client_cash_page search by financial firm' do
      report_page.go_subpage "Client Cash"
      report_page.client_cash_type = "Financial Firm"
      report_page.filter
      report_page.client_type_cash_element.when_present.text.should eql "Financial Firm"
    end
    #client cash页面按others类型查询记录
    it 'client_cash_page search by others' do
      report_page.go_subpage "Client Cash"
      report_page.client_cash_type = "Others"
      report_page.filter
      report_page.client_type_cash_element.when_present.text.should eql "Others"
    end
    #client cash页面按am查询记录
    it 'client_cash_page search by am' do
      report_page.go_subpage "Client Cash"
      report_page.am_cilentcash = "test_am1"
      report_page.filter
      report_page.am_clientcash_report_element.when_present.text.should include "test_am1"
    end
    #client cash页面按prospect状态查询记录
    it 'client_cash_page search by prospect status' do
      report_page.go_subpage "Client Cash"
      report_page.client_status_clientcash = "Prospect"
      report_page.filter
      report_page.client_status_clientcash_locate_element.when_present.text.should eql "Prospect"
    end
    #client cash页面按engage状态查询记录
    it 'client_cash_page search by engage status' do
      report_page.go_subpage "Client Cash"
      report_page.client_status_clientcash = "Engage"
      report_page.filter
      report_page.client_status_clientcash_locate_element.when_present.text.should eql "Engage"
    end
    #client cash页面按discover状态查询记录
    it 'client_cash_page search by discover status' do
      report_page.go_subpage "Client Cash"
      report_page.client_status_clientcash = "Discover"
      report_page.filter
      report_page.client_status_clientcash_locate_element.when_present.text.should eql "Discover"
    end
    #client cash页面按trial状态查询记录
    it 'client_cash_page search by trial status' do
      report_page.go_subpage "Client Cash"
      report_page.client_status_clientcash = "Trial"
      report_page.filter
      report_page.client_status_clientcash_locate_element.when_present.text.should eql "Trial"
    end
    #client cash页面按confirm状态查询记录
    it 'client_cash_page search by confirm status' do
      report_page.go_subpage "Client Cash"
      report_page.client_status_clientcash = "Confirm"
      report_page.filter
      report_page.client_status_clientcash_locate_element.when_present.text.should eql "Confirm"
    end
    #client cash页面按annual状态查询记录
    it 'client_cash_page search by annual status' do
      report_page.go_subpage "Client Cash"
      report_page.client_status_clientcash = "Annual"
      report_page.filter
      report_page.client_status_clientcash_locate_element.when_present.text.should eql "Annual"
    end
    #client cash页面按project状态查询记录
    it 'client_cash_page search by project status' do
      report_page.go_subpage "Client Cash"
      report_page.client_status_clientcash = "Project"
      report_page.filter
      report_page.client_status_clientcash_locate_element.when_present.text.should eql "Project"
    end
    #client cash页面按close状态查询记录
    it 'client_cash_page search by close status' do
      report_page.go_subpage "Client Cash"
      report_page.client_status_clientcash = "Close"
      report_page.filter
      report_page.client_status_clientcash_locate_element.when_present.text.should eql "Close"
    end
    #km project status页面选择start date点击clear按钮
    it 'km_project_status_page select start date and click clear button' do
      report_page.go_subpage "KM Project Status"
      report_page.input_startdate_kmpage_element.when_present.click
      report_page.clear_startdate_kmpage_element.when_present.click
      report_page.filter_element.when_present.text.should eql "search"
    end
    #km project status页面选择end date点击clear按钮
    it 'km_project_status_page select end date and click clear button' do
      report_page.go_subpage "KM Project Status"
      report_page.input_enddate_kmpage_element.when_present.click
      report_page.clear_enddate_kmpage_element.when_present.click
      report_page.filter_element.when_present.text.should eql "search"
    end
    #km project status页面按end date查询记录
    it 'km_project_status_page search by end date' do
      report_page.go_subpage "KM Project Status"
      report_page.input_enddate_kmpage_element.when_present.click
      report_page.apply_enddate_kmpage_element.when_present.click
      report_page.filter_element.when_present.click
      report_page.filter_element.when_present.text.should eql "search"
    end
    #km project status页面按on hold状态查询记录
    it 'km_project_status_page search by on hold status' do
      report_page.go_subpage "KM Project Status"
      report_page.project_status_kmpage = "On Hold"
      report_page.filter
      report_page.project_status_kmpagereport_element.when_present.text.should eql "On Hold"
    end
    #km project status页面按complete状态查询记录
    it 'km_project_status_page search by complete status' do
      report_page.go_subpage "KM Project Status"
      report_page.project_status_kmpage = "Complete"
      report_page.filter
      report_page.project_status_kmpagereport_element.when_present.text.should eql "Complete"
    end
    #km project status页面按invalid状态查询记录
    it 'km_project_status_page search by invalid status' do
      report_page.go_subpage "KM Project Status"
      report_page.project_status_kmpage = "Invalid"
      report_page.filter
      report_page.project_status_kmpagereport_element.when_present.text.should eql "Invalid"
    end
    #km project status页面按project name查询记录
    it 'km_project_status_page search by project name' do
      report_page.go_subpage "KM Project Status"
      report_page.input_project_name_km = "test"
      report_page.filter
      report_page.input_project_name_kmreport_element.when_present.text.include? "test"
    end
    #km project status页面页码点击contact的链接------------------------------------------N/A(project没有contact，无法定位)
    # it 'km_project_status_page click contact link' do
    # end
    #km project status页面页码点击project的链接
    it 'km_project_status_page click project link' do
      report_page.go_subpage "KM Project Status"
      report_page.filter
      report_page.first_project_kmpage_element.when_present.click
      report_page.attach_to_window(:title=>report_page.first_project_kmpage_element.when_present.text+" - Task List - Capvision")
      report_page.consultants_tasks_ds_element.when_present.text.should eql "Task List"
    end
    #call manager页面选择date点击clear按钮
    it 'call_manager_page select date and then click clear button' do
      report_page.go_subpage "Call Manager"
      report_page.input_date_callmanager_element.when_present.click
      report_page.clear_date_callmanager_element.when_present.click
      report_page.filter_element.when_present.text.should eql "search"
    end
    #call manager页面按keywords查询记录
    it 'call_manager_page search by keywords' do
      report_page.go_subpage "Call Manager"
      report_page.keywords_callmanager = "6"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "search"
    end
    #compliance check页面date点击clear按钮
    it 'compliance_check_page select date and then click clear' do
      report_page.go_subpage "Compliance Check"
      report_page.input_date_compliancecheck_element.when_present.click
      report_page.clear_date_compliancecheck_element.when_present.click
      report_page.filter_element.when_present.text.should eql "search"
    end
    #compliance check页面按recommended状态查询记录
    it 'compliance_check_page search by recommended status' do
      report_page.go_subpage "Compliance Check"
      report_page.task_status_compliancecheck = "Recommended"
      report_page.filter
      report_page.locate_status_complianccheck_element.when_present.text.should eql "Recommended"
    end
    #compliance check页面按arranged状态查询记录
    it 'compliance_check_page search by arranged status' do
      report_page.go_subpage "Compliance Check"
      report_page.task_status_compliancecheck = "Arranged"
      report_page.filter
      report_page.locate_status_complianccheck_element.when_present.text.should eql "Arranged"
    end
    #compliance check页面按completed状态查询记录
    it 'compliance_check_page search by completed status' do
      report_page.go_subpage "Compliance Check"
      report_page.task_status_compliancecheck = "Completed"
      report_page.filter
      report_page.locate_status_complianccheck_element.when_present.text.should eql "Completed"
    end
    #compliance check页面点击client链接
    it 'compliance_check_page click client link' do
      report_page.go_subpage "Compliance Check"
      report_page.task_status_compliancecheck_element.when_present.select "Arranged"
      report_page.filter_element.when_present.click
      report_page.first_client_compliancecheck_element.when_present.click
      report_page.attach_to_window(:title=>"Profile - "+report_page.first_client_compliancecheck_element.when_present.text+" - Capvision")
      report_page.client_profile_element.when_present.text.should eql "Profile"
    end
    #compliance check页面点击project链接
    it 'compliance_check_page click project link' do
      report_page.go_subpage "Compliance Check"
      report_page.filter_element.when_present.click
      report_page.first_project_compliancecheck_element.when_present.click
      report_page.attach_to_window(:title=>report_page.first_project_compliancecheck_element.when_present.text+" - Task List - Capvision")
      report_page.project_names_element.when_present.text.should include "Project Info"
    end
    #compliance check页面点击consultant链接
    it 'compliance_check_page click consultant link' do
      report_page.go_subpage "Compliance Check"
      report_page.filter
      report_page.first_consultant_compliancecheck_element.when_present.click
      report_page.attach_to_window(:title=>report_page.first_consultant_compliancecheck_element.when_present.text+" - Capvision")
      report_page.consultant_profile_element.when_present.text.should eql "Profile"
    end
    #compliance approval页面选择requested time点击clear按钮
    it 'compliance_approval_page select requested time and then click clear' do
      report_page.go_compliance_approval
      report_page.input_requestedtime_complianceapproval_element.when_present.click
      report_page.clear_date_complianceapproval_element.when_present.click
      report_page.filter_element.when_present.text.should eql "search"
    end
    #compliance approval页面按internal_status查询记录
    it 'compliance_approval_page search by internal status approved' do
      report_page.go_compliance_approval
      report_page.internal_status = "Approved"
      report_page.filter
      report_page.internal_status_locate_element.when_present.text.should eql "Approved"
    end
    #compliance approval页面按external_status查询记录
    it 'compliance_approval_page search by external status approved' do
      report_page.go_compliance_approval
      report_page.internal_status = "Approved"
      report_page.external_status = "Approved"
      report_page.filter
      report_page.external_status_locate_element.when_present.text.should eql "Approved"
    end
    #compliance approval页面按keywords查询记录
    it 'compliance_approval_page search by keywords' do
      report_page.go_compliance_approval
      report_page.input_keywords_complianceapproval = "test"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "search"
    end
    #compliance approval页面的project的链接
    it 'compliance_approval_page click project link ' do
      report_page.go_compliance_approval
      report_page.filter
      report_page.first_project_complianceapproval_element.when_present.click
      report_page.attach_to_window(:title=>report_page.first_project_complianceapproval_element.when_present.text+" - Task List - Capvision")
      report_page.task_list_element.when_present.text.should eql "Task List"
    end
    #consultation industry页面选择date点击clear按钮
    it 'consultation_industry_page select date and then click clear button ' do
      report_page.go_subpage "Consultation Industry"
      report_page.input_date_consultation_industry_element.when_present.click
      report_page.clear_date_conindustry_element.when_present.click
      report_page.filter_element.when_present.text.should eql "search"
    end
    #consultation industry页面按private equity状态查询记录
    it 'consultation_industry_page search by private equity' do
      report_page.go_subpage "Consultation Industry"
      report_page.client_type_industryreport = "Private Equity"
      report_page.filter
      report_page.client_type_locate_industry_element.when_present.text.should eql "Private Equity"
    end
    #consultation industry页面按hedge fund状态查询记录
    it 'consultation_industry_page search by hedge fund' do
      report_page.go_subpage "Consultation Industry"
      report_page.client_type_industryreport = "Hedge Fund"
      report_page.filter
      report_page.client_type_locate_industry_element.when_present.text.should eql "Hedge Fund"
    end
    #consultation industry页面按venture capital状态查询记录
    it 'consultation_industry_page search by venture capital' do
      report_page.go_subpage "Consultation Industry"
      report_page.client_type_industryreport = "Venture Capital"
      report_page.filter
      report_page.client_type_locate_industry_element.when_present.text.should eql "Venture Capital"
    end
    #consultation industry页面按mutual fund状态查询记录
    it 'consultation_industry_page search by mutual fund' do
      report_page.go_subpage "Consultation Industry"
      report_page.client_type_industryreport = "Mutual Fund"
      report_page.filter
      report_page.client_type_locate_industry_element.when_present.text.should eql "Mutual Fund"
    end
    #consultation industry页面按corporate状态查询记录
    it 'consultation_industry_page search by corporate' do
      report_page.go_subpage "Consultation Industry"
      report_page.client_type_industryreport = "Corporate"
      report_page.filter
      report_page.client_type_locate_industry_element.when_present.text.should eql "Corporate"
    end
    #consultation industry页面按financial firm状态查询记录
    it 'consultation_industry_page search by financial firm' do
      report_page.go_subpage "Consultation Industry"
      report_page.client_type_industryreport = "Financial Firm"
      report_page.filter
      report_page.client_type_locate_industry_element.when_present.text.should eql "Financial Firm"
    end
    #consultation industry页面的project链接
    it 'consultation_industry_page click project link' do
      report_page.go_subpage "Consultation Industry"
      report_page.filter
      report_page.first_project_industryreport_element.when_present.click
      report_page.attach_to_window(:title=>report_page.first_project_industryreport_element.when_present.text+" - Task List - Capvision")
      report_page.task_list_element.when_present.text.should eql "Task List"
    end
    #client project页面consultation子页面以project name为关键词查询记录
    it 'client_project_page consultation_page search by project name' do
      report_page.go_subpage "Client Project"
      report_page.input_project_name_clientproject = "test"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "Search"
    end
    #client project页面consultation子页面以info为关键词查询记录
    it 'client_project_page consultation_page search by info' do
      report_page.go_subpage "Client Project"
      report_page.input_project_name_clientproject = "test"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "Search"
    end
    #client project页面consultation子页面以description为关键词查询记录
    it 'client_project_page consultation_page search by description' do
      report_page.go_subpage "Client Project"
      report_page.input_project_name_clientproject = "test"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "Search"
    end
    #client project页面consultation子页面点击project链接
    it 'client_project_page consultation_page click project link' do
      report_page.go_subpage "Client Project"
      report_page.filter
      report_page.first_project_consultation_element.when_present.click
      report_page.attach_to_window(:title=>report_page.first_project_consultation_element.when_present.text+" - Task List - Capvision")
      report_page.task_list_element.when_present.text.should eql "Task List"
    end
    #client project页面capvision data services子页面以info为关键词查询记录
    it 'client_project_page DS_page search by info' do
      report_page.go_subpage "Client Project"
      report_page.data_service_link_element.when_present.click
      report_page.input_project_name_clientproject = "test"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "Search"
    end
    #client project页面capvision data services子页面点击project链接
    it 'client_project_page DS_page click project link' do
      report_page.go_subpage "Client Project"
      report_page.data_service_link_element.when_present.click
      report_page.filter
      report_page.first_project_dataservice_element.when_present.click
      report_page.attach_to_window(:title=>report_page.first_project_dataservice_element.when_present.text+" - Task List - Capvision")
      report_page.consultants_tasks_ds_element.when_present.text.should eql "Consultants Tasks"
    end
    #client project页面capvision data services子页面以description为关键词查询记录
    it 'client_project_page DS_page search by description' do
      report_page.go_subpage "Client Project"
      report_page.data_service_link_element.when_present.click
      report_page.input_project_name_clientproject = "test"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "Search"
    end
    
    #client project页面ges convey子页面点击project链接
    it 'client_project_page ges_page click project link' do
      report_page.go_subpage "Client Project"
      report_page.ges_convey_link_element.when_present.click
      report_page.filter
      report_page.first_project_gesconvey_element.when_present.click
      report_page.attach_to_window(:title=>report_page.first_project_gesconvey_element.when_present.text+" - Task List - Capvision")
      report_page.consultants_tasks_ges_element.when_present.text.should eql "Consultants Tasks"
    end
    #client project页面ges convey子页面按all am查询记录
    it 'client_project_page ges_page search by am' do
      report_page.go_subpage "Client Project"
      report_page.ges_convey_link_element.when_present.click
      report_page.filter
      report_page.filter_element.when_present.text.should eql "Search"
    end
    #client project页面ges convey子页面按location查询记录
    it 'client_project_page ges_page search by location' do
      report_page.go_subpage "Client Project"
      report_page.ges_convey_link_element.when_present.click
      report_page.input_location_ges_element.when_present.click
      report_page.select_location_ges_element.when_present.click 
      report_page.filter
      report_page.filter_element.when_present.text.should eql "Search"
    end
    #client project页面ges convey子页面以project name为关键词查询记录
    it 'client_project_page ges_page search by project name' do
      report_page.go_subpage "Client Project"
      report_page.ges_convey_link_element.when_present.click
      report_page.input_project_keywords_gesconvey = "test"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "Search"
    end
    #client project页面ges convey子页面以info为关键词查询记录
    it 'client_project_page ges_page search by info' do
      report_page.go_subpage "Client Project"
      report_page.ges_convey_link_element.when_present.click
      report_page.input_project_keywords_gesconvey = "test"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "Search"
    end
    #client project页面ges convey子页面以description为关键词查询记录
    it 'client_project_page ges_page search by description' do
      report_page.go_subpage "Client Project"
      report_page.ges_convey_link_element.when_present.click
      report_page.input_project_keywords_gesconvey = "test"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "Search"
    end
    #client project页面conference子页面点击project链接
    it 'client_project_page conference_page click project link' do
      report_page.go_subpage "Client Project"
      report_page.conference_link_element.when_present.click
      report_page.filter
      report_page.first_project_conference_element.when_present.click
       report_page.attach_to_window(:title=>report_page.first_project_conference_element.when_present.text+" - Task List - Capvision")
      report_page.consultants_tasks_conference_element.when_present.text.should eql "Consultants Tasks"
    end
    #client project页面conference子页面按am查询记录
    it 'client_project_page conference_page search by am' do
      report_page.go_subpage "Client Project"
      report_page.conference_link_element.when_present.click
      report_page.filter
      report_page.filter_element.when_present.text.should eql "Search"
    end
    #client project页面conference子页面按client查询记录
    it 'client_project_page conference_page search by client' do
      report_page.go_subpage "Client Project"
      report_page.conference_link_element.when_present.click
      report_page.input_client_conference_element.when_present.click
      report_page.select_client_conference_element.when_present.click
      report_page.filter
      report_page.filter_element.when_present.text.should eql "Search"
    end
    #client project页面conference子页面按industry查询记录
    it 'client_project_page conference_page search by industry' do
      report_page.go_subpage "Client Project"
      report_page.conference_link_element.when_present.click
      report_page.industry_conference = "Aerospace - 航空"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "Search"
    end
    #client project页面conference子页面按location查询记录
    it 'client_project_page conference_page search by location' do
      report_page.go_subpage "Client Project"
      report_page.conference_link_element.when_present.click
      report_page.input_location_conference_element.when_present.click
      report_page.select_location_conference_element.when_present.click
      report_page.filter
      report_page.filter_element.when_present.text.should eql "Search"
    end
    #client project页面conference子页面以project name为关键词查询记录
    it 'client_project_page conference_page search by Project name' do
      report_page.go_subpage "Client Project"
      report_page.ges_convey_link_element.when_present.click
      report_page.input_project_keywords_conference = "test"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "Search"
    end
    #client project页面conference子页面以info为关键词查询记录
    it 'client_project_page conference_page search by info' do
      report_page.go_subpage "Client Project"
      report_page.ges_convey_link_element.when_present.click
      report_page.input_project_keywords_conference = "test"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "Search"
    end
    #client project页面conference子页面以description为关键词查询记录
    it 'client_project_page conference_page search by description' do
      report_page.go_subpage "Client Project"
      report_page.ges_convey_link_element.when_present.click
      report_page.input_project_keywords_conference = "test"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "Search"
    end
    #client project页面hr service子页面点击project链接
    it 'client_project_page hrs_page click project link' do
      report_page.go_subpage "Client Project"
      report_page.hrs_link_element.when_present.click
      report_page.filter
      report_page.first_project_hrs_element.when_present.click
      report_page.attach_to_window(:title=>report_page.first_project_hrs_element.when_present.text+" - Task List - Capvision")
      report_page.task_list_hrs_element.when_present.text.should eql "Task List"
    end
    #client project页面hr service子页面按am查询记录
    it 'client_project_page hrs_page search by am' do
      report_page.go_subpage "Client Project"
      report_page.hrs_link_element.when_present.click
      report_page.filter
      report_page.filter_element.when_present.text.should eql "Search"
    end
    #client project页面hr service子页面按client查询记录
    it 'client_project_page hrs_page search by client' do
      report_page.go_subpage "Client Project"
      report_page.hrs_link_element.when_present.click
      report_page.input_client_hrs_element.when_present.click
      report_page.select_client_hrs_element.when_present.click
      report_page.filter
      report_page.filter_element.when_present.text.should eql "Search"
    end
    #client project页面hr service子页面按industry查询记录
    it 'client_project_page hrs_page search by industry' do
      report_page.go_subpage "Client Project"
      report_page.hrs_link_element.when_present.click
      report_page.industry_hrs = "Aerospace - 航空"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "Search"
    end
    #client project页面hr service子页面按location查询记录
    it 'client_project_page hrs_page search by location' do
      report_page.go_subpage "Client Project"
      report_page.hrs_link_element.when_present.click
      report_page.input_location_hrs_element.when_present.click
      report_page.select_location_hrs_element.when_present.click
      report_page.filter
      report_page.filter_element.when_present.text.should eql "Search"
    end
    #client project页面hr service子页面以project name为关键词查询记录
    it 'client_project_page hrs_page search by project name' do
      report_page.go_subpage "Client Project"
      report_page.hrs_link_element.when_present.click
      report_page.input_project_keywords_hrs = "test"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "Search"
    end
    #client project页面hr service子页面以info为关键词查询记录
    it 'client_project_page hrs_page search by info' do
      report_page.go_subpage "Client Project"
      report_page.hrs_link_element.when_present.click
      report_page.input_project_keywords_hrs = "test"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "Search"
    end
    #client project页面hr service子页面以description为关键词查询记录
    it 'client_project_page hrs_page search by description' do
      report_page.go_subpage "Client Project"
      report_page.hrs_link_element.when_present.click
      report_page.input_project_keywords_hrs = "test"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "Search"
    end
    #client project页面international consultation子页面按am查询记录
    it 'client_project_page interconsultation_page search by am' do
      report_page.go_subpage "Client Project"
      report_page.interconsultation_link_element.when_present.click
      report_page.filter
      report_page.filter_element.when_present.text.should eql "Search"
    end
    #client project页面international consultation子页面按client查询记录
    it 'client_project_page interconsultation_page search by client' do
      report_page.go_subpage "Client Project"
      report_page.interconsultation_link_element.when_present.click
      report_page.input_client_interconsultation_element.when_present.click
      report_page.select_client_interconsultation_element.when_present.click
      report_page.filter
      report_page.filter_element.when_present.text.should eql "Search"
    end
    #client project页面international consultation子页面按industry查询记录
    it 'client_project_page interconsultation_page search by industry' do
      report_page.go_subpage "Client Project"
      report_page.interconsultation_link_element.when_present.click
      report_page.industry_interconsultation = "Aerospace - 航空"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "Search"
    end
    #client project页面international consultation子页面按location查询记录
    it 'client_project_page interconsultation_page search by location' do
      report_page.go_subpage "Client Project"
      report_page.interconsultation_link_element.when_present.click
      report_page.input_location_interconsultation_element.when_present.click
      report_page.select_location_interconsultation_element.when_present.click
      report_page.filter
      report_page.filter_element.when_present.text.should eql "Search"
    end
    #client project页面international consultation子页面以project name为关键词查询记录
    it 'client_project_page interconsultation_page search by project name' do
      report_page.go_subpage "Client Project"
      report_page.interconsultation_link_element.when_present.click
      report_page.input_project_keywords_interconsultation = "test"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "Search"
    end
    #client project页面international consultation子页面以info为关键词查询记录
    it 'client_project_page interconsultation_page search by info' do
      report_page.go_subpage "Client Project"
      report_page.interconsultation_link_element.when_present.click
      report_page.input_project_keywords_interconsultation = "test"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "Search"
    end
    #client project页面international consultation子页面以description为关键词查询记录
    it 'client_project_page interconsultation_page search by description' do
      report_page.go_subpage "Client Project"
      report_page.interconsultation_link_element.when_present.click
      report_page.input_project_keywords_interconsultation = "test"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "Search"
    end
    #consultation status&feedback页面选择date点击clear按钮
    it 'consultation_status_and_feedback_page select date and then click clear button' do
      report_page.go_subpage "Consultation Status&Feedback"
      report_page.input_date_csf_element.when_present.click
      report_page.clear_date_csf_element.when_present.click
      report_page.filter
      report_page.filter_element.when_present.text.should eql "search"
    end
    #consultation status&feedback页面按client查询记录
    it 'consultation_status_and_feedback_page search by Client' do
      report_page.go_subpage "Consultation Status&Feedback"
      report_page.input_client_csf_element.when_present.click
      report_page.select_client_csf_element.when_present.click
      report_page.filter
      report_page.filter_element.when_present.text.should eql "search"
    end
    #consultation status&feedback页面按not contacted状态查询记录
    it 'consultation_status_and_feedback_page search by not contacted' do
      report_page.go_subpage "Consultation Status&Feedback"
      report_page.task_status_csf = "Not Contacted"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "search"
    end
    #consultation status&feedback页面按recommended状态查询记录
    it 'consultation_status_and_feedback_page search by recommended' do
      report_page.go_subpage "Consultation Status&Feedback"
      report_page.task_status_csf = "Recommended"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "search"
    end
    #consultation status&feedback页面按selected状态查询记录
    it 'consultation_status_and_feedback_page search by selected' do
      report_page.go_subpage "Consultation Status&Feedback"
      report_page.task_status_csf = "Selected"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "search"
    end
    #consultation status&feedback页面按pending状态查询记录
    it 'consultation_status_and_feedback_page search by pending' do
      report_page.go_subpage "Consultation Status&Feedback"
      report_page.task_status_csf = "Pending"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "search"
    end
    #consultation status&feedback页面按arranged状态查询记录
    it 'consultation_status_and_feedback_page search by arranged' do
      report_page.go_subpage "Consultation Status&Feedback"
      report_page.task_status_csf = "Arranged"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "search"
    end
    #consultation status&feedback页面按completed状态查询记录
    it 'consultation_status_and_feedback_page search by completed' do
      report_page.go_subpage "Consultation Status&Feedback"
      report_page.task_status_csf = "Completed"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "search"
    end
    #consultation status&feedback页面按10mins test状态查询记录
    it 'consultation_status_and_feedback_page search by 10mins test' do
      report_page.go_subpage "Consultation Status&Feedback"
      report_page.task_status_csf = "10mins test"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "search"
    end
    #consultation status&feedback页面按client canceled状态查询记录
    it 'consultation_status_and_feedback_page search by client canceled' do
      report_page.go_subpage "Consultation Status&Feedback"
      report_page.task_status_csf = "Client canceled"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "search"
    end
    #consultation status&feedback页面按consultant canceled状态查询记录
    it 'consultation_status_and_feedback_page search by consultant canceled' do
      report_page.go_subpage "Consultation Status&Feedback"
      report_page.task_status_csf = "Consultant canceled"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "search"
    end
    #consultation status&feedback页面按not interviewed状态查询记录
    it 'consultation_status_and_feedback_page search by not interviewed' do
      report_page.go_subpage "Consultation Status&Feedback"
      report_page.task_status_csf = "Not interviewed"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "search"
    end
    #consultation status&feedback页面按unsuccessful interview状态查询记录
    it 'consultation_status_and_feedback_page search by unsuccessful interview' do
      report_page.go_subpage "Consultation Status&Feedback"
      report_page.task_status_csf = "Unsuccessful interview"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "search"
    end
    #consultation status&feedback页面按consultant not familiar状态查询记录
    it 'consultation_status_and_feedback_page search by consultant not familiar' do
      report_page.go_subpage "Consultation Status&Feedback"
      report_page.task_status_csf = "Consultant not familiar"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "search"
    end
    #consultation status&feedback页面按consultant refused 状态查询记录
    it 'consultation_status_and_feedback_page search by consultant refused' do
      report_page.go_subpage "Consultation Status&Feedback"
      report_page.task_status_csf = "Consultant refused"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "search"
    end
    #consultation status&feedback页面按rescheduled状态查询记录
    it 'consultation_status_and_feedback_page search by rescheduled' do
      report_page.go_subpage "Consultation Status&Feedback"
      report_page.task_status_csf = "Rescheduled"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "search"
    end
    #consultation status&feedback页面按project name查询记录
    it 'consultation_status_and_feedback_page search by project name' do
      report_page.go_subpage "Consultation Status&Feedback"
      report_page.project_name_csf = "AT_我叫weijun"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "search"
    end
    #consultation status&feedback页面点击project链接
    it 'consultation_status_and_feedback_page click project link' do
      report_page.go_subpage "Consultation Status&Feedback"
      report_page.filter
      report_page.first_project_csf_element.when_present.click
      report_page.attach_to_window(:title=>report_page.first_project_csf_element.when_present.text+" - Task List - Capvision")
      report_page.task_list_element.when_present.text.should eql "Task List"
    end
    #request summary report页面选择date点击clear按钮
    it 'request_summary_report_page select date and click clear button' do
      report_page.go_subpage "Request Summary Report"
      report_page.input_date_requestsummary_element.when_present.click
      report_page.clear_date_requestsummary_element.when_present.click
      report_page.filter
      report_page.filter_element.when_present.text.should eql "search"
    end
    #request summary report页面按successful状态查询记录
    it 'request_summary_report_page search by Successful' do
      report_page.go_subpage "Request Summary Report"
      report_page.request_summary_status = "Successful"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "search"
    end
    #request summary report页面按on hold状态查询记录
    it 'request_summary_report_page search by on hold' do
      report_page.go_subpage "Request Summary Report"
      report_page.request_summary_status = "On Hold"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "search"
    end
    #request summary report页面按cancel状态查询记录
    it 'request_summary_report_page search by cancel' do
      report_page.go_subpage "Request Summary Report"
      report_page.request_summary_status = "Cancel"
      report_page.filter
      report_page.filter_element.when_present.text.should eql "search"
    end
    #request summary report页面点击consultant链接
    it 'request_summary_report_page click consultant link' do
      report_page.go_subpage "Request Summary Report"
      report_page.filter
      report_page.first_consultant_rs_element.when_present.click
      report_page.attach_to_window(:title=>report_page.first_consultant_rs_element.when_present.text+" - Capvision")
      report_page.consultant_profile_element.when_present.text.should eql "Profile"
    end

end
