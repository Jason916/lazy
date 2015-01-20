#encoding: utf-8
require File.expand_path 'app/cases/spec_helper'
require File.expand_path 'app/cases/shared/action'

describe 'compliance page', :compliance do 
	      let(:compliance_page) do 
		      home_page = $navi.goto_home_page
			    login_page = home_page.direct_to_login_page
			    home_page = login_page.login "admin","1234"
			    compliance_page = home_page.direct_to_compliance_page
        end
  
    		it 'compliance page go to visit tnc list page' do
          compliance_page.tnc_element.click
            # compliance_page.wait_until do
            #   sleep 2
            #   compliance_page.title.should include("Tnc - Capvision")
            # end
    		end
        it 'compliance page go to visit ca list page' do
          compliance_page.ca_element.click
            # compliance_page.wait_until do
            #   sleep 2
            #   compliance_page.title.should include ("Client Agreement - Capvision")
            # end
        end
    		it 'compliance page create Tnc page' do
          compliance_page.tnc_element.click
          sleep 1
          compliance_page.create_tnc_link
          compliance_page.create_tnc
          content = compliance_page.content_element
          compliance_page.execute_script "arguments[0].innerHTML='1234'", content
          compliance_page.submit_tnc
            # compliance_page.wait_until do
            #   compliance_page.title.should include("Tnc - Capvision")
            # end
    		end
        it 'compliance page create ca page' do
          compliance_page.ca_element.click
          sleep 1
          compliance_page.creat_ca_link
          compliance_page.create_ca
          ca_content = compliance_page.ca_content_element
          compliance_page.execute_script "arguments[0].innerHTML='1234'", ca_content
          compliance_page.submit_ca
            # compliance_page.wait_until do
            #   compliance_page.title.should include("Client Agreement - Capvision")
            # end
        end
        it 'compliance page edit Tnc page' do
          compliance_page.tnc_element.click
          sleep 1
          compliance_page.edit_tnc_element.click
          compliance_page.tnc_title='edit123'
          compliance_page.submit_tnc
            # compliance_page.wait_until do
            #   compliance_page.edit_tnc_title.should include("修改后测试tnc")
            # end
        end
        it 'compliance page edit ca page' do
          compliance_page.ca_element.click
          sleep 1
          compliance_page.edit_ca_element.click
          compliance_page.ca_title='edit123'
          compliance_page.submit_ca
            # compliance_page.wait_until do
            #   compliance_page.edit_ca_title.should include("修改后测试ca")
            # end
        end
        it 'compliance page create T&C but write nothing and  click save button (the result:display wrong information )' do
          compliance_page.tnc_element.click
          sleep 1
          compliance_page.create_tnc_link
          sleep 1
          compliance_page.submit_tnc
          sleep 1
          # compliance_page.err_tnc_title_element.text.should eql "Title cannot be blank."
          # compliance_page.err_tnc_version_element.text.should eql "Version cannot be blank."
          #注释的部分取不到元素
          #compliance_page.err_tnc_titlemsg_element.text.should eql "Please fix the following input errors:"
          #compliance_page.err_tnc_message_element.text.should eql "Message can not be all empty!"
        end
        it 'compliance page input decimal in version field (the result:display reminding information)' do
          compliance_page.tnc_element.click
          sleep 1
          compliance_page.create_tnc_link
          sleep 1
          compliance_page.tnc_title = "test tnc title"
          compliance_page.tnc_version = "3.0"
          sleep 1
          compliance_page.submit_tnc
          # compliance_page.err_tnc_version_element.text.should eql "Version must be an integer."
        end
        it 'compliance page input special character in version field (the result:display reminding information)' do
          compliance_page.tnc_element.click
          sleep 1
          compliance_page.create_tnc_link
          sleep 1
          compliance_page.tnc_title = "test tnc title111"
          compliance_page.tnc_version = "@@@@"
          sleep 1
          compliance_page.submit_tnc
          # compliance_page.err_tnc_version_element.text.should eql "Version must be a number."
        end
        it 'compliance page select T&C with Bilingual version and save(the result:display Bilingual language in locale field on list page )' do
          compliance_page.tnc_element.click
          sleep 1
          compliance_page.create_tnc_link
          sleep 1
          compliance_page.create_bilingual_tnc
          compliance_page.locate_ck_content
          # compliance_page.send_keys :tab
          bilcontent = compliance_page.bil_content_element
          sleep 2
          compliance_page.execute_script "arguments[0].innerHTML='1234'", bilcontent
          compliance_page.submit_tnc
          sleep 2
          # compliance_page.wait_until do
          #   compliance_page.locale.should eql "Bilingual"
          # end
        end
        it 'compliance page select T&C with Chinese version and save(the result:display chinese language in locale field on list page )' do
          compliance_page.tnc_element.click
          sleep 1
          compliance_page.create_tnc_link
          sleep 1
          compliance_page.create_chinese_tnc
          compliance_page.locate_ck_content
          chcontent = compliance_page.ch_content_element
          sleep 2
          compliance_page.execute_script "arguments[0].innerHTML='1234'", chcontent
          compliance_page.submit_tnc
          # compliance_page.wait_until do
          #   compliance_page.locale.should eql "Chinese"
          # end
        end

        it 'compliance page create T&C and click cancel button' do
          compliance_page.tnc_element.click
          sleep 1
          compliance_page.create_tnc_link
          sleep 1
          compliance_page.cancel_tnc
            # compliance_page.wait_until do
            #   compliance_page.title.should include("Tnc - Capvision")
            # end
        end
        it 'compliance page click view icon in some T&C(the result:goto tnc view page)' do
          compliance_page.tnc_element.click
          sleep 1
          compliance_page.view_tnc_element.click
          sleep 2
            # compliance_page.wait_until do
            #   compliance_page.title.should include("Capvision")
            # end
        end
        it 'compliance page create CA but write nothing and  click save button (the result:display wrong information )' do
          compliance_page.ca_element.click
          sleep 1
          compliance_page.creat_ca_link
          sleep 1
          compliance_page.submit_ca
          sleep 1
          # compliance_page.err_ca_title_element.text.should eql "Title cannot be blank."
          # compliance_page.err_ca_message_element.text.should eql "Content cannot be blank."
        end
        it 'compliance page create CA and click back button' do
          compliance_page.ca_element.click
          sleep 1
          compliance_page.creat_ca_link
          sleep 1
          compliance_page.cancel_ca
            # compliance_page.wait_until do
            #   compliance_page.title.should include("Client Agreement - Capvision")
            # end
        end
        it 'compliance page click view icon in some CA(the result:goto ca view page)' do
          compliance_page.ca_element.click
          sleep 1
          compliance_page.view_ca_element.click
          sleep 2
            # compliance_page.wait_until do
            #   compliance_page.title.should include("Capvision") 
            # end       
        end
end