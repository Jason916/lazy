#encoding: utf-8
require File.expand_path 'app/cases/shared/action'
class ConsultantPage < Lol::Page
  include Action

  page_url "#{$config.host}search/default/consultant"

  #add consultant link
  link :add_consultant ,:text=> "Create Consultant"

  #consultant name
  text_field :consultant_name, :id=> "Consultant_name"

  #consultant origin
  select_list :consultant_origin, :id=> "Consultant_origin_id"

  #origin value
  text_field :originValue, :id=> "origin_value"

  #consultant gender
  radio_button :consultant_gender, :id=> "Consultant_gender_1"

  #consultant firstname
  text_field :consultant_firstname, :id => "Consultant_firstname"

  #consultant lastname
  text_field :consultant_lastname, :id=> "Consultant_lastname"

  #consultant nickname
  text_field :consultant_nickname, :id=> "Consultant_nickname"

  #consultant status
  select_list :consultant_status, :id=> "Consultant_status"

  #consultant type
  select_list :consultant_type, :id=> "Consultant_type"

  #consultant adeptlanguage
  checkbox :consultant_adeptlanguage_0, :id=> "Consultant_adeptlanguage_0"

  #email
  text_field :contactothers_email, :id=> "ContactOthers_email"

  #mobile
  text_field :contactmobile_mobile, :id=> "ContactMobile_mobile"

  #citycode
  text_field :contacttelephone_citycode, :id=> "ContactTelephone_citycode"

  #telephone
  text_field :contacttelephone_telephone, :id=> "ContactTelephone_telephone"

  #weixin
  text_field :contactothers_weixin, :id=> "ContactOthers_weixin"

  #submit consultant
  button :submit, :xpath=> ".//*[@id='yw0']"

  #cancel consultant
  link :cancel, :href=> "/search/default/consultant"

  #search consultant
  button :search, :name=>"yt0"

  #first consultant
  link :first_consultant,:xpath=>"//tr/td/div/a"

  #edit basic information
  element :edit_basic_information,:i,:xpath=>"//a[@id='consultant-basic-edit']/i"

  #first name
  text_field :first_name,:id=>"Consultant_firstname"

  #edit background expertise
  element :edit_background_expertise,:i,:xpath=>"//a[@id='consultant-background-edit']/i"

  #background
  text_area :background,:id=>"ConsultantBackground_background"

  #expertise
  text_area :expertise,:id=>"ConsultantBackground_expertise"

  #edit general comment
  element :edit_general_comment,:i,:xpath=>"//a[@id='consultant-generalcomment-edit']/i"

  #general comment
  text_area :general_comment,:id=>"Consultant_generalcomment"

  #add work experience
  element :add_work_experience,:i,:xpath=>"//a[@id='consultant-experience-edit']/i"

  #company
  text_field :company ,:id=>"company-selector"

  #company_available
  link :company_available,:xpath=>"//li[@class='ui-menu-item']/a"

  #position
  text_field :position, :id=>"ConsultantPosition_positionLabel"

  #position_available
  # link :position_available,:text=>"测试职位_junwei"
  link :position_available,:xpath=>"//ul[@id='ui-id-9']/li/a"

  #start date year
  select_list :start_date_year,:id=>"ConsultantPosition_startdateYear"

  #start date month
  select_list :start_date_month,:id=>"ConsultantPosition_startdateMonth"

  #is current?
  checkbox :current,:id=>"ConsultantPosition_iscurrent"

  #save experience
  button :save_experience,:id=>"yw0"

  #add education
  element :add_education,:i,:xpath=>"//a[@id='consultant-school-edit']/i"

  #school name
  text_field :school_name,:id=>"ConsultantSchool_name"

  #school name available
  li :school_name_available,:text=>"AT测试大学"

  #school major
  text_field :school_major,:id=>"ConsultantSchool_major"

  #school degree
  select_list :school_degree, :id=>"ConsultantSchool_degree"

  #school start year
  select_list :school_start_year, :id=>"ConsultantSchool_startyear"

  #school end year
  select_list :school_end_year, :id=>"ConsultantSchool_endyear"

  #save education
  button :save_education,:id=>"yw0"

  #edit education
  element :edit_education,:i,:xpath=>"//div[@id='ui-accordion-2-panel-0']/a[2]/i"

  #edit resume box
  element :edit_resume_box,:i,:xpath=>"//a[@id='consultant-resumebox-edit']/i"

  #resume box content
  text_area :resume_box_content,:id=>"Consultant_resumebox"

  #select resume
  file_field :select_resume,:id=>"ndb-file-upload-input"

  #upload resume button
  button :upload_resume_button,:id=>"ndb-file-upload-upload-btn"

  #edit warning bar
  element :edit_warning_bar,:i,:xpath=>"//div[@id='warning-bar']/span/i"

  #warning bar
  text_field :warning_bar,:id=>"warning_bar_content"

  #edit tag
  text_field :tag,:id=>"consultant-tag-name"

  #save tag
  element :save_tag,:i,:xpath=>"//a[@id='consultant-tag-enter-save']/i"

  #add mobile
  element :add_mobile,:i,:id=>"btn-add-1"

  #mobile phone
  text_field :mobile_phone,:id=>"Contact_mobilephone"

  #save mobile phone
  element :save_mobile_phone,:i,:xpath=>"//div[3]/div/div/i"
  
  #delete mobile phone
  element :delete_mobile_phone,:i,:xpath=>"//div[3]/div/div/i[3]"

  #note
  text_area :note,:id=>"note-text"

  #save note
  button :save_note,:id=>"note-submit"

  #request tab
  link :request_tab,:xpath=>"//ul[@id='yw7']/li[6]/a"

  #request type
  select_list :request_type,:id=>"ConsultantRequest_type"

  #request message
  text_area :request_message,:id=>"ConsultantRequest_message"

  #submit request
  button :submit_request,:name=>"yt0"

  #finance tab
  link :finance_tab,:xpath=>"//ul[@id='yw7']/li[7]/a"

  #debug profile tab
  link :profile_tab,:xpath=>"//*[@id='yw6']/li[1]/a"

  #edit payment method
  element :edit_payment_method,:i,:xpath=>"//div/a/i"

  #payment type
  select_list :payment_type,:id=>"ConsultantFiancial_type"

  #add bank card
  link :add_bank_card,:id=>"add-bank-account-btn"

  #bank account name
  text_field :bank_account_name,:id=>"ConsultantBankAccount_accountname"

  #bank name
  link :bank_name,:xpath=>"//div[@id='s2id_ConsultantBankAccount_bankid']/a"
  
  #select bank name
  div :select_bank_name,:text=>"招商银行"

  #bank account number
  text_field :bank_account_number,:id=>"ConsultantBankAccount_accountnumber"

  #other information
  text_field :other_information,:id=>"ConsultantBankAccount_otherinformation"

  #save bank information
  link :save_bank_information,:id=>"add-bank-account-btn"

  #edit gifts card
  element :edit_gifts_card,:i,:xpath=>"//div[@class='container-fluid']/div/div/div[2]/div[3]/a/i"

  #select gasoline card
  checkbox :gasoline_card,:id=>"ConsultantFinance_gaslinecard"

  #edit donate information
  element :edit_donate_information,:i,:xpath=>"//div[@class='container-fluid']/div/div/div[2]/div[4]/a/i"
  
  #donate account name
  text_field :donate_account_name,:id=>"ConsultantFinance_accountname"

  #donate website
  text_field :donate_website,:id=>"ConsultantFinance_website"

  #interest tab
  link :interest_tab,:xpath=>"//ul[@id='yw7']/li[8]/a"

  #edit interest button
  link :edit_interest_button,:id=>"edit-interest-btn"

  #capvision expert exchanges
  checkbox :capvision_expert_exchanges,:id=>"service_0"

  #ipo newsletters
  checkbox :ipo_newsletters,:id=>"service_1"

  #monthly investment reports
  checkbox :monthly_investment_reports,:id=>"service_2"

  #email 
  checkbox :email,:id=>"contact_0"

  #phone
  checkbox :phone,:id=>"contact_1"

  #sms
  checkbox :sms,:id=>"contact_2"

  #im
  checkbox :im,:id=>"contact_3"

  #project interviews
  checkbox :project_interviews,:id=>"business_0"

  #industry networking
  checkbox :industry_networking,:id=>"business_1"

  #career opportunities
  checkbox :career_opportunities,:id=>"business_2"

  #business deals
  checkbox :business_deals,:id=>"business_3"

  #fundraising
  checkbox :fundraising,:id=>"business_4"

  #save interest
  button :save_interest,:id=>"yw0"

  #add email
  element :add_email,:i,:id=>"btn-add-9"

  #email
  text_field :email,:id=>"Contact_other"

  #save_email
  element :save_email,:i,:class=>"icon-save btn-operation pointer-icon scan-enter-save cap-loading-submit"

  #compliance tab
  link :compliance_tab,:xpath=>"//ul[@id='yw7']/li[5]/a"

  #open upload prompt
  link :open_upload_prompt,:class=>"upload-compliance"

  #select attachment
  file_field :select_attachment,:id=>"ndb-file-upload-input"

  #upload attachment
  button :upload_attachment,:id=>"ndb-file-upload-upload-btn"

  #send introduction link
  link :send_introduction_link,:text=>"Send Introduction"
  
  #send email link 
  link :send_eamil_link, :text=> "Send Email"

  #send introduction button
  button :send_introduction_button,:id=>"yw0"

  #delete email
  element :delete_email,:i,:xpath=>"//div[@class='row-fluid']/div[3]/div/div/i[3]"

  #delete resume
  element :delete_resume,:i,:xpath=>"//div[3]/div/div[1]/div[2]/div[9]/div/div/div[1]/span[4]/a/i"

  #consultant status
  link :consultant_status,:class=>"btn dropdown-toggle btn-success btn-inverse"

  #status value
  link :status_value,:text=>"Enrolled"

  #delete mobile
  element :delete_mobile,:i,:xpath=>"//form[@id='ajax-contact-update-form']/div/div[3]/div/div[2]/i[3]"

  #add telephone button
  element :add_telephone_button,:i,:id=>"btn-add-2"

  #delete telephone
  element :delete_telephone,:i,:xpath=>"//div[@class='row-fluid']/div[3]/div/div/i[3]"

  #telephone
  text_field :telephone ,:id=>"Contact_telephone"

  #save telephone
  element :save_telephone,:i,:xpath=>"//form[@id='ajax-contact-update-form']/div[2]/div[3]/div/div/i"

  #add weixin button
  element :add_weixin_button,:i,:id=>"btn-add-10"

  #weixin
  text_field :weixin,:id=>"Contact_other"

  #save weixin
  element :save_weixin,:i,:xpath=>"//div[4]/div[3]/div/div/i"

  #delete weixin
  element :delete_weixin,:i,:xpath=>"//div[4]/div[3]/div/div/i[3]"

  #add address
  element :add_address_button,:i,:xpath=>"//div[3]/div/div[2]/div[5]/div/div/span[2]/i"

  #input address
  text_area :address,:id=>"address-text"

  #save address
  element :save_address,:i,:id=>"save-address"

  #delete address
  element :delete_address,:i,:xpath=>"//div[3]/div/div[2]/div[5]/div/div/span[3]/div/div[1]/i[3]"
  
  #edit address
  element :edit_address,:i,:xpath=>"//div[3]/div/div[2]/div[5]/div/div/span[3]/div/div[1]/i[2]"

  #set contact
  element :set_contact,:i,:xpath=>"//div[3]/div/div[2]/div[5]/div/div/span[3]/div/div[1]/i[1]"
  #add other contact button
  button :add_other_contact_button,:id=>"btn-add-other"

  #other contact
  text_field :other_contact,:id=>"Contact_other"

  #save other contact
  element :save_other_contact,:i,:xpath=>"//div[@id='contact-content-other']/div/div[2]/div/i"

  #points links
  link :points, :id=> "consultant-points"

  #relationship tab
  link :relationship_tab, :xpath=>"//ul[@id='yw7']/li[3]/a"  

  #relationship project tab
  link :relationship_project_tab,:xpath=>"//ul[@id='yw1']/li[2]/a"
  # link :project_relationship, :href=> "/consultant/dynamic/project?id=200"

  #relationship communication tab
  link :relationship_communication_tab,:xpath=>"//ul[@id='yw1']/li[3]/a"

  #relationship request tab
  link :relationship_request_tab,:xpath=>"//ul[@id='yw1']/li[4]/a"

  #relationship compliance tab
  link :relationship_compliance_tab,:xpath=>"//ul[@id='yw1']/li[5]/a"

  #relationship point tab
  link :relationship_point_tab,:xpath=>"//ul[@id='yw1']/li[6]/a"

  #points tab
  link :points_tab,:xpath=>"//ul[@id='yw7']/li[10]/a"

  #points income tab
  link :points_income_tab,:xpath=>"//ul[@id='yw1']/li[2]/a"

  #points spent tab
  link :points_spent_tab,:xpath=>"//ul[@id='yw1']/li[3]/a"

  #communications tab
  link :communications_tab,:xpath=>"//ul[@id='yw7']/li[4]/a"

  #communications email tab
  link :communications_email_tab,:xpath=>"//ul[@id='yw9']/li[1]/a"

  #communications phone tab
  link :communications_phone_tab,:xpath=>"//ul[@id='yw9']/li[2]/a"

  #communications sms tab
  link :communications_sms_tab,:xpath=>"//ul[@id='yw9']/li[3]/a"

  #projects tab
  link :projects_tab,:xpath=>"//ul[@id='yw7']/li[2]/a"

  #projects consultations tab
  link :projects_consultations_tab,:xpath=>"//ul[@id='yw8']/li[1]/a"

  #projects data tab
  link :projects_data_tab,:xpath=>"//ul[@id='yw8']/li[2]/a"

  #projects ges tab
  link :projects_ges_tab,:xpath=>"//ul[@id='yw8']/li[3]/a"

  #projects conference tab
  link :projects_conference_tab,:xpath=>"//ul[@id='yw8']/li[4]/a"

  #projects hrs tab
  link :projects_hrs_tab,:xpath=>"//ul[@id='yw8']/li[5]/a"

  #projects inter tab
  link :projects_inter_tab,:xpath=>"//ul[@id='yw8']/li[6]/a"

  #online link
  link :online_link,:text=>"Online"

  #tnc template
  select_list :tnc_template,:id=>"EmailTemplate_name"

  #submit tnc
  button :submit_tnc,:id=>"compliance-send-submit"

  #cancel tnc
  link :cancel_tnc,:text=>"Cancel"

  #add points
  link :add_points,:id=>"addpoints"

  #click points button
  button :btn_add,:xpath=>"//div[9]/div[3]/div/button[1]"

  #input points
  text_field :txt_points,:id=>"points"

  #input reason
  text_area :txt_reason,:id=>"points-reason"

  #click points cancel
  button :btn_cancel,:xpath=>"//div[9]/div[3]/div/button[2]"
 
  #select consultant team 
  select_list :select_consultant_team, :id=>"consultant-team"
  
  #select consultant industry 
  select_list :select_consultant_industry, :id=>"consultant-industry"
  
  #select consultant subindustry 
  select_list :select_consultant_subindustry, :id=>"consultant-subindustry"
  
  #select consultant type
  select_list :select_consultant_type, :id=>"type"
  
  #select consultant status
  select_list :select_consultant_status, :id=>"status"
  
  #select consultant function
  select_list :select_consultant_function, :id=>"functionid"
  
  #click consultant location 
  div :click_consultant_location, :id=>"location-selector"
  
  #select consultant location
  link :select_consultant_location, :id=>"上海-65"
  
  #select consultant panel
  select_list :select_consultant_panel, :id=>"panelid"
  
  #more filter link
  link :click_more_filter, :id=>"more-filter-link"
  
  #pack up link
  link :click_up_link, :id=>"pack-up-link"
  
  #company size min
  text_field :input_company_sizemin, :id=>"sizeMin"
  
  #company size max
  text_field :input_company_sizemax, :id=>"sizeMax"
  
  #company revenueMin
  text_field :input_company_revenuemin, :id=>"revenueMin"
  
  #conpany revenueMax
  text_field :input_company_revenuemax, :id=>"revenueMax"
  
  #search keywords
  text_field :input_keywords, :id=>"keywords"
  
  #click select keyword type button
  link :select_keyword_type_btn, :xpath=>"//span/div/a"
  
  #select keyword type name
  link :select_keyword_type_name, :text=>"Name"
  
  #select keyword type name
  link :select_keyword_type_company, :xpath=>"//span/div/div/ul/li[3]/a"
  
  #first company
  td :first_company, :xpath=>"//tr/td[6]"
  
  #select keyword type name
  link :select_keyword_type_position, :xpath=>"//span/div/div/ul/li[4]/a"
  
  #first position
  td :first_position, :xpath=>"//tr/td[7]"
  
  #select keyword type name
  link :select_keyword_type_background, :xpath=>"//span/div/div/ul/li[5]/a"
  
  #first background
  div :first_background, :xpath=>"//tr/td[4]/div"
  
  #select keyword type name
  link :select_keyword_type_expertise, :xpath=>"//span/div/div/ul/li[6]/a"
  
  #first expertise
  div :first_expertise, :xpath=>"//tr/td[5]/div"
  
  #select keyword type name
  link :select_keyword_type_tag, :xpath=>"//span/div/div/ul/li[7]/a"
  
  #select keyword type name
  link :select_keyword_type_notes, :xpath=>"//span/div/div/ul/li[8]/a"
  
  #first notes
  td :first_notes, :xpath=>"//tr/td[12]"
  
  #select keyword type name
  link :select_keyword_type_school, :xpath=>"//span/div/div/ul/li[9]/a"
  
  #select keyword type name
  link :select_keyword_type_comment, :xpath=>"//span/div/div/ul/li[10]/a"
  
  #select keyword type name
  link :select_keyword_type_resume, :xpath=>"//span/div/div/ul/li[11]/a"
  
  #click link more/pick up
  link :more_pick_up ,:class=>"show-more-note"

  #set notes
  element :set_notes,:i,:xpath=>"//div[3]/div/div[2]/div[6]/div/div/div[1]/div[4]/i[1]"

  #delete notes
  element :delete_notes,:i,:xpath=>"//div[3]/div/div[2]/div[6]/div/div/div[1]/div[4]/i[2]"

  #set main
  button :set_main_bank,:class=>"pull-right"

  #delete bank
  element :delete_bank,:i,:class=>"icon-trash cap-icon"

  #delete education
  element :delete_education ,:i,:class=>"icon-trash cap-icon"

  #cancel experience
  link :experience_cancel ,:id=>"consultant-experience-cancel"

  #cancel education
  link :education_cancel ,:id=>"consultant-school-cancel"
  #link to consultant profile page
  link :link_consultant_profile_page, :xpath=>"//tr/td[11]/a"
  
  #h1 text
  h1 :h1_text, :xpath=>"//h1"
  
  #h3 text
  h3 :h3_text,:xpath=>"//h3"
  
  #the text of consultant rate
  link :text_of_consultant_rate, :id=>"consultant_rate"
  
  #input rate
  text_field :input_rate, :xpath=>"//div/div/input"
  
  #click save rate
  button :save_rate, :xpath=>"//div/div/button"
  
  #verify rate alert
  div :verify_rate_alert, :xpath=>"//form/div/div[2]"
  
  #T&C link
  link :tnc_link, :xpath=>"//div[2]/div/span/a"
  
  #select consultant ryan
  link :select_consultant_ryan, :xpath=>"//tr[6]/td/div/a"
  
  #company link 
  link :click_company_link, :xpath=>"//div[2]/div/div/div/div/div[2]/a"
  
  #click position link
  link :click_position_link, :xpath=>"//div[4]/div/div[2]/a"
  
  #click school link
  link :click_school_link, :xpath=>"//a[contains(text(),'清华大学')]"
  
  #click notes mark
  element :notes_mark, :i ,:xpath=>"//div[6]/div/div/div/div[4]/i"
  
  #history list
  element :history_list, :i ,:xpath=>"//h3/i"
  
  #click add to project btn
  link :add_to_project, :id=>"yw2"
  
  #click cancel btn
  button :click_cancel_btn, :text=>"Cancel"
  
  #click the first tnc link
  link :click_first_tnc, :xpath=>"//tr/td/span/a"
  
  #click panel
  link :click_panel, :xpath=>"//div/span[2]/div/a"
  
  #contact solid star alert
  element :contact_solid_star_alert, :i ,:xpath=>"//div[5]/div[3]/div/div/i"
  
  #address solid star alert
  element :address_solid_star_alert, :i ,:xpath=>"//div/div/span[3]/div/div[2]/i"

  #set main
  button :set_main_bank,:class=>"pull-right"
  
  #function when create consultant
  ul :function, :xpath=>"//div[@id='s2id_ConsultantPosition_functions']/ul"
  
  
  
  
  
  def create_consultant
    self.consultant_name = "ATjunweiTest#{rand(1000000)}"
    self.consultant_origin='Events'
    sleep 2
    self.originValue_element.when_present.append "eventTest"
    self.select_consultant_gender
    self.consultant_firstname= "jun"
    self.consultant_lastname= "wei"
    self.consultant_nickname= "xiaovv"
    self.consultant_status='Not Contacted'
    self.consultant_type='Qualified'
    self.contactothers_email= "weijun0609#{rand(1000000)}@163.com"
    self.contactmobile_mobile= "15918#{rand(1000000)}"
    self.contacttelephone_citycode= "021"
    self.contacttelephone_telephone= "3567240" 
    self.contactothers_weixin= "wesaly"
    self.company_element.when_present.set '中国经济信息网'
    self.position_element.when_present.set '总经理'
    self.function_element.when_present.click
    self.send_keys :enter
    self.submit_element.when_present.click
  end
  def select_first_consultant
    self.first_consultant_element.when_present.click
    self.attach_to_window :title=>self.first_consultant_element.when_present.text+" - Capvision"
  end

  def edit_basic_information
    self.edit_basic_information_element.when_present.click
    sleep 2
    self.first_name = 'AT测试顾问1号'
    self.edit_basic_information_element.when_present.click
  end

  def edit_background_expertise
    hidden_element
    self.edit_background_expertise_element.when_present.click 
    sleep 2
    self.background="AT测试中文背景"
    self.expertise="AT测试中文特长"
    self.edit_background_expertise_element.when_present.click 
  end

  def edit_generalcomment
    hidden_element
    self.edit_general_comment_element.when_present.click
    sleep 2
    self.general_comment="AT测试generalcomment"
    self.edit_general_comment_element.when_present.click
  end

  def add_experience
    hidden_element
    self.add_work_experience_element.when_present.click
    self.company_element.when_present.set "测试公司_junwei"
    sleep 5
    self.company_available_element.when_present.click
    self.position_element.when_present.set "测试职位_junwei"
    #self.position_available_element.when_present.click
    self.check_current
    self.start_date_year_element.when_present.select "2014"
    self.start_date_month_element.when_present.select "2"
    self.save_experience_element.when_present.click
  end

  def add_education
    hidden_element
    self.add_education_element.when_present.click
    sleep 2
    self.school_name = "AT测试大学"
    sleep 2
    self.school_name_available
    self.school_major = "计算机科学与技术"
    self.school_degree = "Undergraduate / 本科"
    self.school_start_year = "2010"
    self.school_end_year = "2014"
    self.save_education
  end

  def edit_education
    hidden_element
    self.edit_education_element.when_present.click
    sleep 2
    self.school_name = "AT测试大学"
    sleep 2
    self.school_name_available
    self.save_education
  end

  def edit_resumebox
    hidden_element
    self.edit_resume_box_element.when_present.click
    sleep 2
    self.resume_box_content = "AT测试resumebox"
    self.edit_resume_box_element.when_present.click
  end

  def upload_resume
    hidden_element
    self.select_resume = File.expand_path(File.join('.'),'app/attachment/sprint1.docx')
    sleep 2
    self.upload_resume_button
  end

  def edit_warningbar
    hidden_element
    self.edit_warning_bar_element.when_present.click
    sleep 2
    self.warning_bar = "ATwarning bar测试"
    self.edit_warning_bar_element.when_present.click
  end

  def edit_tag
    hidden_element
    self.tag = "ATtag测试#{rand(100)}"
    self.save_tag_element.when_present.click
  end

  def add_mobile
    hidden_element
    self.add_mobile_element.when_present.click
    sleep 2
    self.mobile_phone = "1590#{rand(9)}#{rand(9)}7#{rand(9)}954"
    self.save_mobile_phone_element.when_present.click
  end

  def edit_note
    hidden_element
    self.note = "AT测试notes#{rand(100)}"
    self.save_note
  end

  #need be updated later
  # def tnc_email
  #   @browser.window(:title=>first_project+" - Capvision").when_present.use do
  #     @browser.link(:xpath, "//ul[@id='yw6']/li[5]/a").when_present.click
  #     if  @browser.link(:xpath, "//tr[1]/td[4]/span/a[3]").exist?
  #       if @browser.link(:xpath, "//tr[1]/td[4]/span/a[3]").text == "Email"
  #          @browser.link(:xpath, "//tr[1]/td[4]/span/a[3]").when_present.click
  #          @browser.textarea(:id, "compliance_message").when_present.set "AT测试email msg"
  #          @browser.button(:id, "compliance-send-submit").when_present.click
  #         elsif  @browser.link(:xpath,"//tr[1]/td[4]/span/a[3]").text == "Accept"
  #              @browser.link(:xpath,"//tr[1]/td[4]/span/a[3]").when_present.click
  #              @browser.alert.ok
  #       end
  #     else
  #       @browser.link(:xpath,"//tr[1]/td[4]/span/a").when_present.click
  #       @browser.textarea(:id, "compliance_message").when_present.set "重新签署TNC msg"
  #       @browser.button(:id, "compliance-send-submit").when_present.click
  #     end
  #   end
  # end

  def tnc_online_ksh
    self.compliance_tab
    self.online_link
    self.tnc_template = "顾问通过官网签T&C的链接(Chinese)"
    self.submit_tnc
  end

  def tnc_online_capweb
    self.compliance_tab
    self.online_link
    self.tnc_template = "顾问通过官网签T&C的链接(English)"
    self.submit_tnc
  end
 
  def tnc_online_cancel
    self.compliance_tab
    self.online_link
    self.cancel_tnc
  end

  def upload_doc
    self.compliance_tab
    self.open_upload_prompt
    self.select_attachment = File.expand_path(File.join('.') , 'app/attachment/NDB-Tables.doc')
    self.upload_attachment
  end

  def upload_docx_2mb
    self.compliance_tab
    self.open_upload_prompt
    self.select_attachment = File.expand_path(File.join('.') , 'app/attachment/NDB_specification_Apr_15.docx')
    self.upload_attachment
  end

  def upload_docx
    self.compliance_tab
    self.open_upload_prompt
    self.select_attachment = File.expand_path(File.join('.') , 'app/attachment/sprint1.docx')
    self.upload_attachment
  end

  def upload_pdf
    self.compliance_tab
    self.open_upload_prompt
    self.select_attachment = File.expand_path(File.join('.') , 'app/attachment/watir-webdriver-cn.pdf')
    self.upload_attachment
  end

  def upload_msg
    self.compliance_tab
    self.open_upload_prompt
    self.select_attachment = File.expand_path(File.join('.') , 'app/attachment/test_msg_file.msg')
    self.upload_attachment
  end

  def edit_pull_request
    self.request_tab
    self.request_type = "Hiring"
    self.request_message = "AT测试pull request"
    self.submit_request
  end

  def edit_payment
    self.finance_tab
    self.edit_payment_method_element.when_present.click
    sleep 2
    self.payment_type = "Cash"
    self.edit_payment_method_element.when_present.click
  end

  def edit_bankcard
    self.finance_tab
    self.add_bank_card
    self.bank_name_element.when_present.click
    self.send_keys :down
    self.send_keys :enter
    sleep 2
    self.bank_account_name = "AT张三#{rand(100000)}"
    # self.bank_name_element.when_present.click
    # self.select_bank_name_element.when_present.click
    self.bank_account_number = "620#{rand(10000000000000)}"
    self.other_information = "test other bank"
    self.save_bank_information
  end

  def input_special_characters
    self.finance_tab
    self.add_bank_card
    sleep 2
    self.bank_account_number = "@@!@!"
    self.save_bank_information
  end

  def input_null
    self.finance_tab
    self.add_bank_card
    self.save_bank_information
  end

  def edit_gifts
    self.finance_tab
    hidden_element
    self.edit_gifts_card_element.when_present.click 
    sleep 2
    self.check_gasoline_card
    self.edit_gifts_card_element.when_present.click 
  end

  def edit_donate
    self.finance_tab
    hidden_element
    self.edit_donate_information_element.when_present.click
    sleep 2
    self.donate_account_name = "test donate account name"
    self.donate_website = "test donate website"
    self.edit_donate_information_element.when_present.click
  end

  def edit_interest
    self.interest_tab
    self.edit_interest_button
    self.check_capvision_expert_exchanges
    self.check_ipo_newsletters
    self.check_monthly_investment_reports
    self.check_email
    self.check_phone
    self.check_sms 
    self.check_im 
    self.check_project_interviews
    self.check_industry_networking
    self.check_career_opportunities
    self.check_business_deals
    self.check_fundraising
    self.save_interest
  end

  def send_introduction
    self.send_eamil_link_element.when_present.click
    self.send_introduction_link_element.when_present.click
    sleep 2
    self.send_introduction_button_element.when_present.click
  end
      
  def change_status
    self.consultant_status
    self.status_value
  end

  def add_telephone
    hidden_element
    self.add_telephone_button_element.when_present.click
    sleep 2
    self.telephone = "56524353"
    self.save_telephone_element.when_present.click
  end

  def add_email
    hidden_element
    self.add_email_element.when_present.click
    sleep 2
    self.email = "rhan@capvision.com.cn"
    self.save_email_element.when_present.click
  end

  def add_weixin
    hidden_element
    self.add_weixin_button_element.when_present.click
    sleep 2
    self.weixin = "Ryan's weixin"
    self.save_weixin_element.when_present.click 
  end

  def add_other_contact
    hidden_element
    self.add_other_contact_button
    sleep 2
    self.other_contact="541039523"
    self.save_other_contact_element.when_present.click
  end

  def goto_relationship_project_page
    self.relationship_tab
    self.relationship_project_tab
  end

  def goto_relationship_communication_page
    self.relationship_tab
    self.relationship_communication_tab
  end

  def goto_relationship_request_page
    self.relationship_tab
    self.relationship_request_tab
  end

  def goto_relationship_compliance_page
    self.relationship_tab
    self.relationship_compliance_tab
  end

  def goto_relationship_point_page
    self.relationship_tab
    self.relationship_compliance_tab
  end

  def goto_points_income_page
    self.points_tab
    self.points_income_tab
  end

  def goto_points_spent_page
    self.points_tab
    self.points_spent_tab
  end

  def goto_communications_email_page
    self.communications_tab
    self.communications_email_tab
  end

  def goto_communications_phone_page
    self.communications_tab
    self.communications_phone_tab
  end

  def goto_communications_sms_page
    self.communications_tab
    self.communications_sms_tab
  end

  def goto_projects_consultations_page
    self.projects_tab
    self.projects_consultations_tab
  end

  def goto_projects_data_page
    self.projects_tab
    self.projects_data_tab
  end

  def goto_projects_ges_page
    self.projects_tab
    self.projects_ges_tab
  end

  def goto_projects_conference_page
    self.projects_tab
    self.projects_conference_tab
  end

  def goto_projects_hrs_page
    self.projects_tab
    self.projects_hrs_tab
  end

  def goto_projects_inter_page
    self.projects_tab
    self.projects_inter_tab
  end
  
  def verify_page
    self.search_element.when_present.click
    self.search_element.when_present.text.should == "Search"
  end
  
  def add_notes_more
    hidden_element
    self.note = "More than 3 lines-More than 3 lines-More than 3 lines-More than 3 lines-More than 3 lines More than 3 lines-More than 3 lines-More than 3 lines-More than 3 lines-More than 3 lines"
    sleep 3
    self.save_note
  end
  
end
