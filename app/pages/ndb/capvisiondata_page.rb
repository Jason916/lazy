#encoding: utf-8
require File.expand_path 'app/cases/shared/action'
class CapvisionDataPage < Lol::Page
	include Action
	page_url "#{$config.host}"

	#进入data项目中
	link :capvisiondataList, :href=>"/project/data/index/index"
	#创建data项目链接
	link :create_capvisiondata, :href=>"/project/data/index/createbasic"
	#项目名字
	text_field :capdataName, :id=>"ProjectData_name"
	#描述
	text_area :description, :id=>"ProjectData_description"
	#优先级
	select_list :priority , :id=>"ProjectData_priority"
	#开始时间
	text_field :starttime , :id=>"ProjectData_starttime"
  #结束时间
  text_field :endtime , :id=>"ProjectData_endtime"
	#主行业-子行业
	select_list :industry , :id=>"industry-selector"
	#项目需要的顾问人数
	text_field :requestconsultants , :id=>"ProjectData_requestedconsultants"
	#项目预期的顾问人数
	text_field :expectedconsultants , :id=>"ProjectData_expectedconsultants"
	#项目价格
	text_field :price , :id=>"ProjectData_price"
	#下一步按钮
	button :next , :id=>"yw1"
	#项目manager
	select_list :projectManager , :id=>"ProjectAdvanceForm_pm"
	#项目supportmember
	checkbox :supportMember , :text=>"Jun Wei"
	#保存
	button :save , :id=>"yw2"
	#项目status
	select_list :search_status , :id=>"ProjectSearchForm_status"
	#关键字搜索
	text_field :keywords_project , :id=>"ProjectSearchForm_keywords"
	#seach按钮
	button :search , :value=>"Search"
	#data service list
	link :projectList ,:xpath=>"//div[@id='project-grid']/table/tbody/tr[1]/td[2]/a"
	#list上第一行的checkbox
	checkbox :grid1 , :id=>"project-grid_c0_0"
	#list上第二行的checkbox
	checkbox :grid2,:id=>"project-grid_c0_1"
	#更改type类型
	select_list :actionType , :id=>"Action_type"
	#update链接
	link :update_project ,:id=>"project_update_btn"
	#状态修改为on-hold时填写的notes
	select_list :onholdnote ,:id=>"onhold_note"
	#更改状态完成后点击保存按钮
	button :save_project, :text=>"Save"
	#状态修改为invalid时填写的notes
	text_area :invalidnote,:id=>"invalid_note"
	#状态修改为complete时填写的notes
	text_area :completenote,:id=>"complete_note"
	#点击添加task链接
	link :add_task,:xpath=>"//div[3]/div/div/form/div[1]/a"
	#添加task时进入consultant页面搜索全部
	button :search_consultant,:text=>"Search"
	#第一行顾问的checkbox
	checkbox :first_consultant,:id=>"yw0_c0_0"
  #第二行顾问的checkbox
  checkbox :second_consultant,:id=>"yw0_c0_1"
	#点击add consultant to project按钮
	button :add_consultant_to_project ,:id=>"btn-add-consultant"
	#弹框中点击go to project 按钮
	button :goto_project ,:text=>"Back to the project"
	#编辑consultant task中mkt-notes字段
	link :edit_mkt_notes,:xpath=>"//tr[1]/td[8]/a"
	link :edit_mkt_notes_contact,:xpath=>"//tr/td[7]/a"
	#对mkt-notes字段输入值
	text_field :input_mkt_notes,:xpath=>"//div[1]/div[1]/input"
	#保存mkt-notes的值
	button :save_mkt_notes,:xpath=>"//div[2]/button"
	#编辑consultant task中date字段
	link :edit_date,:xpath=>"//div[3]/div/div/form/div[2]/table/tbody/tr[1]/td[8]/a"
	#保存date的值
	button :save_date,:xpath=>"//div[2]/button"
	#编辑consultant task中的hours
	link :edit_hours,:xpath=>"//div[3]/div/div/form/div[2]/table/tbody/tr[1]/td[10]/a"
	#对consultant hours输入值
	text_field :input_hours,:xpath=>"//div[1]/div[1]/input"
	#保存hours的值
	button :save_hours,:xpath=>"//div[3]/div/div/form/div[2]/table/tbody/tr[1]/td[10]/div/div[2]/div/form/div/div[1]/div[2]/button[1]"
	#编辑consultant cash字段
	link :edit_cash,:xpath=>"//tr/td[9]/a"
	#update payment cash on consultant task page
	link :update_payment_cash,:xpath=>"//tr/td[11]/a"
    #edit contact billing notes
    link :edit_billing_notes,:xpath=>"//td[10]/a"
	#输入cash值

	text_field :input_cash,:id=>"ProjectTaskPayment_cash"
	#保存cash的值
	button :save_cash,:xpath=>"//div[6]/div[3]/div/button[1]"

	#编辑notes信息
	link :edit_notes,:xpath=>"//div[3]/div/div/form/div[2]/table/tbody/tr[1]/td[12]/a"
	#输入notes信息
	text_field :input_notes,:xpath=>"//div[1]/div[1]/input"
	#保存notes信息
	button :save_notes,:xpath=>"//div[3]/div/div/form/div[2]/table/tbody/tr[1]/td[12]/div/div[2]/div/form/div/div[1]/div[2]/button[1]"
	#consultant task中选择第一个task的checkbox

	checkbox :first_task ,:id=>"task-grid_c0_0"
  #consultant task中选择第二个task的checkbox
  checkbox :second_task,:id=>"task-grid_c0_1"
	#consultant task中选择action
	select_list :task_action,:id=>"action"
	#consultant task中点击update按钮
	button :task_update,:id=>"task_update_btn"
	#状态更改成功后的提示信息
	div :message,:xpath=>"//div[3]/div/div/div[1]"
	#contact task中添加contact时搜索全部
 	button :search_contact,:text=>"Search"
 	#contact task中选择的第一个task的checkbox
 	checkbox :first_contact,:id=>"client-contact-grid_c0_0"
  #contact task中选择的第二个task的checkbox
  checkbox :sencond_contact,:id=>"client-contact-grid_c0_1"
 	#选择contact list页面中第一个checkbox
 	checkbox :first_contact_task ,:id=>"task-grid_c0_0"
 	#点击contact list页面中add contact to project按钮
 	button :add_contact_to_project,:xpath=>"//div[2]/div/div/form[2]/div[1]/input"
 	#弹框中点击goto contact tasklist按钮
 	button :goto_contact_tasklist,:xpath=>"//div[4]/div[3]/div/button[1]"
 	#contact task中编辑km notes字段
 	link :edit_contact_km_notes,:xpath=>"//div[3]/div/div/form/div[2]/table/tbody/tr[1]/td[6]/a"
 	#输入km notes字段
 	text_field :input_contact_km_notes,:xpath=>"//div[3]/div/div/form/div[2]/table/tbody/tr[1]/td[6]/div/div[2]/div/form/div/div[1]/div[1]/input"
 	#保存km notes字段
 	button :save_contact_km_notes,:xpath=>"//div[3]/div/div/form/div[2]/table/tbody/tr[1]/td[6]/div/div[2]/div/form/div/div[1]/div[2]/button[1]"
 	#点击某个项目进入contact task的页面中
 	link :contact_task,:text=>"Contacts Tasks"
 	#contact task中输入client hours
 	text_field :input_contact_client_hours,:xpath=>"//div[3]/div/div/form/div[2]/table/tbody/tr[1]/td[8]/div/div[2]/div/form/div/div[1]/div[1]/input"
 	#contact task中输入bill notes
 	text_field :input_contact_billnotes,:xpath=>"//div/input"
 	#contact task中保存bill notes
 	button :save_contact_bill_notes,:xpath=>"//div[2]/button"
 	#点击日历控件中的clear链接
 	link :clear_date,:xpath=>"//div[2]/a"
 	#contact task中状态修改成功后的提示信息
 	div :contact_message,:xpath=>"//div[3]/div/div/div"
 	#删除项目图标
 	element :delete_project,:i,:xpath=>"//tr/td[10]/a[2]/i"
    #manage信息
    td :manager_text,:xpath=> "//tr/td[8]"
    #error信息
 	div :alert_error ,:xpath=>"//div[1]/div/div[1]"
    #进入project info页面
 	link :project_info,:text=>"Project Info"
    #编辑basic info信息
    link :edit_basicinfo,:id=>"project-basic-edit"
    #编辑project team信息
    link :edit_projectteam,:id=>"project-team-edit"
    #编辑team pm信息
    select_list :edit_project_manager,:id=>"Team_pm"
    #选择other弹出area
    text_area :other_area_notes,:id=>"other_area"
    #上传文档
    element :upload_contask, :i ,:xpath=>"//tr/td[15]/a/i"
    #选择文档
    file_field :select_attachment,:id=>"ndb-file-upload-input"
    #上传button
    button :upload_attachment,:id=>"ndb-file-upload-upload-btn"
    #根据user筛选
    span :click_to_select_user, :xpath=>"//div[@id='s2id_ProjectSearchForm_userid']/a/span"
    div :select_user_to_search, :text=>"test_km1"
    #根据participant筛选
    select_list :search_byparticipant,:id=>"ProjectSearchForm_participant"
    #根据industry筛选
    select_list :search_byindustry,:id=>"ProjectSearchForm_industryid"
    #查看图标
    element :view_project,:i,:xpath=>"//tr/td[10]/a[1]/i"
    #list页面根据project排序
    link :sort_project,:xpath=>"//div[3]/div/div/form/div[2]/table/thead[1]/tr/th[2]/a"
    #list页面根据priority排序
    link :sort_priority,:xpath=>"//div[3]/div/div/form/div[2]/table/thead[1]/tr/th[3]/a"
    #list页面根据startdate排序
    link :sort_startdate,:xpath=>"//div[3]/div/div/form/div[2]/table/thead[1]/tr/th[4]/a"
    #list页面根据status排序
    link :sort_status,:xpath=>"//div[3]/div/div/form/div[2]/table/thead[1]/tr/th[5]/a"
    #consultant task页面根据status排序
    link :consultant_task_sort_status,:xpath=>"//div[3]/div/div/form/div[2]/table/thead[1]/tr/th[3]/a"
    #consultant task页面根据date排序
    link :consultant_task_sort_date,:xpath=>"//div[3]/div/div/form/div[2]/table/thead[1]/tr/th[9]/a"
    #consultant task页面根据coh排序
    link :consultant_task_sort_coh,:xpath=>"//div[3]/div/div/form/div[2]/table/thead[1]/tr/th[10]/a"
    #consultant task页面根据coc排序
    link :consultant_task_sort_coc,:xpath=>"//div[3]/div/div/form/div[2]/table/thead[1]/tr/th[11]/a"
    #consultant task页面根据manager排序
    link :consultant_task_sort_manager,:xpath=>"//div[3]/div/div/form/div[2]/table/thead[1]/tr/th[13]/a"
    #contact task页面根据status排序
    link :contact_task_sort_status,:xpath=>"//div[3]/div/div/form/div[2]/table/thead[1]/tr/th[2]/a"
    #contact task页面根据clh排序
    link :contact_task_sort_clh,:xpath=>"//div[3]/div/div/form/div[2]/table/thead[1]/tr/th[8]/a"
    #contact task页面根据clc排序
    link :contact_task_sort_clc,:xpath=>"//div[3]/div/div/form/div[2]/table/thead[1]/tr/th[9]/a"


 	#创建data项目
 	def create_dataservice_project
 			self.capvisiondataList
            sleep 1
            self.create_capvisiondata
            self.capdataName = "ATcapvisiondata_test#{rand(1000)}"
            self.description = "lol---------"
            self.priority_element[1].click
            self.industry_element[13].click
            self.requestconsultants = "#{rand(10000)}"
            self.expectedconsultants = "#{rand(10000)}"
            self.price = "#{rand(1000)}"
            self.next
            self.projectManager_element[3].click
            self.save
 	end

 	#验证consultants requested字段
 	def validate_consultants_requested
 		self.capvisiondataList
 		sleep 1
 		self.create_capvisiondata
 		self.capdataName = "ATcapvisiondata_test#{rand(1000)}"
        self.description = "lol---------"
        self.priority = "High"
        self.industry = "Agriculture - 农业"
        self.requestconsultants = "ABC"
        self.next
 	end
 	#验证consultants expected字段
 	def validate_consultants_expected
 		self.capvisiondataList
 		sleep 1
 		self.create_capvisiondata
 		self.capdataName = "ATcapvisiondata_test#{rand(1000)}"
        self.description = "lol---------"
        self.priority = "High"
        self.industry = "Agriculture - 农业"
        self.requestconsultants = "12"
        self.expectedconsultants = "ABC"
        self.next
 	end
 	#验证price字段
 	def validate_price
 		self.capvisiondataList
 		sleep 1
 		self.create_capvisiondata
 		self.capdataName = "ATcapvisiondata_test#{rand(1000)}"
        self.description = "lol---------"
        self.priority = "High"
        self.industry = "Agriculture - 农业"
        self.requestconsultants = "12"
        self.expectedconsultants = "10"
        self.price = "ABC"
        self.next
 	end
    def goto_project_info
        self.capvisiondataList
        sleep 1
        self.search_status = 'In Process'
        self.search
        sleep 1
        self.projectList
        sleep 1
        self.attach_to_window(:title => self.first_project + " - Task List - Capvision")
        self.project_info
    end
 	#编辑basic info
 	def edit_basic_info
        self.edit_basicinfo
        sleep 1
        self.capdataName = "edit_dataname"
        sleep 1
        hidden_element
        self.edit_basicinfo
 	end
    #编辑basic info必填项为空
    def verification_edit_basic_info_empty
        self.edit_basicinfo
        sleep 1
        self.capdataName = ""
        self.description = ""
        self.starttime = ""
        self.industry = "--Please choose--"
        sleep 1
        hidden_element
        self.edit_basicinfo
    end
    def starttime_more_than_endtime
        self.edit_basicinfo
        sleep 1
        self.starttime = "2014-08-21"
        self.endtime = "2014-08-20"
        hidden_element
        self.edit_basicinfo
    end
    #编辑project team
    def edit_project_team
        self.edit_projectteam
        sleep 1
        self.edit_project_manager = "test_km1"
        sleep 1
        hidden_element
        self.edit_projectteam
    end
    #不选择consultant task直接点击update
    def click_consultant_task_updatebutton
        self.capvisiondataList
        sleep 1
        self.search_status = 'In Process'
        self.search
        sleep 1
        self.projectList
        sleep 1
        self.attach_to_window(:title => self.first_project + " - Task List - Capvision")
        self.task_update
    end
    #不选择contact task直接点击update
    def click_contact_task_updatebutton
        self.capvisiondataList
        sleep 1
        self.search_status = 'In Process'
        self.search
        sleep 1
        self.projectList
        sleep 1
        self.attach_to_window(:title => self.first_project + " - Task List - Capvision")
        self.contact_task
        self.task_update
    end
    #选择task不选中action点击update
    def choose_consultant_task_update
        self.capvisiondataList
        sleep 1
        self.search_status = 'In Process'
        self.search
        sleep 1
        self.projectList
        sleep 1
        self.attach_to_window(:title => self.first_project + " - Task List - Capvision")
        self.first_task_element.when_present.click
        sleep 1
        self.task_update_element.when_present.click
    end
    #选择contact task不选中action点击update
    def choose_contact_task_update
        self.capvisiondataList
        sleep 1
        self.search_status = 'In Process'
        self.search
        sleep 1
        self.projectList
        sleep 1
        self.attach_to_window(:title => self.first_project + " - Task List - Capvision")
        self.contact_task_element.when_present.click
        self.first_task_element.when_present.click
        sleep 1
        self.task_update_element.when_present.click
    end
    #上传txt文档格式的文件
    def upload_txt
            self.capvisiondataList
            sleep 1
            self.search_status = 'In Process'
            self.search
            sleep 1
            self.projectList
            sleep 1
            self.attach_to_window(:title => self.first_project + " - Task List - Capvision")
            sleep 2
            self.upload_contask_element.when_present.click
            sleep 2
            self.select_attachment = File.expand_path(File.join('.') , 'app/attachment/email.txt')
            sleep 2
            self.upload_attachment_element.when_present.click
    end
    #上传大于20mb文档
    def upload_docx_20MB
            self.capvisiondataList
            sleep 1
            self.search_status = 'In Process'
            self.search
            sleep 1
            self.projectList
            sleep 1
            self.attach_to_window(:title => self.first_project + " - Task List - Capvision")
            sleep 2
            self.upload_contask_element.when_present.click
            sleep 2
            self.select_attachment = File.expand_path(File.join('.') , 'app/attachment/20mb_photos.docx')
            sleep 2
            self.upload_attachment_element.when_present.click
    end
    #上传正常大小文档
    def upload_docx
            self.capvisiondataList
            sleep 1
            self.search_status = 'In Process'
            self.search
            sleep 1
            self.projectList
            sleep 1
            self.attach_to_window(:title => self.first_project + " - Task List - Capvision")
            sleep 2
            self.upload_contask_element.when_present.click
            sleep 2
            self.select_attachment = File.expand_path(File.join('.') , 'app/attachment/sprint1.docx')
            sleep 2
            self.upload_attachment_element.when_present.click
    end


 	#根据all status and keywords搜索
 	def allstatus_keywords_search
 			self.capvisiondataList
            sleep 1
            self.search_status = "All Status"
            self.keywords_project = "ATcapvisiondata_test"
            self.search
 	end

 	#更改状态为inprocess
 	def update_inprocess
 			self.capvisiondataList
            sleep 1
            self.search_status = 'All Status'
            self.search
            sleep 1
            self.check_grid1
            self.actionType = 'In Process'
            self.update_project
 	end

 	#更改状态为onhold
 	def update_onhold
 			self.capvisiondataList
            sleep 1
            self.search_status = 'All Status'
            self.search
            sleep 1
            self.check_grid1
            self.actionType = 'On Hold'
            self.update_project
            sleep 1
            self.onholdnote = 'Change of project direction'
            self.save_project
 	end
    #onhold选中other填写reason
    def choose_other_onholdnotes
            self.capvisiondataList
            sleep 1
            self.search_status = 'All Status'
            self.search
            sleep 1
            self.check_grid1
            self.actionType = 'On Hold'
            self.update_project
            sleep 1
            self.onholdnote = 'Others'
            self.other_area_notes = "other reason"
            self.save_project
    end

    #onhold选中other填写reason
    def choose_other_onholdnotes
            self.capvisiondataList
            sleep 1
            self.search_status = 'All Status'
            self.search
            sleep 1
            self.check_grid1
            self.actionType = 'On Hold'
            self.update_project
            sleep 1
            self.onholdnote = 'Others'
            self.other_area_notes = "other reason"
            self.save_project
    end

 	#更改状态为invalid
 	def update_invalid
 			self.capvisiondataList
            sleep 1
            self.search_status = 'All Status'
            self.search
            sleep 1
            self.check_grid1
            self.actionType = 'Invalid'
            self.update_project
            sleep 2
            self.invalidnote = "ATtestinvalidnotes~~~~~~~~~~~~~~"
            self.save_project
 	end

 	#更改状态为complete
 	def update_complete
 		 	self.capvisiondataList
            sleep 1
            self.search_status = 'All Status'
            self.search
            sleep 1
            self.check_grid1
            self.actionType = 'Complete'
            self.update_project
            sleep 1
            self.completenote = "ATtestcompletenotes~~~~~~~~~~~~~~"
            self.save_project
 	end
 	
 	#添加consultant task
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
            # self.attach_to_window(:title => "Consultants search - Capvision")
            self.search_consultant
            sleep 1
            self.check_first_consultant
            hidden_element
            self.check_second_consultant
            sleep 1
            self.add_consultant_to_project
            sleep 10
            self.goto_project
      end
      #consultant task根据status排序
      def consultant_sort_status
          self.add_consultant_task
          sleep 2
          self.consultant_task_sort_status
          sleep 2
      end
      #consultant task根据date排序
      def consultant_sort_date
          self.add_consultant_task
          sleep 2
          self.consultant_task_sort_date
          sleep 2
      end
      #consultant task根据coh排序
      def consultant_sort_coh
          self.add_consultant_task
          sleep 2
          self.consultant_task_sort_coh
          sleep 2
      end
      #consultant task根据coc排序
      def consultant_sort_coc
          self.add_consultant_task
          sleep 2
          self.consultant_task_sort_coc
          sleep 2
      end
      #consultant task根据manager排序
      def consultant_sort_manager
          self.add_consultant_task
          sleep 2
          self.consultant_task_sort_manager
          sleep 2
      end
      #添加contact task
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
            # self.attach_to_window(:title => "Contacts - Capvision")
            self.search_contact
            sleep 2
            self.check_first_contact
            self.check_sencond_contact
            sleep 2
            self.add_contact_to_project
            sleep 10
            self.goto_contact_tasklist
      end

      #contact task根据status排序
      def contact_sort_status
          self.add_contact_task
          sleep 2
          self.contact_task_sort_status
          sleep 2
      end
      #contact task根据clh排序
      def contact_sort_clh
          self.add_contact_task
          sleep 2
          self.contact_task_sort_clh
          sleep 2
      end
      #contact task根据clc排序
      def contact_sort_clc
          self.add_contact_task
          sleep 2
          self.contact_task_sort_clc
          sleep 2
      end
      #删除单个consultant task
      def delete_single_consultant_task
          self.add_consultant_task
          self.check_first_task
          self.task_action = "Deleted"
          self.task_update
      end
      #删除多个consultant task
      def delete_multiple_consultant_task
          self.add_consultant_task
          self.check_first_task
          self.check_second_task
          self.task_action = "Deleted"
          self.task_update
      end
      #修改单个contact task为not contacted
      def update_single_contact_task
          self.add_contact_task
          self.check_first_task
          self.task_action = "Not Contacted"
          self.task_update
      end
      #修改多个contact task为not contacted
      def update_multiple_contact_task
          self.add_contact_task
          self.check_first_task
          self.check_second_task
          self.task_action = "Not Contacted"
          self.task_update
      end
      #删除单个contact task
      def delete_single_contact_task
          self.add_contact_task
          self.check_first_task
          self.task_action = "Deleted"
          self.task_update
      end
      #删除多个contact task
      def delete_multiple_contact_task
          self.add_contact_task
          self.check_first_task
          self.check_second_task
          self.task_action = "Deleted"
          self.task_update
      end
end