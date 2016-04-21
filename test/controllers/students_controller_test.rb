require 'test_helper'

class StudentsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:students)
  end

  test "should create student" do
    assert_difference('Student.count') do
      post :create, student: {first_name: 'Dorin', last_name: 'Guțu', birthday: '1996-05-13', phone: '(021)-321-334', email: 'doringutsu@gmail.com', subject_id: '25'}
    end

    assert_redirected_to student_path(assigns(:article))
  end
end
