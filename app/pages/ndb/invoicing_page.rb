#encoding: utf-8
class InvoicingPage < Lol::Page
  page_url "#{$config.host}report/invoicing/index"

  button :click_search, :value=> "search"
  select_list :set_project_type, :id => "InvoicingForm_projectType"
  text_field :set_keywords, :id=> "InvoicingForm_projectName"

  text_field :reservation, :id=> "reservation"
  td :date, :xpath=> "//div[5]/div[2]/table/tbody/tr/td"
  button :updateDate, :class=> "btn btn-small btn-success applyBtn"

  span :locateClient, :xpath=> "//div[@id='s2id_InvoicingForm_client']/a/span"
  div :selectClient, :text=> "cash"
  def set_date
    self.reservation_element.when_present.click
    self.date_element.when_present.click #选择日期表的第一个
    self.updateDate_element.when_present.click
  end

  def set_client
    self.locateClient_element.when_present.click
    self.selectClient_element.when_present.click
  end

end
