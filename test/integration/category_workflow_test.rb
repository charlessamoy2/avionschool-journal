require 'test_helper'

class CategoryWorkflowTest < ActionDispatch::IntegrationTest
    
    def setup
        @category = categories(:one)
    end

    test '01. create a new category' do
        get new_category_path
        assert_response :success

        assert_difference 'Category.count', 1 do
            post categories_path, params: { category: {name: 'test', description: 'test description'}}
            assert_response :redirect
        end
        follow_redirect!
        assert_response :success
    end

    test '02. update a current category' do
        get edit_category_path(:id => @category.id)
        assert_response :success
        
        assert_changes '@category.name' do
            put category_path(:id => @category.id), params: {category: {name: 'test edit'}}
            @category.reload
            assert_response :redirect
        end
        
        follow_redirect!
        assert_response :success
    end

    test '03. delete a current category' do
        assert_difference 'Category.count', -1 do
            delete category_path(:id => @category.id)
            assert_response :redirect
        end
        follow_redirect!
        assert_response :success
    end
end