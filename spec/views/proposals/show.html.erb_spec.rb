require 'rails_helper'

RSpec.describe "proposals/show", type: :view do
  before(:each) do
    @proposal = assign(:proposal, Proposal.create!(
      body: "Body",
      votes_count: 2,
      votes_porcentage: "9.99",
      user: nil,
      agreement: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Body/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
