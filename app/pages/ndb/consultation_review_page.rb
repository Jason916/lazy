#encoding: utf-8
require File.expand_path 'app/cases/shared/action'
class ConsultationReviewPage < Lol::Page
  include Action
    page_url "#{$config.host}project/consultation/review/index"

    text_field :search_icon, :xpath=>"//div[3]/div/div/div[2]/form/input"
    element :search_for_task, :i, :xpath=>'//div[3]/div/div/form/div[1]/a/i'
    text_field :search_consultant, :id=>"task-search-text"
    link :consultant_name, :xpath=>"//div[2]/table/tbody/tr[1]/td[8]/div/a"
    text_field :review_date, :id=> "reservation"
    select_list :consultation_type, :id=>"ProjectReviewSearchForm_projectType"
    select_list :task_status, :id=>"ProjectReviewSearchForm_status"
    select_list :participants, :id=>"ProjectReviewSearchForm_participant"
    select_list :select_action, :id=>"action"
    checkbox :select_all_task, :id=>"task-grid_c0_all"
    button :btn_update, :id=>"taskupdate-btn"
    button :btn_search, :value=>"Search"
    button :btn_apply, :class=>"btn btn-small btn-success applyBtn"
    img :high_rate, :xpath=>"//div[3]/div/div/form/div[2]/table/tbody/tr[1]/td[8]/div/img"
    img :soon_signal, :xpath=>"//tr[3]/td[2]/div/img"
    link :icon_pencil, :xpath=>"//tr[1]/td[17]/a[1]/i"
    text_field :reservation, :id=> "reservation"
    td :setdate, :xpath=> "//div[2]/table/tbody/tr/td"
    div :status, :xpath=>"//div[2]/table/tbody/tr[1]/td[2]/div"
    link :first_project, :xpath=>"//div[2]/table/tbody/tr[1]/td[5]/a"
    div :warning, :xpath=>"//div[3]/div/div/div[1]"

end