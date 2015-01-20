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
        report_page.title.should eql "Please Choose One Report - Capvision"
      end
    end

    it 'search by date on daily page ' do
      report_page.go_subpage "Daily"
      report_page.input_date "Daily"
      report_page.filter
      # report_page.text.should include "Date"
    end

    it 'search by the status of recommended on daily page '  do 
      report_page.go_subpage "Daily"
      report_page.daily_status="Recommended"
      report_page.filter
      # report_page.wait_until do
      #   report_page.title.should eql "Daily Report - Capvision"
      # end
    end

    it 'search by the status of arranged on daily page '  do 
      report_page.go_subpage "Daily"
      report_page.daily_status="Arranged"
      report_page.filter
      # report_page.wait_until do
      #   report_page.title.should eql "Daily Report - Capvision"
      # end
    end
    
    it 'search by the status of completed on daily page '  do 
      report_page.go_subpage "Daily"
      report_page.daily_status="Completed"
      report_page.filter
      # report_page.wait_until do
      #   report_page.title.should eql "Daily Report - Capvision"
      # end  
    end
    
    it 'search by the default status  on daily page '  do 
      report_page.go_subpage "Daily"
      report_page.filter
      # report_page.wait_until do
      #   report_page.title.should eql "Daily Report - Capvision"
      # end
    end
    
    it 'search by the industry of agriculture on full consultant page '  do 
      report_page.go_subpage "Full Consultant"
      report_page.fullconsultant_industry="Agriculture - 农业"
      report_page.filter
      # report_page.wait_until do
      #   report_page.title.should eql "Full Consultant Report - Capvision"
      # end
    end
=begin    
    it 'search by the industry of aerospace on full consultant page '  do 
      report_page.go_subpage "Full Consultant"
      report_page.fullconsultant_industry="Aerospace - 航空" 
      report_page.filter
      report_page.title.should eql "Full Consultant Report - Capvision"
    end
    
    it 'search by the industry of chemicals on full consultant page '  do 
      report_page.go_subpage "Full Consultant"
      report_page.fullconsultant_industry="Chemicals - 化学产品"
      report_page.filter
      report_page.title.should eql "Full Consultant Report - Capvision"
    end
    
    it 'search by the industry of energy on full consultant page '  do 
      report_page.go_subpage "Full Consultant"
      report_page.fullconsultant_industry="Energy - 能源"
      report_page.filter
      report_page.title.should eql "Full Consultant Report - Capvision"
    end
    
    it 'search by the industry of environment on full consultant page '  do 
      report_page.go_subpage "Full Consultant"
      report_page.fullconsultant_industry="Environment - 环保"
      report_page.filter
      report_page.title.should eql "Full Consultant Report - Capvision"
    end
