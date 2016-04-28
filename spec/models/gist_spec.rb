require 'rails_helper'

RSpec.describe Gist, type: :model do
  it "has a valid Factory" do
    expect(build(:gist)).to be_valid
  end

  it "is invalid without a description" do
    gist = build(:gist, description: nil)
    gist.valid?
    expect(gist.errors[:description]).to include("can't be blank")
  end

  it "is invalid wihtout a title" do
    gist = build(:gist, title: nil)
    gist.valid?
    expect(gist.errors[:title]).to include("can't be blank")
  end

  it "is invalid without a code" do
    gist = build(:gist, code: nil)
    gist.valid?
    expect(gist.errors[:code]).to include("can't be blank")
  end

  it "is invalid without a language" do
    gist = build(:gist, language: nil)
    gist.valid?
    expect(gist.errors[:language]).to include("can't be blank")
  end
end
