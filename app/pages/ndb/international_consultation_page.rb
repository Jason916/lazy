#encoding: utf-8
require File.expand_path 'app/cases/shared/action'
class InternationalPage < Lol::Page
	include Action

  page_url "#{$config.host}project/internation/index/index"
  #international consultation create button
  link :button_create, :id=> "project_create_btn"
  #filling in the name of project
  text_field :international_name, :id=> "Project_name"
  #filling in the description of project
  text_field :international_description, :id=>"Project_description"
  #select the industry of project
  select_list :international_industry, :id=> "industry-selector"
  select_list :international_subindustry, :id=> "Project_industryid"
  #next button
  button :button_next, :name=> "yt0"
  button :complete_int_btn, :id=> "task-complete-form-btn"
  button :cancel_int_btn, :value=> "Cancel"
  #save button
  button :button_save, :name=> "yt0"
  #set client and contact
  span :click_client, :xpath=> "//div[@id='s2id_ProjectClient_clientid']/a/span"
  div :choose_client, :text=> "Chicago Bulls"
  text_field :click_contact, :xpath=> "//li/input"
  #div :choose_contact, :xpath=> "div[6]/ul/li/div"
  #goto 1st project of the list
  link :select_project, :xpath=> "//td[2]/a"
  
  select_list :search_by_status, :id=> "ProjectSearchForm_status" 
  select_list :list_project_action, :id=>'Action_type'
  
  #international consultation list search button
  button :button_search, :name=> "yt0"
  #select the 1st project to act
  checkbox :project_checkbox0, :id=> "project-grid_c0_0"
  #select the 2nd project to act
  checkbox :project_checkbox1, :id=> "project-grid_c0_1"
  #update action
  link :button_update, :id=> "project_update_btn"
  #on hold note
  select_list :on_hold_note, :id=> "onhold_note"
  #complete pop up info
  text_area :complete_note, :id=>"complete_note"
  checkbox :complete_email_confirm, :id=>"complete_email_confirm"
  text_field :complete_contact, :id=>"complete_contact"
  #pop-up to confirm
  button :pop_up_save, :class=>"ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only"
  #filling in invalid note 
  text_field :invalid_note, :id=> "invalid_note"

  #add consultant to project button
  link :add_consultant, :text=> "Add Consultant"
  button :search_consultant, :name=>"yt0"
  checkbox :select_consultant, :id=>"yw0_c0_0"
  button :button_add_consultant_to_project, :id=> "btn-add-consultant"
  button :goto_task_list, :text=>"Back to the project"
  button :btn_ok, :text=>"Stay"
  checkbox :select_1_consultant, :id=> "yw0_c0_1"
  checkbox :select_2_consultant, :id=> "yw0_c0_2"
  checkbox :select_3_consultant, :id=> "yw0_c0_3"
  checkbox :select_4_consultant, :id=> "yw0_c0_4"


  #select task and update
  checkbox :task_checkbox0, :id=> "task-grid_c0_0"
  checkbox :task_checkbox1, :id=> "task-grid_c0_1"
  select_list :task_action, :id=> "action"
  button :task_update, :id=> "taskupdate-btn"
  button :change_status, :id=> "change-status"
  text_field :arrange_date0, :xpath=> "//span[2]/span[2]/div/input"
  text_field :arrange_date1, :xpath=> "//div[2]/div[3]/div[1]/span[2]/span[2]/div/input"
  text_field :nick_name0, :xpath=> "//div[2]/span[2]/input"
  text_field :nick_name1, :xpath=> "//div[2]/div[3]/div[2]/span[2]/input"
  select_list :type_of_interview0, :xpath=> "//div[4]/span[2]/select"
  select_list :type_of_interview1, :xpath=> "//div[2]/div[3]/div[4]/span[2]/select"
  button :submit, :value=> "Submit"
  checkbox :send_email0, :xpath=> "//div[1]/div[2]/div[1]/span/input"
  checkbox :send_email1, :xpath=> "//div[2]/div[2]/div[1]/span/input"
  button :arrange_next, :value=> "Next"
  button :send_email_to_client, :value=>"Send Email To Client"

  checkbox :select_all, :xpath=> "//div[3]/div/div/form/div[2]/table/thead[1]/tr/th[1]/input"
  select_list :search_consultant_by_invalid, :id=> "status"

  link :compliance_info, :xpath=> "//div[3]/div/div/ul/li[3]/a"
  div :compliance_identy, :xpath=>'//div[3]/div/div/div/div/form/div[2]/div/div[1]/div[1]'
  link :task_list, :xpath=> "//div[3]/div/div/div/div/ul/li[1]/a"
  link :compliance_tnc, :id=> "compliance_tnc"
  link :compliance_ca, :id=> "compliance_ca"
  span :compliance_training, :xpath=>"//div[@id='training-button']/div/span"
  select_list :tnc, :xpath=> "//div[1]/div[2]/div/div[2]/div/form/div/div[1]/div[1]/select"
  select_list :ca, :xpath=> "//select"
  button :tnc_save, :xpath=> "//div[1]/div[2]/div/div[2]/div/form/div/div[1]/div[2]/button[1]"
  button :ca_save, :xpath=> "//div[2]/div[2]/div/div[2]/div/form/div/div[1]/div[2]/button[1]"
  element :verify_row_red_ornot, :tr ,:xpath=> "//table/tbody/tr[1]"
  link :send_ca, :xpath=>"//tr/td[18]/div[2]/a"
  link :send_ca1, :xpath=>"//tr/td[18]/div[2]/a"
  link :resend_ca, :xpath=>"//tr/td[18]/div[3]/a"
  link :sign_ca, :xpath=>"//tr[1]/td[18]/div[4]/a"
  button :btn_send_ca, :id=>"compliance-send-submit"
  link :resend_display, :xpath=>'//tr/td[20]/div[3]/a'
  div :ident_change_status, :xpath=>'//div[3]/div/div/div[1]'
  div :ident_ca_send, :xpath=>"//div[3]/div/div/div[1]"
  element :upload_ca_file, :i, :xpath=>"//tr[1]/td[18]/div[5]/a[1]/i"
  div :compliance_req, :xpath=>"//div[3]/div/div/div/div/form/div[2]/div/div[5]/div[1]"
  element :feedback, :i, :xpath=>"//div[2]/table/tbody/tr[1]/td[16]/a[2]/i"
  element :task_feedback, :i, :xpath=>"//tr/td[18]/div[1]/a[2]/i"
  div :task_feedback_popup, :xpath=>"//div[7]/div[1]"
  button :task_feedback_save, :xpath=>"//div[9]/div[3]/div/button[1]"
  button :task_feedback_save1, :xpath=>"//div[7]/div[3]/div/button"
  select_list :feedback_expertise, :id=>"expertise"
  select_list :feedback_communication, :id=>"communication"
  select_list :feedback_professionalism, :id=>"professionalism"
  span :popup_title, :id=>"ui-id-2"
  select_list :popup_service_quality, :id=>"service"
  button :feedback_save, :xpath=> "//div[6]/div[3]/div/button[1]"
  element :delete_first_project, :i, :xpath=>"//tr[1]/td[16]/a[3]/i"
  element :h1, :h1, :xpath=>"//div[3]/div/div/h1"
  button :step1_next, :id=>"yw1"
  button :step2_save, :name=>"yt0"
  text_field :edit_consultants_requested, :id=>"Project_requestedconsultants"
  text_field :edit_consultants_expected, :id=>"Project_expectedconsultants"
  text_field :edit_project_price, :id=>"Project_price"
  link :step1_cancel, :class=>"btn btn-error"
  link :first_int, :xpath=> "//div[2]/table/tbody/tr[1]/td[2]/a"
  text_area :project_description, :id=>"Project_description"
  link :project_info, :xpath=>"//div[3]/div/div/ul/li[2]/a"
  element :basic_edit_icon, :i, :xpath=>"//div[3]/div/div/div[1]/div/div[1]/a/i"
  span :project_description_display, :xpath=>"//div[3]/div/span"
  div :error_alert, :class=>"alert alert-block alert-error"
  link :client_info, :xpath=>"//div[3]/div/div/ul/li[4]/a"
  div :task_alert, :id=>"flash-alert-error"
  link :add_consultant, :xpath=>"//div[3]/div/div/form/div[1]/a[1]"
  div :search_tips, :class=>"search-tips"
  element :edit_project_team, :i, :xpath=>"//div[3]/div/div/div[1]/div/div[3]/a/i"
  select_list :project_manager_edit, :id=>"Team_pm"
  span :project_manager_display, :xpath=>"//div[3]/div/div/div[1]/div/div[3]/div/div/div[2]/div/span"
  element :operation_icons, :td, :xpath=>"//div[2]/table/tbody/tr/td[17]"
  element :approval_icon, :i, :xpath=>"//tr[2]/td[18]/div[5]/a[2]/i"
  span :client_name, :xpath=>"//div[3]/div[1]/div/div/div[1]/div[1]/span[2]"
  element :update_icon, :i, :xpath=>"//tr[2]/td[19]/div/a/i"
  select_list :type_of_interview, :id=>"ProjectInternationTask_typeofinterview"
  text_field :clear_name, :id=>"Project_name"
  text_field :clear_description, :id=>"Project_description"
  text_field :clear_startdate, :id=>"Project_starttime"
  select_list :clear_industry, :id=>"industry-selector"
  checkbox :int_checkbox0, :id=> "project-grid_c0_0"
  button :popup_save, :class=>"ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only"
  div :add_successfully, :id=>"add-consultant-dialog"
  link :km_notes, :xpath=>"//div[2]/table/tbody/tr[1]/td[7]/a"
  link :km_note, :xpath=>"//tr/td[8]/a"
  text_field :enter_value, :class=>"input-medium"
  button :btn_submit_notes, :class=>"btn btn-primary editable-submit"
  link :first_consultant_name, :xpath=>"//tr[1]/td[8]/div/a"
  img :high_rate, :xpath=>"//img"
  element :upload_file ,:i ,:xpath=> "//tr/td[18]/div[5]/a[1]/i"
  file_field :ndb_file_upload_input ,:id=> "ndb-file-upload-input"
  button :ndb_file_upload_btn ,:id=> "ndb-file-upload-upload-btn"
  link :download_file, :xpath=>'//tr/td[17]/a[1]'
  element :delete_file, :i, :xpath=>'//tr/td[17]/a[2]/i'
  link :task_manager_link, :xpath=>"//div[3]/div/div/form/div[2]/table/thead[1]/tr/th[16]/a"
  link :arrange_next_button, :xpath=>'//div[2]/div/div[1]/form/div/div/div[1]/div[2]/input[1]'
  link :arrange_send_email, :id=>'send-email'
  link :id_link, :xpath=>"//tr/th[2]/a"
  link :status_link, :xpath=>"//tr/th[3]/a"
  link :date_link, :xpath=>"//tr/th[5]/a"
  link :name_link, :xpath=>"//tr/th[9]/a"
  link :cih_link, :xpath=>"//tr/th[13]/a"
  link :coh_link, :xpath=>"//tr/th[14]/a"
  link :coc_link, :xpath=>"//tr/th[15]/a"
  link :arrange_next_button, :xpath=>'//div[2]/div/div[1]/form/div/div/div[1]/div[2]/input[1]'
  link :arrange_send_email, :id=>'send-email'
  element :edit_client_icon, :i, :xpath=>"//div[2]/a/i"
  div :choose_1_client, :text=> "研究员②号"
  text_field :client_contact1, :xpath=>"//div/ul/li/input"
  text_field :client_project_manager, :xpath=>'//div[3]/div/div/div[1]/div/div[2]/div/div/form/div[3]/div/div/ul/li/input'
  ###
  link :consultant_link0, :xpath=>'//tr[1]/td[11]/div/a'
  link :consultant_link1, :xpath=>'//tr/td[10]/div/a'
  span :capvision_approval, :xpath=>'//div[3]/div/div/div/div/form/div[2]/div/div[4]/div[2]/div/div/span[2]'
  span :client_approval, :xpath=>'//div[3]/div/div/div/div/form/div[2]/div/div[5]/div[2]/div/div/span[2]'
  div :task_grid, :xpath=>'//div/div/form/div[2]'
  element :first_task_edit_icon, :i, :xpath=>'//tr[1]/td[20]/div[1]/a[1]/i'
  checkbox :select_first_task, :id=>'task-grid_c0_0'
  element :first_task_edit_icon1, :i, :xpath=>'//tr[1]/td[17]/div[1]/a[1]/i'
  text_field :consultation_date, :id=>'ProjectInternationTask_datetimeString'
  div :task_save_alert, :xpath=>'//div[2]/div/div/div/div/form/div[1]'
  text_field :client_hour, :id=>"ProjectTaskReceipts_hours"
  text_field :billing_notes, :id=>"ProjectTaskReceipts_billnotes"
  text_field :consultant_hour, :id=>"ProjectTaskPayment_hours"
  link :btn_cancel, :text=>"Cancel"
  div :recommend_alert, :id=>"recommend-alert"
  span :set_training_for_project, :xpath=>'//div[3]/div/div/div/div/form/div[2]/div/div[3]/div[2]/div/div/span[2]'
  link :rec_step1_consultant_namelink, :xpath=>'//div[2]/div/div[1]/form/div/div/div[1]/div[1]/div[2]/span[2]/a'
  text_field :rec_step1_id, :xpath=>'//div[2]/div/div[1]/form/div/div/div[1]/div[1]/div[4]/div[1]/span[2]/input'
  span :id_alert, :xpath=>'//div[2]/div/div[1]/form/div/div/div[1]/div[1]/div[4]/div[1]/span[2]/span'
  element :rec1_choose_workexp, :i, :xpath=>"//div[2]/div/div[1]/form/div/div/div[1]/div[1]/div[4]/div[2]/span[3]/i"
  text_field :other_workexp, :xpath=>'//div[5]/div[2]/label[2]/input'
  button :workexp_pop_ok, :xpath=>'//div[5]/div[3]/div/button[1]'
  button :workexp_pop_cancel, :xpath=>'//div[5]/div[3]/div/button[2]'
  text_field :btn_rec1_cancel, :xpath=>'//div[2]/div/div[1]/form/div/div/div[1]/div[2]/input[3]'
  text_field :btn_rec1_change_status, :xpath=>'//div[2]/div/div[1]/form/div/div/div[1]/div[2]/input[2]'
  text_field :btn_rec1_next, :xpath=>'//div[2]/div/div[1]/form/div/div/div[1]/div[2]/input[1]'
  span :email_to, :xpath=>'//div/div/div[2]/div[1]/div[3]/span[1]'
  button :btn_rec2_previous, :xpath=>"//form/div/div/div[2]/div[2]/input[1]"
  button :btn_rec2_cancel, :xpath=>"//form/div/div/div[2]/div[2]/input[3]"
  text_field :btn_rec2_sendemailto, :xpath=>'//div[2]/div/div[1]/form/div/div/div[2]/div[2]/input[2]'
  button :btn_rec2_popup_continue, :xpath=>'//div[4]/div[3]/div/button[1]'
  button :btn_rec2_popup_cancel, :xpath=>'//div[4]/div[3]/div/button[2]'
  span :previous_identy, :xpath=>'//div[2]/div/div[1]/form/div/div/div[1]/div[1]/div[1]/span[1]'
  select_list :select_email_version, :xpath=>'//div[2]/div/div[1]/form/div/div/div[2]/div[1]/div[1]/span[2]/select'
  div :arrange_alert, :xpath=>'//div[3]/div/div/div[1]'
  link :arg_step1_consultant_namelink, :xpath=>'//div[2]/div/div[1]/form/div/div/div[1]/div[1]/div[1]/span[2]/a'
  text_field :arg1_consultation_date, :xpath=>'//div[2]/div/div[1]/form/div/div/div[1]/div[1]/div[3]/div[1]/span[2]/span[1]/input'
  button :btn_arg1_next, :name=>'next'
  button :btn_arg1_change_status, :value=>'Change Status'
  button :btn_arg1_cancel, :value=>'Cancel'
  span :arg1_consultation_date_alert, :xpath=>'//div[2]/div/div[1]/form/div/div/div[1]/div[1]/div[3]/div[1]/span[2]/span[4]'
  span :arg1_consultation_date_past_alert, :xpath=>'//span[5]'
  span :arg1_nickname_alert, :xpath=>'//div[2]/div/div[1]/form/div/div/div[1]/div[1]/div[3]/div[3]/span[2]'
  select_list :arg1_typeOfInterview, :xpath=>'//div[2]/div/div[1]/form/div/div/div[1]/div[1]/div[3]/div[4]/span[2]/select'
  span :arg1_typeOfInterview_alert, :xpath=>'//div[2]/div/div[1]/form/div/div/div[1]/div[1]/div[3]/div[5]/span[2]'
  checkbox :arg2_sendCalendar, :xpath=>'//div[2]/div[1]/label/input'
  span :arg2_calendarTo, :xpath=>'//div[2]/div/div[1]/form/div/div/div[2]/div[1]/div[4]/span[1]'
  button :btn_arg2_previous, :value=>'Previous'
  button :btn_arg2_cancel, :xpath=>"//div/div/div[2]/div[2]/input[3]"
  text_field :btn_arg2_sendEmailToClient, :xpath=>'//div[2]/div/div[1]/form/div/div/div[2]/div[2]/input[2]'
  button :btn_arg2_popup_ok, :xpath=>'//button'
  span :arg2_toConsultant_alert, :xpath=>'//div[2]/div/div/form/div[1]/div[1]/span[1]'
  text_field :arg2_toConsultant_byEmail, :xpath=>'//div[2]/div/div/form/div[1]/div[2]/div[1]/span/input'
  span :arg2_toConsultant_byEmail_alert, :xpath=>'//div[2]/div/div/form/div[1]/div[2]/div[2]/div[3]/span[1]'
  div :arg2_toConsultant_sendEmailSuc_alert, :xpath=>'//div[3]/div/div/div[1]'
  text_field :btn_arg2_toConsultant_submit, :xpath=>'//div[2]/div/div/form/div[2]/input[1]'
  text_field :btn_arg2_toConsultant_cancel, :xpath=>'//div[2]/div/div/form/div[2]/input[2]'
  div :complete_notContact_task_alert, :xpath=>'//div[3]/div/div/div[1]'
  text_field :complete_consultationDate, :id=>"ProjectInternationTask_datetimeString"
  select_list :complete_typeOfInterview, :id=>'ProjectInternationTask_typeofinterview'
  text_field :complete_clientHour, :id=>'ProjectTaskReceipts_hours'
  span :complete_clientHour_alert, :xpath=>'//div[2]/div/div/div/div/form/div[3]/div/div[1]/div/span'
  text_area :complete_billingNotes, :id=>'ProjectTaskReceipts_billnotes'
  span :complete_billingNotes_alert, :xpath=>'//div[2]/div/div/div/div/form/div[3]/div/div[2]/div/span'
  text_field :complete_consultantHour, :id=> "ProjectTaskPayment_hours"
  button :btn_complete_submit, :xpath=>"//form/div[4]/input[1]"
  button :btn_complete_submit1, :class=>"btn btn-primary cap-loading-submit"
  button :btn_complete_cancel, :xpath=>'//div[2]/div/div/div/div/form/div[4]/input[2]'
  div :complete_consultationDate_alert, :class=>"alert alert-block alert-error"
  text_field :complete_startTime, :id=>'ProjectInternationTask_starttimeString'
  text_field :complete_endTime, :id=>'ProjectInternationTask_endtimeString'
  div :complete_startAndEndTime_alert, :xpath=>'//div[2]/div/div/div/div/form/div[1]'
  span :completet_typeOfInterview_alert, :xpath=>'//div[2]/div/div/div/div/form/div[2]/div/div[5]/div/span'
  span :complete_consultantHour_alert, :xpath=>'//div[2]/div/div/div/div/form/div[3]/div/div[3]/div/span'
  text_field :chb_sendFebakEmailToClient, :xpath=>'//div[2]/div/div/div/div/form/label/input'
  div :sendFebakEmailToClient_alert, :xpath=>'//div[3]/div/div/div[2]'  
  element :task_status_alert, :td, :xpath=>'//div[3]/div/div/form/div[2]/table/tbody/tr/td[4]'
  text_field :chb_sendFebakEmailToConsultant, :xpath=>'//div[2]/div/div/form/label/input'
  text_field :btn_unsuccessful_submit, :xpath=>'//div[2]/div/div/form/input[1]'
  text_field :btn_unsuccessful_cancel, :xpath=>'//div[2]/div/div/form/input[2]'
  div :sendFebakEmailToConsultant_alert, :xpath=>'//div[3]/div/div/div[1]'
  element :task_list_search, :i, :xpath=>'//div[3]/div/div/form/div[1]/a[3]/i'
  text_field :listSearch_input, :xpath=>'//div[3]/div/div/form/div[1]/input[4]'
  link :pendingPage_consultantLink, :xpath=>'//div[2]/div/div/form/div[1]/div[1]/span[2]/a'
  text_field :btn_pendingPage_cancel, :xpath=>'//div[2]/div/div/form/div[2]/input[2]'
  text_field :btn_pendingPage_submit, :xpath=>'//div[2]/div/div/form/div[2]/input[1]'
  text_field :chb_pendingPage_sendEmailToConsultant, :xpath=>'//div[2]/div/div/form/div[1]/div[2]/div[1]/span/input'
  div :pendingPage_sendEmailToConsultant_alert, :xpath=>'//div[3]/div/div/div[1]'
  div :task_status, :id=>"task-grid"
  element :search_on_tasklist, :i, :xpath=>"//div/a[3]/i"
  link :verify_task_list, :xpath=>"//ul[@id='yw0']/li/a"
  #click email to on step2
  ul :input_email_on_step2, :xpath=>"//div[3]/span[2]/div/ul"
  ##consultant page input consultant name
  text_field :input_consultant_name, :id=> "keywords"
  #all alert info 
  div :all_alerts, :class=>"alert alert-block alert-error"
  #select task_manager when complete task
  select_list :select_taskmanager, :id=>"ProjectInternationTask_taskmanagerid"
  #select task_type when complete task
  select_list :select_tasktype, :id=>"ProjectInternationTask_type"
  #task start time when edit task
  text_field :task_start_time, :id=>"ProjectInternationTask_starttimeString"
  #consultant rate
  text_field :client_rate, :id=> "ProjectTaskReceipts_rate"





  def change_status_other
      self.enter_int_task_list
      self.task_checkbox0_element.when_present.click
  end
  def search_for_definite_consultant
      self.task_list_search_element.when_present.click
      self.listSearch_input = "han"
      self.search_on_tasklist_element.when_present.click
  end
  def goto_pending
      self.task_checkbox0_element.when_present.click
      self.task_action_element.when_present.select "Pending"
      self.task_update_element.when_present.click
  end
  def goto_unsuccessful
      self.enter_int_task_list
      self.task_checkbox0_element.when_present.click
      self.task_action_element.when_present.select "Unsuccessful interview"
      self.task_update_element.when_present.click
  end
  def complete_with_necInfo
      self.select_taskmanager_element.when_present.[](1).click
      self.select_tasktype_element.when_present.select "International.C"
      self.complete_consultationDate_element.when_present.set"2010-10-10"
      self.complete_startTime_element.when_present.set"13:00"
      self.complete_endTime_element.when_present.set"14:00"
      self.complete_typeOfInterview_element.when_present.select "Phone"
      self.complete_billingNotes_element.when_present.set "test billing notes"
      self.complete_clientHour_element.when_present.set"2"
      self.complete_consultantHour_element.when_present.set"2"
  end
  def set_startAndEndTime
      self.complete_startTime_element.when_present.set "12:00"
      self.complete_endTime_element.when_present.set "00:00"
  end

  def rec2_send_email_to 
      self.select_email_version_element.when_present.select "Consultation Recomendation Email(English)"
      self.choose_mail_to_send
      self.btn_rec2_sendemailto_element.when_present.click
  end
  def compliance_approval
      self.compliance_info_element.when_present.click
      self.capvision_approval_element.when_present.click
      self.client_approval_element.when_present.click
      self.task_list_element.when_present.click
  end
  def create_int
      self.button_create_element.when_present.click
      self.international_name_element.when_present.set "xtest_INT_ryan"
      self.international_description_element.when_present.set "test"
      self.international_industry_element.when_present.select "Aerospace - 航空"
      sleep 2
      self.international_subindustry_element.when_present.select "航空 - Airlines"
      self.button_next_element.when_present.click
      self.select_client
      self.select_project_team
      self.button_save_element.when_present.click
  end
  def select_client
      self.click_client_element.when_present.click 
      self.choose_client_element.when_present.click
      self.click_contact_element.when_present.set "ryan"
      sleep 2
      self.send_keys :enter
  end
  def arg1_consultation_date_clear
      self.arg1_consultation_date_element.when_present.clear
      self.send_keys :enter
  end
  def arg1_consultation_date_setToPast
      self.arg1_consultation_date_element.when_present.set "2000-10-10"
      self.send_keys :enter
      self.nick_name0_element.when_present.set "Ryan"
      self.type_of_interview0_element.when_present.select "Phone"
  end
  def enter_int_task_list
      self.button_search_element.when_present.click
      self.select_project
      self.attach_to_window(:title=>self.first_project+" - Task List - Capvision")
  end

  def search_all_status_int
      self.search_by_status_element.when_present.select "All Status"
      sleep 2
      self.button_search_element.when_present.click
  end
  def set_training
      self.compliance_info_element.when_present.click
      self.set_training_for_project_element.when_present.click
      self.task_list_element.when_present.click
  end

  def add_consultant_operation #添加顾问
			self.add_consultant_element.when_present.click
			#self.input_consultant_name_element.when_present.append "Han"
			self.search_consultant_element.when_present.click
			sleep 2
			self.select_consultant_element.when_present.click
			self.button_add_consultant_to_project_element.when_present.click
			self.goto_task_list_element.when_present.click
			# sleep 1
			# self.text.include? "Not Contacted"
  end
  def add_consultant_not_enrolled #添加enrolled的顾问
			self.add_consultant_element.when_present.click
			self.search_consultant_by_invalid_element.when_present.select "Prospect"
			self.search_consultant_element.when_present.click
			sleep 2
			self.select_consultant_element.when_present.click
			self.button_add_consultant_to_project_element.when_present.click
			self.goto_task_list_element.when_present.click
			sleep 1
			self.text.include? "Not Contacted"
  end
  def add_five_consultants #添加5个顾问
    self.add_consultant_element.when_present.click
    self.search_consultant_element.when_present.click
    sleep 2
    hidden_element
    self.select_consultant_element.when_present.click
    self.select_1_consultant_element.when_present.click
    self.select_2_consultant_element.when_present.click
    sleep 2
    self.select_3_consultant_element.when_present.click
    self.select_4_consultant_element.when_present.click
    self.button_add_consultant_to_project_element.when_present.click
    sleep 2
    self.goto_task_list_element.when_present.click
  end
  def verify_row_is_red
      self.verify_row_red_ornot_element.when_present.class_name
  end

  

  def task_feedback_info_fillin
      self.feedback_expertise_element.when_present.select "5"
      self.feedback_communication_element.when_present.select "5"
      self.feedback_professionalism_element.when_present.select "5"
      self.task_feedback_save1_element.when_present.click
  end

  
  def clear_basic
      self.clear_name_element.when_present.clear
      self.clear_description_element.when_present.clear
      self.clear_startdate_element.when_present.clear
      self.clear_industry_element.when_present.select "--Please choose--" 
  end
      