=end    
    it 'search by the default status on full consultant page '  do 
      report_page.go_subpage "Full Consultant"
      report_page.filter
      # report_page.wait_until do
      #   report_page.title.should eql "Full Consultant Report - Capvision"
      # end
    end

    it 'search by date on consultant growth page ' do 
      report_page.go_subpage "Consultant Growth"
      report_page.input_date "ConsultantGrowth"
      report_page.filter
      # report_page.wait_until do
      #   report_page.title.should eql "Consultant Growth Report - Capvision"
      # end
    end

    it 'search by the default status on consultant growth page '  do 
      report_page.go_subpage "Consultant Growth"
      report_page.filter
      # report_page.wait_until do
      #   report_page.title.should eql "Consultant Growth Report - Capvision"
      # end
    end
    
    it 'search by close date on client summary page '  do 
      report_page.go_subpage "Client Summary"
      report_page.input_close_date
      report_page.filter
      # report_page.wait_until do
      #   report_page.title.should eql "Client Summary Report - Capvision"
      # end
    end

    it 'search by renewal date on client summary page '  do 
      report_page.go_subpage "Client Summary"
      report_page.input_renewal_date
      report_page.filter
      # report_page.wait_until do
      #   report_page.title.should eql "Client Summary Report - Capvision"
      # end
    end

    it 'search by the type of consulting firm on client summary page '  do 
      report_page.go_subpage "Client Summary"
      report_page.clientsummary_type = "Consulting Firm"
      report_page.filter
      # report_page.wait_until do
      #   report_page.title.should eql "Client Summary Report - Capvision"
      # end
    end   

    it 'search by the type of private equity on client summary page '  do 
      report_page.go_subpage "Client Summary"
      report_page.clientsummary_type = "Private Equity"
      report_page.filter
      # report_page.title.should eql "Client Summary Report - Capvision"
    end

    it 'search by the type of hedge fund on client summary page '  do 
      report_page.go_subpage "Client Summary"
      report_page.clientsummary_type = "Hedge Fund"
      report_page.filter
      # report_page.title.should eql "Client Summary Report - Capvision"
    end
    
    it 'search by the type of venture capital on client summary page '  do 
      report_page.go_subpage "Client Summary"
      report_page.clientsummary_type = "Venture Capital"
      report_page.filter
      # report_page.title.should eql "Client Summary Report - Capvision"
    end
    
    it 'search by the type of mutual fund on client summary page '  do 
      report_page.go_subpage "Client Summary"
      report_page.clientsummary_type = "Mutual Fund"
      report_page.filter
      # report_page.title.should eql "Client Summary Report - Capvision"
    end
    
    it 'search by the type of corporate on client summary page '  do 
      report_page.go_subpage "Client Summary"
      report_page.clientsummary_type = "Corporate"
      report_page.filter
      # report_page.title.should eql "Client Summary Report - Capvision"
    end
    
    it 'search by the type of financial firm client summary page '  do 
      report_page.go_subpage "Client Summary"
      report_page.clientsummary_type = "Financial Firm"
      report_page.filter 
      # report_page.title.should eql "Client Summary Report - Capvision"
    end
    
    it 'search by the type of others on client summary page'  do 
      report_page.go_subpage "Client Summary"
      report_page.clientsummary_type = "Others"
      report_page.filter
      # report_page.title.should eql "Client Summary Report - Capvision"
    end
    
    it 'search by the default type on client summary page'  do 
      report_page.go_subpage "Client Summary"
      report_page.filter
      # report_page.wait_until do
      #   report_page.title.should eql "Client Summary Report - Capvision"
      # end
    end
    
    it 'search by date on client cash page'  do 
      report_page.go_subpage "Client Cash"
      report_page.input_date "ClientCash"
      report_page.filter
      # report_page.wait_until do
      #   report_page.title.should eql "Client Cash Report - Capvision"
      # end
    end
    
    it 'search by the type of consulting firm on client cash page'  do 
      report_page.go_subpage "Client Cash"
      report_page.clientcash_type = "Consulting Firm"
      report_page.filter
      # report_page.wait_until do
      #   report_page.title.should eql "Client Cash Report - Capvision"
      # end
    end
    
    it 'search by the default type on client cash page'  do 
      report_page.go_subpage "Client Cash"
      report_page.filter
      # report_page.wait_until do
      #   report_page.title.should eql "Client Cash Report - Capvision"
      # end
    end

    it 'search by date on KM project status page'  do 
      report_page.go_subpage "KM Project Status"
      report_page.input_start_date
      report_page.filter
    #   report_page.wait_until do
    #     report_page.title.should eql "KM Project Status Report - Capvision"
    #   end
    end
    
    it 'search by the status of in process on KM project status page'  do 
      report_page.go_subpage "KM Project Status"
      report_page.kmproject_status = "In Process"
      report_page.filter
      # report_page.wait_until do
      #   report_page.title.should eql "KM Project Status Report - Capvision"
      # end
    end
    
    it 'search by the default status on KM project status page'  do 
      report_page.go_subpage "KM Project Status"
      report_page.filter
      # report_page.wait_until do
      #   report_page.title.should eql "KM Project Status Report - Capvision"
      # end
    end
    
    it 'search by date on call manager page'  do 
      report_page.go_subpage "Call Manager"
      report_page.input_date "CallManager"
      report_page.filter
      # report_page.wait_until do
      #   report_page.title.should eql "Call Manager Report - Capvision"
      # end
    end
    
    it 'search by default on call manager page'  do 
      report_page.go_subpage "Call Manager"
      report_page.filter
      # report_page.wait_until do
      #   report_page.title.should eql "Call Manager Report - Capvision"
      # end
    end
    
    it 'search by date on compliance check page'  do 
      report_page.go_subpage "Compliance Check"
      report_page.input_compliance_date
      report_page.filter
      # report_page.wait_until do
      #   report_page.title.should eql "Compliance Check Report - Capvision"
      # end
    end
    
    it 'search by default on compliance check page'  do 
      report_page.go_subpage "Compliance Check"
      report_page.filter
      # report_page.wait_until do
      #   report_page.title.should eql "Compliance Check Report - Capvision"
      # end
    end
    
    it 'search by requested time on compliance approval page'  do 
      report_page.go_compliance_approval
      report_page.input_compliance_requested_date
      report_page.filter
      # report_page.wait_until do
      #   report_page.title.should eql "Compliance Approval Report - Capvision"
      # end
    end
    
    it 'search by default on compliance approval page' do 
      report_page.go_compliance_approval
      report_page.filter
      # report_page.wait_until do
      #   report_page.title.should eql "Compliance Approval Report - Capvision"
      # end
    end
    
    it 'compliance approval page approve function' do
      report_page.go_compliance_approval
      report_page.check_first_checkbox
      report_page.approve_btn_element.when_present.click
      sleep 2
      # report_page.text.should include "Send To Km Successfully"
    end
    
    it 'compliance approval page direct approve function' do
      report_page.go_compliance_approval
      report_page.check_first_checkbox
      report_page.direct_approve_btn_element.when_present.click
      sleep 2
      # report_page.text.should include "Send To Km Successfully"
    end
    
    it 'compliance approval page external approve function' do
      report_page.go_compliance_approval
      report_page.check_first_checkbox
      report_page.external_approve_btn_element.when_present.click
      sleep 2
      # report_page.text.should include "Send To Km Successfully"
    end
    
    it 'compliance approval page reject function' do
      report_page.go_compliance_approval
      report_page.check_first_checkbox
      report_page.reject_btn_element.when_present.click
      report_page.fill_reject_note = "at_test_reject_asdsas"
      report_page.reject_save_btn
      sleep 2
      # report_page.text.should include "Send To Km Successfully"
    end
    
    it 'search by date on consultant industry page' do 
      report_page.go_subpage "Consultation Industry"
      report_page.input_date "ConsultationIndustry"
      report_page.filter
      # report_page.wait_until do
      #   report_page.title.should eql "Consultation Industry Report - Capvision"
      # end
    end
    
    it 'search by default on consultant industry page'  do 
      report_page.go_subpage "Consultation Industry"
      report_page.filter
      # report_page.wait_until do
      #   report_page.title.should eql "Consultation Industry Report - Capvision"
      # end
    end
    
    it 'search by default on client project page'  do 
      report_page.go_subpage "Client Project"
      report_page.filter
      report_page.wait_until do
        report_page.title.should eql "Client Project Report - Capvision"
      end  
      report_page.go_subpage "Capvision Data Services"
      report_page.filter
      report_page.wait_until do
        report_page.title.should eql "Client Project Report - Capvision"
      end
      report_page.go_subpage "GES ConVey TM"
      report_page.filter
      report_page.wait_until do
        report_page.title.should eql "Client Project Report - Capvision"
      end  
      report_page.go_subpage "Conference"
      report_page.filter
      report_page.wait_until do
        report_page.title.should eql "Client Project Report - Capvision"
      end
      report_page.go_subpage "HR Service"
      report_page.filter
      report_page.wait_until do
        report_page.title.should eql "Client Project Report - Capvision"
      end
      report_page.go_subpage "International Consultation"
      report_page.filter
      report_page.wait_until do
        report_page.title.should eql "Client Project Report - Capvision"
      end
    end
    
    it 'search by date on consultation status&feedback page' do 
      report_page.go_subpage "Consultation Status&Feedback"
      report_page.input_consultation_status_date
      report_page.filter
      # report_page.wait_until do
      #   sleep 2
      #   report_page.title.should eql "Consultation status&feedback Report - Capvision"
      # end
    end
    
    it 'search by default on consultation status&feedback page' do 
      report_page.go_subpage "Consultation Status&Feedback"
      report_page.filter
      # report_page.wait_until do
      #   sleep 3
      #   report_page.title.should eql "Consultation status&feedback Report - Capvision"
      # end
    end
    
end

