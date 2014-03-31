require "test_helper"

describe Scroll::Page::Translation do
  should validate_presence_of(:content_type)

  let(:translation)   { build_stubbed(:page_translation) }

  it "should fail when loading content" do
    translation.content_type = 'file'
    translation.__send__(:markdown).must_equal('Content is currently unreachable')
    translation.content_type = 'remote'
    translation.__send__(:markdown).must_equal('Content is currently unreachable')
  end

  it "should load remote markdown" do
    stub_request(:get, 'http://test.tld/dummy.md').
      to_return(body: '# Dummy', status: 200)
    
    translation.md_remote = 'http://test.tld/dummy.md'
    translation.content_type = 'remote'
    translation.__send__(:markdown).include?('<h1 id="dummy">Dummy</h1>').must_equal true
  end
end