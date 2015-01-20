#encoding: utf-8
require File.expand_path 'app/cases/shared/action'
class ProjectConveyPage < Lol::Page
  include Action
	page_url "#{$config.host}/project/service/index/index"
	
	#convey-page search button
	button :search_default, :name=> "yt0"
	#convey-page search by users
	span :search_users, :xpath=> "//div[@id='s2id_ProjectSearchForm_userid']/a/span"
	div  :click_users, :text=> "Bobo_team"
	#convey-page search by participants
	select_list :search_participants, :id=> "ProjectSearchForm_participant"

	#convey-page search by industry
	select_list :search_industry, :id=> "ProjectSearchForm_industryid"

	#convey-page search by project status
	select_list :search_status, :id=> "ProjectSearchForm_status"

	#convey-page search by project type
	select_list :search_type, :id=> "ProjectSearchForm_projecttype"

	#convey-page search by keywords
	text_field :search_keywords, :id=> "ProjectSearchForm_keywords"
	
	#create button
	link :create_convey, :id=> "project_create_btn"

	#create name
	text_field :create_name, :id=> "ProjectService_name"

	#create description
	textarea :create_description, :id=> "ProjectService_description"

	#create start date
	text_field :start_date, :id=> "ProjectService_starttime"

	#create end date
	text_field :end_date, :id=> "ProjectService_endtime"

	#create industry
	select_list :create_industry, :id=> "industry-selector"

	#create consultants requested
	text_field :create_consultants_requested, :id=> "ProjectService_requestedconsultants"

	#create consultants expected
	text_field :create_consultants_expected, :id=> "ProjectService_expectedconsultants"

	#create price
	text_field :create_price, :id=> "ProjectService_price"

	#create-page next button
	button :create_next, :id=> "yw1"

	#create-page cancel button
	link :create_cancel, :text=> "Cancel"

	#create-page2 choose client
	span :choose_client_input, :xpath=> "//div[@id='s2id_ProjectClient_clientid']/a/span"
	div :choose_client_content, :text=> "cash"
	
	#create-page2 save button
	button :create_save, :id=> "yw3"
	
	#convey-page select first project
	checkbox :click_firstproject, :id=> "project-grid_c0_0"

	#convey-page select second project
	checkbox :click_secondproject, :xpath=> "//tr[2]/td/input"

	#project status-action select
	select_list :change_action, :id=> "Action_type"

	#project update status-action
	link :update_action, :id=> "project_update_btn"

	#project onhold-reason select
	select_list :onhold_note, :id=> "onhold_note"

	#project onhold-reason save
	button :onhold_save, :xpath=> "html/body/div[5]/div[3]/div/button[1]"

	#project invalid-reason input
	textarea :invalid_note, :id=> "invalid_note"

	#project invalid-reason save
	button :invalid_save, :xpath=> "html/body/div[5]/div[3]/div/button[1]"

	#project complete-reason input
	textarea :complete_note, :id=> "complete_note"

	#project complete-reason save
	button :complete_save, :xpath=> "html/body/div[5]/div[3]/div/button[1]"

	#consultant task-list edit consultant hour--------click link
	link :task_list_cohour, :xpath=> "//tr/td[10]/a"
	#consultant task-list edit consultant hour--------input hour
	text_field :cohour_input, :class=> "input-medium"
	#consultant task-list edit consultant hour--------save hour
	button :cohour_yes, :xpath=> "//div/div[1]/div[2]/button[1]"

	#consultant task-list edit consultant cash------click link
	link :task_list_cocash, :xpath=> "//tr/td[11]/a"

	#consultant task-list edit consultant cash------input number
	text_field :cocash_input, :xpath=> "//div/div[1]/div/input"

	#consultant task-list edit consultant cash------save cash
	button :cocash_save, :xpath=> "//div[6]/div[3]/div/button[1]"

	#consultant task-list upload document
	#click upload link
	element :upload_file ,:i ,:xpath=> "//div[@id='task-grid']/table/tbody/tr/td[15]/a/i"
	#upload file input
	file_field :ndb_file_upload_input ,:id=> "ndb-file-upload-input"
	#ndb file upload upload btn
  	button :ndb_file_upload_btn ,:id=> "ndb-file-upload-upload-btn"

  	#delete uploaded documnet
  	element :del_document , :i ,:xpath=> "//div[@id='task-grid']/table/tbody/tr/td[14]/a[2]/i"

	#contact - page  link
	link :contact_task, :text=> "Contacts Tasks"

	#task status select
	select_list :change_task_action, :id=> "action"

	#update task status
	button :update_task_button, :id=> "task_update_btn"

	#select first task
	checkbox :click_firsttask, :id=> "task-grid_c0_0"
	#select second task
	checkbox :click_secondtask, :id=> "task-grid_c0_1"

	#contact task-list edit date---click link
	link :contact_task_date, :xpath=> "//tr/td[7]/a"
	#contact task-list edit date---save date
	button :date_yes, :xpath=> "//div/div[1]/div[2]/button"

	#contact task-list edit client hour-----click link
	link :contact_task_hour, :xpath=> "//tr/td[8]/a"

	#contact task-list edit client hour-----input hour
	text_field :contact_hour_input, :xpath=> "//div/div[1]/div[1]/input"

	#contact task-list edit client hout------save hour
	button :clhour_yes, :xpath=> "//div/div[1]/div[2]/button[1]"

	#contact task-list edit client cash------click link
	link :contact_task_cash, :xpath=> "//tr/td[9]/a"

	#contact task-list edit client cash------input cash
	text_field :contact_cash_input, :xpath=> "//div/div[1]/div[1]/input"

	#contact task-list edit client cash------save cash
	button :clcash_yes, :xpath=> "//div/div[1]/div[2]/button[1]"

	#contact task-list edit billing notes-----click link
	link :contact_billing_notes, :xpath=> "//tr/td[10]/a"

	#contact task-list edit billing notes-----input billing notes
	text_field :contact_billnotes_input, :xpath=> "//div/div[1]/div[1]/input"

	#contact task-list edit billing notes-----save billing notes
	button :clbillnotes_yes, :xpath=> "//div/div[1]/div[2]/button[1]"

	#contact task-list edit km notes--------click link
	link :contact_kmnotes, :xpath=> "//tr/td[6]/a"

	#contact task-list edit km notes--------input notes
	text_field :contact_kmnotes_input, :xpath=> "//div/div[1]/div[1]/input"

	#contact task-list edit km notes--------save notes
	button :contact_kmnotes_yes, :xpath=> "//div/div[1]/div[2]/button[1]"

	#project-list page view icon
	link :view_project, :xpath=> "//div[@id='project-grid']/table/tbody/tr[1]/td[12]/a[1]"

	#project information page---edit basic info icon
	link :basic_edit_icon, :id=> "project-basic-edit"

	#project info page---edit team icon
	link :team_edit_icon, :id=> "project-team-edit"

	#project info page---select team manager
	select_list :select_teammanager, :id=> "Team_pm"

	#project-list page---click first project
	link :first_ges_project, :xpath=> "//td[2]/a"

	#consultant-task add consultant to project
	link :add_consultant_task, :text=> "Add Consultant"

	#consultants-page search button
	button :search_consultant, :name=> "yt0"

	#consultants-page select consultant
	checkbox :select_first_consultant, :id=> "yw0_c0_0"

	#consultants-page add consultant button
	button :add_consultant_button, :id=> "btn-add-consultant"

	#consultants-page button:Back to the project
	button :go_to_this_project_list, :text=> "Back to the project"


	#consultants_task_list edit mkt notes----click link
	link :edit_mktnotes, :xpath=> "//tr/td[8]/a"
	#consultants_task_list edit mkt notes-----input
	text_field :mktnotes_input, :class=> "input-medium"
	#consultants_task_list edit mkt notes------save
	button :mktnotes_save, :xpath=> "//div/div[1]/div[2]/button"

	#consultant_task_list edit date---click link
	link :task_list_date, :xpath=> "//tr/td[9]/a"
	#consultant_task_list edit date---save date
	button :date_yes, :xpath=> "//div/div[1]/div[2]/button"

	#consultant_task_list edit payment notes----click link
	link :edit_paymentnotes, :xpath=> "//tr/td[12]/a"
	#consultant_task_list edit payment notes----input
	text_field :paymentnotes_input, :class=> "input-medium"
	#consultant_task_list edit payment notes----save
	button :paymentnotes_save, :xpath=> "//div/div[1]/div[2]/button"

	#consultant_task_list-----high rate consultant
	img :high_rate_consultant, :xpath=> "//tr/td[4]/div/img"

	#contact-task add contact
	link :add_contact, :text=> "Add Contact"
	
	#contacts-page select first contact
	checkbox :select_first_contact, :id=> "client-contact-grid_c0_0"
	
	#contacts-page add contact to project
	button :add_contact_to_project, :id=> "add_contact_to_project"
	
	#contacts-page go to this project list
	button :add_contact_confirm, :text=> "Back to the project"

	#project-list page delete icon
	link :delete_project_icon, :xpath=> "//div[@id='project-grid']/table/tbody/tr[1]/td[12]/a[2]"

	########task_list (consultants\contacts)
	#select status
	select_list :select_status, :id=> "action"

	#update status
	button :update_status, :id=> "task_update_btn"

	#task_list select first task
	checkbox :click_firsttask, :id=> "task-grid_c0_0"
	
	##consultant page input consultant name
    text_field :input_consultant_name, :id=> "keywords"

  	#clear_num
  	span :clear_num, :class=> "editable-clear-x"

  	#alert info
  	div :all_alerts, :class=> "alert alert-block alert-error"

  	#alerts on task page of convey project
  	div :alerts_on_task_page, :class=> "mt10 alert alert-error"

  	#upload alert info
  	form :upload_alert_info, :id=> "ndb_file_upload_form"

  	#project manager
    select_list :project_manager, :id=> "ProjectAdvanceForm_pm"



	def edit_basicinfo
		self.basic_edit_icon_element.when_present.click
		sleep 1
		self.create_description = "edit basic information"
		self.create_industry_element.when_present.select "Chemicals - 化学产品"
		self.basic_edit_icon_element.when_present.click
	end

	def edit_team
		self.team_edit_icon_element.when_present.click
		sleep 1
		self.select_teammanager_element.when_present.select "hamburgerKM"
		sleep 1
		self.team_edit_icon_element.when_present.click
	end
	
	def goto_project
		self.search_default_element.when_present.click
		self.first_ges_project_element.when_present.click
		self.attach_to_window(:title=>first_project+" - Task List - Capvision")
	end
	def goto_contacts_tasks
		self.search_default_element.when_present.click
		self.first_ges_project_element.when_present.click
		self.attach_to_window(:title=>first_project+" - Task List - Capvision")
		self.contact_task_element.when_present.click
	end
	def view_project_link
		self.view_project_element.when_present.click
		sleep 2
		self.attach_to_window(:title=>first_project+" - Capvision")	
	end

	def add_consultant
			self.add_consultant_task_element.when_present.click
			self.input_consultant_name_element.when_present.append "Han"
			self.search_consultant_element.when_present.click
			sleep 2
			a = self.select_first_consultant_element.exist?
        if a.to_s == "true"
        	puts "顾问添加完成"
        else
        	puts "顾问添加失败！"
        end
			self.select_first_consultant_element.when_present.click
			self.add_consultant_button_element.when_present.click
			self.go_to_this_project_list_element.when_present.click
	end

	def upload_exe
		self.upload_file_element.when_present.click
		self.ndb_file_upload_input_element.when_present.set File.expand_path(File.join('.'),'app/attachment/EXE.exe')
		self.ndb_file_upload_btn_element.when_present.click
		sleep 1
	end

	def upload_pdfdayu20
		self.upload_file_element.when_present.click
		self.ndb_file_upload_input_element.when_present.set File.expand_path(File.join('.'),'app/attachment/dayu20M.pdf')
		self.ndb_file_upload_btn_element.when_present.click
		sleep 1
	end

	def upload_normal_document
		self.upload_file_element.when_present.click
		self.ndb_file_upload_input_element.when_present.set File.expand_path(File.join('.'),'app/attachment/NDB-Tables.doc')
		self.ndb_file_upload_btn_element.when_present.click
		sleep 1
	end

	def add_contacts
		self.contact_task_element.when_present.click
		sleep 3
		self.add_contact_element.when_present.click
		sleep 1
		self.check_select_first_contact
		self.add_contact_to_project_element.when_present.click
		self.add_contact_confirm_element.when_present.click
	end

	def delete_project
	    project_name = first_project
	    if project_name.include? "AT-Convey-project"
	  	   message = self.alert do
	  	   self.delete_project_icon_element.when_present.click
		 end
		   message.should == "Are you sure you wish to delete this project?"
		else
		   puts "There is no new project to delete."
		end  
	end
end