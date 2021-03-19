require 'rails_helper'

RSpec.describe "proposals/index", type: :view do
  before(:each) do
    assign(:proposals, [
      Proposal.create!(
        body: "Body",
        votes_count: 2,
        votes_porcentage: "9.99",
        user: nil,
        agreement: nil
      ),
      Proposal.create!(
        body: "Body",
        votes_count: 2,
        votes_porcentage: "9.99",
        user: nil,
        agreement: nil
      )
    ])
  end

  it "renders a list of proposals" do
    render
    assert_select "tr>td", text: "Body".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
