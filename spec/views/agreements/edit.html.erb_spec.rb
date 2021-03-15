require 'rails_helper'

RSpec.describe "agreements/edit", type: :view do
  before(:each) do
    @agreement = assign(:agreement, Agreement.create!(
      title: "MyString",
      description: "MyText",
      state: "MyString",
      user: nil
    ))
  end

  it "renders the edit agreement form" do
    render

    assert_select "form[action=?][method=?]", agreement_path(@agreement), "post" do

      assert_select "input[name=?]", "agreement[title]"

      assert_select "textarea[name=?]", "agreement[description]"

      assert_select "input[name=?]", "agreement[state]"

      assert_select "input[name=?]", "agreement[user_id]"
    end
  end
end
