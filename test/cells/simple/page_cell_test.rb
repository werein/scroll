require 'test_helper'

module Scroll
  class PageCellTest < Cell::TestCase
    it "should show list of pages" do
      post = create(:page)
      render_cell('scroll/page', :list).must_include 'Apple iPhone'
    end
  end
end 