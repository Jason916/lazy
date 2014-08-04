#encoding: utf-8
require File.expand_path 'app/cases/shared/main.rb'
class ProfilePage < NdbPage
  include PageObject
  
  page_url "#{$config.host}client/index/view?id=28"
  
  
  h1 :profile_title, :class=> "page-header"
  link :client_contacts, :xpath=> "//a[contains(text(),'Client Contacts')]"
  button :create_contact_button, :id=> "create-contact-btn"
  text_field :client_contact_email, :id=> "Contact_email_other"
  button :create_contact_save_button, :id=> "yw1"
  #h3 text
  h3 :title_text, :xpath=> "//h3"
  #click link of edit basic info
  link :edit_basic_info, :xpath=> "//a[@id='basic-info-edit']"
  #select client teamsize
  select_list :select_client_teamsize, :id=> "Client_teamsize"
  #select client type
  select_list :select_client_type, :id=> "Client_type"
  #input client chinesename
  text_field :input_client_chinesename, :xpath=> "//input[@id='Client_chinesename']"
  #old location
  div :old_location, :xpath=> "//form[@id='client-basic-info-form']/div[6]/div/div/div/div/div/li/div"
  #click to set location
  div :click_to_set_location, :id=> "location-selector"
  #select location
  link :select_location, :xpath=> "//a[@id='上海-65']"
  #add compliance note btn
  button :add_compliance_note, :xpath=> "//input[@id='add-compliance-note-btn']"
  #save compliance note message
  button :save_compliance_note, :xpath=> "//input[@id='compliance-note-save-btn']"
  #input client compliance note message
  text_field :input_client_compliance_message, :xpath=> "//input[@id='ClientComplianceNote_message']"
  #add cash note btn
  button :add_cash_note, :xpath=> "//input[@id='add-cash-btn']"
  #save cash note btn 
  button :save_cash_note, :xpath=> "//input[@id='cash-save-btn']"
  #input cash note info 
  text_field :input_cash_note, :xpath=> "//input[@id='cash-amount-new']"
  #input cash date
  text_field :input_cash_date, :xpath=> "//input[@id='cash-date-new']"
  #add cash alert info
  span :add_cash_alert_info, :xpath=> "//span[@id='cash-error_new']"
  #edit crm info
  link :edit_crm_info, :xpath=> "//a[@id='basic-crm-edit']"
  #select client relation status
  select_list :select_relation_status, :id=> "ClientRelation_status"
  #input client relation statusnotes
  text_field :input_relation_statusnotes, :id=> "ClientRelation_statusnotes"
  #input client relation alert
  text_field :input_relation_alert, :id=> "ClientRelation_alert"
  #input client relation reminder
  text_field :input_relation_reminder, :id=> "ClientRelation_reminder"
  #edit contract info 
  link :add_contract_info, :xpath=> "//a[@id='client-contract-add-0']"
  #input client contract details
  text_field :input_contract_details, :id=> "ClientContract_details"
  #input client contract size
  text_field :input_contract_size, :id=> "ClientContract_size"
  #input client contract revenuenote
  text_field :input_contract_revenuenote, :id=> "ClientContract_revenuenote"
  #input client contract period
  text_field :input_contract_period, :id=> "ClientContract_period"
  #click client contract close date
  text_field :input_contract_closedate, :id=> "ClientContract_closedateString"
  #select close date
  td :select_closedate, :xpath=> "//tr[3]/td[4]"
  #save contract info 
  link :save_contract_info, :xpath=> "//a[@id='client-contract-save-0']"
  #edit account info
  link :edit_account_info, :xpath=> "//a[@id='basic-account-edit']"
  #select am
  select_list :select_am, :id=> "ClientAmPercentage_0_amid"
  #select second am
  select_list :select_second_am, :id=> "ClientAmPercentage_1_amid"
  #input percentage
  text_field :input_percentage, :id=> "ClientAmPercentage_0_percentage"
  #input second percentage
  text_field :input_second_percentage, :id=> "ClientAmPercentage_1_percentage"
  #input client Am Percentage notes
  text_field :input_percentage_notes, :id=> "ClientAmPercentage_0_split_notes"
  #input second client Am Percentage notes
  text_field :input_second_percentage_notes, :id=> "ClientAmPercentage_1_split_notes"
  #add am
  button :add_am, :xpath=> "//input[@id='add-edit-am']"
  #delete am 
  element :delete_am, :i ,:xpath=> "//div[@id='add-edit-am-0']/div/div/i"
  #add sale note
  link :add_sale_note, :xpath=> "//a[@id='add-salenote-btn']"
  #client sale notes type
  select_list :select_salenotes_type, :id=> "ClientSaleNotes_type"
  #input client salenotes date string
  text_field :input_salenotes_date, :id=> "ClientSaleNotes_dateString"
  #select salenotes date
  td :select_salenotes_date, :xpath=> "//tr[4]/td[3]"
  #client sale notes
  text_field :input_salenotes, :id=> "ClientSaleNotes_notes"
  #client sale notes nextstep
  text_field :input_salenotes_nextstep, :id=> "ClientSaleNotes_nextstep"
  #create contact btn
  button :create_contact_btn, :xpath=> "//input[@id='create-contact-btn']"
  #client contact chinesename
  text_field :input_contact_chinesename, :id=> "ClientContact_chinesename"
  #client contact firstname
  text_field :input_contact_firstname, :id=> "ClientContact_firstname"
  #client contact lastname
  text_field :input_contact_lastname, :id=> "ClientContact_lastname"
  #client contact mobilephone
  text_field :input_contact_mobilephone, :id=> "Contact_mobile_mobilephone"
  #contact tel citycode
  text_field :input_tel_citycode, :id=> "Contact_tel_citycode"
  #contact tel telephone
  text_field :input_tel_telephone, :id=> "Contact_tel_telephone"
  #contact tel extension
  text_field :input_tel_extension, :id=> "Contact_tel_extension"
  #contact email other
  text_field :input_email_other, :id=> "Contact_email_other"
  #contact weixin other
  text_field :input_weixin_other, :id=> "Contact_weixin_other"
  #add contact
  button :add_another_contact, :id=> "add_contact"
  #input contact content
  text_field :input_contact_content, :xpath=> "//div[@id='contact_content']/div/div/input"
  #client contact position
  text_field :input_contact_position, :id=> "ClientContact_position"
  #select location
  div :select_contact_location, :id=> "location-selector"
  #select client contact nps
  select_list :select_contact_nps, :id=> "ClientContact_nps"
  #select client contact rem
  select_list :select_contact_rem, :id=> "ClientContact_rem"
  #edit compliance notes
  element :edit_compliancenote, :i ,:xpath=> "//div[3]/div/div[3]/i"
  #input client compliance note message
  text_field :input_compliance_note ,:id=> "ClientComplianceNote_message"
  #save compliance notes after edit
  element :save_compliance_note, :i ,:xpath=> "//div[2]/i"
  #delete compliance link
  element :delete_compliance_link, :i ,:xpath=> "//div/div[3]/div[3]/i[2]"
  #the content of compliance 
  div :compliance_text, :xpath=> "//div[@id='compliance-notes-area']/div[3]/div"
  #click to edit cash note
  element :edit_cashnote, :i ,:xpath=> "//div[5]/a/i"
  #cash content
  text_field :input_cashnote, :xpath=> "//div[@id='cash-area']/div[2]/div/div/input"
  #save cash note 
  element :save_cashnote, :i ,:xpath=> "//div[3]/a/i"
  #the content of cash note
  div :cashnote_text , :xpath=> "//div[@id='cash-area']/div[2]/div/div[2]"
  #link of the tnc
  link :link_of_tnc, :xpath=> "//a[@id='compliance_tnc']"
  #select tnc
  select_list :select_tnc_list, :xpath=> "//div[@id='compliance-area']/div[2]/div[2]/div/div[2]/div/form/div/div/div/select"
  #submit the tnc
  button :submit_tnc, :xpath=> "//button[@type='submit']"

  def projects_link_test#profile页面projects的链接验证
       begin
      temp = Array.new   
      temp = $navi.url
      client_id =temp.split("=")[1]      
      $navi.goto "http://qa.ndb.capvision.com/client/index/projects?id=#{client_id}&type=1"
      title = self.title_text_element.when_present.text
      if title =="Consultation"
        puts "Consultation OK"
      else 
        collect_err "go to Consultation error!"
      end
      $navi.goto "http://qa.ndb.capvision.com/client/index/projects?id=#{client_id}&type=2"
      title = self.title_text_element.when_present.text
      if title =="Capvision data"
        puts "Capvision data OK"
      else
        collect_err "go to Capvision data error!"
      end
      $navi.goto "http://qa.ndb.capvision.com/client/index/projects?id=#{client_id}&type=3"
      title = self.title_text_element.when_present.text
      if title =="GES ConVeyTM"
        puts "GES ConVey OK"
      else
        collect_err "go to GES ConVey error!"
      end
      $navi.goto "http://qa.ndb.capvision.com/client/index/projects?id=#{client_id}&type=4"  
      title = self.title_text_element.when_present.text    
      if title =="Conference"
        puts "Conference OK"
      else
        collect_err "go to conference_error!"
      end
      $navi.goto "http://qa.ndb.capvision.com/client/index/projects?id=#{client_id}&type=5"
      title = self.title_text_element.when_present.text
      if title =="Hr service"
        puts "Hr service OK"
      else
        collect_err "go to hr_service_error!"
      end
      $navi.goto "http://qa.ndb.capvision.com/client/index/projects?id=#{client_id}&type=6"
      title = self.title_text_element.when_present.text
      if title =="International Consultation"
        puts "International Consultation OK"
      else
        collect_err "go to international_consultation_error!"
      end      
      rescue 
        f = File.new(File.join(path,"#{time}.txt"),"a+")
        f.puts "error:#{$!} at:#{$@}"
        f.puts "=======================================================================#{log_time}"
        f.close
      end
  end

  def edit_basic_information teamsize,type,chinesename#编辑profile页面的基本资料框体
      begin
      self.edit_basic_info_element.when_present.click
      sleep 1
      self.select_client_teamsize_element.when_present.select(teamsize)
      self.select_client_type_element.when_present.select(type)
      self.input_client_chinesename_element.when_present.clear
      self.input_client_chinesename_element.when_present.append chinesename
      if self.old_location_element.exist?
        self.old_location_element.when_present.click 
      end  
      self.click_to_set_location_element.when_present.click
      self.select_location_element.when_present.click
      self.edit_basic_info_element.when_present.click
      rescue 
        f = File.new(File.join(path,"#{time}.txt"),"a+")
        f.puts "error:#{$!} at:#{$@}"
        f.puts "=======================================================================#{log_time}"
        f.close
      end
  end
    
  def add_compliance_notes note#添加财务备注
      begin
        self.add_compliance_note_element.when_present.click
        self.input_client_compliance_message_element.when_present.clear
        self.input_client_compliance_message_element.when_present.append "1@_ q2%$## -"
        self.save_compliance_note_element.when_present.click
        rescue 
        f = File.new(File.join(path,"#{time}.txt"),"a+")
        f.puts "error:#{$!} at:#{$@}"
        f.puts "=======================================================================#{log_time}"
        f.close
      end
  end  
    
  def add_cash cash#添加资金备注 
      begin
        self.add_cash_note_element.when_present.click
        self.input_cash_note_element.when_present.clear
        self.input_cash_note_element.when_present.append cash
        self.save_cash_note_element.when_present.click
        rescue 
        f = File.new(File.join(path,"#{time}.txt"),"a+")
        f.puts "error:#{$!} at:#{$@}"
        f.puts "=======================================================================#{log_time}"
        f.close
      end
  end
  
  def add_date
      begin
        self.add_cash_note_element.when_present.click
        self.input_cash_note_element.when_present.clear
        self.input_cash_note_element.when_present.append "188"
        self.input_cash_date_element.when_present.click
        self.send_keys :down
        self.save_cash_note_element.when_present.click
        rescue 
        f = File.new(File.join(path,"#{time}.txt"),"a+")
        f.puts "error:#{$!} at:#{$@}"
        f.puts "=======================================================================#{log_time}"
        f.close
      end
  end
    
    
  def add_cash_alert_test#添加资金错误提示验证
        self.add_cash_alert_info_element
  end
    
  def edit_crm_information status,statusnotes,alert,reminder#编辑CRM
      begin
        self.edit_crm_info_element.when_present.click
        self.select_relation_status_element.when_present.select(status)   #Annual
        self.input_relation_statusnotes_element.when_present.clear
        self.input_relation_statusnotes_element.when_present.append statusnotes
        self.input_relation_alert_element.when_present.clear
        self.input_relation_alert_element.when_present.append alert
        self.input_relation_reminder_element.when_present.clear
        self.input_relation_reminder_element.when_present.append reminder
        self.edit_crm_info_element.when_present.click
        rescue 
        f = File.new(File.join(path,"#{time}.txt"),"a+")
        f.puts "error:#{$!} at:#{$@}"
        f.puts "=======================================================================#{log_time}"
        f.close
      end
  end
    
  def edit_contract_information period#编辑contract information
      begin
        self.add_contract_info_element.when_present.click
        self.input_contract_details_element.when_present.clear
        self.input_contract_details_element.when_present.append "at qweq eqwe qweqwe wqe_@asda "
        self.input_contract_size_element.when_present.clear
        self.input_contract_size_element.when_present.append "2998"
        self.input_contract_revenuenote_element.when_present.clear
        self.input_contract_revenuenote_element.when_present.append "at1 qweq eqwe qweqwe wqe_@asda"
        self.input_contract_period_element.when_present.clear
        self.input_contract_period_element.when_present.append period
        self.input_contract_closedate_element.when_present.click
        self.select_closedate_element.when_present.click
        self.input_contract_revenuenote_element.when_present.click
        self.save_contract_info_element.when_present.click
        rescue 
        f = File.new(File.join(path,"#{time}.txt"),"a+")
        f.puts "error:#{$!} at:#{$@}"
        f.puts "=======================================================================#{log_time}"
        f.close
      end
  end  
    
  def edit_account_information percentage#编辑account information
      begin
        self.edit_account_info_element.when_present.click
        self.select_am_element.when_present.select(person)
        self.input_percentage_element.when_present.clear
        self.input_percentage_element.when_present.append percentage
        self.input_percentage_notes_element.when_present.clear
        self.input_percentage_notes_element.when_present.append "ada asda# ad@ asdz$ sf___--"
        self.edit_account_info_element.when_present.click
        rescue 
        f = File.new(File.join(path,"#{time}.txt"),"a+")
        f.puts "error:#{$!} at:#{$@}"
        f.puts "=======================================================================#{log_time}"
        f.close
      end
  end
    
  def add_am am,percentage,whether_verify_alert#在profil页面account框体中增加am
      begin
        self.edit_account_info_element.when_present.click
        self.add_am_element.when_present.click
        self.select_second_am_element.when_present.select(am)
        self.input_second_percentage_element.when_present.clear
        self.input_second_percentage_element.when_present.when_present.append percentage
        self.input_second_percentage_notes_element.when_present.clear
        self.input_second_percentage_notes_element.when_present.append "at ada asda# ad@ asdz$ sf___--#{rand(100000)}"
        if whether_verify_alert == "on"
        sleep 1
        self.edit_account_info_element.when_present.click
        else
        message = self.alert do  
          self.delete_am_element.when_present.click 
        end
        sleep 4
        self.edit_account_info_element.when_present.click
        end
        rescue 
        f = File.new(File.join(path,"#{time}.txt"),"a+")
        f.puts "error:#{$!} at:#{$@}"
        f.puts "=======================================================================#{log_time}"
        f.close
      end
  end


  def select_random_client
      begin 
      f= "18","20","28","36","40","41","34","23","53","50","25"
      id = f[rand(0..7)]
      puts id
      $navi.goto "http://qa.ndb.capvision.com/client/index/view?id=#{id}"
      rescue 
        f = File.new(File.join(path,"#{time}.txt"),"a+")
        f.puts "error:#{$!} at:#{$@}"
        f.puts "=======================================================================#{log_time}"
        f.close
      end                
  end
  
  def create_sale_note#创建一个销售备注
       begin 
      go_sub_page 'Sale Notes'   
      self.add_sale_note_element.when_present.click
      d= "Sales Visit","Phone Call","Email"
      type = d[rand(0..2)].to_s
      self.select_salenotes_type_element.when_present.select(type)
      self.input_salenotes_date_element.when_present.click
      self.select_salenotes_date_element.when_present.click
      t = Time.now
      time = t.strftime("%m%d%H").freeze
      self.input_salenotes_element.when_present.append time+"akdjasljd_aks
      ;oldaks@"
      self.input_salenotes_nextstep_element.when_present.append time+"!@jjojsadallm
      xmaspjdasp"
      self.add_sale_note_element.when_present.click
      if self.text.scan(time)
        puts "create sale note......OK "
      else
        collect_err "fail to create sale note !"
      end
      rescue 
        f = File.new(File.join(path,"#{time}.txt"),"a+")
        f.puts "error:#{$!} at:#{$@}"
        f.puts "=======================================================================#{log_time}"
        f.close
      end
  end
  
  def create_contact#创建一个联系人  
       begin
      go_sub_page 'Client Contacts'
      self.create_contact_btn_element.when_present.click
      name = "at_weijun"+[*'0'..'9',*'A'..'Z'].sample(4).join
      self.input_contact_chinesename_element.when_present.append name
      self.input_contact_firstname_element.when_present.append "at_weijun"
      self.input_contact_lastname_element.when_present.append "at_weijun"
      self.input_contact_mobilephone_element.when_present.append "1519577#{rand(10000)}"
      self.input_tel_citycode_element.when_present.append "20#{rand(10000)}"
      self.input_tel_telephone_element.when_present.append "5128#{rand(10000)}"
      self.input_tel_extension_element.when_present.append "23"
      self.input_email_other_element.when_present.append "weijun#{rand(10000)}@163.com"
      self.input_weixin_other_element.when_present.append "12313123123"
      self.add_another_contact_element.when_present.click
      self.input_contact_content_element.when_present.append "573654323"
      self.input_contact_position_element.when_present.append "业务经理"
      self.select_contact_location_element.when_present.click
      c= "重庆-66","河北-67","上海-65","天津-64","北京-63","浙江-73","黑龙江-71","湖南-80"
                城市 =  c[rand(0..7)].to_s
      self.link(:id, "#{城市}").when_present.click
      autocomplete = self.ul :class => 'select2-choices'
      autocomplete.when_present.click
      sleep 2
      d= "Aerospace - 航空","Agriculture - 农业","Chemicals - 化学产品","Energy - 能源","Environment - 环保","Food & Beverage - 食品饮料","Healthcare - 医疗","TMT - 网络技术"
                 行业 = d[rand(0..7)].to_s
      self.div(:text, "#{行业}").when_present.click
      sleep 2
      self.select_contact_nps_element.when_present.select("Promoter")
      self.select_contact_rem_element.when_present.select("test_km1")
      self.select_contact_nps_element.when_present.select("Promoter")
      self.create_contact_save_button_element.when_present.click
      rescue 
        f = File.new(File.join(path,"#{time}.txt"),"a+")
        f.puts "error:#{$!} at:#{$@}"
        f.puts "=======================================================================#{log_time}"
        f.close
      end
  end

  def edit_compliance_notes update_notes
    self.edit_compliancenote_element.when_present.click  
    self.input_compliance_note_element.when_present.clear
    self.input_compliance_note_element.when_present.append update_notes
    self.save_compliance_note_element.when_present.click
  end
    
  def delete_compliance_notes
    message = self.alert do
      self.delete_compliance_link_element.when_present.click
    end
  end  
    
  def compliance
    sleep 2
    self.compliance_text_element.when_present.text
  end  
    
  def error_info num
    self.li(:xpath, "//ul[@id='error-info']/li[#{num}]").when_present.text
  end  
  
  def edit_cash_note cash_note
    self.edit_cashnote_element.when_present.click
    sleep 2
    self.input_cashnote_element.when_present.clear
    self.input_cashnote_element.when_present.append cash_note
    sleep 2
    self.save_cashnote_element.when_present.click
  end
  
  def cash_note
    sleep 2
    self.cashnote_text_element.when_present.text 
  end
  
  def tnc
    sleep 2
    self.link_of_tnc_element.when_present
  end
  
  def choose_tnc
    tnc.click
    self.select_tnc_list_element.when_present.select "凯盛专家网络条款协议_V4.0"
    self.submit_tnc_element.when_present.click
  end
  
end