require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase

    def setup
        @category = categories(:one)
    end

    test "01. index action should be success" do
        get :index
        assert_response :success
    end

    test "02. create action should be a redirect" do
        get :new
        assert_response :success

        assert_difference 'Category.count', 1 do
            post :create,
            params: {category: { name: "Charles Samoy", description: "Personal"}}
            assert_response :redirect
        end
    end

    test "03. edit action should be a success" do
        get :edit, params: {id: @category.id}
        assert_response :success
    end

    test "04. update action should be a redirect" do
        post :update,
        params: {id: @category.id, category: {name: "Charles Test", description: "test"}}
        assert_response :redirect
    end
    
    test "05. delete action should be a redirect" do
        post :delete, params: {id: @category.id}
        assert_response :redirect
    end

end