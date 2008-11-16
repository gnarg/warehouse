require File.dirname(__FILE__) + '/../test_helper'
require 'comments_controller'

context "Comments Controller" do
  setup do
    @controller = CommentsController.new
    @controller.stubs(:current_user).returns(users(:rick))
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @request.host = "sample.test.host"
  end
  
  specify "should create new comment" do
    change = changes(:one_moon)
    assert_difference "Comment.count" do
      post :create, :comment => { :author => 'tester', :body => 'test body' }, 
                    :change_id => change.id
    end
    assigns(:comment).author.should == 'tester'
    assigns(:comment).body.should == 'test body'
    assigns(:comment).change.id.should == change.id
  end
end  
