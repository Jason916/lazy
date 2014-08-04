#encoding: utf-8
require File.expand_path 'app/cases/shared/action'
class CapvisionDataPage < NdbPage
	include Action
	page_url "#{$config.host}"

	link :capvisiondataList, :href=>"/project/data/index/index"
	link :create_capvisiondata, :href=>"/project/data/index/createbasic"
	text_field :capdataName, :id=>"ProjectData_name"
	text_area :description, :id=>"ProjectData_description"
	select_list :priority , :id=>"ProjectData_priority"
	text_field :starttime , :id=>"ProjectData_starttime"
	select_list :industry , :id=>"industry-selector"
	text_field :requestconsultants , :id=>"ProjectData_requestedconsultants"
	text_field :expectedconsultants , :id=>"ProjectData_expectedconsultants"
	text_field :price , :id=>"ProjectData_price"
	button :next , :id=>"yw1"
	select_list :projectManager , :id=>"ProjectAdvanceForm_pm"
	checkbox :supportMember , :text=>"Jun Wei"
	button :save , :id=>"yw2"
	select_list :search_status , :id=>"ProjectSearchForm_status"
	text_field :keywords_project , :id=>"ProjectSearchForm_keywords"
	button :search , :value=>"Search"
	link :projectList ,:xpath=>"//div[@id='project-grid']/table/tbody/tr[1]/td[2]/a"
	checkbox :grid1 , :id=>"project-grid_c0_0"
	checkbox :grid2,:id=>"project-grid_c0_1"
	select_list :actionType , :id=>"Action_type"
	link :update_project ,:id=>"project_update_btn"
	select_list :onholdnote ,:id=>"onhold_note"
	button :save_project, :text=>"Save"
	text_area :invalidnote,:id=>"invalid_note"
	text_area :completenote,:id=>"complete_note"
	link :add_task,:xpath=>"//div[3]/div/div/form/div[1]/a"
	button :search_consultant,:text=>"Search"
	checkbox :frist_consultant,:id=>"yw0_c0_0"
	button :add_consultant_to_project ,:id=>"btn-add-consultant"
	button :goto_project ,:text=>"Go to this project list"
	link :edit_mkt_notes,:xpath=>"//div[3]/div/div/form/div[2]/table/tbody/tr[1]/td[7]/a"
	text_field :input_mkt_notes,:xpath=>"//div[3]/div/div/form/div[2]/table/tbody/tr[1]/td[7]/div/div[2]/div/form/div/div[1]/div[1]/input"
	button :save_mkt_notes,:xpath=>"//div[3]/div/div/form/div[2]/table/tbody/tr[1]/td[7]/div/div[2]/div/form/div/div[1]/div[2]/button[1]"
	link :edit_date,:xpath=>"//div[3]/div/div/form/div[2]/table/tbody/tr[1]/td[8]/a"
	button :save_date,:xpath=>"//div[3]/div/div/form/div[2]/table/tbody/tr[1]/td[8]/div/div[2]/div/form/div/div[1]/div[2]/button[1]"
	link :edit_hours,:xpath=>"//div[3]/div/div/form/div[2]/table/tbody/tr[1]/td[9]/a"
	text_field :input_hours,:xpath=>"//div[3]/div/div/form/div[2]/table/tbody/tr[1]/td[9]/div/div[2]/div/form/div/div[1]/div[1]/input"
	button :save_hours,:xpath=>"//div[3]/div/div/form/div[2]/table/tbody/tr[1]/td[9]/div/div[2]/div/form/div/div[1]/div[2]/button[1]"
	link :edit_cash,:xpath=>"//div[3]/div/div/form/div[2]/table/tbody/tr[1]/td[10]/a"
	text_field :input_cash,:id=>"ProjectTaskPayment_cash"
	button :save_cash,:xpath=>"//div[6]/div[3]/div/button[1]"
	link :edit_notes,:xpath=>"//div[3]/div/div/form/div[2]/table/tbody/tr[1]/td[11]/a"
	text_field :input_notes,:xpath=>"//div[3]/div/div/form/div[2]/table/tbody/tr[1]/td[11]/div/div[2]/div/form/div/div[1]/div[1]/input"
	button :save_notes,:xpath=>"//div[3]/div/div/form/div[2]/table/tbody/tr[1]/td[11]/div/div[2]/div/form/div/div[1]/div[2]/button[1]"
	checkbox :first_task ,:id=>"task-grid_c0_0"
	select_list :task_action,:id=>"action"
	button :task_update,:id=>"task_update_btn"
	div :message,:xpath=>"//div[3]/div/div/div[1]"

 	button :search_contact,:text=>"Search"
 	checkbox :first_contact,:id=>"client-contact-grid_c0_0"
 	button :add_contact_to_project,:xpath=>"//div[2]/div/div/form[2]/div[1]/input"
 	button :goto_contact_tasklist,:xpath=>"//div[4]/div[3]/div/button[1]"
 	link :edit_contact_km_notes,:xpath=>"//div[3]/div/div/form/div[2]/table/tbody/tr[1]/td[6]/a"
 	text_field :input_contact_km_notes,:xpath=>"//div[3]/div/div/form/div[2]/table/tbody/tr[1]/td[6]/div/div[2]/div/form/div/div[1]/div[1]/input"
 	button :save_contact_km_notes,:xpath=>"//div[3]/div/div/form/div[2]/table/tbody/tr[1]/td[6]/div/div[2]/div/form/div/div[1]/div[2]/button[1]"
 	link :contact_task,:text=>"Contacts Tasks"
 	text_field :input_contact_client_hours,:xpath=>"//div[3]/div/div/form/div[2]/table/tbody/tr[1]/td[8]/div/div[2]/div/form/div/div[1]/div[1]/input"
 	text_field :input_contact_billnotes,:xpath=>"//div[3]/div/div/form/div[2]/table/tbody/tr[1]/td[10]/div/div[2]/div/form/div/div[1]/div[1]/input"
 	button :save_contact_bill_notes,:xpath=>"//div[3]/div/div/form/div[2]/table/tbody/tr[1]/td[10]/div/div[2]/div/form/div/div[1]/div[2]/button[1]"
 	link :clear_date,:xpath=>"//div[3]/div/div/form/div[2]/table/tbody/tr[1]/td[7]/div/div[2]/div/form/div/div[1]/div[1]/div[2]/a"
 	div :contact_message,:xpath=>"//div[3]/div/div/div"
 	checkbox :first_contact_task ,:id=>"task-grid_c0_0"

 	def add_consultant_task
            self.capvisiondataList
            sleep 1
            self.search_status = 'In Process'
            self.search
            sleep 1
            self.projectList
            sleep 1
            self.attach_to_window(:title => self.first_project + " - Task List - Capvision")
            self.add_task
            sleep 1
            self.attach_to_window(:title => "Consultants search - Capvision")
            self.search_consultant
            sleep 1
            self.check_frist_consultant
            sleep 1
            self.add_consultant_to_project
            sleep 5
            self.goto_project
      end

      def add_contact_task
      		self.capvisiondataList
            sleep 1
            self.search_status = 'In Process'
            self.search
            sleep 1
            self.projectList
            sleep 1
            self.attach_to_window(:title => self.first_project + " - Task List - Capvision")
            self.contact_task
            self.add_task
            sleep 1
            self.attach_to_window(:title => "Contacts - Capvision")
            self.search_contact
            sleep 1
            self.check_first_contact
            sleep 1
            self.add_contact_to_project
            sleep 5
            self.goto_contact_tasklist
      end
end