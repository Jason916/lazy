#encoding: utf-8
require File.expand_path 'app/cases/spec_helper'
describe 'home page', :home do 
	
	 
			it 'should visit home page' do 
				home_page = $navi.goto_home_page
				home_page.title.should include("Login - Capvision")
			end
	
end