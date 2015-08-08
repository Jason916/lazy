#encoding: utf-8
require File.expand_path 'app/cases/shared/main.rb'
class ContactPage < NdbPage
  
  page_url "#{$config.host}client/contact/index"
  
  select_list :type, :id=> "ClientContact_client_type"
  button :filter, :name=> "yt0"
  table :contact_list, :class=> "items table table-striped"
  text_field :add_note_information, :id=> "note-text"
  button :click_submit_btn, :id=> "note-submit"
  button :add_other_contact_btn, :id=> "btn-add-other"
  text_field :contact_other, :id=> "Contact_other"
  link :click_transfer_btn, :text=> "Transfer"
  text_field :contact_transfer_email, :id=> "ClientContact_email"
  button :save, :id=> "yw1"
  link :click_web_invitation_btn, :id=> "yw6"
  text_field :input_keyword, :id=> "ClientContact_keyword"
  #contact_profile_page send web account
  link :click_send_webaccount_btn, :text=> "Send Web Account(Sent)"
  button :click_send_btn, :id=> "yw1"
  #add project btn
  link :add_project, :id=> "yw4"
  #contact title
  link :contact_title_name, :xpath=> "//ul[@id='yw0']/li[2]/a"
  #add contacts mobile
  element :add_contacts_mobile, :i ,:xpath=> "//i[@id='btn-add-1']"
  #input mobilephone number
  text_field :input_mobile_num, :xpath=> "//input[@id='Contact_mobilephone']"
  #update mobilephone number
  element :update_contacts_mobile, :i ,:xpath=> "//i[@action='update']"
  #save mobilephone number
  element :save_contacts_btn, :i ,:xpath=> "//i[@action='save']"
  #add tel
  element :add_tel, :i ,:xpath=> "//i[@id='btn-add-2']"
  #input contact citycode
  text_field :input_contact_citycode, :xpath=> "//input[@id='Contact_citycode']"
  #input contact telephone 
  text_field :input_contact_telephone, :xpath=> "//input[@id='Contact_telephone']"
  #input contact extension
  text_field :input_contact_extension, :xpath=> "//input[@id='Contact_extension']"
  #update contact tel
  element :update_contacts_tel, :i ,:xpath=> "//div[2]/div[3]/div/div/i"
  #add contacts email
  element :add_contacts_email, :i ,:xpath=> "//i[@id='btn-add-9']"
  #input contacts email
  text_field :input_contact_email ,:xpath=> "//input[@id='Contact_other']"
  #update contact email
  element :update_contacts_email, :i ,:xpath=> "//div[3]/div[3]/div/div/i"
  #click to select project
  element :click_to_select_project, :input ,:xpath=> "//input[@type='text']"
  #click OK btn
  button :click_ok_btn, :text=> "Ok"
  #h1 text
  h1 :h1_text ,:xpath=> "//h1"
  #select add project
  checkbox :select_add_project ,:xpath=> "//input[@id='task-grid_c0_4']"
  #select to delete project
  select_list :select_to_delete_project ,:xpath=> "//select[@id='action']"
  #task update btn
  button :task_update ,:id=> "task_update_btn"
  #the alert of delete project
  div :alert_of_delete_project ,:xpath=> "//div[3]/div/div/div"
  #click select location 
  div :click_location ,:id=> "location-selector"
  #select city
  link :select_city ,:xpath=> "//a[contains(text(),'上海')]"
  #search btn on contact page
  button :search_btn ,:id=> "yw2"
  #name of name
  td :city_of_name ,:xpath=> "//td[10]"
  #delete note 
  element :delete_note , :i ,:xpath=> "//div/div/div/div[4]/i[2]"
  #contact basic edit btn
  element :edit_contact_basic , :i ,:xpath=> "//a[@id='contact_basic_edit_btn']/i"
  #input contact firstname
  text_field :input_contact_firstname ,:id=> "Contact_firstname"
  #input contact lastname
  text_field :input_contact_lastname ,:id=> "Contact_lastname"
  #click contact
  div :click_contact ,:xpath=> "//div[@id='basic_information_area_div']/div/div/div[2]/div/div/div[2]"
  #contact preference edit btn
  element :edit_contact_preference , :i ,:xpath=> "//a[@id='contact_preference_edit_btn']/i"
  #contact industry coverage
  ul :contact_industry_coverage ,:xpath=> "//div[@id='s2id_Contact_industrycoverage']/ul"
  #select industry
  div :select_industry ,:text=> "Aerospace - 航空"
  #add other contact
  element :click_add_other_contact , :i ,:xpath=> "//div[5]/div[3]/div/div/i[2]"
  #btn of add other
  button :add_other_contact_btn ,:id=> "btn-add-other"
  #select contact type
  select_list :select_contact_type ,:id=> "Contact_type"
  #transfer alert info 
  div :transfer_alert_info ,:xpath=> "//div/div[2]/div"
  #click transfer client
  span :click_transfer_client ,:xpath=> "//div[@id='s2id_ClientContact_clientid']/a/span"
  
  
  
  
  
  
  

  def num
    num = rand(2..5)
    return num
  end 

  def km_login        #km_login
    go_main_page "admin"
    go_sub_page "Logout"
    set_username.set "test_km1"
    set_password.set "123456"
    login_btn
    sleep 2
  end

  def click_add_project_button #点击add project按钮
    self.add_project_element.when_present.click
  end

  def go_contact_page #跳转至contact页面
    go_main_page "Client"
    go_sub_page "Contacts"
  end

  def goto_contacts_profile_page #hard code了contact profile 页面
    $navi.goto "http://qa.ndb.capvision.com/client/contact/view?id=339"
  end

  def goto_contact_page id
    $navi.goto "http://qa.ndb.capvision.com/client/contact/view?id=#{id}"
  end

  def contact_title
    self.contact_title_name_element.when_present.text
  end

  def edit_contacts_mobile#编辑联系人的手机号码
    begin
    if self.add_contacts_mobile_element.exist?     
       self.add_contacts_mobile_element.when_present.click
       self.input_mobile_num_element.when_present.clear
       self.input_mobile_num_element.when_present.append "15618886543"
    else
       self.update_contacts_mobile_element.when_present.click
       self.input_mobile_num_element.when_present.clear
       self.input_mobile_num_element.when_present.append "15618886543"
    end
    self.save_contacts_btn_element.when_present.click
    rescue 
        f = File.new(File.join(path,"#{time}.txt"),"a+")
        f.puts "error:#{$!} at:#{$@}"
        f.puts "=======================================================================#{log_time}"
        f.close
    end
  end
  
  def edit_contacts_tel#编辑了联系人的电话号码
    begin
    if self.add_tel_element.exist? 
      self.add_tel_element.when_present.click
      self.input_contact_citycode_element.when_present.clear
      self.input_contact_citycode_element.when_present.append "021"
      self.input_contact_telephone_element.when_present.clear
      self.input_contact_telephone_element.when_present.append "38561859"
      self.input_contact_extension_element.when_present.clear
      self.input_contact_extension_element.when_present.append "0"
    else  
      self.update_contacts_tel_element.when_present.click
      self.input_contact_telephone_element.when_present.clear
      self.input_contact_telephone_element.when_present.append "38561859"    
    end
    self.save_contacts_btn_element.when_present.click
    rescue 
        f = File.new(File.join(path,"#{time}.txt"),"a+")
        f.puts "error:#{$!} at:#{$@}"
        f.puts "=======================================================================#{log_time}"
        f.close
    end
  end
  
  def edit_contacts_email#编辑了联系人的邮箱
    begin
    if self.add_contacts_email_element.exist? 
      self.add_contacts_email_element.when_present.click
      self.input_contact_email_element.when_present.clear
      self.input_contact_email_element.when_present.append "yund122@gtfund.com"
    else
      self.update_contacts_email_element.when_present.click
      self.input_contact_email_element.when_present.clear
      self.input_contact_email_element.when_present.append "yund122@gtfund.com"
    end
    self.save_contacts_btn_element.when_present.click
    sleep 3
    rescue 
        f = File.new(File.join(path,"#{time}.txt"),"a+")
        f.puts "error:#{$!} at:#{$@}"
        f.puts "=======================================================================#{log_time}"
        f.close
    end
  end

  def add_project project#添加一个项目
    click_add_project_button
    self.click_to_select_project_element.when_present.click
    self.div(:text, "#{project}").when_present.click
    message = self.alert do
      self.click_ok_btn_element.when_present.click
    end
    sleep 2
    message.should == "Add successfully. Do you want to view this project?"
    h1 = self.h1_text_element.text
    if h1 == project
      puts "add project.....OK"
      sleep 2
      self.select_add_project_element.when_present.click
      self.select_to_delete_project_element.when_present.select "Deleted"
      self.task_update_element.when_present.click
      sleep 2
      a = self.alert_of_delete_project_element.when_present.text.to_s
      if a == "Change task status successfully."
        puts "delete project.....OK"
      else
        collect_err "fail to delete project!"
      end
    else
     collect_err "add project fail!"
    end
  end
  
  def filter_by_location#用地理位置来筛选contacts
     begin
      self.click_location_element.when_present.click 
      self.select_city_element.when_present.click
      self.search_btn_element.when_present.click
      a = self.city_of_name_element.when_present.text
      if a.to_s == "China-"+city.to_s
        puts "filter by location is ok."  
      else
        collect_err "city is not match! error!"
      end  
     rescue 
        f = File.new(File.join(path,"#{time}.txt"),"a+")
        f.puts "error:#{$!} at:#{$@}"
        f.puts "=======================================================================#{log_time}"
        f.close
     end
  end
  
  def delete_note_information
    message = self.alert do
      self.delete_note_element.when_present.click
    end
  end
  
  def edit_basic_information
      self.edit_contact_basic_element.when_present.click
      self.input_contact_firstname_element.when_present.clear
      self.input_contact_firstname_element.when_present.append "蜘蛛侠1"
      self.input_contact_lastname_element.when_present.clear
      self.input_contact_lastname_element.when_present.append "蜘蛛侠"
      self.edit_contact_basic_element.when_present.click
      self.click_contact_element.when_present.click
  end
  
  def edit_preference
      self.edit_contact_preference_element.when_present.click
      self.contact_industry_coverage_element.when_present.click
      self.select_industry_element.when_present.click
      self.edit_contact_preference_element.when_present.click
  end

  def add_other_contact
    if self.click_add_other_contact_element.exist?
      message = self.alert do
        self.click_add_other_contact_element.when_present.click
      end
      sleep 5
      self.add_other_contact_btn_element.when_present.click
      self.select_contact_type_element.when_present.select "MSN"
      self.contact_other="771@hotmail.com"
      self.save_contacts_btn_element.when_present.click
    else
      self.add_other_contact_btn
      self.select_contact_type_elelemt.when_present.select "MSN"
      self.contact_other="771@hotmail.com"
      self.save_contacts_btn_element.when_present.click
    end
  end
  
  def transfer_alert
    self.transfer_alert_info_element.when_present.text
  end

  def contact_transfer_client client_name
    self.click_transfer_client_element.when_present.click
    self.div(:text, "#{client_name}").when_present.click
  end

end