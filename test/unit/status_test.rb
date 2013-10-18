require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "that status require content" do
  	status = Status.new
  	assert !status.save
  	assert !status.errors[:content].empty?
  end

  test "at least two letters long " do 
  	status = Status.new
  	status.content = "H"
  	assert !status.save
  	assert !status.errors[:content].empty?
  end

  test "That a status has a user ID " do 
  	status = Status.new
  	status.content = "Hello World"
  	assert !status.save
  	assert !status.errors[:user_id].empty?
  end 
end
