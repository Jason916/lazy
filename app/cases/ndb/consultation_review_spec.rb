#encoding: utf-8

require File.expand_path 'app/cases/spec_helper'
require File.expand_path 'app/cases/shared/action'

describe 'consultation review page',:Con_R do
	let(:consultation_review_page) do
		home_page = $navi.goto_home_page
		login_page = home_page.direct_to_login_page
		home_page = login_page.login "test_km1","123456"
		consultation_review_page = home_page.direct_to_consultation_review_page
	end
	it "search consultant in consultation review" do
		consultation_review_page.search_for_task_element.when_present.click
		consultation_review_page.search_consultant_element.when_present.attribute_value("placeholder").should include "Search Consultant"
	end
	it "search by empty name" do
		consultation_review_page.search_icon_element.when_present.click
		consultation_review_page.search_icon_element.when_present.click
		# consultation_review_page.
	end
	it "search by specific name" do
		consultation_review_page.search_for_task_element.when_present.click
		consultation_review_page.search_consultant_element.when_present.set "Han"
		consultation_review_page.search_for_task_element.when_present.click
		consultation_review_page.consultant_name_element.when_present.text.should eql "Han"
	end
	it "high rate consultant signal display" do
		consultation_review_page.search_for_task_element.when_present.click
		consultation_review_page.search_consultant_element.when_present.set "Han"
		consultation_review_page.search_for_task_element.when_present.click
		consultation_review_page.high_rate_element.when_present.attribute_value("title").should eql "This is high rate consultant"
	end
	it "search by [consultation date]" do
		consultation_review_page.reservation_element.when_present.click
		consultation_review_page.btn_apply_element.when_present.click
		#date_element.when_present.set "08/01/2014 - 08/31/2014"
		consultation_review_page.btn_search_element.when_present.click
		consultation_review_page.btn_search_element.when_present.text.should eql "Search"
	end
	it "search by [status]:arranged" do
		consultation_review_page.task_status_element.when_present.select "Arranged"
		consultation_review_page.btn_search_element.when_present.click
		consultation_review_page.status_element.when_present.text.should eql "Arranged"
	end
	it "search by [status]:completed" do
		consultation_review_page.task_status_element.when_present.select "Completed"
		consultation_review_page.btn_search_element.when_present.click
		consultation_review_page.status_element.when_present.text.should eql "Completed"
	end
	it "search by [all participants]" do
		consultation_review_page.participants_element.when_present.select "All Participants"
		consultation_review_page.btn_search_element.when_present.click
		consultation_review_page.btn_search_element.when_present.text.should eql "Search"
	end
	it "search by [KM lead]" do
		consultation_review_page.participants_element.when_present.select "KM Lead"
		consultation_review_page.btn_search_element.when_present.click
		consultation_review_page.btn_search_element.when_present.text.should eql "Search"
	end
	it "search by [KM support]" do
		consultation_review_page.participants_element.when_present.select "KM Support"
		consultation_review_page.btn_search_element.when_present.click
		consultation_review_page.btn_search_element.when_present.text.should eql "Search"
	end
	it "search by [consultation]" do
		consultation_review_page.consultation_type_element.when_present.select "Consultation"
		consultation_review_page.btn_search_element.when_present.click
		consultation_review_page.first_project_element.when_present.text.should include "CON"
	end
	it "search by [international consultation]" do
		consultation_review_page.consultation_type_element.when_present.select "International.C"
		consultation_review_page.btn_search_element.when_present.click
		consultation_review_page.first_project_element.when_present.text.should include "INT"
	end
	# it "[soon] signal for arranged task in two days" do
	# 	consultation_review_page.
	# end
	it "[update] random action with none task selected" do
		consultation_review_page.select_action_element.when_present.select "Recommended"
		consultation_review_page.btn_update_element.when_present.click
		consultation_review_page.warning_element.when_present.text.should eql "You must select a task"
	end
	it "[update] one task with none action" do
		consultation_review_page.select_all_task_element.when_present.click
		consultation_review_page.btn_update_element.when_present.click
		consultation_review_page.warning_element.when_present.text.should eql "You must select an action."
	end

end
