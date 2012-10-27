require 'spec_helper'

describe "The foo module" do
  %w(bar baz/1).each do |path|
    full_path = "#{Capybara.app_host}/#{path}"
    context "on path #{full_path}" do
      visit full_path

      it "exists" do
        page.should have_selector('div.foo')
      end
    end
  end
end
