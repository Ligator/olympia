require 'rails_helper'

RSpec.describe "proposals/edit", type: :view do
  before(:each) do
    @proposal = assign(:proposal, Proposal.create!(
      body: "MyString",
      votes_count: 1,
      votes_porcentage: "9.99",
      users: nil,
      agremments: nil
    ))
  end

  it "renders the edit proposal form" do
    render

    assert_select "form[action=?][method=?]", proposal_path(@proposal), "post" do

      assert_select "input[name=?]", "proposal[body]"

      assert_select "input[name=?]", "proposal[votes_count]"

      assert_select "input[name=?]", "proposal[votes_porcentage]"

      assert_select "input[name=?]", "proposal[users_id]"

      assert_select "input[name=?]", "proposal[agremments_id]"
    end
  end
end
