require 'rails_helper'

RSpec.describe "proposals/new", type: :view do
  before(:each) do
    assign(:proposal, Proposal.new(
      body: "MyString",
      votes_count: 1,
      votes_porcentage: "9.99",
      users: nil,
      agremments: nil
    ))
  end

  it "renders new proposal form" do
    render

    assert_select "form[action=?][method=?]", proposals_path, "post" do

      assert_select "input[name=?]", "proposal[body]"

      assert_select "input[name=?]", "proposal[votes_count]"

      assert_select "input[name=?]", "proposal[votes_porcentage]"

      assert_select "input[name=?]", "proposal[users_id]"

      assert_select "input[name=?]", "proposal[agremments_id]"
    end
  end
end
