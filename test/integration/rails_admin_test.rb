require 'test_helper'

describe "Rails Admin integration test" do
  let(:current_user)  { build(:user) }
  setup               { integration_login }
  teardown            { Warden.test_reset! }

  it "must have access to create new page" do 
    visit rails_admin.new_path(model_name: 'scroll~page')
    within '#new_scroll_page' do 
      page.has_content?('Active').must_equal true
      page.has_content?('Image').must_equal true
      page.has_content?('Translations').must_equal true
    end
  end
end