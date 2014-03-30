require "test_helper"

describe Scroll::Page do
  should accept_nested_attributes_for(:translations)

  let(:page)          { build_stubbed(:page) }

  it "default must be valid" do
    page.must_be :valid?
  end

  it "must have title as default to_s result" do 
    "#{page.translation}".must_equal page.translation.title
  end

  it "must have at least one translation" do
    build_stubbed(:page, translations: []).wont_be :valid?
  end

  it "must have html safe content" do 
    page.content.must_equal page.html.html_safe
  end

  it "must envoke markdown if is file or remote" do 
    page.translation.expects(:markdown)
    page.translation.content_type = 'file'
    page.content
  end
end