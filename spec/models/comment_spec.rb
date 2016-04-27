require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "is valid with a user and a content" do
    user = User.new
    comment = Comment.new(
      content: "My message",
      user: user)
    expect(comment).to be_valid
  end

  it "is not valid without a content" do
    comment = Comment.new(content: nil)
    comment.valid?
    expect(comment.errors[:content]).to include("can't be blank")
  end
end
