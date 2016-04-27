require 'rails_helper'

RSpec.describe Gist, type: :model do
  it "is valid with a description, title, language, code and user" do
    user = User.new
    gist = Gist.new(
      description: "description",
      title: "title",
      language: "ruby",
      code: "my code",
      user: user)
    expect(gist).to be_valid
  end

  it "is invalid without a description" do
    gist = Gist.new(description: nil)
    gist.valid?
    expect(gist.errors[:description]).to include("can't be blank")
  end

  it "is invalid wihtout a title" do
    gist = Gist.new(title: nil)
    gist.valid?
    expect(gist.errors[:title]).to include("can't be blank")
  end

  it "is invalid without a code" do
    gist = Gist.new(code: nil)
    gist.valid?
    expect(gist.errors[:code]).to include("can't be blank")
  end
end
