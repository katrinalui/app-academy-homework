require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  subject(:user) do
    FactoryGirl.build(:user,
      email: "hey@hello.com",
      password: "password")
  end

  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password) }

    it "creates a password_digest when a password is given" do
      expect(user.password_digest).to_not be_nil
    end

    it "creates a session_token after initialize" do
      expect(user.session_token).to_not be_nil
    end
  end

  describe "#is_password?" do
    it "verifies if password is correct" do
      expect(user.is_password?("password")).to be true
    end

    it "verifies if password is incorrect" do
      expect(user.is_password?("bad password")).to be false
    end
  end

  describe "#reset_session_token" do
    it "sets a new session token for the user" do
      prev_session_token = user.session_token
      user.reset_session_token!

      expect(user.session_token).to_not eq(prev_session_token)
    end

    it "returns the new session token" do
      expect(user.reset_session_token!).to eq(user.session_token)
    end
  end

  describe "::find_by_credentials" do
    before { user.save! }

    it "returns user with valid credentials" do
      expect(User.find_by_credentials('hey@hello.com', 'password')).to eq(user)
    end

    it "returns nil with invalid credentials" do
      expect(User.find_by_credentials('hey@hello.com', 'bad password')).to eq(nil)
    end
  end
end
