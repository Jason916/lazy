#encoding: utf-8
require File.expand_path 'app/cases/spec_helper'
require File.expand_path 'app/cases/shared/action'

class CompliancePage < Lol::Page
	#page_url "#{$config.host}/compliance/tnc/index"
    include Action
	link :tnc ,:text=>"Tnc"
	link :ca, :text=>"ClientAgreement"
	#tnc edit button
	element :edit_tnc,:i,:xpath=>"//div[@id='yw0']/table/tbody/tr[1]/td[7]/a[2]/i"
	#ca edit button
	element :edit_ca,:i,:xpath=>"//div[@id='yw0']/table/tbody/tr[1]/td[5]/a[2]/i"
	#tnc view button
	element :view_tnc,:i,:xpath=>"//div[@id='yw0']/table/tbody/tr[1]/td[7]/a[1]/i"
	#ca view button
	element :view_ca,:i,:xpath=>"//div[@id='yw0']/table/tbody/tr[1]/td[5]/a[1]/i"
	
	link :create_tnc_link, :href=>"/compliance/tnc/create"
	link :creat_ca_link, :href=>"/compliance/clientagreement/create"
	text_field :tnc_title, :id=>"Tnc_title"
	text_field :tnc_version, :id=>"Tnc_version"
	checkbox :tnc_current, :id=>"Tnc_current"
	text_field :ca_title, :id=>"ClientAgreement_title"
	link :client_click, :xpath=>".//*[@id='s2id_ClientAgreement_clientid']/a"
	div :ca_client, :xpath=>"html/body/div[4]/ul/li[12]/div"
	button :submit_tnc, :id=>"tnc-submit-btn"
	button :submit_ca, :id=>"yw2"
	link :cancel_tnc , :id=>"yw2"
	link :cancel_ca , :text=>"Back"
	link :email, :href=>"/consultant/compliance/send?id=20&type=tnc&typeid=17&action=email"
	link :online, :href=>"/consultant/compliance/send?id=20&type=tnc&typeid=17&action=online"
	link :sms, :href=>"/consultant/compliance/send?id=20&type=tnc&typeid=17&action=sms"
	link :title_tnc, :href=>"/consultant/compliance/tnc?id=20&tncid=17"
	text_area :email_msg, :id=>"compliance_message"
	button :email_send, :id=>"compliance-send-submit"
	text_field :tnccontent_en_title ,:id=>"TncContent_en_title"
	text_field :bilingual_title , :xpath=>"//div[@id='yw0_tab_3']/div/div/input"
	text_field :chinese_title , :xpath=>"//div[@id='yw0_tab_2']/div/div/input"
	span :err_tnc_title ,:xpath=>"//*[@id='horizontalForm']/div[1]/div/span"
	span :err_tnc_version ,:xpath=>"//*[@id='horizontalForm']/div[2]/div/span"
	#div :err_tnc_titlemsg,:xpath=>"//div[@id='yw0_tab_1']/div[1]/p"
	#div :err_tnc_message ,:xpath=>"//*[@id='yw0_tab_1']/div[1]/ul/li"
	link :bilingual_tnc ,:text=>"Bilingual"
	link :chinese_tnc ,:text=>"Chinese"
	span :err_ca_title ,:xpath=>"html/body/div[2]/div/div[1]/form/fieldset/div[2]/div/span"
	span :err_ca_message ,:xpath=>"//*[@id='horizontalForm']/fieldset/div[5]/div/span[2]"
	span :client_value,:xpath=>"//*[@id='s2id_ClientAgreement_clientid']/a/span"
	text_field :input_client,:xpath=>"//html/body/div[4]/div/input"
	span :select_client,:xpath=>"html/body/div[4]/ul/li/div/span"
	# def edit_tnc
	# 	@browser.element(:xpath =>"//div[@id='yw0']/table/tbody/tr[1]/td[7]/a[2]/i").when_present.click
	# 	sleep 2
	# 	self.tnc_title = "修改后测试tnc#{rand(10000)}"
	# 	self.submit_tnc
	# end
	# def locale
	# 	@browser.element(:xpath =>"//div[@id='yw0']/table/tbody/tr[1]/td[4]").when_present.text
			
	# end
	# def edit_tnc_title						
	# 	@browser.element(:xpath =>"//div[@id='yw0']/table/tbody/tr[1]/td[2]").when_present.text
	# end
	# def tnc_view
	# 	@browser.element(:xpath =>"//div[@id='yw0']/table/tbody/tr[1]/td[7]/a[1]/i").when_present.click
	# end
	# def ca_view
	# 	@browser.element(:xpath =>"//div[@id='yw0']/table/tbody/tr[1]/td[5]/a[1]/i").when_present.click
	# end
	# def edit_ca
	# 	@browser.element(:xpath =>"//div[@id='yw0']/table/tbody/tr[1]/td[5]/a[2]/i").when_present.click
	# 	self.ca_title = "修改后测试ca#{rand(10000)}"
	# 	self.submit_ca
	# end
	# def edit_ca_title
	# 	@browser.element(:xpath =>"//div[@id='yw0']/table/tbody/tr[1]/td[2]").when_present.text
	# end

	def create_tnc
		self.tnc_title = "AT测试tnc#{rand(10000)}"
        self.tnc_version = "1#{rand(100)}"
        self.check_tnc_current
        self.tnccontent_en_title = "AT测试content_title"
        # content = self.content_element
        # self.execute_script "argument(0).innerHTML='1234'",self.content_element
        # self.submit_tnc
	end
	def create_bilingual_tnc
		self.tnc_title = "ATtestbilingualtnc#{rand(10000)}"
        self.tnc_version = "1#{rand(100)}"
        self.check_tnc_current
        self.bilingual_tnc
        sleep 2
        self.bilingual_title = "ATtestcontent_title"
        sleep 2
        # self.editor_tnc_bi_content
        # self.submit_tnc
	end

	# def locate_bil_content
	# 	@browser.send_keys :tab
	# end

	def locate_ck_content
		self.send_keys :tab
	end

	def create_chinese_tnc
		self.tnc_title = "ATtestchinesetnc#{rand(10000)}"
        self.tnc_version = "1#{rand(100)}"
        self.check_tnc_current
        self.chinese_tnc
        self.chinese_title = "ATtestchinesetnc_title"
        # self.editor_tnc_ch_content
        # self.submit_tnc
	end
	def create_ca
		self.ca_title="AT测试ca#{rand(10000)}"
        self.client_value_element.click
        self.input_client = '阿斯达'
        self.select_client_element.click
        # self.editor_ca_content
        # self.submit_ca
	end
	# def editor_tnc_content
	# 	# @browser.iframe(:title =>'Rich Text Editor,TncContent[en][message]').send_keys 'weijun tnc test O(∩_∩)O~  (*^__^*) '
	# end
	# def editor_tnc_bi_content
	# 	@browser.iframe(:title =>'Rich Text Editor,TncContent[bi][message]').send_keys 'weijun tnc test O(∩_∩)O~  (*^__^*) '
	# end
	
	in_iframe(:index=>0) do |frame|
		paragraph(:content,:xpath=>'/html/body/p',:frame=>frame)
	end

	in_iframe(:index=>0) do |frame|
		element(:ca_content,:body,:xpath=>'/html/body',:frame=>frame)
	end

	in_iframe(:index=>2) do |frame|
		paragraph(:bil_content,:xpath=>'/html/body/p',:frame=>frame)
	end

	in_iframe(:index=>1) do |frame|
		paragraph(:ch_content,:xpath=>'/html/body/p',:frame=>frame)
	end

	# def editor_tnc_ch_content
	# 	@browser.iframe(:title =>'Rich Text Editor,TncContent[zh_cn][message]').when_present.send_keys 'weijun tnc test O(∩_∩)O~  (*^__^*) '
	# end
	# def editor_ca_content
	# 	# @browser.iframe(:title =>'Rich Text Editor,ClientAgreement_note').when_present.send_keys 'weijun ca test O(∩_∩)O~  (*^__^*) '
	# 	@browser.iframe(:index=>0)
	# end	
	# def set_client
	# 	@browser.span(:xpath, "//div[@id='s2id_ClientAgreement_clientid']/a/span").when_present.click
	# 	@browser.div(:text, "阿斯达 (若风)").when_present.click
	# end
 
end