#task文档上传
  def upload_exe
      self.upload_file_element.when_present.click
      self.ndb_file_upload_input_element.when_present.set File.expand_path(File.join('.'),'app/attachment/EXE.exe')
      self.ndb_file_upload_btn_element.when_present.click
      sleep 1
      self.text.include? "Invalid file "
  end

  def upload_dayu20m
      self.upload_file_element.when_present.click
      self.ndb_file_upload_input_element.when_present.set File.expand_path(File.join('.'),'app/attachment/dayu20M.pdf')
      self.ndb_file_upload_btn_element.when_present.click
      sleep 1
      self.text.include? "dayu20M.pdf"
  end

  def upload_docnormal
      self.upload_file_element.when_present.click
      self.ndb_file_upload_input_element.when_present.set File.expand_path(File.join('.'),'app/attachment/doc_normal.docx')
      self.ndb_file_upload_btn_element.when_present.click
      sleep 1
      self.text.include? "doc_normal"
  end
#task文档上传end
  def upload_ca
      self.upload_ca_file_element.when_present.click
      self.ndb_file_upload_input_element.when_present.set File.expand_path(File.join('.'),'app/attachment/doc_normal.docx')
      self.ndb_file_upload_btn_element.when_present.click 
      self.text.include? "doc_normal"
  end
    
  def set_ca
      self.compliance_info_element.when_present.click
      self.compliance_ca_element.when_present.click
      self.ca_element.when_present.select "N/A"
      self.btn_submit_notes_element.when_present.click
  end
  def clear_project_ca
      self.enter_int_task_list
      self.compliance_info_element.when_present.click
      self.compliance_ca_element.when_present.click
      self.ca_element.when_present.select "N/A"
      self.ca_save_element.when_present.click
  end
  def clear_project_tnc
      self.enter_int_task_list
      self.compliance_info_element.when_present.click
      self.compliance_tnc_element.when_present.click
      self.tnc_element.when_present.select "N/A"
      self.tnc_save_element.when_present.click
  end
  def recommend_task
      self.task_action_element.when_present.select "Recommended"
      self.task_update_element.when_present.click
  end
  def goto_first_task_rec1_page
      self.enter_int_task_list
      self.task_checkbox0_element.when_present.click
      self.task_action_element.when_present.select "Recommended"
      self.task_update_element.when_present.click
  end
  def goto_first_task_rec2_page
      self.enter_int_task_list
      self.task_checkbox0_element.when_present.click
      self.task_action_element.when_present.select "Recommended"
      self.task_update_element.when_present.click
      self.btn_rec1_next_element.when_present.click
  end
  def arrange_first_task
      self.task_action_element.when_present.select "Arranged"
      self.task_update_element.when_present.click
  end
  def goto_first_task_arg1_page
      self.enter_int_task_list
      self.task_checkbox0_element.when_present.click
      self.task_action_element.when_present.select "Arranged"
      self.task_update_element.when_present.click
  end
  def goto_arg2_page
      self.goto_first_task_arg1_page
      self.fillin_arrange_option
      self.btn_arg1_next_element.when_present.focus
      self.btn_arg1_next_element.when_present.click
  end
  def choose_mail_to_send
      self.input_email_on_step2_element.when_present.click
      self.send_keys :enter
  end
  def goto_complete_page
      self.enter_int_task_list
      self.task_checkbox0_element.when_present.click
      self.task_action_element.when_present.select "Completed"
      self.task_update_element.when_present.click
  end
  def fillin_arrange_option
      self.arrange_date0_element.when_present.set "23:59"
      self.nick_name0_element.when_present.set "Ryan"
      self.type_of_interview0_element.when_present.select "Phone"
  end
  def complete_first_task
      self.task_action_element.when_present.select "Completed"
      self.task_update_element.when_present.click
  end
  def select_project_team
      self.select_project_manager_element.when_present.click
      #self.select_project_manager_element.when_present.click
      self.send_keys :down
      self.send_keys :enter
      self.select_skm_element.when_present.click
      self.send_keys :down
      self.send_keys :enter
      ####这块最好尽快恢复###SCAN
      #self.select_project_manager_element.when_present.select "test_km1"
      #self.select_skm_element.when_present.select "Test Skm1"
  end
  select_list :select_project_manager, :id=>"ProjectDetailForm_pm"
  select_list :select_skm, :id=>"ProjectDetailForm_skm"
  ###
  def edit_client_with_contact
      self.edit_client_icon_element.when_present.click
      #self.client_contact1_element.when_present.click
      #self.send_keys :enter
      sleep 2
      self.edit_client_icon_element.when_present.click
  end 

end