#encoding: utf-8
require File.expand_path 'app/cases/spec_helper'
require File.expand_path 'app/cases/shared/action'


describe 'consultant page', :consultant do 
      let(:consultant_page) do 
        home_page = $navi.goto_home_page
        login_page = home_page.direct_to_login_page
        home_page = login_page.login "admin","1234"
        consultant_page = home_page.direct_to_consultant_page
      end  

      it 'should visit Consultant' do
         consultant_page.wait_until do
           sleep 2
           consultant_page.title.should include("Consultant")
         end
      end
      
      it 'should visit consultant creation page' do
        consultant_page.add_consultant
        # sleep 2
        # consultant_page.wait_until do
        #   consultant_page.title.should include("Capvision New DB")
        # end
      end

      #创建顾问页面输入正确信息点击submit，创建成功
      it 'create consultant'  do
        consultant_page.add_consultant_element.when_present.click
        # sleep 2
        consultant_page.create_consultant
        # consultant_page.wait_until do
        #   consultant_page.title.should include "ATjunweiTest"
        #   end
      end
      
      it 'edit consultant basic information on consultant profile page' do
        consultant_page.search
        # sleep 2
        consultant_page.select_first_consultant
        consultant_page.edit_basic_information
        #   consultant_page.wait_until do
        #     # sleep 2
        # consultant_page.firstname.should eql "AT测试顾问1号"
        # end
      end
      
      it 'edit Background & Expertise on consultant profile page' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.edit_background_expertise
        # sleep 2
        # consultant_page.wait_until do
        #         consultant_page.background.should eql "AT测试中文背景"
        #         consultant_page.expertise.should eql "AT测试中文特长"
        #     end
      end
      
      it 'edit generalcomment on consultant profile page' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.edit_generalcomment
        # sleep 2
        # consultant_page.wait_until do
        #         consultant_page.general_comment.should eql "AT测试generalcomment"
        #     end
      end

      #顾问profile页面编辑工作经历保存成功
      it 'should add experience' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.add_experience
        # consultant_page.wait_until do
        #         consultant_page.title.should eql "Consultants search - Capvision"
        #     end
      end

      #顾问profile页面添加教育经历成功
