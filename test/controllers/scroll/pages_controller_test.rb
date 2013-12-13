require 'test_helper'

module Scroll
  describe PagesController do  
    let(:current_user)  { build(:user) } 
    let(:page_attr)     { attributes_for(:page, translations_attributes: [ attributes_for(:page_translation) ]).except(:translations) }
    let(:invalid_attr)  { attributes_for(:invalid_page) }
    let(:current_user)  { mock 'user' }

    before do
      can Scroll::Page
      current_user.stubs(:manage?).returns(true)
      current_user.stubs(:xeditable?).returns(true)
      @page = create(:page)
    end

    it "should get index" do 
      get :index, use_route: :scroll_engine
      assigns(:pages).wont_be_nil
      assert_response :success
      assert_template :index
    end

    it "should get new" do 
      get :new, use_route: :scroll_engine
      assigns(:page).wont_be_nil
      assert_response :success
      assert_template :new
    end

    it "should create page w valid attributes" do 
      assert_difference('Scroll::Page.count') do
        post :create, use_route: :scroll_engine, page: page_attr
      end
      assigns(:page).errors.full_messages.must_be :empty?
      assert_response :redirect
      assert_redirected_to page_path(assigns(:page))
      assert_equal 'Page was successfully created.', flash[:notice]
    end

    it "shouldn't create page w invalid attributes" do 
      assert_no_difference('Scroll::Page.count') do
        post :create, use_route: :scroll_engine, page: invalid_attr
      end
      assigns(:page).errors.full_messages.wont_be :empty?
      assert_response :success
      assert_template :new
    end

    it "should show page" do 
      get :show, use_route: :scroll_engine, id: @page
      assigns(:page).wont_be_nil
      assigns(:page).must_equal @page
      assert_response :success
      assert_template :show
    end

    it "should get edit" do 
      get :edit, use_route: :scroll_engine, id: @page
      assigns(:page).wont_be_nil
      assigns(:page).must_equal @page
      assert_response :success
      assert_template :edit
    end

    it "should update page w valid attributes" do
      patch :update, use_route: :scroll_engine, id: @page, translations_attributes: { translations: [ attributes_for(:page_cs_translation) ] }
      assigns(:page).errors.full_messages.must_be :empty?
      assert_response :redirect
      assert_redirected_to page_path(assigns(:page))
      assert_equal 'Page was successfully updated.', flash[:notice]
    end

    it "shouldn't update page w invalid attributes" do
      patch :update, use_route: :scroll_engine, id: @page, page: { translations_attributes: [ attributes_for(:page_translation) ] }
      assigns(:page).errors.full_messages.wont_be :empty?
      assigns(:page).must_equal @page
      assert_response :success
      assert_template :edit
    end

    it "should destroy page" do 
      assert_difference('Scroll::Page.count', -1) do
        delete :destroy, use_route: :scroll_engine, id: @page
      end
      assert_response :redirect
      assert_redirected_to pages_path
      assert_equal 'Page was successfully deleted.', flash[:notice]
    end
  end
end