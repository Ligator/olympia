require 'rails_helper'

RSpec.describe "cards/show", type: :view do
  before(:each) do
    @card = assign(:card, Card.create!(
      number_card: 2,
      name_bank: "Name Bank",
      titular_name: "Titular Name",
      type: "Type",
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Name Bank/)
    expect(rendered).to match(/Titular Name/)
    expect(rendered).to match(/Type/)
    expect(rendered).to match(//)
  end
end
