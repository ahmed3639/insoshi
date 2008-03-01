require File.dirname(__FILE__) + '/../spec_helper'

describe ForumPost do
  include CustomModelMatchers
  
  before(:each) do
    @post = ForumPost.new(:body => "Hey there", :topic => topics(:one),
                          :person => people(:quentin))
  end
  
  it "should be valid" do
    @post.should be_valid
  end
  
  it "should require a body" do
    post = ForumPost.new
    post.should_not be_valid
    post.errors.on(:body).should_not be_empty
  end
  
  it "should have a maximum body length" do
    @post.should have_maximum(:body, MAX_TEXT_LENGTH)
  end
end
