require 'rails_helper'

RSpec.describe "cards/index", type: :view do
  before(:each) do
    assign(:cards, [
      Card.create!(
        number_card: 2,
        name_bank: "Name Bank",
        titular_name: "Titular Name",
        type: "Type",
        user: nil
      ),
      Card.create!(
        number_card: 2,
        name_bank: "Name Bank",
        titular_name: "Titular Name",
        type: "Type",
        user: nil
      )
    ])
  end

  it "renders a list of cards" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Name Bank".to_s, count: 2
    assert_select "tr>td", text: "Titular Name".to_s, count: 2
    assert_select "tr>td", text: "Type".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
