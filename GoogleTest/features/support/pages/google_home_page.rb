class GoogleHomePage
  include PageObject

  page_url "www.google.com"

  text_field(:google_search_for,:id=>'lst-ib')

  def google_search_data search_criteria
    self.google_search_for_element.send_keys search_criteria
    self.google_search_for_element.send_keys :end
  end

end