it 'the company is empty the correct display of information' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.hidden_element
        consultant_page.add_work_experience_element.when_present.click
        sleep 2
        consultant_page.company_element.when_present.set""
        sleep 2
        consultant_page.position_element.when_present.set"test"
      end

      it 'do not fill out the information stored directly' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.hidden_element
        consultant_page.add_work_experience_element.when_present.click
        sleep 2
        consultant_page.save_experience_element.when_present.click
      end

      it 'click experience cancel' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.hidden_element
        consultant_page.add_work_experience_element.when_present.click
        sleep 2
        consultant_page.experience_cancel_element.when_present.click
      end

      it 'name automatically match the input position' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.hidden_element
        consultant_page.add_work_experience_element.when_present.click
        sleep 2
        consultant_page.position_element.when_present.set"测试职位_junwei"
      end
      it 'englishname automatically match the input position' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.hidden_element
        consultant_page.add_work_experience_element.when_present.click
        sleep 2
        consultant_page.position_element.when_present.set"test position"
      end
      it 'alias automatically match the input position' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.hidden_element
        consultant_page.add_work_experience_element.when_present.click
        sleep 2
        consultant_page.position_element.when_present.set"cszw"
      end 
      it 'should add education' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.add_education
        # consultant_page.wait_until do
        #         consultant_page.title.should eql "Consultants search - Capvision"
        #     end
      end
      #顾问profile页面编辑教育经历后保存成功
      it 'should edit education' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.edit_education
        # consultant_page.wait_until do
        #         consultant_page.title.should eql "Consultants search - Capvision"
        #     end
      end
 #添加教育经历时school为空（正确显示提示信息【异步】）
      it 'add education experience school is empty display the correct information' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.hidden_element
        consultant_page.add_education_element.when_present.click
        sleep 2
        consultant_page.school_name_element.when_present.set""
        sleep 2
        consultant_page.school_major_element.when_present.set"test test"
      end
      #添加教育经历时major为空（正确显示提示信息【异步】）
      it 'add education experience major is empty display the correct information' do
        consultant_page.search_element.when_present.click
        consultant_page.select_first_consultant
        consultant_page.hidden_element
        consultant_page.add_education_element.when_present.click
        sleep 2
        consultant_page.school_major_element.when_present.set""
        sleep 2
        consultant_page.school_degree_element.when_present.select"Undergraduate / 本科"
      end
      #添加教育经历时school的name自动匹配
      it 'add education experience when school name automatic matching' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.hidden_element
        consultant_page.add_education_element.when_present.click
        sleep 2
        consultant_page.school_name_element.when_present.set"AT测试大学"
      end
      #添加教育经历时school的english name自动匹配
      it 'add education experience when school english name automatic matching' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.hidden_element
        consultant_page.add_education_element.when_present.click
        sleep 2
        consultant_page.school_name_element.when_present.set"test school"
      end

      it 'delete education' do
        consultant_page.search
        consultant_page.select_first_consultant
        message = consultant_page.alert do
          consultant_page.delete_education_element.when_present.click
        end
      end

      it 'do not fill out the information stored directly education' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.hidden_element
        consultant_page.add_education_element.when_present.click
        sleep 2
        consultant_page.save_education_element.when_present.click
      end

      it 'click education cancel' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.hidden_element
        consultant_page.add_education_element.when_present.click
        sleep 2
        consultant_page.education_cancel_element.when_present.click
      end

      it 'edit resumebox on consultant profile page' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.edit_resumebox
        # consultant_page.wait_until do
        #         consultant_page.resume_box.should eql "AT测试resumebox"
        #     end
      end

      #顾问profile页面上传简历成功
      it 'upload resume on consultant profile page' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.upload_resume
        # consultant_page.wait_until do
        #         consultant_page.title.should eql "Consultants search - Capvision"
        #     end
      end

      it 'edit warning bar on consultant profile page' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.edit_warningbar
        # consultant_page.wait_until do
        #         consultant_page.title.should eql "Consultants search - Capvision"
        #     end
      end

      it 'edit tag on consultant profile page' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.edit_tag
        # consultant_page.wait_until do
        #         consultant_page.title.should eql "Consultants search - Capvision"
        #     end
      end

      it 'delete mobile on consultant profile page' do
        consultant_page.search
        consultant_page.select_first_consultant
        message = consultant_page.alert do
          consultant_page.delete_mobile_phone_element.when_present.click
        end
          # consultant_page.wait_until do
          #       consultant_page.title.should eql "Consultants search - Capvision"
          #   end
      end

      it 'add mobile on consultant profile page' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.hidden_element
        consultant_page.add_mobile
          # consultant_page.wait_until do
          #       consultant_page.title.should eql "Consultants search - Capvision"
          #   end
      end

      it 'edit note on consultant profile page' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.edit_note
        # consultant_page.wait_until do
        #         consultant_page.title.should eql "Consultants search - Capvision"
        #     end
      end

      it 'edit Pull Request on consultant request page' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.edit_pull_request
        # consultant_page.wait_until do
        #         consultant_page.title.should eql "Consultants search - Capvision"
        #     end
      end

      it 'edit Payment Method on consultant finance page' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.edit_payment
          # consultant_page.wait_until do
          #       consultant_page.title.should eql "Consultants search - Capvision"
          #   end
      end

      it 'edit Bank Card Information on consultant finance page' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.edit_bankcard
          # consultant_page.wait_until do
          #       consultant_page.title.should eql "Consultants search - Capvision"
          #   end
      end

      it 'edit gifts Information on consultant finance page' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.edit_gifts
          # consultant_page.wait_until do
          #       consultant_page.title.should eql "Consultants search - Capvision"
          #   end
        end

      it 'edit donate Information on consultant finance page' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.edit_donate
          # consultant_page.wait_until do
          #       consultant_page.title.should eql "Consultants search - Capvision"
          #   end
      end

      it 'edit interest on consultant interest page' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.edit_interest
          # consultant_page.wait_until do
          #   sleep 1
          #       consultant_page.title.should eql "Consultants search - Capvision"
          #   end
      end

      #顾问compliance页面上传.doc格式的文件，上传成功
      it 'consultant compliance page upload document(.doc)' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.upload_doc
        # consultant_page.wait_until do
        #   consultant_page.title.should eql "Consultants search - Capvision"
        # end
      end

      #顾问compliance页面上传.docx格式的文件，上传成功
      it 'consultant compliance page upload document(.docx)' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.upload_docx
        # consultant_page.wait_until do
        #   consultant_page.title.should eql "Consultants search - Capvision"
        # end
      end

      #顾问compliance页面上传.pdf格式的文件，上传成功
      it 'consultant compliance page upload document(.pdf)' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.upload_pdf
        # consultant_page.wait_until do
        #   consultant_page.title.should eql "Consultants search - Capvision"
        # end
      end

      #顾问compliance页面上传.msg格式的文件，上传成功
      it 'consultant compliance page upload document(.msg)' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.upload_msg
        # consultant_page.wait_until do
        #   consultant_page.title.should eql "Consultants search - Capvision"
        # end
      end

      it 'consultant_contact add email' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.add_email
      # consultant_page.wait_until do 
      #    consultant_page.text.include? "rhan@capvision.com.cn"
      # end
      end

      it 'consultant_navi [send introduction] button function' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.send_introduction
      # sleep 3
      # consultant_page.text.include? "Send Introduction Email Successful."
      end
  
      it 'consultant_contact delete email' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.hidden_element
        message = consultant_page.confirm(true) do
          consultant_page.delete_email_element.when_present.click
        end
        message.should eq "Are you sure you wish to delete this contact?"
      end

      it 'consultant_navi change consultant status' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.change_status
      end
  
    
      it 'consultant page points link function' do
        consultant_page.search
        consultant_page.select_first_consultant
        # sleep 1
        consultant_page.points
      # consultant_page.wait_until do 
      #   sleep 2
      #    consultant_page.text.include? "Source/Use"
      # end
      end  
      
      it 'consultant_contact delete mobile' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.hidden_element
        message = consultant_page.confirm(true) do
        # sleep 2
          consultant_page.delete_mobile_element.click
        end
        message.should == "Are you sure you wish to delete this contact?"
      end


      it 'consultant_contact add telephone' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.add_telephone
      # consultant_page.wait_until do 
      #   sleep 1
      #    consultant_page.text.include? "56524353"
      # end
      end
    
      it 'consultant_contact delete telephone' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.hidden_element
        message = consultant_page.alert do
          consultant_page.delete_telephone_element.click
        end
        message.should == "Are you sure you wish to delete this contact?"
      end
    
      it 'consultant_contact add weixin' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.add_weixin
      # consultant_page.wait_until do 
      #   sleep 1
      #    consultant_page.text.include? "Ryan's weixin"
      # end
      end
    
      it 'consultant_contact delete weixin' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.hidden_element
        message = consultant_page.alert do
          consultant_page.delete_weixin_element.when_present.click
        end
        message.should == "Are you sure you wish to delete this contact?"
      end

      it 'consultant_contact add other contact' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.add_other_contact
      # consultant_page.wait_until do 
      #    consultant_page.text.include? "541039523"
      # end
      end

      it 'should visit relationship project page' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.goto_relationship_project_page
      # consultant_page.wait_until do
      #   sleep 2
      #   consultant_page.title.should eql 'Relationship - AutoTestRyan - Capvision' 
      # end
      end
    
      it 'should visit relationship communication page' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.goto_relationship_communication_page
    #   consultant_page.wait_until do
    #   sleep 2
    #   consultant_page.title.should eql 'Relationship - AutoTestRyan - Capvision' 
    # end
      end
    
      it 'should visit relationship request page' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.goto_relationship_request_page
    #   consultant_page.wait_until do
    #   sleep 2
    #   consultant_page.title.should eql 'Relationship - AutoTestRyan - Capvision' 
    # end
      end
    
      it 'should visit relationship compliance page' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.goto_relationship_compliance_page
    #   consultant_page.wait_until do
    #   sleep 2
    #   consultant_page.title.should eql 'Relationship - AutoTestRyan - Capvision' 
    # end
      end
    
      it 'should visit relationship point page' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.goto_relationship_point_page
    #   consultant_page.wait_until do
    #   sleep 2
    #   consultant_page.title.should eql 'Relationship - AutoTestRyan - Capvision' 
    # end
      end
    
      it 'should visit points income page' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.goto_points_income_page
      # consultant_page.wait_until do
      # sleep 2
      #   consultant_page.title.should eql 'Points - AutoTestRyan - Capvision'
      # end
      end
    
      it 'should visit points spent page' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.goto_points_spent_page
      # consultant_page.wait_until do
      # sleep 2
      #   consultant_page.title.should eql 'Points - AutoTestRyan - Capvision'
      # end
      end
    
      it 'should visit communications email page' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.goto_communications_email_page
      # consultant_page.wait_until do
      #   sleep 2
      # consultant_page.title.should eql 'Communications - AutoTestRyan - Capvision'
      # end
      end
    
      it 'should visit communications phone page' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.goto_communications_phone_page
      # consultant_page.wait_until do
      #   sleep 2
      #   consultant_page.title.should eql 'Communications - AutoTestRyan - Capvision'
      # end
      end
    
      it 'should visit communications sms page' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.goto_communications_sms_page
      # consultant_page.wait_until do
      #   sleep 2
      # consultant_page.title.should eql 'Communications - AutoTestRyan - Capvision'
      # end
      end
    
    it 'should visit consultations projects page' do
      consultant_page.search
      consultant_page.select_first_consultant
      consultant_page.goto_projects_consultations_page
      # consultant_page.wait_until do
      #   sleep 2
      # consultant_page.title.should eql 'Projects - AutoTestRyan - Capvision'
      # end
    end
    
    it 'should visit data projects page' do
      consultant_page.search
      consultant_page.select_first_consultant
      consultant_page.goto_projects_data_page
    #   consultant_page.wait_until do
    #     sleep 2
    #   consultant_page.title.should eql 'Projects - AutoTestRyan - Capvision'
    # end
    end
    
    it 'should visit ges projects page' do
      consultant_page.search
      consultant_page.select_first_consultant
      consultant_page.goto_projects_ges_page
    #   consultant_page.wait_until do
    #   sleep 2
    #   consultant_page.title.should eql 'Projects - AutoTestRyan - Capvision'
    # end
    end
   
    it 'should visit conference projects page' do
      consultant_page.search
      consultant_page.select_first_consultant
      consultant_page.goto_projects_conference_page
    #   consultant_page.wait_until do
    #   sleep 2
    #   consultant_page.title.should eql 'Projects - AutoTestRyan - Capvision'
    # end
    end
    
    it 'should visit hrs projects page' do
      consultant_page.search
      consultant_page.select_first_consultant
      consultant_page.goto_projects_hrs_page
      # consultant_page.wait_until do
      # sleep 2
      # consultant_page.title.should eql 'Projects - AutoTestRyan - Capvision'
      # end
    end
    
    it 'should visit international consultations projects page' do
      consultant_page.search
      consultant_page.select_first_consultant
      consultant_page.goto_projects_inter_page
    #   consultant_page.wait_until do
    #   sleep 2
    #   consultant_page.title.should eql 'Projects - AutoTestRyan - Capvision'
    # end
    end  

      it 'consultant compliance page upload > 2 MB and docx document(the result:display reminding information)' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.upload_docx_2mb
        # consultant_page.wait_until do
        #   consultant_page.title.should eql "Consultants search - Capvision"
        # end
      end
      
      #顾问compliance页面通过ksh签署tnc
      it 'consultant compliance page send chinese tnc' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.tnc_online_ksh
        # consultant_page.wait_until do
        #   consultant_page.title.should eql "Consultants search - Capvision"
        # end
      end

      #顾问compliance页面通过官网签署tnc
      it 'consultant compliance page send english tnc' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.tnc_online_capweb
        # consultant_page.wait_until do
        #   consultant_page.title.should eql "Consultants search - Capvision"
        # end
      end

      it 'consultant compliance page sign T&C through online and click cancel button(the result:sign fail)' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.tnc_online_cancel
        # consultant_page.wait_until do
        #   consultant_page.title.should eql "Consultants search - Capvision"
        # end
      end
      
      #need be updated later
      # it 'consultant compliance page sign t&c by email(email-accpet-resend)' do
      #   consultant_page.search
      #   consultant_page.select_first_consultant
      #   consultant_page.tnc_email
      #     # consultant_page.wait_until do
      #     #   consultant_page.title.should eql "Consultants search - Capvision"
      #     # end
      # end
      #############################################0902###################################################
      #创建顾问时不填写任何信息直接点击submit（正确显示提示信息）
      it 'create a consultant not fill in any information directly click on the submit (right display a message)' do
        consultant_page.add_consultant
        consultant_page.submit
      end
      #创建顾问时不输入名字（正确显示提示信息【异步】）
      it 'create a consultant not input the name (correctly display the prompt information asynchronous [])' do
        consultant_page.add_consultant
        consultant_page.consultant_name = ""
        consultant_page.consultant_firstname = "test"
      end
      #创建顾问时输入特殊字符以及不符合格式的邮箱（正确显示提示信息【异步】）
      it 'create a consultant input special characters and email does not conform to the format' do
        consultant_page.add_consultant
        consultant_page.contactothers_email = "@@@"
        consultant_page.contactothers_weixin = "testwechat"
      end
      #创建顾问时输入特殊字符的手机号（正确显示提示信息【异步】）
      it 'input the special character of mobile phone number (consultant to correctly display a message [asynchronous])' do
        consultant_page.add_consultant
        consultant_page.contactmobile_mobile = "@@@"
        consultant_page.contactothers_weixin = "testwechat"
      end
      #创建顾问时输入小数的手机号（正确显示提示信息【异步】）
      it 'mobile phone number input decimal Consultant (correctly display the prompt information of asynchronous [])' do
        consultant_page.add_consultant
        consultant_page.contactmobile_mobile = "1.98"
        consultant_page.contactothers_weixin = "testwechat"
      end
      #创建顾问时输入特殊字符的电话号码（正确显示提示信息【异步】）
      it 'create a consultant input special characters (the correct phone number display a message [asynchronous])' do
        consultant_page.add_consultant
        consultant_page.contacttelephone_citycode = "021"
        consultant_page.contacttelephone_telephone = "@@@"
        consultant_page.contactothers_weixin = "testwechat"
      end
      #创建顾问时输入小数的电话号码（正确显示提示信息【异步】）
      it 'create a consultant input decimal telephone number (the correct display a message [asynchronous])' do
        consultant_page.add_consultant
        consultant_page.contacttelephone_citycode = "021"
        consultant_page.contacttelephone_telephone = "1.986"
        consultant_page.contactothers_weixin = "testwechat"
      end
      #创建顾问点击cancel按钮
      it 'Click the Cancel button to create the consultant' do
        consultant_page.add_consultant
        consultant_page.cancel
      end
      #删除简历
      it 'Delete your resume' do
        consultant_page.search
        consultant_page.select_first_consultant
        message =  consultant_page.confirm(true) do
          consultant_page.delete_resume_element.when_present.click
        end
        message.should == "Are you sure you wish to delete this file?"
      end
      
      #添加积分时不填写points点击add
      it 'Add integral does not fill in points click Add' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.add_points
        consultant_page.txt_reason = "atest"
        consultant_page.alert do
          consultant_page.btn_add_element.when_present.click
        end
      end

      #添加积分时填写points和reason点击add
      it 'Add integral fill in points and reason click Add' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.add_points
        consultant_page.txt_points = "1200"
        consultant_page.txt_reason = "other bonus"
        message =  consultant_page.alert do
          consultant_page.btn_add_element.when_present.click
        end
        message.should == "add succesfully"
      end
      #添加积分时点击cancel
      it 'Click Add integral cancel' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.add_points
        consultant_page.btn_cancel
      end
      
      #顾问搜索页面根据team搜索
      it 'consultant page search by team' do
        consultant_page.select_consultant_team_element.when_present.select "QA"
        consultant_page.verify_page
      end
      
      #顾问搜索页面根据行业和子行业搜索
      it 'consultant page search by industry and subindustry' do
        consultant_page.hidden_element
        consultant_page.select_consultant_industry_element.when_present.select "Agriculture - 农业"
        sleep 2
        consultant_page.select_consultant_subindustry_element.when_present.select "农、林、牧、渔服务业- Agriculture service"
        consultant_page.verify_page
      end

      #顾问搜索页面根据capvision elite类型搜索
      it 'consultant page search by the type of Capvision Elite' do
        consultant_page.select_consultant_type_element.when_present.select "Capvision Elite"
        consultant_page.verify_page
      end
      
      #顾问搜索页面根据Qualified类型搜索
      it 'consultant page search by the type of Qualified' do
        consultant_page.select_consultant_type_element.when_present.select "Qualified"
        consultant_page.verify_page
      end

      #顾问搜索页面根据Non-Qualified类型搜索
      it 'consultant page search by the type of Non-Qualified' do 
        consultant_page.select_consultant_type_element.when_present.select "Non-Qualified"
        consultant_page.verify_page
      end
      
      #顾问搜索页面根据Enrolled状态搜索
      it 'consultant page search by the status of Enrolled' do
        consultant_page.select_consultant_status_element.when_present.select "Enrolled"
        consultant_page.verify_page
      end
      
      #顾问搜索页面根据Communicated状态搜索
      it 'consultant page search by the status of Communicated' do
        consultant_page.select_consultant_status_element.when_present.select "Communicated"
        consultant_page.verify_page
      end
      
      #顾问搜索页面根据Not Contacted状态搜索
      it 'consultant page search by the status of Not Contacted' do
        consultant_page.select_consultant_status_element.when_present.select "Not Contacted"
        consultant_page.verify_page
      end
      
      #顾问搜索页面根据Prospect状态搜索
      it 'consultant page search by the status of Prospect' do
        consultant_page.select_consultant_status_element.when_present.select "Prospect"
        consultant_page.verify_page
      end
      
      #顾问搜索页面根据Invalid状态搜索
      it 'consultant page search by the status of Invalid' do
        consultant_page.select_consultant_status_element.when_present.select "Invalid"
        consultant_page.verify_page
      end
      
      #顾问搜索页面根据Blacklist状态搜索
      it 'consultant page search by the status of Blacklist' do
        consultant_page.select_consultant_status_element.when_present.select "Blacklist"
        consultant_page.verify_page
      end
      
      #顾问搜索页面根据function搜索
      it 'consultant page search by the function' do
        consultant_page.select_consultant_function_element.when_present.select "管理 / Management"
        consultant_page.verify_page
      end
      
      #顾问搜索页面根据location搜索
      it 'consultant page search by the location' do
        consultant_page.click_consultant_location_element.when_present.click
        consultant_page.select_consultant_location_element.when_present.click
        consultant_page.verify_page
      end
      
      #顾问搜索页面根据panel搜索
      it 'consultant page search by the panel' do
        consultant_page.select_consultant_panel_element.when_present.select "测试panel2"
        consultant_page.verify_page
      end
      
      #顾问搜索页面点击more filter/pick up展开或收起公司规模和盈收
      it 'consultant page click more filter adn pick up link' do
        consultant_page.click_more_filter_element.when_present.click
        consultant_page.click_up_link_element.when_present.click
      end
      
      #顾问搜索页面根据公司规模搜索
      it 'consultant page search by Company Size' do
        consultant_page.click_more_filter_element.when_present.click
        consultant_page.input_company_sizemin_element.when_present.set "0"
        consultant_page.input_company_sizemax_element.when_present.set "0"
        consultant_page.verify_page
      end
      
      #顾问搜索页面根据公司盈收搜索
      it 'consultant page search by Company Revenue' do
        consultant_page.click_more_filter_element.when_present.click
        consultant_page.input_company_revenuemin_element.when_present.set "0"
        consultant_page.input_company_revenuemax_element.when_present.set "0"
        consultant_page.verify_page
      end
      
      #顾问搜索页面根据keywords(all)搜索
      it 'consultant page search by keywords(all)' do
        consultant_page.input_keywords_element.when_present.set "ctest"
        consultant_page.search_element.when_present.click
        consultant_page.first_consultant_element.when_present.text.should include "ctest"
      end
      
      #顾问搜索页面根据team+行业搜索
      it 'consultant page search by team and industry' do
        consultant_page.select_consultant_team_element.when_present.select "Bobo_team"
        consultant_page.select_consultant_industry_element.when_present.select "Aerospace - 航空"
        consultant_page.verify_page
      end
      
      #顾问搜索页面根据team+type搜索
      it 'consultant page search by team and type' do
        consultant_page.select_consultant_team_element.when_present.select "Bobo_team"
        consultant_page.select_consultant_type_element.when_present.select "Qualified"
        consultant_page.verify_page
      end
      
      #顾问搜索页面根据team+status搜索
      it 'consultant page search by team and status' do
        consultant_page.select_consultant_team_element.when_present.select "Bobo_team"
        consultant_page.select_consultant_status_element.when_present.select "Enrolled"
        consultant_page.verify_page
      end
      
      #顾问搜索页面根据team+function搜索
      it 'consultant page search by team and function' do
        consultant_page.select_consultant_team_element.when_present.select "Bobo_team"
        consultant_page.select_consultant_function_element.when_present.select "管理 / Management"
        consultant_page.verify_page
      end
      
      #顾问搜索页面根据team+panel搜索
      it 'consultant page search by team and panel' do
        consultant_page.select_consultant_team_element.when_present.select "Bobo_team"
        consultant_page.select_consultant_panel_element.when_present.select "测试panel2"
        consultant_page.verify_page
      end
      
      #顾问搜索页面根据team+keywords搜索
      it 'consultant page search by team and keywords' do
        consultant_page.select_consultant_team_element.when_present.select "Bobo_team"
        consultant_page.input_keywords_element.when_present.set "ctest"
        consultant_page.search_element.when_present.click
        consultant_page.first_consultant_element.when_present.text.should include "ctest"
      end
      
      #顾问搜索页面根据keywords(name)搜索
      it 'consultant page search by keywords(name)' do
        consultant_page.input_keywords_element.when_present.set "gtest1329"
        consultant_page.select_keyword_type_btn_element.when_present.click
        consultant_page.select_keyword_type_name_element.when_present.click
        consultant_page.search_element.when_present.click
        consultant_page.first_consultant_element.when_present.text.should include "gtest1329"
      end
      
      #顾问搜索页面根据keywords(company)搜索
      it 'consultant page search by keywords(company)' do
        consultant_page.input_keywords_element.when_present.set "新的测试公司"
        consultant_page.select_keyword_type_btn_element.when_present.click
        consultant_page.select_keyword_type_company_element.when_present.click
        consultant_page.search_element.when_present.click
        #consultant_page.first_company_element.when_present.text.should eql "新的测试公司"
      end
      
      #顾问搜索页面根据keywords中position的english name字段搜索
      it 'consultant page search by keywords(position)' do
        consultant_page.input_keywords_element.when_present.set "测试职位1"
        consultant_page.select_keyword_type_btn_element.when_present.click
        consultant_page.select_keyword_type_position_element.when_present.click
        consultant_page.search_element.when_present.click
        consultant_page.first_position_element.when_present.text.should eql "测试职位1"
      end
      
      #顾问搜索页面根据keywords中position的alias字段搜索
      it 'consultant page search by keywords(position)alias' do
        consultant_page.input_keywords_element.when_present.set "alias"
        consultant_page.select_keyword_type_btn_element.when_present.click
        consultant_page.select_keyword_type_position_element.when_present.click
        consultant_page.search_element.when_present.click
        consultant_page.first_position_element.when_present.text.should eql "alias"        
      end
      
      #顾问搜索页面根据keywords中position的name字段搜索
      it 'consultant page search by keywords(position)name' do
        consultant_page.input_keywords_element.when_present.set "test1"
        consultant_page.select_keyword_type_btn_element.when_present.click
        consultant_page.select_keyword_type_position_element.when_present.click
        consultant_page.search_element.when_present.click
        consultant_page.first_position_element.when_present.text.should eql "test1"
      end
      
      #顾问搜索页面根据keywords(background)搜索
      it 'consultant page search by keywords(background)' do
        consultant_page.input_keywords_element.when_present.set "AT测试中文背景"
        consultant_page.select_keyword_type_btn_element.when_present.click
        consultant_page.select_keyword_type_background_element.when_present.click
        consultant_page.search_element.when_present.click
        consultant_page.first_background_element.when_present.text.should eql "AT测试中文背景"
      end
      
      #顾问搜索页面根据keywords(expertise)搜索
      it 'consultant page search by keywords(expertise)' do
        consultant_page.input_keywords_element.when_present.set "机械制造的太极宗师"
        consultant_page.select_keyword_type_btn_element.when_present.click
        consultant_page.select_keyword_type_expertise_element.when_present.click
        consultant_page.search_element.when_present.click
        consultant_page.first_expertise_element.when_present.text.should eql "机械制造的太极宗师"
      end
      
      #顾问搜索页面根据keywords(tag)搜索
      it 'consultant page search by keywords(tag)' do
        consultant_page.input_keywords_element.when_present.set "at"
        consultant_page.select_keyword_type_btn_element.when_present.click
        consultant_page.select_keyword_type_tag_element.when_present.click
        consultant_page.search_element.when_present.click
        consultant_page.first_background_element.when_present.text.should include "AT"
      end
      
      #顾问搜索页面根据keywords(notes)搜索
      it 'consultant page search by keywords(notes)' do
        consultant_page.input_keywords_element.when_present.set "俄方EA"
        consultant_page.select_keyword_type_btn_element.when_present.click
        consultant_page.select_keyword_type_notes_element.when_present.click
        consultant_page.search_element.when_present.click
        consultant_page.first_notes_element.when_present.text.should include "俄方EA"
      end
      
      #顾问搜索页面根据keywords中school的english name字段搜索
      it 'consultant page search by keywords(school)english name' do
        consultant_page.input_keywords_element.when_present.set "school"
        consultant_page.select_keyword_type_btn_element.when_present.click
        consultant_page.select_keyword_type_school_element.when_present.click
        consultant_page.search_element.when_present.click
      end
      
      #顾问搜索页面根据keywords中school的alias字段搜索
      it 'consultant page search by keywords(school)alias' do
        consultant_page.input_keywords_element.when_present.set "alias"
        consultant_page.select_keyword_type_btn_element.when_present.click
        consultant_page.select_keyword_type_school_element.when_present.click
        consultant_page.search_element.when_present.click
        consultant_page.first_position_element.when_present.text.should eql "测试数据正确"
      end
      
      #顾问搜索页面根据keywords中school的name字段搜索
      it 'consultant page search by keywords(school)name' do
        consultant_page.input_keywords_element.when_present.set "魏军大学"
        consultant_page.select_keyword_type_btn_element.when_present.click
        consultant_page.select_keyword_type_school_element.when_present.click
        consultant_page.search_element.when_present.click
      end
      
      #顾问搜索页面根据keywords(comment)搜索
      it 'consultant page search by keywords(comment)' do
        consultant_page.input_keywords_element.when_present.set "test"
        consultant_page.select_keyword_type_btn_element.when_present.click
        consultant_page.select_keyword_type_comment_element.when_present.click
        consultant_page.search_element.when_present.click
        consultant_page.first_position_element.when_present.text.should eql "Position"
      end      
      
      #顾问搜索页面根据keywords(resume)搜索  
      it 'consultant page search by keywords(resume)' do
        consultant_page.input_keywords_element.when_present.set "ap"
        consultant_page.select_keyword_type_btn_element.when_present.click
        consultant_page.select_keyword_type_resume_element.when_present.click
        consultant_page.search_element.when_present.click
        consultant_page.first_position_element.when_present.text.should eql "aoop"
      end
      
      #顾问搜索页面点击calls和completed calls进入顾问project页面
      it 'consultant page click calls and completed calls link and goto consultant project page' do
        consultant_page.search_element.when_present.click
        consultant_page.link_consultant_profile_page
        consultant_page.attach_to_window :title=>consultant_page.first_consultant_element.text+" - Capvision"
        consultant_page.h1_text_element.when_present.text.should eql "Han"
      end
      
      #顾问profile页面鼠标移动到rate上显示提示信息
      it 'consultant profile page the hover text of the rate' do
        consultant_page.search_element.when_present.click
        consultant_page.select_first_consultant
        consultant_page.text_of_consultant_rate_element.when_present.attribute_value("title").should eql "Click here to edit (SKM only)."
      end
      
      #编辑rate时输入小数显示提示信息
      it 'consultant profile page input decimals' do
        consultant_page.search_element.when_present.click
        consultant_page.select_first_consultant
        consultant_page.text_of_consultant_rate_element.when_present.click
        consultant_page.input_rate_element.when_present.set "0.5"
        consultant_page.save_rate_element.when_present.click
        consultant_page.verify_rate_alert_element.when_present.text.should eql "只能输入整数"
      end
      
      #编辑rate时输入特殊字符显示提示信息
      it 'consultant profile page input special decimals' do
        consultant_page.search_element.when_present.click
        consultant_page.select_first_consultant
        consultant_page.text_of_consultant_rate_element.when_present.click
        consultant_page.input_rate_element.when_present.set "@$"
        consultant_page.save_rate_element.when_present.click
        consultant_page.verify_rate_alert_element.when_present.text.should eql "只能输入整数"
      end
      
      #点击t&c进入顾问compliance页面
      it 'consultant profile page click T&C link' do
        consultant_page.search_element.when_present.click
        consultant_page.select_first_consultant
        consultant_page.tnc_link_element.when_present.click
        consultant_page.h3_text_element.when_present.text.should eql "T&C"
      end
      
      #鼠标移动到T&C: OLD时显示提示信息
      it 'consultant profile page old T&C hover text' do
        consultant_page.search_element.when_present.click
        consultant_page.select_first_consultant
        consultant_page.tnc_link_element.when_present.attribute_value("title").should include "this consultant has signed old version T&C"
      end
      
      #鼠标移动到T&C: New时显示提示信息
      #鼠标移动到T&C: N/A时显示提示信息
      it 'consultant profile page old T&C hover text(N/A)' do
        consultant_page.search_element.when_present.click
        consultant_page.hidden_element
        consultant_page.select_consultant_ryan_element.when_present.click
        consultant_page.attach_to_window(:title=> "Ryan - Capvision")
        consultant_page.tnc_link_element.when_present.attribute_value("title").should include "this consultant has"
      end
           
      #点击company进入company view页面
      it 'consultant profile page click company link' do
        consultant_page.search_element.when_present.click
        consultant_page.hidden_element
        consultant_page.select_consultant_ryan_element.when_present.click
        consultant_page.attach_to_window(:title=> "Ryan - Capvision")
        consultant_page.hidden_element
        consultant_page.click_company_link_element.when_present.click
        consultant_page.attach_to_window(:title=> "View Company - Capvision")
        consultant_page.hidden_element
        consultant_page.h1_text_element.when_present.text.should include "咨询公司"
      end
            
      #点击position进入position view页面
      it 'consultant profile page click position link' do
        consultant_page.search_element.when_present.click
        consultant_page.hidden_element
        consultant_page.select_consultant_ryan_element.when_present.click
        consultant_page.attach_to_window(:title=> "Ryan - Capvision")
        consultant_page.hidden_element
        consultant_page.click_position_link_element.when_present.click
        consultant_page.attach_to_window(:title=> "View Position - Capvision")
        consultant_page.hidden_element
        consultant_page.h1_text_element.when_present.text.should include "View Position"
      end
      
      #点击school进入school view页面
      it 'consultant profile page click position link' do
        consultant_page.search_element.when_present.click
        consultant_page.hidden_element
        consultant_page.select_consultant_ryan_element.when_present.click
        consultant_page.attach_to_window(:title=> "Ryan - Capvision")
        consultant_page.hidden_element
        consultant_page.click_school_link_element.when_present.click
        consultant_page.attach_to_window(:title=> "View 清华大学 - Capvision")
        consultant_page.hidden_element
        consultant_page.h1_text_element.when_present.text.should include "清华大学"
      end
      
      #notes中鼠标移动到空心星星上显示提示信息
      it 'consultant profile page verify note hollow star alert' do
        consultant_page.search_element.when_present.click
        consultant_page.hidden_element
        consultant_page.select_consultant_ryan_element.when_present.click
        consultant_page.attach_to_window(:title=> "Ryan - Capvision")
        consultant_page.notes_mark_element.when_present.click
        consultant_page.notes_mark_element.when_present.attribute_value("title").should include "Mark this note as "
      end
      
      #notes中鼠标移动到实心星星上显示提示信息
      it 'consultant profile page verify note solid star alert' do
        consultant_page.search_element.when_present.click
        consultant_page.hidden_element
        consultant_page.select_consultant_ryan_element.when_present.click
        consultant_page.attach_to_window(:title=> "Ryan - Capvision")
        consultant_page.notes_mark_element.when_present.click
        consultant_page.notes_mark_element.when_present.attribute_value("title").should include "Mark this note as "
      end
      
      it 'add address' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.hidden_element
        consultant_page.add_address_button_element.when_present.click
        sleep 2
        consultant_page.address_element.when_present.set"上海市闸北区恒丰路439号"
        sleep 2
        consultant_page.save_address_element.when_present.click
      end
      #删除address
      it 'delete address' do
        consultant_page.search
        consultant_page.select_first_consultant
        message = consultant_page.alert do
          consultant_page.delete_address_element.when_present.click
        end
      end
      #编辑address
      it 'edit address' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.hidden_element
        consultant_page.edit_address_element.when_present.click
        sleep 2
        consultant_page.address_element.when_present.set"更新后地址"
        sleep 2
        consultant_page.save_address_element.when_present.click
      end
      #点击address中星星图标设主要详细地址或非主要详细地址
      it 'Click on the address icon design stars mainly detailed address or non primary detailed address' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.set_contact_element.when_present.click
      end
      #notes中输入超过3行的notes显示"more"链接
      it 'Notes in the input more than 3 lines of notes display "more" link' do
        consultant_page.search
        consultant_page.select_first_consultant
        sleep 3
        consultant_page.add_notes_more
      end
      #点击more/pick up链接展开/收起notes信息
      it 'Click the more/pick up link deployment / fold notes information'  do
        consultant_page.search
        consultant_page.select_first_consultant
        sleep 3
        if consultant_page.more_pick_up_element.text == "More"
         consultant_page.more_pick_up
        else
         consultant_page.more_pick_up
        end
      end
      #点击notes中星星图标设主要notes或非主要notes
      it 'Click on the notes icon design stars mainly notes or non notes major' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.set_notes_element.when_present.click
      end
      #删除notes
      it 'delete notes' do
        consultant_page.search
        consultant_page.select_first_consultant
        message = consultant_page.alert do
          consultant_page.delete_notes_element.when_present.click
        end
      end
      #银行账户输入特殊字符（正确显示提示信息）
      it 'Bank account (the correct input of special characters display a message)' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.input_special_characters
      end
      #创建银行账号时不输入（正确显示提示信息）
      it 'No input to create bank account (when correctly display a message)' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.input_null
      end

      #设主要银行账号
      it 'A major bank accounts' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.finance_tab
        sleep 2
        consultant_page.set_main_bank_element.when_present.click
      end

      #删除银行账号
      it 'delete bank account' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.finance_tab
        sleep 2
        message = consultant_page.alert do
          consultant_page.delete_bank_element.when_present.click
        end
      end

      #history中点击向下或向上图标展开历史记录或收起历史记录
      it 'consultant profile page click history link ' do
        consultant_page.search_element.when_present.click
        consultant_page.select_first_consultant
        consultant_page.attach_to_window(:title=>"Han - Capvision")
        consultant_page.history_list_element.when_present.click
      end
      
      #添加顾问到项目时点击cancel
      it 'consultant profile page add consultant to project then click cancel' do
        consultant_page.search_element.when_present.click
        consultant_page.select_first_consultant
        consultant_page.attach_to_window(:title=>"Han - Capvision")
        consultant_page.add_to_project_element.when_present.click
        consultant_page.click_cancel_btn_element.when_present.click
      end
      
      #顾问compliance页面点击title进入详细页面
      it 'consultant compliance page click the link of title' do
        consultant_page.search_element.when_present.click
        consultant_page.select_first_consultant
        consultant_page.tnc_link_element.when_present.click
        consultant_page.click_first_tnc_element.when_present.click
        consultant_page.h1_text_element.when_present.text.should eql "Han"
      end
      
      #创建银行账户时点击cancel
      it 'consultant page add bank card then click cancel btn' do
        consultant_page.search_element.when_present.click
        consultant_page.select_first_consultant
        consultant_page.finance_tab_element.when_present.click
        consultant_page.add_bank_card_element.when_present.click
        consultant_page.attach_to_window(:title=>"Finance - Han - Capvision")
        consultant_page.cancel_tnc_element.when_present.click
      end
      
      #点击panel名称进入panel view页面
      it 'consultant profile page click panel then into panel view' do
        consultant_page.search_element.when_present.click
        consultant_page.select_first_consultant
        consultant_page.click_panel_element.when_present.click
        consultant_page.attach_to_window(:title=>"Panel panelpanel - Capvision")
        consultant_page.h1_text_element.when_present.text.should include "Panel"
      end
            
      #顾问compliance页面通过online签署tnc后点击cancel，签署失败
      it 'consultant compliance page click online to sign tnc then click cancel' do
        consultant_page.search_element.when_present.click
        consultant_page.select_first_consultant
        consultant_page.compliance_tab_element.when_present.click
        consultant_page.online_link_element.when_present.click
        consultant_page.cancel_tnc_element.when_present.click
      end
    
      #contact中鼠标移动到实心星星上显示提示信息
      it 'consultant profile page verify conatct solid star alert' do
        consultant_page.search_element.when_present.click
        consultant_page.select_first_consultant
        consultant_page.contact_solid_star_alert_element.when_present.click
        sleep 3
        consultant_page.contact_solid_star_alert_element.when_present.attribute_value("title").should include "main contacts"
      end
      
      #contact中鼠标移动到空心星星上显示提示信息
      it 'consultant profile page verify contact hollow star alert' do
        consultant_page.search_element.when_present.click
        consultant_page.select_first_consultant
        consultant_page.contact_solid_star_alert_element.when_present.click
        sleep 3
        consultant_page.contact_solid_star_alert_element.when_present.attribute_value("title").should include "This is not main contacts, you can click here to set it to main contacts"
      end
      
      #address中鼠标移动到实心星星上显示提示信息
      it 'consultant profile page verify address solid star alert' do
        consultant_page.search_element.when_present.click
        consultant_page.select_first_consultant
        consultant_page.address_solid_star_alert_element.when_present.click
        sleep 3
        consultant_page.address_solid_star_alert_element.when_present.attribute_value("title").should include "main address"
      end      
      
      #address中鼠标移动到空心星星上显示提示信息
      it 'consultant profile page verify address hollow star alert' do
        consultant_page.search_element.when_present.click
        consultant_page.select_first_consultant
        consultant_page.address_solid_star_alert_element.when_present.click
        sleep 3
        consultant_page.address_solid_star_alert_element.when_present.attribute_value("title").should eql "This is unmain address, you can click here to set it to main address"
      end  
    
end
