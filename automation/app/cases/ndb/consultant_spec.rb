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

      it 'create consultant'  do
        consultant_page.add_consultant
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

      it 'should add experience' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.add_experience
        # consultant_page.wait_until do
        #         consultant_page.title.should eql "Consultants search - Capvision"
        #     end
      end

      it 'should add education' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.add_education
        # consultant_page.wait_until do
        #         consultant_page.title.should eql "Consultants search - Capvision"
        #     end
      end

      it 'should edit education' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.edit_education
        # consultant_page.wait_until do
        #         consultant_page.title.should eql "Consultants search - Capvision"
        #     end
      end


      it 'edit resumebox on consultant profile page' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.edit_resumebox
        # consultant_page.wait_until do
        #         consultant_page.resume_box.should eql "AT测试resumebox"
        #     end
      end

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

      it 'add mobile on consultant profile page' do
        consultant_page.search
        consultant_page.select_first_consultant
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

      it 'edit donate Information on consultant finance page'  do
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

      it 'consultant compliance page upload document(.doc)' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.upload_doc
        # consultant_page.wait_until do
        #   consultant_page.title.should eql "Consultants search - Capvision"
        # end
      end

      it 'consultant compliance page upload document(.docx)' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.upload_docx
        # consultant_page.wait_until do
        #   consultant_page.title.should eql "Consultants search - Capvision"
        # end
      end

      it 'consultant compliance page upload document(.pdf)' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.upload_pdf
        # consultant_page.wait_until do
        #   consultant_page.title.should eql "Consultants search - Capvision"
        # end
      end

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
      message = consultant_page.confirm(true) do
      consultant_page.delete_email_element.click
      end
      message.should == "Are you sure you wish to delete this contact?"
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
      message = consultant_page.alert do
      consultant_page.delete_weixin_element.click
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
    
    it 'should visit international consultations projects page',:test do
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
  
      it 'consultant compliance page send chinese tnc' do
        consultant_page.search
        consultant_page.select_first_consultant
        consultant_page.tnc_online_ksh
        # consultant_page.wait_until do
        #   consultant_page.title.should eql "Consultants search - Capvision"
        # end
      end
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
end
