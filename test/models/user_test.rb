require "test_helper"

describe User do
  let(:user) { User.new(name: "bob", uid: 12345, provider: "github", email: "bob@bob.com") }

  it "must be valid" do

    value(user).must_be :valid?
  end
end
