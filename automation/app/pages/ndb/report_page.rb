#encoding: utf-8
require File.expand_path 'app/cases/shared/main.rb'
class ReportPage < NdbPage
  
  page_url "#{$config.host}report/index/index"
  
  select_list :daily_status, :id => "DailyForm_status"
  select_list :fullconsultant_industry, :id => "FullConsultantForm_industry"
  select_list :clientsummary_type, :id => "ClientSummaryForm_type"
  select_list :clientcash_type, :id => "ClientCashForm_type"
  select_list :kmproject_status, :id => "KmProjectStatusForm_status"
  button :filter, :name=> "yt0"
  link :go_compliance_approval, :xpath=> "//div[2]/ul/li[11]/a"
  #check first checkbox
  checkbox :first_checkbox, :id=> "compliance-approval_c0_0"
  #click approve btn
  button :approve_btn, :id=> "internal-approve-btn"
  #click direct approve btn
  button :direct_approve_btn, :id=> "direct-approve-btn" 
  #click external approve btn 
  button :external_approve_btn, :id=> "external-approve-btn"
  #click reject btn 
  button :reject_btn, :id=> "reject-btn" 
  #fill reject note
  text_field :fill_reject_note, :id=> "rejectnotes"
  #click reject save btn
  button :reject_save_btn, :id=> "reject-notes-btn"
  
  
   
  def go_subpage pagename
    @browser.link(:xpath, "//a[contains(text(),'#{pagename}')]").when_present.click
  end
  
  def choose_date
    @browser.td(:xpath, "//div[5]/div[2]/table/tbody/tr/td").when_present.click 
  end
  
  def input_date subpage
    @browser.text_field(:id, "#{subpage}Form_date").when_present.click
    choose_date
  end

  def input_close_date
    @browser.text_field(:id, "ClientSummaryForm_closedate").when_present.click
    choose_date
  end
  
  def input_renewal_date
    @browser.text_field(:id, "ClientSummaryForm_renewaldate").when_present.click
    @browser.td(:xpath, "//div[6]/div[2]/table/tbody/tr/td").when_present.click
  end
  
  def input_start_date
    @browser.text_field(:id, "KmProjectStatusForm_startdate").when_present.click
    choose_date
  end
  
  def input_compliance_date
    @browser.text_field(:id, "reservation").when_present.click
    choose_date
  end
  
  def input_compliance_requested_date
    @browser.text_field(:id, "reservation").when_present.click
    @browser.td(:xpath, "//div[6]/div[2]/table/tbody/tr/td").when_present.click
  end
  
  def input_consultation_status_date
    @browser.text_field(:id, "DailyForm_date").when_present.click
    choose_date
  end

  def date 
    date = Time.now
    date.strftime("%Y/%m")
  end




end 