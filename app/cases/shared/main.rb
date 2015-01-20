#encoding: utf-8
require "rubygems"
require "watir-webdriver"
require "pathname"

  
  def time
    t = Time.now
    t.strftime("%Y-%m-%d")
  end
 
  def log_time
    t = Time.now
    t.strftime("%Y-%m-%d(%H:%M)")
  end
  
  def real_path
    real_path = Pathname.new(File.dirname(__FILE__)).realpath
  end
  
  def path
    path = "#{real_path}/error_log"
  end
  
  def set_username
    self.text_field(:id, "LoginForm_username")
  end
  
  def set_password
    self.text_field(:id, "LoginForm_password")
  end
  
  def login_btn
    self.button(:name, "yt0").when_present.click
  end
  
  def collect_err err
    f = File.new(File.join(path,"#{time}.txt"),"a+")
    f.puts "#{err.to_s}"
    f.puts "=======================================================================#{log_time}"
    f.close
  end
    
  def person
    person = "test_am1"
  end
 
  def go_main_page pagename
    self.link(:xpath, "//a[contains(text(),'#{pagename}')]").when_present.click
  end
  
  def go_sub_page subpage
    self.link(:xpath, "//a[contains(text(),'#{subpage}')]").when_present.click
  end




  



      
       
     


    
    

  
  


