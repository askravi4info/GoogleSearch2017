Given(/^user is on Google Home page$/) do
  visit GoogleHomePage
end

When(/^user search for (.*)$/) do |search_data|
  on(GoogleHomePage).google_search_data search_data
end

And(/^select (.*) from the list$/) do |arg|
  on(GoogleSearchResultsPage).select_correct_item arg
end

Then(/^verify the user gets the (.*) search results$/) do |arg|
  actual_results = on(GoogleSearchResultsPage).no_of_results_element.when_visible.text
  # fail "Expected value - #{arg} is NOT found in the Actual results - #{actual_results} " unless actual_results.include? arg
  expect(actual_results).should include arg
end


Then(/^user should get the search results for the valid data$/) do
  @file = YAML.load_file('C:\Users\Ravi\Desktop\google_search_Jan_2017\features\test_data.yml')
  # p @file['patch']['request']
  # on(GoogleHomePage).google_search_data @file.[Environment['env']]('search_criteria')



  on(GoogleHomePage).google_search_data 'sony laptops'
  on(GoogleSearchResultsPage) do |page|
    page.select_correct_item 'sony laptops'
    actual_results = page.no_of_results_element.when_visible.text
  end
  # expect(actual_results).should include '24,600,000'

  # step "user search for #{dell laptops}"
  # step "select #{dell laptops} from the list"
  # step "verify the user gets the 24,600,000 search results"


  # Steps %Q{
  #   When "user search for #{dell laptops}"
  #   And "select #{sony laptops} from the list"
  #   Then "verify the user gets the 24,600,000 search results"
  #
  #       }

end

And(/^verify the following/) do |table|
  # table is a table.hashes.keys # => [:walmart]
  table.hashes.each do |text|
    p text['details']
    p text['wiki_details']

    ad_text = on(GoogleSearchResultsPage).ad_details_element.text
    # expect(ad_text).should include text['details']
    fail "#{ad_text} is not displayed" unless ad_text.include? text['details']
    wiki_expected_text = on(GoogleSearchResultsPage).wikipedia_url_element.text
    # expect(wiki_expected_text).should include text['wiki_details']
    # fail '' unless wiki_expected_text.include? text['wiki_details']
on(GoogleSearchResultsPage).all_results_elements.each do |x|
  p x.text
end
  end
end

Then(/^verify user can access data from yml files$/) do
  # @file = YAML.load_file(File.join(File.dirname(__FILE__),'tes'))
  @file = YAML.load_file('C:\Users\Ravi\Desktop\google_search_Jan_2017\features\test_data.yml')
  p @file.fetch('request')
  p @file.fetch('search_criteria')
  p @file['content']['session']
  p @file['content']['company_name']

  File.open('../../test_data.yml', "w") {|f| f.write(@file.to_yaml) }

  @file['request'] = 33333
  @file['content']['session'] = 2 #Modify

  p @file.fetch('request')
  p @file['content']['session']


end