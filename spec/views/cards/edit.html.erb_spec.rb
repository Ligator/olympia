require 'rails_helper'

RSpec.describe "cards/edit", type: :view do
  before(:each) do
    @card = assign(:card, Card.create!(
      number_card: 1,
      name_bank: "MyString",
      titular_name: "MyString",
      type: "",
      user: nil
    ))
  end

  it "renders the edit card form" do
    render

    assert_select "form[action=?][method=?]", card_path(@card), "post" do

      assert_select "input[name=?]", "card[number_card]"

      assert_select "input[name=?]", "card[name_bank]"

      assert_select "input[name=?]", "card[titular_name]"

      assert_select "input[name=?]", "card[type]"

      assert_select "input[name=?]", "card[user_id]"
    end
  end
end
