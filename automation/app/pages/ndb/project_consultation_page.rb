#encoding: utf-8
require File.expand_path 'app/cases/shared/action'
class ProjectConsultationPage < NdbPage
  include Action
  page_url "#{$config.host}project/consultation/index/index"
  
  button :filter, :name=> "yt0"
  select_list :project_industry, :id=> "ProjectSearchForm_industryid"
  select_list :project_status, :id=> "ProjectSearchForm_status"
  link :project_create_btn, :id=>"project_create_btn"
  text_field :project_name, :id=> "Project_name"
  #input project description
  text_field :project_description, :id=> "Project_description"
  #select industry
  select_list :select_industry, :id=> "industry-selector"
  button :next, :id=> "yw1"
  text_field :key_questions, :id=> "ProjectDetailForm_keyQuestions"
  button :save, :id=> "yw5"
  h1 :consultation_title, :xpath=> "//h1"
  link :choose_project, :xpath=> "//td[2]/a"
  #select the first project
  checkbox :project_checkbox, :id=> "project-grid_c0_0"
  #select the second project
  checkbox :second_project_checkbox, :id=> "project-grid_c0_1"
  select_list :choose_action, :id=> "Action_type"
  link :project_update_btn, :id=> "project_update_btn"
  div :project_update_alert, :class=> "alert alert-success"
  textarea :input_invalid_note, :id=> "invalid_note"
  button :save_note, :xpath=> "//div[3]/div/button"
  button :complete_save_note, :xpath=> "//div[3]/div/button[1]"
  select_list :project_choosefeedback, :id=> "service"
  button :feedback_save, :xpath=> "//div[6]/div[3]/div/button"
  select_list :choose_taskaction, :id=> "action"
  #click update btn
  button :update_taskstatus, :id=> "taskupdate-btn"
  link :select_project, :xpath=> "//td[2]/a"
  #view task status
  td :task_status, :xpath=> "//tr/td[3]"
  #click delete link
  link :del_project, :xpath=> "//a[3]"
  #link to client info page
  link :go_to_project_clientinfo_page, :xpath=> "//ul[@id='yw0']/li[4]/a"
  #link to client contacts page
  link :go_to_project_clientcontacts_page, :xpath=> "//ul[@id='yw0']/li[5]/a"
  #link to emails page
  link :go_to_project_emails_page, :xpath=> "//ul[@id='yw0']/li[6]/a"
  #link to sms page
  link :go_to_project_sms_page, :xpath=> "//ul[@id='yw0']/li[7]/a"
  #link to compliance page
  link :go_to_project_compliance_page, :xpath=> "//ul[@id='yw0']/li[3]/a"
  #select first task
  checkbox :first_task_checkbox, :id=> "task-grid_c0_0"
  #select second task
  checkbox :second_task_checkbox, :id=> "task-grid_c0_1"
  #project alert information
  div :alert_success_information,:xpath=> "//div[3]/div/div/div"
  #click save on hold note btn
  button :save_onhold_note,:text=> "Save"
  #add_consultant btn
  p :add_consultant_alert, :xpath=> "//div[@id='add-consultant-dialog']/p"
  #update task 
  element :update_task_link, :i ,:xpath=> "//tr/td[19]/div/a/i"
  #update task after delete a complete task
  element :update_task_link1, :i ,:xpath=> "//tr/td[18]/div/a/i"
  #input consultation date
  text_field :input_consultation_date, :xpath=> "//input[@id='ProjectConsultationTask_datetimeString']"
  #save after edit consultation
  button :save_consultaion, :id=> "yw2"
  #input consultation hour
  text_field :input_consultation_hour, :xpath=> "//input[@id='ProjectTaskPayment_hours']"
  #click view project info link
  element :view_project_link, :i ,:xpath=> "//div[@id='project-grid']/table/tbody/tr/td[16]/a/i"
  #click delete consultation link
  link :del_consultation, :xpath=> "//a[3]"
  #click project feedback link
  link :project_feedback_link, :xpath=> "//div[@id='project-grid']/table/tbody/tr[1]/td[16]/a[2]"
  #add consultant link
  link :add_consultant_link, :text=> "Add Consultant"
  #first consultant checkbox
  checkbox :first_consultant, :id=> "yw0_c0_0"
  #second consultant checkbox
  checkbox :second_consultant, :id=> "yw0_c0_1"
  #click add consultant btn
  button :add_consultant_btn, :id=> "btn-add-consultant"
  #Go to this project list btn
  button :go_to_this_project_list, :text=> "Go to this project list"
  #click recommand alert btn 
  button :recommand_alert_btn, :xpath=> "//div[3]/div/button"
  #change status btn
  button :change_status, :id=> "change-status"
  #choose whether Contacted or not
  radio_button :contacted_btn, :xpath=> "//div[6]/div/span/input"
  #input consultant date
  text_field :consultant_date, :xpath=> "//span[2]/div/input"
  #input nick name  
  text_field :nick_name, :xpath=> "//div[@id='yw0_tab_1']/div/div[3]/div[2]/span[2]/input"
  #select type of interview
  select_list :type_of_interview, :xpath=> "//div[@id='yw0_tab_1']/div/div[3]/div[4]/span[2]/select"
  #click client 
  span :click_client, :xpath=> "//div[@id='s2id_ProjectClient_clientid']/a/span"
  #select client
  div :select_client, :text=> "cash"
  #click project basic info link
  link :project_basic_edit, :id=> "project-basic-edit-btn"
  #click project client and contact edit link
  link :edit_project_client_contact, :id=> "project-client-and-contact-edit-btn"
  #click project team edit link
  link :edit_project_team, :id=> "project-team-edit-btn"
  #select team pm"
  select_list :select_team_pm, :id=> "Team_pm"
  #click project requirements edit link
  link :edit_project_requirements, :id=> "project-requirements-edit-btn"
  #input project requirements info requirements
  text_area :input_info_requirements, :xpath=> "//textarea[@id='Profile_info_requirements']"
  #select on hold reason
  select_list :select_onhold_reason, :id=> "onhold_note"
  #link of compliance on project page
  link :link_to_compliance, :xpath=> "//div[3]/div/div/ul/li[3]/a"
  #click client agreement link
  link :client_agreement, :id=> "compliance_ca"
  #select client agreement
  select_list :select_client_agreement, :xpath=> "//select"
  #save client agreement
  button :save_client_agreement, :xpath=> "//button[@type='submit']"
  #next step 
  button :next_step, :name=> "next"
  #input mail to
  ul :input_mail_to ,:xpath=> "//span[2]/div/ul"
  #select email to mail to
  div :select_email ,:text=> "Alex Tang [ atang@capvision.com ]"
  #select email1 to mail to
  div :select_email1 ,:text=> "Admin [ dbsender@capvision.com.cn ]"
  #click No btn
  button :click_no_btn ,:xpath=> "//button[2]"
  #input calendar to
  ul :input_calendar_to ,:xpath=> "//div[@id='email_template']/div[4]/span[2]/div/ul"
  #send email btn
  button :send_email ,:xpath=> "//input[@id='send-email']"
  #click cancel calendar link
  element :cancel_calendar_link , :i ,:xpath=> "//div[@id='task-grid']/table/tbody/tr[1]/td[18]/div[6]/a/i"
  #select calendar to
  div :select_calendar_to ,:text=> "Admin [ dbsender@capvision.com.cn ]"
  #click Yes btn
  button :click_yes_btn ,:text=> "Yes"
  #select sms 
  checkbox :select_sms ,:xpath=> "//span/input"
  #select second sms
  checkbox :select_second_sms ,:xpath=> "//div[2]/div[2]/div/span/input"
  #submit sms
  button :submit_sms ,:text=> "Submit"
  #project consultation task endtime string
  text_field :consultation_task_endtime ,:id=> "ProjectConsultationTask_endtimeString"
  #project consultation task type of interview
  select_list :consultation_task_type_of_interview ,:id=> "ProjectConsultationTask_typeofinterview"
  #project consultation task industry
  span :consultation_task_industry ,:xpath=> "//div[@id='s2id_ProjectConsultationTask_industry']/a/span"
  #select project consultation task industry
  div :select_consultation_task_industry ,:text=> "能源-能源开采与加工-石油与天然气开采"
  #input project task receipts hours
  text_field :input_task_receipts_hours ,:id=> "ProjectTaskReceipts_hours"
  #input project task receipts bill notes
  text_area :input_task_receipts_billnotes ,:id=> "ProjectTaskReceipts_billnotes"
  #input project task payment hours
  text_field :input_task_payment_hours ,:id=> "ProjectTaskPayment_hours"
  #save btn on the second step of task complete page
  button :save_complete_page_btn ,:name=> "submit"
  #click compliance tnc link
  link :compliance_tnc_link ,:id=> "compliance_tnc"
  #click compliance ca link
  link :compliance_ca_link ,:id=> "compliance_ca"
  #select 
  select_list :select_tnc_or_ca ,:xpath=> "//div/div/div/select"
  #save tnc or ca
  button :save_tnc_or_ca ,:xpath=>"//div/div/div[2]/button[1]"
  #training label
  label :training_label ,:xpath=> "//div[@id='training-button']/div/label"
  #capcheck label
  label :capcheck_label ,:xpath=> "//div[@id='capcheck-button']/div/label"
  #clientcheck label
  label :clientcheck_label ,:xpath=> "//div[@id='clientcheck-button']/div/label"
  #task list link
  link :link_to_task_list ,:text=> "Task List"
  #link
  link :task_list_link ,:xpath=> "//div[3]/div/div/ul/li[1]/a"
  #upload file
  element :upload_file ,:i ,:xpath=> "//div[@id='task-grid']/table/tbody/tr[1]/td[21]/div[5]/a/i"
  #ndb file upload input
  file_field :ndb_file_upload_input ,:id=> "ndb-file-upload-input"
  #ndb file upload upload btn
  button :ndb_file_upload_btn ,:id=> "ndb-file-upload-upload-btn"
  #ndb delete document
  element :del_document , :i ,:xpath=> "//div[@id='task-grid']/table/tbody/tr/td[19]/a[2]/i"
  #verify the info of alert after deleted document
  div :info_after_delete_document ,:xpath=> "//div[@id='task-grid']/table/tbody/tr/td[19]"
  #task feedback
  element :task_feedback_link , :i ,:xpath=>"//div[@id='task-grid']/table/tbody/tr/td[22]/div/a[2]/i"
  #expertise
  select_list :select_expertise ,:id=> "expertise"
  #communication
  select_list :select_communication ,:id=> "communication"
  #professionalism
  select_list :select_professionalism ,:id=> "professionalism"
  #save task feedback
  button :save_task_feedback ,:xpath=> "//div[9]/div[3]/div/button"
  #click km note link
  link :km_note_link ,:xpath=> "//div[@id='task-grid']/table/tbody/tr/td[10]/a"
  #input km note 
  text_field :input_km_note ,:xpath=> "//div/div/div/input"
  #save km note
  button :save_km_note ,:xpath=> "//div/div/div[2]/button"
  #send ca
  link :send_ca ,:text=> "Send CA"
  #compliance send submit
  button :compliance_send_submit ,:id=> "compliance-send-submit"
  #click sign ca link
  link :sign_ca ,:text=> "Sign CA"
  #click resend ca link
  link :resend_ca ,:text=> "Resend CA"
  
  
  
  
  
  def choose_client
    self.click_client_element.when_present.click
    self.select_client_element.when_present.click
  end

  def view_projectinfo
    self.view_project_link_element.when_present.click
  end
  
  def edit_project_info
    self.project_basic_edit_element.when_present.click
    self.project_description_element.when_present.clear
    self.project_description_element.when_present.append "at_test_consultationlol wowawowerjwad@!#!@3  123"
    self.select_industry_element.when_present.select "Aerospace - 航空"
    self.project_basic_edit_element.when_present.click
    self.edit_project_client_contact_element.when_present.click
    self.edit_project_client_contact_element.when_present.click
    self.edit_project_team_element.when_present.click
    self.select_team_pm_element.when_present.select "test_km2"
    self.edit_project_team_element.when_present.click
		self.edit_project_requirements_element.when_present.click
		self.input_info_requirements_element.when_present.clear
		self.input_info_requirements_element.when_present.append "at_test_consultationlol wowawowerjwad@!#!@3  123"
		self.edit_project_requirements_element.when_present.click
  end

  def onhold_note
    self.select_onhold_reason_element.when_present.select "Change of project direction"
    self.save_onhold_note_element.when_present.click
  end

  def alert_success
   self.alert_success_information_element.when_present.text
  end
  
  def delete_project
    project_name = self.first_project
    if project_name.include? "AT_我叫weijun"
       message =self.alert do
       self.del_consultation_element.when_present.click
       end
       message.should == "Are you sure you wish to delete this project?"
    else
       puts "There is no new project to delete."
    end    
  end
  
  def project_feedback
	    self.project_feedback_link_element.when_present.click
  end
	
	def add_consultant
	    self.add_consultant_link_element.when_present.click
	    self.filter_element.when_present.click
			sleep 2
			if self.first_consultant_element.enabled?
			  puts "顾问添加完成"
			else
			  puts "顾问添加失败！"
			end
			self.first_consultant_element.when_present.click
			self.add_consultant_btn_element.when_present.click
			self.go_to_this_project_list_element.when_present.click
			sleep 1
			self.text.include? "Not Contacted"
	end
	
	def add_two_consultants
	    self.add_consultant_link_element.when_present.click
      self.filter_element.when_present.click
      sleep 2
      self.first_consultant_element.when_present.click
      self.second_consultant_element.when_present.click
      self.add_consultant_btn_element.when_present.click
	end
	
	def change_selected_without_compliace
	    sleep 2
	    self.first_task_checkbox_element.when_present.click
	    self.choose_taskaction_element.when_present.select("Selected")
			self.update_taskstatus_element.when_present.click
			sleep 2
			self.text.include? "You cannot do select action because there is no compliance requirement."
	end
	
	def change_recommended
	    sleep 2
	    self.first_task_checkbox_element.when_present.click
	    self.choose_taskaction_element.when_present.select("Recommended")
	    self.update_taskstatus_element.when_present.click
	    self.recommand_alert_btn_element.when_present.click
			sleep 2
			self.contacted_btn_element.when_present.click
			self.change_status_element.when_present.click
			sleep 1
			self.text.include? "Change task status successfully. "
	end
	
	def change_pending
	    sleep 2
      self.first_task_checkbox_element.when_present.click
      if self.second_task_checkbox_element.exist?
        self.second_task_checkbox_element.when_present.click
      end
      self.choose_taskaction_element.when_present.select("Pending")
      self.update_taskstatus_element.when_present.click
	end
	
	def change_second_task task_status
	    sleep 2
	    self.second_task_checkbox_element.when_present.click
      self.choose_taskaction_element.when_present.select task_status
      self.update_taskstatus_element.when_present.click
      if task_status == "Recommended"
        self.contacted_btn_element.when_present.click
        puts "Recommend task"
      else
        sleep 2
        self.consultant_date_element.when_present.clear
        self.consultant_date_element.when_present.append "23:57"
        self.nick_name_element.when_present.clear
        self.nick_name_element.when_present.append "cenimeiace"
        self.type_of_interview_element.when_present.select "Phone"
        puts "Arrange task"
      end
      self.change_status_element.when_present.click
	end
	
	def change_ca_to_NA
	    self.link_to_compliance_element.when_present.click
	    self.client_agreement_element.when_present.click
      self.select_client_agreement_element.when_present.select "N/A"
      self.save_client_agreement_element.when_present.click
	end
	
	def change_ca_to_signment
		  self.link_to_compliance_element.when_present.click
      self.client_agreement_element.when_present.click
      self.select_client_agreement_element.when_present.select "AT测试ca1_修改后"
      self.save_client_agreement_element.when_present.click
	end
	
	def change_recommend_to_arrange
	    sleep 2
      self.first_task_checkbox_element.when_present.click
      self.choose_taskaction_element.when_present.select "Arranged"
      self.update_taskstatus_element.when_present.click
      sleep 2
			self.consultant_date_element.when_present.clear
      self.consultant_date_element.when_present.append "23:57"
      self.nick_name_element.when_present.clear
      self.nick_name_element.when_present.append "cenimeiace"
      self.type_of_interview_element.when_present.select "Phone"
			self.change_status_element.when_present.click
			sleep 1
			self.text.include? "Change task status successfully. "
	end
	
	def send_calendar
	    sleep 2
			self.first_task_checkbox_element.when_present.click
			self.choose_taskaction_element.when_present.select "Arranged"
			self.update_taskstatus_element.when_present.click
			sleep 2
			self.consultant_date_element.when_present.clear
      self.consultant_date_element.when_present.append "23:57"
      self.nick_name_element.when_present.clear
      self.nick_name_element.when_present.append "cenimeiace"
      self.type_of_interview_element.when_present.select "Phone"
			self.next_step_element.when_present.click
			sleep 2
			self.input_mail_to_element.when_present.click
			self.select_email_element.when_present.click
			self.input_calendar_to_element.when_present.click
			self.select_email1_element.when_present.click
			sleep 2
			self.send_email_element.when_present.click
			self.click_no_btn_element.when_present.click
			sleep 6
	end
	
	def cancel_calendar
	    message = self.alert do
	    sleep 1
	    self.cancel_calendar_link_element.when_present.click
	  end
	end
	
	def send_sms_arrange 
	    sleep 2
      self.first_task_checkbox_element.when_present.click
      if self.second_task_checkbox_element.exist?
        self.second_task_checkbox_element.when_present.click
      end
			self.choose_taskaction_element.when_present.select "Arranged"
			self.update_taskstatus_element.when_present.click
			sleep 2
			self.consultant_date_element.when_present.clear
      self.consultant_date_element.when_present.append "23:57"
      self.nick_name_element.when_present.clear
      self.nick_name_element.when_present.append "cenimeiace"
      self.type_of_interview_element.when_present.select "Phone"
			self.next_step_element.when_present.click
			sleep 2
			self.input_mail_to_element.when_present.click
      self.select_email_element.when_present.click
      self.input_calendar_to_element.when_present.click
			self.select_calendar_to_element.when_present.click
			self.send_email_element.when_present.click
			sleep 5
			self.click_yes_btn_element.when_present.click
			sleep 2
			self.select_sms_element.when_present.click
			if self.select_second_sms_element.exist?
         self.select_second_sms_element.when_present.click 
			end
			self.submit_sms_element.when_present.click
	end
	
	
	def change_arrange_to_complete
	    sleep 2
			self.first_task_checkbox_element.when_present.click
			self.choose_taskaction_element.when_present.select "Completed"
			self.update_taskstatus_element.when_present.click
			sleep 2
			self.consultation_task_endtime_element.when_present.clear
			self.consultation_task_endtime_element.when_present.append "23:59"
			self.consultation_task_type_of_interview_element.when_present.select "In-Person"
			self.consultation_task_industry_element.when_present.click
			self.select_consultation_task_industry_element.when_present.click
			self.input_task_receipts_hours_element.when_present.clear
			self.input_task_receipts_hours_element.when_present.append "10"
			self.input_task_receipts_billnotes_element.when_present.clear
			self.input_task_receipts_billnotes_element.when_present.append "this is billing notes"
			self.input_task_payment_hours_element.when_present.clear
			self.input_task_payment_hours_element.when_present.append "10"
			self.save_complete_page_btn_element.when_present.click
			sleep 1
			self.text.include? "Completed"
	end
	
	def change_completed_to_deleted
	    sleep 2
			self.first_task_checkbox_element.when_present.click
			self.choose_taskaction_element.when_present.select "Deleted"
			self.update_taskstatus_element.when_present.click
			sleep 2
			self.text.include? "Change task status successfully."
	end
	
	def change_completed_to_10minstest
		  self.attach_to_window(:title=> first_project+" - Task List - Capvision")
		  sleep 2
			self.first_task_checkbox_element.when_present.click
			self.choose_taskaction_element.when_present.select "10mins test"
			self.update_taskstatus_element.when_present.click
			sleep 2
			self.text.include? "Change task status successfully. "
	end
	
	def update_task
	    self.update_task_link1_element.when_present.click
			sleep 4
			self.text.include? "Edit Consultation"
			self.save_consultaion_element.when_present.click
	end
	
	def	tc
	    self.link_to_compliance_element.when_present.click
	    self.compliance_tnc_link_element.when_present.click
	    self.select_tnc_or_ca_element.when_present.select "凯盛专家网络条款协议_V4.0"
	    self.save_tnc_or_ca_element.when_present.click
	end
	
	def	client_agreement
	    self.compliance_ca_link_element.when_present.click
	    self.select_tnc_or_ca_element.when_present.select "AT测试ca1_修改后"
	    self.save_tnc_or_ca_element.when_present.click
	end
	
	def	training
			self.training_label_element.when_present.click
	end
	
	def	capvision_approval
		  self.capcheck_label_element.when_present.click
	end
	
	def	client_approval
	    self.clientcheck_label_element.when_present.click
	    self.link_to_task_list_element.when_present.click
			sleep 2
			self.first_task_checkbox_element.when_present.click
			self.choose_taskaction_element.when_present.select "Selected"
			self.update_taskstatus_element.when_present.click
			self.text.include? "You cannot select the action before you recommend the task."
	end
	
	
	def change_notcontacted_to_selected
	    self.task_list_link_element.when_present.click
		  sleep 2
			self.first_task_checkbox_element.when_present.click
			self.choose_taskaction_element.when_present.select "Selected"
			self.update_taskstatus_element.when_present.click
			sleep 2
			self.text.include? "You cannot select the action before you recommend the task."
	end
	
	def upload_docnormal
			self.upload_file_element.when_present.click
			self.ndb_file_upload_input_element.when_present.set File.expand_path(File.join('.'),'app/attachment/doc_normal.docx')
			self.ndb_file_upload_btn_element.when_present.click
			sleep 1
			self.text.include? "doc_normal"
	end
	
	def upload_dayu20m
			self.upload_file_element.when_present.click
			self.ndb_file_upload_input_element.when_present.set File.expand_path(File.join('.'),'app/attachment/dayu20M.pdf')
			self.ndb_file_upload_btn_element.when_present.click
			sleep 1
			self.text.include? "dayu20M.pdf"
	end
	
	def upload_exe
			self.upload_file_element.when_present.click
			self.ndb_file_upload_input_element.when_present.set File.expand_path(File.join('.'),'app/attachment/EXE.exe')
			self.ndb_file_upload_btn_element.when_present.click
			sleep 1
			self.text.include? "Invalid file "
	end
	
	def delete_document
			message = self.alert do
			  self.del_document_element.when_present.click
			end
	end
	
	def verify_deletedocument
			self.info_after_delete_document_element.when_present.text
	end
	
	def task_feedback
	    self.task_feedback_link_element.when_present.click
			self.select_expertise_element.when_present.select("5")
			self.select_communication_element.when_present.select("5")
			self.select_professionalism_element.when_present.select("5")
			message = self.alert do
			  self.save_task_feedback_element.when_present.click
			end
			sleep 2
			message.should == "Save Successful!"
	end
	
	def kmnotes
	    self.km_note_link_element.when_present.click
	    sleep 1
	    self.input_km_note_element.when_present.clear
	    self.input_km_note_element.when_present.when_present.append "KM NOTES"
	    self.save_km_note_element.when_present.click
			self.text.include? "KM NOTES"
	end
	
	def change_to_selected
		  sleep 2
			self.first_task_checkbox_element.when_present.click
			self.choose_taskaction_element.when_present.select "Selected"
			self.update_taskstatus_element.when_present.click
			sleep 1
			self.text.include? "Change task status successfully. "
	end
	
	def change_seleted_to_arranged
		  sleep 2
			self.first_task_checkbox_element.when_present.click
			self.choose_taskaction_element.when_present.select "Arranged"
			self.update_taskstatus_element.when_present.click
			sleep 1
			self.text.include? "It’s cannot be arrange because they have not yet been approved by the Compliance Team. "
	end
	
	def send_ca
	    self.send_ca_element.when_present.click
			sleep 2
			self.compliance_send_submit_element.when_present.click
			sleep 2
			self.text.include? "Send Email Successful."
	end
	
	def sign_ca_no_document
	    message = self.alert do
	      self.sign_ca_element.when_present.click
			end
	end
	
	def resend_ca 
			self.resend_ca_element.when_present.click
			sleep 2
			self.compliance_send_submit_element.when_present.click
			sleep 2
			self.text.include? "Send Email Successful."
	end
	
	def task_list
		  self.task_list_link_element.when_present.click
	end
end