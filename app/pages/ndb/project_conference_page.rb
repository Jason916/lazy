#encoding: utf-8
require File.expand_path 'app/cases/shared/action'
class ProjectConferencePage < Lol::Page

  include Action
  page_url "#{$config.host}project/conference/index/index"

  #conference create
  link :conference_create, :id=> "project_create_btn"
  #create-page project type
  select_list :conference_type, :id=> "ProjectConference_category"
  #create-page project name
  text_field :conference_name, :id=> "ProjectConference_name"
  #create-page project description
  textarea :conference_description, :id=> "ProjectConference_description"
  #create-page priority
  select_list :conference_priority, :id=> "ProjectConference_priority"
  #create-page industry
  select_list :conference_industry, :id=> "industry-selector"
  #create-page secondary industry
  select_list :conference_subindus, :id=> "ProjectConference_industryid"
  #create-page consultants requested
  text_field :conference_request, :id=> "ProjectConference_requestedconsultants"
  #create-page consultants expected
  text_field :conference_expect, :id=> "ProjectConference_expectedconsultants"
  #create-page price
  text_field :conference_price, :id=> "ProjectConference_price"
  #create-page price--currency unit
  select_list :conference_currency, :id=> "ProjectConference_currencyunit"
  #create-page time frame
  select_list :conference_timeframe, :id=> "ProjectConference_timeframe"
  #create-page next step button
  button :conference_next, :id=> "yw1"
  #create-page step 1--cancel button
  link :conference_cancel, :text=> "Cancel"
  #create-page save button
  button :conference_save, :id=> "yw2"
  #consultant task page add consultant link
  link :conference_add_consultant ,:text => "Add Consultant"
  #conference list page search button
  button :search_default, :name=> "yt0"
  #project-page search by users
  span :select_users, :xpath=> "//div[@id='s2id_ProjectSearchForm_userid']/a/span"
  #click to select users
  div :click_users, :text=> "Bobo_team"
  #project-page search by participants
  select_list :select_participants, :id=> "ProjectSearchForm_participant"
  #project-page search by industry
  select_list :select_industry, :id=> "ProjectSearchForm_industryid"
  #project-page search by project status
  select_list :select_status, :id=> "ProjectSearchForm_status"
  #project-page search by project type  
  select_list :select_type, :id=> "ProjectSearchForm_projecttype"
  #project-page search by keywords
  text_field :search_keywords, :id=> "ProjectSearchForm_keywords"
  #consultant page input consultant name
  text_field :input_consultant_name, :id=> "keywords"
  #project-page first project
  checkbox :click_firstpro, :id=> "project-grid_c0_0"
  #project-page choose action type
  select_list :select_action, :id=> "Action_type"
  #project-page update link
  link :action_update, :id=> "project_update_btn"
  #project-page onhold notes
  select_list :onhold_list, :id=> "onhold_note"
  #project-page change onhold status save button
  button :onhold_save, :xpath=> "html/body/div[5]/div[3]/div/button[1]"
  #project-page invalid notes
  textarea :invalid_note, :id=> "invalid_note"
  #project-page change invalid status save button
  button :invalid_save, :xpath=> "html/body/div[5]/div[3]/div/button[1]"
  #project-page complete notes
  textarea :complete_note, :id=> "complete_note"
  #project-page change complete status save button
  button :complete_save, :xpath=> "html/body/div[5]/div[3]/div/button[1]"
  #project-page delete link
  link :delete_project, :xpath=> ".//*[@id='project-grid']/table/tbody/tr[1]/td[12]/a[2]/i"
  #conference project info page
  link :project_info ,:text => "Project Info"
  #project info page basic edit link
  link :project_basic_edit ,:id=> "project-basic-edit"
  #project info page team edit link
  link :project_team_edit ,:id => "project-team-edit"
  #project info page team_pm edit 
  select_list :team_pm ,:id => "Team_pm"
  #consultant search page first consultant
  checkbox :first_consultant ,:id => "yw0_c0_0"
  #consultant search page add consultant button
  button :add_consultant_btn ,:id => "btn-add-consultant"
  #goto project list page
  button :goto_projectlist ,:text => "Back to the project"
  #goto contacts tasks page
  link :contact_tasks ,:text => "Contacts Tasks"
  #contacts task add contact button
  link :add_contact_btn ,:text => "Add Contact"
  #checked first contact
  checkbox :client_contact_grid ,:id => "client-contact-grid_c0_0"
  #contact search page add contact to project
  button :add_contact_to_contacts_task ,:id => "add_contact_to_project"
  #goto contacts task list page
  button :goto_project_list ,:text => "Back to the project"

  #task-page select task status
  select_list :select_task_status, :id => "action"
  #task-page update task status
  button :update_task_status, :id => "task_update_btn"
  #task-page choose first-task
  checkbox :click_firsttask, :id=> "task-grid_c0_0"

  #consultant_task_page edit date----click link
  link :consultant_task_date, :xpath=> "//tr/td[9]/a"
  #consultant/contact_task_page edit date----save date
  button :date_yes, :xpath=> "//div/div[1]/div[2]/button"

  #consultant_task_page edit hour
  link :consultant_task_hour, :xpath=> "//tr/td[10]/a"
  link :consultant_task_hour1, :xpath=> "//div[2]/table/tbody/tr[2]/td[10]/a"
  text_field :consultant_hour_input, :xpath=> "//div/div[1]/div[1]/input"
  button :cohour_yes, :xpath=> "//div/div[1]/div[2]/button"

  #consultant_task_page edit mkt notes
  link :consultant_task_notes, :xpath=> "//tr/td[8]/a"
  text_field :consultant_notes_input, :xpath=> "//div/div[1]/div[1]/input"
  button :notes_yes, :xpath=> "//div/div[1]/div[2]/button"

  #consultant_task_page edit consultant cash
  link :consultant_task_cash, :xpath=> "//tr/td[11]/a"
  link :consultant_task_cash1, :xpath=> "//div[2]/table/tbody/tr[2]/td[11]/a"
  text_field :consultant_cash_input, :id=> "ProjectTaskPayment_cash"
  button :cocash_save, :xpath=> "//div[7]/div[3]/div/button[1]"
  button :cocash_cancel, :xpath=> "//div[7]/div[3]/div/button[2]"

  ############consultant_task_page upload document
  #click upload link
  element :upload_file ,:i ,:xpath=> "//div[@id='task-grid']/table/tbody/tr/td[15]/a/i"
  #upload file input
  file_field :ndb_file_upload_input ,:id=> "ndb-file-upload-input"
  #ndb file upload upload btn
    button :ndb_file_upload_btn ,:id=> "ndb-file-upload-upload-btn"

    #delete uploaded documnet
    element :del_document , :i ,:xpath=> "//div[@id='task-grid']/table/tbody/tr/td[14]/a[2]/i"

    #########################contact_tasks_page
    #contact_task_page edit date----click link
    link :contact_task_date, :xpath=> "//tr/td[8]/a"
    #contact_task_page edit date----save date 
    #与consultant——task——page save date 相同

    #contact_task_page edit hour
    link :contact_task_hour, :xpath=> "//tr/td[9]/a"
    link :contact_task_hour1, :xpath=> "//tr[2]/td[9]/a"
    text_field :contact_hour_input, :xpath=> "//div/div[1]/div[1]/input"
    button :clhour_yes, :xpath=> "//div/div[1]/div[2]/button"

    #contact_task_page edit cash
    link :contact_task_cash, :xpath=> "//tr/td[10]/a"
    link :contact_task_cash1, :xpath=> "//tr[2]/td[10]/a"
    text_field :contact_cash_input, :xpath=> "//div/div[1]/div[1]/input"
    button :clcash_yes, :xpath=> "//div/div[1]/div[2]/button"

    #contact_task_page edit km notes
    link :contact_task_kmnotes, :xpath=> "//tr/td[7]/a"
    text_field :contact_kmnotes_input, :xpath=> "//div/div[1]/div[1]/input"
    button :kmnotes_yes, :xpath=> "//div/div[1]/div[2]/button"
    #alert info
    div :all_alerts, :class=> "alert alert-block alert-error"

    #project team info
    div :project_team_info, :id=>"project-team-info"

    #project manager
    select_list :project_manager, :id=>"ProjectAdvanceForm_pm"


  def goto_project
    self.search_default
    first_project_text =  first_project
    self.link(:text, first_project_text).when_present.click
    self.attach_to_window(:title=>first_project+" - Task List - Capvision")
  end
  def goto_contacts_tasks
    self.search_default
    first_project_text =  first_project
    self.link(:text, first_project_text).when_present.click
    self.attach_to_window(:title=>first_project+" - Task List - Capvision")
    self.contact_tasks_element.when_present.click
  end
  #create conference project
  def create_project
    self.conference_create
    self.conference_name = "ATconference_project"
    self.conference_description = 'automation test'
    self.conference_priority = 'High'
    self.conference_industry = 'Food & Beverage - 食品饮料'
    self.conference_request = '10'
    self.conference_expect = '12'
    self.conference_price ='888'
    self.conference_timeframe = 'In one month'
    self.conference_next
    self.project_manager_element.when_present.select "test_km1"
    self.conference_save
  end
  #edit project info basicinformation
  def edit_basicinfomation
    self.project_info
    sleep 1
    self.project_basic_edit
    sleep 1
    self.conference_type = "Capvision Live"
    self.conference_name = "ATconference_project"
    self.conference_description = "automation test new"
    self.conference_priority = "Medium"
    self.conference_request = "13"
    self.conference_price = "1000"
    self.conference_currency = "USD"
    self.conference_timeframe = "More than one month"
    sleep 1
    hidden_element  
    self.project_basic_edit
  end
  #edit project info project team
  def edit_projectteam
    self.project_info
    sleep 1
    self.project_team_edit
    sleep 1
    self.team_pm = "test_km1"
    self.project_team_edit
  end
  #consultant task page add consultants
  def add_consultant
    self.conference_add_consultant
    sleep 2
    self.input_consultant_name_element.when_present.append "Han"
    self.search_default
    sleep 2
        self.check_first_consultant
        sleep 3
        self.add_consultant_btn
        sleep 4
        self.goto_projectlist
    sleep 2
  end
  #contact task page add contacts
  def add_contacts
    self.contact_tasks_element.when_present.click
    sleep 3
    self.add_contact_btn_element.when_present.click
    sleep 2
    self.client_contact_grid_element.when_present.click
    sleep 2
    self.add_contact_to_contacts_task_element.when_present.click
    sleep 4
    self.goto_project_list_element.when_present.click
    sleep 2
  end
  #delete conference project
  def delete_project
    project_name = @browser.link(:xpath, "//td[2]/a").when_present.text
    if project_name.include? "ATconference_project"
      @browser.i(:xpath, "//div[@id='project-grid']/table/tbody/tr[1]/td[12]/a[2]/i").when_present.click
      @browser.alert.ok
    else
      puts "There is no new project to delete."
    end
  end

  def upload_pdfdayu20
    self.upload_file_element.when_present.click
    self.ndb_file_upload_input_element.when_present.set File.expand_path(File.join('.'),'app/attachment/dayu20M.pdf')
    self.ndb_file_upload_btn_element.when_present.click
    sleep 1
  end
  def upload_normal_doc
    self.upload_file_element.when_present.click
    self.ndb_file_upload_input_element.when_present.set File.expand_path(File.join('.'),'app/attachment/NDB-Tables.doc')
    self.ndb_file_upload_btn_element.when_present.click
    sleep 1
  end
  def upload_normal_docx
    self.upload_file_element.when_present.click
    self.ndb_file_upload_input_element.when_present.set File.expand_path(File.join('.'),'app/attachment/sprint1.docx')
    self.ndb_file_upload_btn_element.when_present.click
    sleep 2
  end
  def upload_normal_xls
    self.upload_file_element.when_present.click
    self.ndb_file_upload_input_element.when_present.set File.expand_path(File.join('.'),'app/attachment/xls.xls')
    self.ndb_file_upload_btn_element.when_present.click
    sleep 2
  end
  def upload_normal_xlsx
    self.upload_file_element.when_present.click
    self.ndb_file_upload_input_element.when_present.set File.expand_path(File.join('.'),'app/attachment/xlsx.xlsx')
    self.ndb_file_upload_btn_element.when_present.click
    sleep 2
  end
  def upload_normal_msg
    self.upload_file_element.when_present.click
    self.ndb_file_upload_input_element.when_present.set File.expand_path(File.join('.'),'app/attachment/test_msg_file.msg')
    self.ndb_file_upload_btn_element.when_present.click
    sleep 2
  end
  def  upload_normal_ppt
    self.upload_file_element.when_present.click
    self.ndb_file_upload_input_element.when_present.set File.expand_path(File.join('.'),'app/attachment/test.ppt')
    self.ndb_file_upload_btn_element.when_present.click
    sleep 2
  end
  def upload_normal_pptx
    self.upload_file_element.when_present.click
    self.ndb_file_upload_input_element.when_present.set File.expand_path(File.join('.'),'app/attachment/test.pptx')
    self.ndb_file_upload_btn_element.when_present.click
    sleep 2
  end
  def upload_normal_exe
    self.upload_file_element.when_present.click
    self.ndb_file_upload_input_element.when_present.set File.expand_path(File.join('.'),'app/attachment/EXE.exe')
    self.ndb_file_upload_btn_element.when_present.click
    sleep 2
  end
  def delete_document
    message = self.alert do
        self.del_document_element.when_present.click
    end
  end
end 

