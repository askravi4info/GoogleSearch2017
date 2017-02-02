class GoogleSearchResultsPage
  include PageObject

  ul(:results_recommendations, class:'sbsb_b')
  div(:no_of_results, id:'resultStats')

  # div(:ad_details, class:'ads-visurl')
  div(:ad_details, class:'c _oc commercial-unit-desktop-top')
  # link(:wikipedia_url, text: 'Vaio - Wikipedia')
  link(:wikipedia_url, text: /Amazon.com/)
  h3(:all_results, class: 'r', :index=> 1)

  def get_all_urls
    all_results_elements.each do |x|
      p x.text
    end
  end

  def verify_url_displayed? expected_url
    fail "" unless get_all_urls.include? expected_url
  end


  def select_correct_item item_name
    results_recommendations_element.when_present(45).list_item_elements.each do |recommendations|
      p recommendations.text
        if recommendations.text.include? item_name
          recommendations.click
          sleep 1
          break
        end
    end
  end

end