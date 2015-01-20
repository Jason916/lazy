#encoding: utf-8
require File.expand_path 'app/cases/shared/action'
class InternationalPage < NdbPage
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
  button :button_next, :id=> "yw1"
  #save button
  button :button_save, :id=> "yw4"
  #set client and contact
  span :click_client, :xpath=> "//div[@id='s2id_ProjectClient_clientid']/a/span"
  div :choose_client, :text=> "Chicago Bulls"
  text_field :click_contact, :xpath=> "div[1]/div/div[2]/div/div/ul/li/input"
  div :choose_contact, :text=> "ryan"
  #goto 1st project of the list
  link :select_project, :xpath=> "//td[2]/a"
 
  select_list :search_by_status, :id=> "ProjectSearchForm_status" 
  

  #international consultation list search button
  button :button_search, :name=> "yt0"
  #select the 1st project to act
  checkbox :project_checkbox0, :id=> "project-grid_c0_0"
  #select the 2nd project to act
  checkbox :project_checkbox1, :id=> "project-grid_c0_1"
  #select one action
  select_list :action, :id=> "Action_type"
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
  button :goto_task_list, :text=>"Go to this project list"
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
  text_field :arrange_date0, :xpath=> "//div[1]/div[3]/div[1]/span[2]/span[2]/div/input"
  text_field :arrange_date1, :xpath=> "//div[2]/div[3]/div[1]/span[2]/span[2]/div/input"
  text_field :nick_name0, :xpath=> "//div[1]/div[3]/div[2]/span[2]/input"
  text_field :nick_name1, :xpath=> "//div[2]/div[3]/div[2]/span[2]/input"
  select_list :type_of_interview0, :xpath=> "//div[1]/div[3]/div[4]/span[2]/select"
  select_list :type_of_interview1, :xpath=> "//div[2]/div[3]/div[4]/span[2]/select"
  button :submit, :value=> "Submit"
  checkbox :send_email0, :xpath=> "//div[1]/div[2]/div[1]/span/input"
  checkbox :send_email1, :xpath=> "//div[2]/div[2]/div[1]/span/input"
  button :arrange_next, :value=> "Next"
  button :send_email_to_client, :value=>"Send Email To Client"

  checkbox :select_all, :xpath=> "//div[3]/div/div/form/div[2]/table/thead[1]/tr/th[1]/input"
  select_list :search_consultant_by_invalid, :id=> "status"

  link :compliance_info, :xpath=> "//div[3]/div/div/ul/li[3]/a"
  link :task_list, :xpath=> "//div[3]/div/div/div/div/ul/li[1]/a"
  link :compliance_tnc, :id=> "compliance_tnc"
  link :compliance_ca, :id=> "compliance_ca"
  select_list :tnc, :xpath=> "//div[1]/div[2]/div/div[2]/div/form/div/div[1]/div[1]/select"
  select_list :ca, :xpath=> "//div[2]/div[2]/div/div[2]/div/form/div/div[1]/div[1]/select"
  button :tnc_save, :xpath=> "//div[1]/div[2]/div/div[2]/div/form/div/div[1]/div[2]/button[1]"
  button :ca_save, :xpath=> "//div[2]/div[2]/div/div[2]/div/form/div/div[1]/div[2]/button[1]"

  def select_client
    self.click_client_element.when_present.click 
    self.choose_client_element.when_present.click
    self.click_contact_element.when_present.click
    self.choose_contact_element.when_present.click
  end


  def add_consultant
			self.add_consultant_element.when_present.click
			self.search_consultant_element.when_present.click
			sleep 2
			self.select_consultant_element.when_present.click
			self.button_add_consultant_to_project_element.when_present.click
			self.goto_task_list_element.when_present.click
			sleep 1
			self.text.include? "Not Contacted"
  end
  def add_consultant_not_enrolled
			self.add_consultant_element.when_present.click
			self.search_consultant_by_invalid_element.when_present.select "Invalid"
			self.search_consultant_element.when_present.click
			sleep 2
			self.select_consultant_element.when_present.click
			self.button_add_consultant_to_project_element.when_present.click
			self.goto_task_list_element.when_present.click
			sleep 1
			self.text.include? "Not Contacted"
  end
  def add_five_consultants
    self.add_consultant_element.when_present.click
    self.search_consultant_element.when_present.click
    sleep 2
    self.select_consultant_element.when_present.click
    self.select_1_consultant_element.when_present.click
    self.select_2_consultant_element.when_present.click
    self.select_3_consultant_element.when_present.click
    self.select_4_consultant_element.when_present.click
    self.button_add_consultant_to_project_element.when_present.click
    sleep 2
    self.goto_task_list_element.when_present.click
  end

  #  def add_consultant_blacklist
		# 	self.add_consultant_element.when_present.click
		# 	self.search_consultant_by_invalid_element.when_present.select "Blacklist"
		# 	self.search_consultant_element.when_present.click
		# 	sleep 2
		# 	self.select_consultant_element.when_present.click
		# 	self.button_add_consultant_to_project_element.when_present.click
		# 	self.goto_task_list_element.when_present.click
		# 	sleep 1
		# 	self.text.include? "Not Contacted"
  # end
end