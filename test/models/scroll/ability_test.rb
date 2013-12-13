require "test_helper"

module Scroll
  describe Ability do
    describe 'Anuathorized access' do 
      let(:ability) { Ability.new(nil) }

      describe 'Pages' do 
        it "can index pages"            do ability.can?(:index, :pages).must_equal true end
        it "cannot show pages"          do ability.cannot?(:show, Page.new).must_equal true end
        it "cannot edit pages"          do ability.cannot?(:edit, Page.new).must_equal true end
        it "cannot update pages"        do ability.cannot?(:update, Page.new).must_equal true end
        it "cannot delete pages"        do ability.cannot?(:delete, Page.new).must_equal true end
      end

      describe 'Enabled pages' do 
        it "can index pages"            do ability.can?(:index, :pages).must_equal true end
        it "cann show pages"            do ability.can?(:show, Page.new(active: true)).must_equal true end
        it "cannot edit pages"          do ability.cannot?(:edit, Page.new(active: true)).must_equal true end
        it "cannot update pages"        do ability.cannot?(:update, Page.new(active: true)).must_equal true end
        it "cannot delete pages"        do ability.cannot?(:delete, Page.new(active: true)).must_equal true end
      end
    end

    describe 'User access' do 
      let(:user)    { user_ability(:user) }
      let(:ability) { Ability.new(user) }
      let(:current_user) { mock 'user' }

      describe 'Pages' do 
        it "can index pages"            do ability.can?(:index, :pages).must_equal true end
        it "cannot show pages"          do ability.cannot?(:show, Page.new).must_equal true end
        it "cannot edit pages"          do ability.cannot?(:edit, Page.new).must_equal true end
        it "cannot update pages"        do ability.cannot?(:update, Page.new).must_equal true end
        it "cannot delete pages"        do ability.cannot?(:delete, Page.new).must_equal true end
      end

      describe 'Enabled pages' do 
        it "can index pages"            do ability.can?(:index, :pages).must_equal true end
        it "cann show pages"            do ability.can?(:show, Page.new(active: true)).must_equal true end
        it "cannot edit pages"          do ability.cannot?(:edit, Page.new(active: true)).must_equal true end
        it "cannot update pages"        do ability.cannot?(:update, Page.new(active: true)).must_equal true end
        it "cannot delete pages"        do ability.cannot?(:delete, Page.new(active: true)).must_equal true end
      end
    end

    describe 'Admin access' do 
      let(:user)    { user_ability(:admin) }
      let(:ability) { Ability.new(user) }
      let(:current_user) { mock 'user' }

      describe 'Pages' do
        it "can index pages"            do ability.can?(:index, :pages).must_equal true end
        it "can show pages"             do ability.can?(:show, Page.new).must_equal true end
        it "can edit pages"             do ability.can?(:edit, Page.new).must_equal true end
        it "can update pages"           do ability.can?(:update, Page.new).must_equal true end
        it "can delete pages"           do ability.can?(:delete, Page.new).must_equal true end
      end
    end
  end
end