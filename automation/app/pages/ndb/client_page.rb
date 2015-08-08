#encoding: utf-8
require File.expand_path 'app/cases/shared/main.rb'
class ClientPage < NdbPage
  page_url "#{$config.host}client/index/index" 

  link :clients, :href=> "/client/index/index"
  link :contact, :href=> "/client/contact/index"
  #search button
  button :search, :value=> "Search"

  button :search_client_contact,:name=>"yt0"

  #keywords textfield
  text_field :keywords, :id=> "Client_keyword"
  button :filter, :name=> "yt0"
  table :client_list, :class=> "items table table-striped"
  select_list :status, :id=> "Client_status"
  select_list :types, :id=> "Client_type"
  link :create_client, :href=> "/client/index/create"
  link :profile, :href=> "/client/index/view?id=28"
  checkbox :choose_first_contact, :id=> "client-contact-grid_c0_0"
  button :inactive_btn, :id=> "set-inactive-btn"
  select_list :client_contact_status, :id=> "ClientContact_status"
  button :active_btn, :id=> "set-active-btn"
  select_list :client_contact_nps, :id=> "ClientContact_nps"
  select_list :client_contact_registration, :id=> "ClientContact_registration"
  text_field :client_contact_keywords, :id=> "ClientContact_keywords"
  #click create client link
  link :create_client_button, :xpath=> "//a[contains(text(),'Create Client')]"
  #click create button
  button :create_button, :xpath=> "//button[@id='yw2']"
  #client alert verify
  div :alert_verify, :xpath=> "//form[@id='client-contact-search-form']/div[2]"
  #select client team size
  select_list :select_client_teamsize, :id=> "Client_teamsize"
  #select client type
  select_list :select_client_type, :id=> "Client_type"
  #input client name
  text_field :client_name, :xpath=> "//input[@id='Client_name']"
  #input client chinese name
  text_field :client_chinesename, :xpath=> "//input[@id='Client_chinesename']"
  #clear location
  div :clear_location, :xpath=> "//form[@id='client-basic-info-form']/div[6]/div/div/div/div/div/li/div"
  #select location
  div :select_location, :id=> "location-selector"
  #click location(shanghai) link
  link :location_link, :xpath=> "//a[@id='上海-65']"
  #select client am 
  select_list :client_am, :id=> "ClientAmPercentage_0_amid"
  #client am percentage
  text_field :client_am_percentage, :id=> "ClientAmPercentage_0_percentage"
  #client am percentage notes
  text_field :input_client_note, :id=> "ClientAmPercentage_0_split_notes"
  #client relation status
  select_list :client_relation_status, :id=> "ClientRelation_status"
  #input client relation status notes
  text_field :client_relation_statusnotes, :id=> "ClientRelation_statusnotes"
  #client relation alert
  text_field :client_relation_alert, :id=> "ClientRelation_alert"
  #client relation reminder
  text_field :client_relation_reminder, :id=> "ClientRelation_reminder"
  #client contract details
  text_field :client_contract_details, :id=> "ClientContract_details"
  #client contract size
  text_field :client_contract_size, :id=> "ClientContract_size"
  #client contract revenue note
  text_field :client_contract_revenuenote, :id=> "ClientContract_revenuenote"
  #client contract period
  text_field :client_contract_period, :id=> "ClientContract_period"
  #client contract closedate string
  text_field :client_contract_closedate_string, :id=> "ClientContract_closedateString"
  #select date
  td :select_date, :xpath=> "//tr[2]/td"
  #basic info edit
  link :edit_basic_info, :xpath=> "//a[@id='basic-info-edit']"
  #click edit sale note link
  element :edit_sale_note, :i ,:xpath=> "//a[2]/i"
  #select client sale notes type
  select_list :select_clientsalenotes_type, :id=> "ClientSaleNotes_type"
  #save sale note
  link :save_sale_note,:xpath=> "//form/a"
  #click add sale note btn
  link :add_sale_note, :xpath=> "//a[@id='add-salenote-btn']"
  #click client sale notes date 
  text_field :client_sale_notes_date, :id=> "ClientSaleNotes_dateString"
  #select sale notes date
  td :select_sale_notes_date, :xpath=> "//tr[4]/td[3]"
  #input client sale notes
  text_field :input_client_sale_note, :id=> "ClientSaleNotes_notes"
  #client sale notes nextstep
  text_field :input_client_sale_nextstep, :id=> "ClientSaleNotes_nextstep"
  #delete client sale note
  element :delete_client_sale_note, :i ,:xpath=> "//div/a/i"
  
  
  #edit basic information
  element :edit_basic_information ,:i,:xpath=>"//a[@id='basic-info-edit']/i"

  #client type
  select_list :client_type,:id=>"Client_type"

  #edit sale notes
  element :edit_sale_notes,:i,:xpath=>"//a[2]/i"

  #sale notes type
  select_list :sale_notes_type,:id=>"ClientSaleNotes_type"

  #save sale notes
  element :save_sale_notes,:i,:xpath=>"//form/a/i"

  #delete sale notes
  element :delete_sale_notes,:i,:xpath=>"//div/a/i"
  # element :delete_sale_notes,:i,:xpath=>"//*[@id='salenote_del_254']/i"

  #跳转至profile页面
  def direct_to_profile_page
    self.profile
    turn_to ProfilePage
  end

  #跳转至client页面
  def direct_to_client_page
    self.client
    turn_to ClientPage
  end

  #跳转至contact页面
  def direct_to_contact_page
    self.contact
    turn_to ContactPage
  end

  #点击搜索按钮 
  # def click_search_button
  #   self.search_button
  #   turn_to ClientPage
  # end 
   
  def num
    num = rand(2..5)
    return num
  end 
  
  def goto_client_contacts_page
      $navi.goto "http://qa.ndb.capvision.com/client/index/clientcontact?id=18"
  end
  
  def backto_client_page
      $navi.goto "http://qa.ndb.capvision.com/client/index/index"
  end
  
  def goto_client_subpage subpage
      self.link(:text,"#{subpage}").when_present.click
  end
  
  def fill_basic_information#填写profile的basic information
      begin
      self.select_client_teamsize_element.when_present.select("500-999人")
      temp = "Consulting Firm","Private Equity","Hedge Fund","Venture Capital","Mutual Fund","Corporate","Financial Firm","Others"
      type = temp[rand(0..7)].to_s
      self.select_client_type_element.when_present.select(type)
      self.client_name_element.when_present.clear
      num= [*'a'..'z',*'0'..'9',*'A'..'Z'].sample(8).join
      puts num
      self.client_name_element.when_present.append "at_test_"+num
      self.client_chinesename_element.when_present.clear
      self.client_chinesename_element.when_present.append "五指若风"
      if self.clear_location?
       self.clear_location_element.when_present.click 
      else
       self.select_location_element.when_present.click
       self.location_link_element.when_present.click
      end
      rescue 
        f = File.new(File.join(path,"#{time}.txt"),"a+")
        f.puts "error:#{$!} at:#{$@}"
        f.puts "=======================================================================#{log_time}"
        f.close
      end
  end
     
  def fill_account_manager#填写profile的account manager
       begin
       self.client_am_element.when_present.select(person)
       self.client_am_percentage_element.clear
       self.client_am_percentage_element.when_present.append "100"
       self.input_client_note_element.clear
       self.input_client_note_element.when_present.append "at ada asda# ad@ asdz$ sf___--#{rand(10000)}"
      rescue 
        f = File.new(File.join(path,"#{time}.txt"),"a+")
        f.puts "error:#{$!} at:#{$@}"
        f.puts "=======================================================================#{log_time}"
        f.close
      end
  end
     
  def fill_crm#填写profile的CRM
       begin
      self.client_relation_status_element.when_present.select("Project")
      self.client_relation_statusnotes_element.clear
      self.client_relation_statusnotes_element.when_present.append "at sdas asdad@1ewe#!@_ - -#{rand(10000)}"
      self.client_relation_alert_element.clear
      self.client_relation_alert_element.when_present.append "at sdas asdad@1ewe#!@_ - -#{rand(10000)}"
      self.client_relation_reminder_element.clear
      self.client_relation_reminder_element.when_present.append "at sdas asdad@1ewe#!@_ - -#{rand(10000)}"
      rescue 
        f = File.new(File.join(path,"#{time}.txt"),"a+")
        f.puts "error:#{$!} at:#{$@}"
        f.puts "=======================================================================#{log_time}"
        f.close
      end
  end
  
  def fill_contract_information#填写profile的contract information
       begin
      self.client_contract_details_element.when_present.clear   
      self.client_contract_details_element.when_present.append "at qweq eqwe qweqwe wqe_@asda "   
      self.client_contract_size_element.clear
      self.client_contract_size_element.when_present.append "2999"
      self.client_contract_revenuenote_element.clear
      self.client_contract_revenuenote_element.when_present.append "at qweq eqwe qweqwe wqe_@asda"
      self.client_contract_period_element.clear
      self.client_contract_period_element.when_present.append "1"
      self.client_contract_closedate_string_element.when_present.click
      self.select_date_element.when_present.click
      self.client_contract_revenuenote_element.when_present.click
      rescue 
        f = File.new(File.join(path,"#{time}.txt"),"a+")
        f.puts "error:#{$!} at:#{$@}"
        f.puts "=======================================================================#{log_time}"
        f.close
      end
  end
     
  def create_client#创建一个client 
      self.create_client_button_element.when_present.click  
      fill_basic_information
      fill_account_manager
      fill_crm
      fill_contract_information
      self.create_button_element.when_present.click 
  end
  
  def change_client_type type
      self.edit_basic_info_element.when_present.click
      self.select_client_type_element.when_present.select(type)
      self.edit_basic_info_element.when_present.click
  end
  
  def edit_sale_notes
      self.edit_sale_note_element.when_present.click
      self.select_clientsalenotes_type_element.when_present.select "Email"
      self.save_sale_note_element.when_present.click
      sleep 2
  end
  
  def create_sale_note
      begin    
      self.add_sale_note_element.when_present.click
      d= "Sales Visit","Phone Call","Email"
      type = d[rand(0..2)].to_s
      self.select_clientsalenotes_type_element.when_present.select(type)
      self.client_sale_notes_date_element.when_present.click
      self.select_sale_notes_date_element.when_present.click
      t = Time.now
      time = t.strftime("%m%d%H").freeze
      self.input_client_sale_note_element.when_present.clear
      self.input_client_sale_note_element.when_present.append time+"akdjasljd_aks#;  oldaks@"
      self.input_client_sale_nextstep_element.when_present.clear
      self.input_client_sale_nextstep_element.when_present.append time+"!@jjojsadallm #xmaspjdasp"
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
  
  def delete_sale_note
    message = self.alert do
      self.delete_client_sale_note_element.when_present.click
    end
    sleep 2
    message.should == "Are you sure you want to delete this sale note?"
  end
  
end