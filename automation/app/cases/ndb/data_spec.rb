# #encoding: utf-8
# require File.expand_path 'app/cases/spec_helper'
# require File.expand_path 'app/cases/shared/action'
# describe 'data page',:data=>false do 
# 	let(:data_page) do 
# 		    home_page = $navi.goto_home_page
# 			login_page = home_page.direct_to_login_page
# 			login_page = login_page.login "admin","1234"
# 			data_page = login_page.direct_to_data_page
#     end
#     describe 'should data' do
#     	context 'should data' do
#     		it 'should visit company' do
#     			data_page.company_element.click
#     			data_page.title.should include ("Company")
#     		end
#     		it 'should visit position' do
#     			data_page.position_element.click
#     			data_page.title.should include ("Position")
#     		end
#     		it 'should visit school' do
#     			data_page.school_element.click
#     			data_page.title.should include ("School")
#     		end
#     		it 'should visit tag' do
#     			data_page.tag_element.click
#     			data_page.title.should include ("Tag")
#     		end
#     		it 'should visit panel' do
#     			data_page.panel_element.click
#     			data_page.title.should include ("Panel")
#     		end
#     		it 'should visit request' do
#     			data_page.request_element.click
#     			data_page.title.should include ("Request")
#     		end
#     		it 'create company' do
#     			data_page.company_element.click
#     			data_page.title.should include ("Company")
#     			data_page.all_company_element.click
#     			data_page.create_company_element.click
#     			data_page.company_name = "测试公司#{rand(100)}"
#     			data_page.company_englishname = "ceshigongsi#{rand(100)}"
#     			data_page.company_shortname = "csgs#{rand(100)}"
#     			data_page.company_type_element[3].click
#     			data_page.company_size_element[3].click
#     			data_page.company_industry_element[1].click
#     			data_page.select_company_listed
#     			data_page.company_description = "test test test @@@@++++++====="
#     			data_page.create_com
#     		end
#     		it 'search all company' do
#     			data_page.company_element.click
#     			data_page.title.should include ("Company")
#     			data_page.all_company_element.click
#     			data_page.company_keywords = "测试公司"
#     			data_page.search_company
#     		end
#     		it 'approve company' do
#     			data_page.company_element.click
#                 data_page.title.should include ("Company")
#                 data_page.all_company_element.click
#                 data_page.company_status_element[1].click
#                 sleep 1
#                 data_page.company_keywords = "测试公司"   
#                 data_page.search_company
#                 sleep 1
#                 data_page.check_edit_company
#                 message = data_page.alert do
#                 data_page.approve_com
#                 end
#                 message.should == "Are you sure to approve these company profile?"
#     		end
#     		it 'duplicate company'do
#     			data_page.company_element.click
#                 data_page.title.should include ("Company")
#                 data_page.all_company_element.click
#                 data_page.company_status_element[1].click
#                 sleep 1
#                 data_page.company_keywords = "测试公司"   
#                 data_page.search_company
#                 data_page.check_edit_company
#                 data_page.duplicate_com = "test company2"
#                 data_page.confirm_com
#                 data_page.ok_com
#     		end
#     		it 'search duplicate company Log' do
    			
#     		end
#     		it 'create position' do
    			
#     		end
#     		it 'search all position' do
    			
#     		end
#     		it 'approve position' do
    			
#     		end
#     		it 'duplicate position' do
    			
#     		end
#     		it 'search duplicate position Log' do
    			
#     		end
#             it 'create school' do
                
#             end
#             it 'keywords search school' do
                
#             end
#             it 'keywords search tag' do
                
#             end
#             it 'create panel' do
                
#             end
#             it 'industry and keywords panel search' do
                
#             end
#             it 'approve panel' do
                
#             end
#             it 'reject panel' do
                
#             end
#             it 'status search request done page' do
                
#             end
#             it 'chick start link' do
                
#             end
#             it '' do
                
#             end
#             it '' do
                
#             end
#             it '' do
                
#             end
#             it '' do
                
#             end
#             it '' do
                
#             end
#             it '' do
                
#             end
#     	end
#     end
# end