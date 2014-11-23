Then /^I should not see the "([^\"]*)" link$/ do |text|
  page.should_not(have_css("a", :text => text),
    "Expected to not see the #{text.inspect} link, but did.")
end

#Then /^(?:|I )should not see "([^\"]*)" link within "([^\"]*)"$/ do |text, selector|
#  within(selector) do |content|
#    if defined?(Spec::Rails::Matchers)
#      content.should_not contain(text)
#    else
#      hc = Webrat::Matchers::HasContent.new(text)
#      assert !hc.matches?(content), hc.negative_failure_message
#    end
#  end
#end