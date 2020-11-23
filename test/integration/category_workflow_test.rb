require 'test_helper'

class CategoryWorkflowTest < ActionDispatch::IntegrationTest
    
    def setup
        @category = categories(:one)
    end

    test '01. create a new category' do
        get new_category_path
        assert_response :success

        assert_difference 'Category.count', 1 do
            post create_category_path, params: { category: {name: 'test', description: 'test description'}}
            assert_response :redirect
        end
        follow_redirect!
        assert_response :success
    end

    test '02. update a current category' do
        get edit_category_path, params: {id: @category.id}
        assert_response :success

        assert_changes '@category.name', from: @category.name, to: 'test edit' do
            post update_category_path, params: {id: @category.id, category: {name: 'test edit'}}
            assert_response :redirect
        end
        follow_redirect!
        assert_response :success
    end

    test '03. delete a current category' do
        get edit_category_path, params: {id: @category.id}
        assert_response :success

        assert_difference 'Category.count', -1 do
            post delete_category_path, params: { id: @category.id}
            assert_response :redirect
        end
        follow_redirect!
        assert_response :success
    end
end