require 'rails_helper'

RSpec.describe "cards/new", type: :view do
  before(:each) do
    assign(:card, Card.new(
      number_card: 1,
      name_bank: "MyString",
      titular_name: "MyString",
      type: ""
    ))
  end

  it "renders new card form" do
    render

    assert_select "form[action=?][method=?]", cards_path, "post" do

      assert_select "input[name=?]", "card[number_card]"

      assert_select "input[name=?]", "card[name_bank]"

      assert_select "input[name=?]", "card[titular_name]"

      assert_select "input[name=?]", "card[type]"
    end
  end
end
