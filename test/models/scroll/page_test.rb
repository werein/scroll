require "test_helper"

describe Scroll::Page do
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
end