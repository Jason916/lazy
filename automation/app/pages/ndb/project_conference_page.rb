#encoding: utf-8
require File.expand_path 'app/cases/shared/action'
class ProjectConferencePage < NdbPage
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

	#create-page2 save button
	button :conference_save, :id=> "yw2"

	link :first_result, :xpath=>"//div[@id='project-grid']/table/tbody/tr[1]/td[2]/a"
	link :add_consultant, :text=>"Add Consultant"
	
	button :conference_add_consultant, :name=> "yt1"
	button :conference_add_contact, :id=> "add_contact_to_project"

	#project-page search button
	button :search_default, :name=> "yt0"

	#project-page search by users
	select_list :select_users, :id=> "ProjectSearchForm_userid"

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
	
	checkbox :click_firstpro, :id=> "project-grid_c0_0"
	select_list :select_action, :id=> "Action_type"
	link :action_update, :id=> "project_update_btn"
	select_list :onhold_list, :id=> "onhold_note"
	button :onhold_save, :xpath=> "html/body/div[5]/div[3]/div/button[1]"
	textarea :invalid_note, :id=> "invalid_note"
	button :invalid_save, :xpath=> "html/body/div[5]/div[3]/div/button[1]"
	textarea :complete_note, :id=> "complete_note"
	button :complete_save, :xpath=> "html/body/div[5]/div[3]/div/button[1]"
	
	link :delete_project, :xpath=> ".//*[@id='project-grid']/table/tbody/tr[1]/td[12]/a[2]/i"
	
	
	def goto_project
		self.search_default_element.when_present.click
		@browser.link(:text, first_project).when_present.click
	end
	
	def edit_basicinfomation
		@browser.link(:text, "Project Info").click
		sleep 1
		@browser.link(:id,"project-basic-edit").when_present.click
		@browser.select_list(:id,"ProjectConference_category").when_present.select("Capvision Live")
		@browser.text_field(:id,"ProjectConference_name").set("ATconference_project")
		@browser.textarea(:id,"ProjectConference_description").set("automation test new")
		@browser.select_list(:id,"ProjectConference_priority").select("Medium")
		@browser.text_field(:id,"ProjectConference_requestedconsultants").set("13")
		@browser.text_field(:id,"ProjectConference_price").set("1000")
		@browser.select_list(:id,"ProjectConference_currencyunit").select("USD")
		@browser.select_list(:id,"ProjectConference_timeframe").select_value("more than one month")
		@browser.link(:id,"project-basic-edit").when_present.click
		@browser.text.include? "automation test new"
	end
	def edit_projectteam
		@browser.link(:text, "Project Info").click
		sleep 1
		@browser.link(:id,"project-team-edit").when_present.click
		@browser.select_list(:id,"Team_pm").when_present.select("test_km1")
		@browser.link(:id,"project-team-edit").when_present.click
		@browser.text.include? "test_km1"
	end

	def add_consultant
		@browser.link(:text,"Add Consultant").when_present.click
		@browser.button(:name,"yt0").when_present.click
		sleep 2
		a = @browser.checkbox(:id,"yw0_c0_0").when_present.exist?
      if a.to_s == "true"
        puts "顾问添加完成"
      else
        puts "顾问添加失败！"
      end
		@browser.checkbox(:id,"yw0_c0_0").when_present.click
		@browser.button(:id, "btn-add-consultant").when_present.click
		@browser.button(:text, "Go to this project list").when_present.click
		sleep 1
		@browser.text.include? "lan"
	end
	def add_contacts
		@browser.link(:text,"Contacts Tasks").when_present.click
		sleep 3
		@browser.link(:text,"Add Contact").when_present.click
		sleep 1
		@browser.checkbox(:id,"client-contact-grid_c0_0").when_present.click
		@browser.button(:id,"add_contact_to_project").when_present.click
		@browser.button(:text,"Go to this project list").when_present.click
		sleep 3
		@browser.text.include? "Not Contacted"
	end
	
	def delete_project
	  project_name = @browser.link(:xpath, "//td[2]/a").when_present.text
	  if project_name.include? "ATconference_project"
		  @browser.i(:xpath, "//div[@id='project-grid']/table/tbody/tr[1]/td[12]/a[2]/i").when_present.click
		  @browser.alert.ok
		else
		  puts "There is no new project to delete."
	  end
	end
	
	
	
	
end	