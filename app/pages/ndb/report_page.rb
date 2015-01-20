#encoding: utf-8
require File.expand_path 'app/cases/shared/main.rb'
class ReportPage < Lol::Page
  
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
  #compliance approval status
  select_list :compliance_approval_status, :id=> "ComplianceApprovalSearchForm_internal_status"
  
  # download
  link :download, :text=> "Download"


  #####################project
  link :task_list, :xpath=> "//div[3]/div/div/ul/li[1]/a"
  link :task_list1, :xpath=> "//ul[@id='yw0']/li/a"
  ul :project_names, :id=> "yw0"
  #####################capvision data services
  link :consultants_tasks_ds, :xpath=> "//div[3]/div/div/ul/li[1]/a"
  #####################ges convey
  link :consultants_tasks_ges, :xpath=> "//div[3]/div/div/ul/li[1]/a"
  #####################conference
  link :consultants_tasks_conference, :xpath=> "//div[3]/div/div/ul/li[1]/a"
  ######################hrs
  link :task_list_hrs, :xpath=> "//div[3]/div/div/ul/li[1]/a"
  #####################client
  link :client_profile, :xpath=> "//div[2]/div/div[1]/div[1]/ul/li[1]/a"
  #####################client contact
  link :contact_profile, :xpath=> "//div[2]/div[1]/div[1]/div[1]/ul/li[1]/a"
  #####################consultant
  link :consultant_profile, :xpath=> "//div[3]/div/div[1]/div[1]/ul/li[1]/a"



  ###########################daily page
  #click here link
  link :daily_here, :xpath=> "//div[3]/div[1]/div/a"
  #locate element time
  element :daily_time, :th, :xpath=> "//div[3]/div[2]/table/thead[1]/tr/th[3]"
  #click first project
  link :first_project_daily, :xpath=> "//tr[1]/td[5]/a"
  #click link paging last 
  link :last_page_daily, :xpath=> "//div[3]/div[2]/div[2]/ul/li[6]/a"
  #click link paging first
  link :first_page_daily, :xpath=> "//div[3]/div[2]/div[2]/ul/li[1]/a"
  #click random paging 
  link :random_page_daily, :xpath=> "//div[3]/div[2]/div[2]/ul/li[4]/a"
  #input page
  text_field :input_page, :xpath=> "//div[3]/div[2]/div[2]/div/input"
  #click go button
  button :go_daily, :xpath=> "//div[3]/div[2]/div[2]/div/button"
  #input date
  text_field :input_date_daily, :id=> "DailyForm_date"
  #click date--next month
  element :next_month_daily, :th, :xpath=> "//div[5]/div[2]/table/thead/tr[1]/th[3]"
  #select some date
  element :next_month_date_daily, :td, :xpath=> "//div[5]/div[2]/table/tbody/tr[2]/td[1]"
  #click date apply button
  button :apply_date_daily, :xpath=> "//div[5]/div[3]/div/button[1]"
  #click date clear button
  button :clear_date_daily, :xpath=> "//div[5]/div[3]/div/button[2]"


  ##############################invocing page
  #input project name
  text_field :invocing_project_name, :id=> "InvoicingForm_projectName"
  #locate element company
  element :company_invocing, :th, :xpath=> "//div[3]/div[2]/table/thead[1]/tr/th[6]"
  #click first client
  link :first_client_invocing, :xpath=> "//tr[1]/td[1]/a"
  #click first contact
  link :first_contact_invocing, :xpath=> "//tr[1]/td[3]/a"
  #click first project
  link :first_project_invocing, :xpath=> "//tr[1]/td[4]/a"
  #click first consultant
  link :first_consultant_invocing, :xpath=> "//tr[1]/td[5]/a"
  #input_date
  text_field :input_date_invocing, :id=> "reservation"
  #click date clear button
  button :clear_button_invocing, :xpath=> "//div[5]/div[3]/div/button[2]"




  ##############################payment report page
  ###############project fee page
  #click first client
  link :first_client_projectfee, :xpath=> "//tr[1]/td[4]/a"
  #click first project
  link :first_project_projectfee, :xpath=> "//tr[1]/td[5]/a"
  #click first consultant
  link :first_consultant_projectfee, :xpath=> "//tr[1]/td[7]/a"

  #payment_report payment notes-----click link
  link :payment_notes, :xpath=> "//tr[1]/td[22]/a"
  #payment_report payment notes------input
  text_field :paynotes_input, :xpath=> "//div/div[1]/div[1]/input"
  #payment_report payment notes------click save
  button :paynotes_save, :xpath=> "//div/div[1]/div[2]/button[1]"

  #payment_report referral fee
  link :goto_referralfee, :xpath=> "//div[3]/div/div/ul/li[2]/a"

  #input date
  text_field :input_date_fee, :id=> "reservation"
  #click date clear button
  button :clear_date_fee, :xpath=> "//div[6]/div[3]/div/button[2]"

  
  ######################full_consultant_report page
  #select consultant status
  select_list :consultant_status, :id => "FullConsultantForm_status"
  #click first consultant
  link :first_consultant_fullc, :xpath=> "//div[3]/div[2]/table/tbody/tr[1]/td[1]/a"


  #####################consultant growth report page
  #click first consultant
  link :first_consultant_cgrowth, :xpath=> "//div[3]/div[2]/table/tbody/tr[1]/td[5]/a"
  #consultant status
  select_list :consultant_status_cgrowth, :id=> "ConsultantGrowthForm_status"
  #locate element consultant status
  td :list_status_cgrowth, :xpath=> "//tr/td[10]"
  #input date
  text_field :input_date_consultantgrowth, :id=> "ConsultantGrowthForm_date"
  #click date clear button
  button :clear_date_consultantgrowth, :xpath=> "//div[5]/div[3]/div/button[2]"
  #created by 
  select_list :select_createdby_cgrowth, :id=> "ConsultantGrowthForm_user"
  #locate element people created by
  element :locate_first_createdby_cgrowth, :td, :xpath=> "//div[3]/div[2]/table/tbody/tr[1]/td"


  ####################client summary report page
  #select am
  select_list :select_am_summary, :id=> "ClientSummaryForm_am"
  #locate element am
  element :am_summary, :td, :xpath=> "//tr[1]/td[2]"
  #select client status
  select_list :client_status_summary, :id=> "ClientSummaryForm_status"
  #locate element client status
  element :client_status_summaryreport, :td, :xpath=> "//tr[1]/td[9]"
  #input close date
  text_field :input_closedate_clientsummary, :id=> "ClientSummaryForm_closedate"
  #click close date clear button
  button :clear_closedate_clientsummary, :xpath=> "//div[5]/div[3]/div/button[2]"
  #input renewal date
  text_field :input_renewaldate_clientsummary, :id=> "ClientSummaryForm_renewaldate"
  #click renewal clear button
  button :clear_renewaldate_clientsummary, :xpath=> "//div[6]/div[3]/div/button[2]"


  #####################request summary report page
  #click the first consultant
  link :first_consultant_rs, :xpath=> "//tr[1]/td[2]/div/a"
  #request summary status
  select_list :request_summary_status, :id=> "RequestSummaryForm_status"
  #input date
  text_field :input_date_requestsummary, :xpath=> "//div[3]/div[1]/form/div[1]/input"
  #click date clear button
  button :clear_date_requestsummary, :xpath=> "//div[5]/div[3]/div/button[2]"


  #########################consultant status&feedback
  select_list :task_status_csf, :id=> "DailyForm_status"
  h1 :h1_text, :xpath=>"//h1"  
  #consultant status&feedback search project_name
  text_field :project_name_csf, :id=> "DailyForm_project"
  #consultant status&feedback first project link
  link :first_project_csf, :xpath=> "//tr[1]/td[6]/a"
  #click date
  text_field :input_date_csf, :id=> "DailyForm_date"
  #click date cleat button
  button :clear_date_csf, :xpath=> "//div[5]/div[3]/div/button[2]"
  #input_client
  element :input_client_csf, :b, :xpath=> "//div[3]/div[1]/form/div[2]/div/a/div/b"
  #select client
  element :select_client_csf, :div, :xpath=> "//div[6]/ul/li[1]/div"




  #########################client cash page
  #client cash type
  select_list :client_cash_type, :id=> "ClientCashForm_type"
  #locate element client type
  element :client_type_cash, :td, :xpath=> "//tr[1]/td[5]"
  #select am
  select_list :am_cilentcash, :id=> "ClientCashForm_am"
  #locate element am
  element :am_clientcash_report, :td, :xpath=> "//tr[1]/td[2]"
  #select client status
  select_list :client_status_clientcash, :id=> "ClientCashForm_status"
  #locate element client status
  element :client_status_clientcash_locate, :td, :xpath=> "//tr[1]/td[6]"
  #input date
  text_field :input_date_clientcash, :id=> "ClientCashForm_date"
  #click date clear button
  button :clear_date_clientcash, :xpath=> "//div[5]/div[3]/div/button[2]"

 

  #############3############referral fee page
  #referral fee link
  link :referralfee_link, :text=> "Referral Fee"
  #first consultant
  link :first_consultant_referfee, :xpath=> "//tr[1]/td[2]/a"
  #first referral
  link :first_refereal_referfee, :xpath=> "//tr[1]/td[3]/a"
  #first project
  link :first_project_referfee, :xpath=> "//div[4]/div[3]/table/tbody/tr[1]/td[5]/a"



  ######################km project status report page
  #select project status
  select_list :project_status_kmpage, :id=> "KmProjectStatusForm_status"
  #locate element project status
  element :project_status_kmpagereport, :td, :xpath=> "//tr[1]/td[3]"
  #input project name
  text_field :input_project_name_km, :id=> "KmProjectStatusForm_project"
  #locate project name
  element :input_project_name_kmreport, :td, :xpath=> "//tr[1]/td[6]"
  #first project link 
  link :first_project_kmpage, :xpath=> "//div[3]/div[2]/table/tbody/tr[1]/td[6]/a"
  #input start date
  text_field :input_startdate_kmpage, :id=> "KmProjectStatusForm_startdate"
  #click start date clear button
  button :clear_startdate_kmpage, :xpath=> "//div[5]/div[3]/div/button[2]"
  #input end date
  text_field :input_enddate_kmpage, :id=> "KmProjectStatusForm_enddate"
  #click end date clear button
  button :clear_enddate_kmpage, :xpath=> "//div[6]/div[3]/div/button[2]"
  #click end date apply button
  button :apply_enddate_kmpage, :xpath=> "//div[6]/div[3]/div/button"




  #######################call manager report
  #input keywords
  text_field :keywords_callmanager, :id=> "CallManagerForm_keywords"
  #input date
  text_field :input_date_callmanager, :xpath=> "//div[3]/div[1]/form/div[1]/div/div/input"
  #click date clear button
  button :clear_date_callmanager, :xpath=> "//div[5]/div[3]/div/button[2]"


  #######################compliance check report page
  #select task status
  select_list :task_status_compliancecheck, :id=> "ComplianceForm_status"
  #locate element task status
  element :locate_status_complianccheck, :td, :xpath=> "//tr/td[1]"
  #click first client
  link :first_client_compliancecheck, :xpath=> "//tr[2]/td[3]/a"
  #click first project
  link :first_project_compliancecheck, :xpath=> "//tr[1]/td[4]/a"
  #click first consultant
  link :first_consultant_compliancecheck, :xpath=> "//tr[1]/td[5]/a"
  #input date
  text_field :input_date_compliancecheck, :xpath=> "//div[3]/div[1]/form/div[1]/input"
  #click date clear button
  button :clear_date_compliancecheck, :xpath=> "//div[5]/div[3]/div/button[2]"



  #######################compliance approval report page
  #select internal status
  select_list :internal_status, :id=> "ComplianceApprovalSearchForm_internal_status"
  #locate element internal status
  element :internal_status_locate, :td, :xpath=> "//tr/td[3]"
  #select external status
  select_list :external_status, :id=> "ComplianceApprovalSearchForm_external_status"
  #locate element external status
  element :external_status_locate, :td, :xpath=> "//tr/td[4]"
  #input keywords
  text_field :input_keywords_complianceapproval, :id=> "ComplianceApprovalSearchForm_keywords"
  #select first project
  link :first_project_complianceapproval, :xpath=> "//tr/td[6]/a"
  #input requested time
  text_field :input_requestedtime_complianceapproval, :xpath=> "//div[3]/div/form/div[1]/input"
  #click date clear time
  button :clear_date_complianceapproval, :xpath=> "//div[6]/div[3]/div/button[2]"



  ###########################consultation industry report page
  #select client type
  select_list :client_type_industryreport, :id=> "ConsultationIndustryForm_type"
  #locate element client type
  element :client_type_locate_industry, :td, :xpath=> "//tr[1]/td[1]"
  #click first project
  link :first_project_industryreport, :xpath=> "//tr/td[4]/a"



  ##########################client project report page--------------consultation
  #input project name keywords
  text_field :input_project_name_clientproject, :id=> "ClientProjectForm_keywords"
  #first project
  link :first_project_consultation, :xpath=> "//tr/td[1]/a"
  ##########################client project report page---------------capvision data service
  #click capvision data service link
  link :data_service_link, :xpath=> "//div[3]/div/div/ul/li[2]/a"
  #first data service project
  link :first_project_dataservice, :xpath=> "//tr/td[1]/a"
  ##########################client project report page----------------ges convey
  #click ges convey link
  link :ges_convey_link, :xpath=> "//div[3]/div/div/ul/li[3]/a"
  #first ges convey project
  link :first_project_gesconvey, :xpath=> "//tr[1]/td[1]/a"
  #select am--ges convey project
  select_list :am_gesconvey, :id=> "ClientProjectForm_am"
  #input project name  description  info
  text_field :input_project_keywords_gesconvey, :id=> "ClientProjectForm_keywords"
  #input location
  element :input_location_ges, :div, :xpath=> "//div[4]/div[1]/form/div[5]/div/div/div/div[2]"
  #select location
  link :select_location_ges, :xpath=> "//div[6]/div[2]/ul[2]/div/li[2]/a"

  #########################client project report page-----------------conference 
  #click conference link
  link :conference_link, :xpath=> "//div[3]/div/div/ul/li[4]/a"
  #first conference project
  link :first_project_conference, :xpath=> "//tr[1]/td[1]/a"
  #select am--conference project
  select_list :am_conference, :id=> "ClientProjectForm_am"
  #select industry--conference project
  select_list :industry_conference, :id=> "ClientProjectForm_industry"
  #input project keywords
  text_field :input_project_keywords_conference, :id=> "ClientProjectForm_keywords"
  #input_client
  element :input_client_conference, :b, :xpath=> "//div[4]/div[1]/form/div[3]/div/a/div/b"
  #select client
  element :select_client_conference, :div, :xpath=> "//div[6]/ul/li[1]/div"
  #input location
  element :input_location_conference, :div, :xpath=> "//div[4]/div[1]/form/div[5]/div/div/div/div[2]"
  #select location
  link :select_location_conference, :xpath=> "//div[6]/div[2]/ul[2]/div/li[2]/a"
  #########################client project report page--------------------hrservicce
  #click hrs service link
  link :hrs_link, :xpath=> "//div[3]/div/div/ul/li[5]/a"
  #first hrs project
  link :first_project_hrs, :xpath=> "//tr[1]/td[1]/a"
  #input_client
  element :input_client_hrs, :b, :xpath=> "//div[4]/div[1]/form/div[3]/div/a/div/b"
  #select client
  element :select_client_hrs, :div, :xpath=> "//div[6]/ul/li[1]/div"
  #select industry---hr service
  select_list :industry_hrs, :id=> "ClientProjectForm_industry"
  #input location
  element :input_location_hrs, :div, :xpath=> "//div[5]/div/div/div/div[2]"
  #select location
  link :select_location_hrs, :xpath=> "//div[6]/div[2]/ul[2]/div/li[2]/a"
  #input project keywords
  text_field :input_project_keywords_hrs, :id=> "ClientProjectForm_keywords"
  #######################client project report page----------------------international consultation
  #click international consultation link
  link :interconsultation_link, :xpath=> "//div[3]/div/div/ul/li[6]/a"
  #input_client
  element :input_client_interconsultation, :b, :xpath=> "//div[4]/div[1]/form/div[3]/div/a/div/b"
  #select client
  element :select_client_interconsultation, :div, :xpath=> "//div[6]/ul/li[1]/div"
  #select industry
  select_list :industry_interconsultation, :id=> "ClientProjectForm_industry"
  #input location
  element :input_location_interconsultation, :div, :xpath=> "//div[5]/div/div/div/div[2]"
  #select location
  link :select_location_interconsultation, :xpath=> "//div[6]/div[2]/ul[2]/div/li[2]/a"
  #input project keywords
  text_field :input_project_keywords_interconsultation, :id=> "ClientProjectForm_keywords"




  #date clear button
  button :date_clear, :xpath=> "//div[5]/div[3]/div/button[2]"
  #click to select create by
  span :click_to_select_createby, :xpath=> "//div[2]/div/a/span"
  #select create by
  div :select_createby, :text=> "test_km1"
  #update btn
  button :update_btn, :name=> "yt0"



  

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

  def report_page_invocing_title
    a = self.first_project_invocing_element.when_present.text
    title= a[a.match(/\[\w+\]/).to_s]=""
    return title
  end

  def date 
    date = Time.now
    date.strftime("%Y/%m")
  end
  
  #consultation industry date
  text_field :input_date_consultation_industry, :id=> "ConsultationIndustryForm_date"
  #click clear date button
  button :clear_date_conindustry, :xpath=> "//div[5]/div[3]/div/button[2]"
  def consultation_industry_date
    self.input_date_consultation_industry_element.when_present.click
    choose_date
  end
  
  
  




end 