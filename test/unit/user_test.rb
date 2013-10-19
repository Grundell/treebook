require 'test_helper'

class UserTest < ActiveSupport::TestCase
	test "a user enters a first name" do
		user = User.new
		assert !user.save
		assert !user.errors[:first_name].empty?
	end

	test "a user enters a last name" do
		user = User.new
		assert !user.save
		assert !user.errors[:last_name].empty?
	end

	test "a user enters a profile name" do
		user = User.new
		assert !user.save
		assert !user.errors[:profile_name].empty?
	end

	test "a user should have a unique profile name" do 
		user = User.new
		user.profile_name = 'jasonsifer'
		user.first_name = 'Jason'
		user.last_name = 'Sifer'
		user.email = 'jason@teamtreehouse.com'
		assert !user.save
		assert !user.errors[:profile_name].empty?
	end

	test "a user should have a profile name witouht spaces" do
		user = User.new
		user.profile_name = "My profile With Spaces"

		assert !user.save
		assert !user.errors[:profile_name].empty?
		assert user.errors[:profile_name].include?("Must be formatted correctly.")
	end

	test "a user can have a correctly formated profile name" do
		user = User.new(first_name: 'Jason', last_name: 'Seifer', email: 'jasonsifer@ngee.se')
		user.password = user.password_confirmation = 'asdfasdf'

		user.profile_name	= 'jasssonsifer_2'
		assert user.valid? 
	end
end
