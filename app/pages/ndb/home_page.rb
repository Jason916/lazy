#encoding: utf-8
require File.expand_path 'app/cases/shared/main.rb'
class HomePage < Lol::Page
  
	page_url "#{$config.host}index/index"

  link :login_text, :href=> "/user/user/login"
  link :client_portal, :text=> "Client Portal"
  link :client, :href=> "/client/index/index"
  link :contact, :text=> "/client/contact/index"
  link :consultant_text, :href=> "/search/default/consultant"
  link :consultant_link, :xpath=> "//ul/li[3]/ul/li[1]/a"
  form :profile_text, :xpath=> "//form[@id='yw1']/fieldset/div[4]/div/div/div/div/span"
  link :report, :href=> "/report/index/index"
  link :consultation, :href=> "/project/consultation/index/index"
  link :compliance_page, :text=>"Compliance"
  link :data_company, :href=>"/company/index/new"
  link :data_position, :href=>"/position/index/new"
  link :data_school, :href=>"/school/index/index"
  link :data_tag, :href=>"/consultant/tag/index"
  link :data_panel, :href=>"/panel/index/index"
  link :data_request, :href=>"/consultant/requestmanagement/doingindex"
  link :data_page, :text=>"Data"
  link :project_page, :text=>"Project"



  link :invoicing, :href=>"/report/invoicing/index"
  link :payment, :href=>"/report/payment/index"
  link :project_page, :href=>"/project/consultation/index/index"
  link :HR_page, :href=> "/project/hr/index/index"
  link :conference_page, :href=> "/project/conference/index/index"
  link :convey_page, :href=> "/project/service/index/index"
  link :international_page, :href=>"/project/internation/index/index"
  link :consultation_review_page, :href=>"/project/consultation/review/index"



  


  
  def direct_to_client_page
    self.client
    turn_to ClientPage
  end
  
  def direct_to_contact_page
    self.contact
    turn_to ContactPage
  end
  
	def direct_to_login_page
		self.login_text
		turn_to LoginPage
  end
  
  def direct_to_consultant_page
    self.consultant_text
    #self.consultant_link_element.when_present.click
    turn_to ConsultantPage
  end

  def direct_to_profile_page
    self.client
    turn_to ProfilePage
  end
  
  def direct_to_report_page
    self.report_element.when_present.click
    turn_to ReportPage
  end
  
  def direct_to_consultation_page
    self.project_page
    turn_to ProjectConsultationPage
  end

  def direct_to_project_page
    self.project_page
    turn_to CapvisionDataPage
  end

  def direct_to_compliance_page
    self.compliance_page
    turn_to CompliancePage
  end

  def direct_to_data_page
    self.data_page
    turn_to DataPage
  end

  def direct_to_data_company
    self.data_company
    turn_to DataPage
  end

  def direct_to_data_position
    self.data_position
    turn_to DataPage
  end

  def direct_to_data_school
    self.data_school
    turn_to DataPage
  end

  def direct_to_data_tag
    self.data_tag
    turn_to DataPage
  end

  def direct_to_data_panel
    self.data_panel
    turn_to DataPage
  end

  def direct_to_data_request
    self.data_request
    turn_to DataPage
  end
  
  def direct_to_invoicing_page
    self.report_element.when_present.click
    self.invoicing
    turn_to InvoicingPage
  end

  def direct_to_payment_page
    self.report
    self.payment
    turn_to PaymentPage
  end
  
  def direct_to_conference_page
	self.project_page
	self.conference_page
	turn_to ProjectConferencePage
  end
  
  def direct_to_convey_page
	self.project_page
	self.convey_page
	turn_to ProjectConveyPage
  end
  
  def direct_to_HR_page
	sleep 2
	self.project_page
	sleep 2
	self.HR_page
	turn_to ProjectHRPage
  end

  def direct_to_international_page
    self.project_page
    self.international_page
    turn_to InternationalPage
  end

  def direct_to_consultation_review_page
    self.project_page
    self.consultation_review_page
    turn_to ConsultationReviewPage
  end

end

