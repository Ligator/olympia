require 'rails_helper'

RSpec.describe "agreements/new", type: :view do
  before(:each) do
    assign(:agreement, Agreement.new(
      title: "MyString",
      description: "MyText",
      state: "MyString",
      user: nil
    ))
  end

  it "renders new agreement form" do
    render

    assert_select "form[action=?][method=?]", agreements_path, "post" do

      assert_select "input[name=?]", "agreement[title]"

      assert_select "textarea[name=?]", "agreement[description]"

      assert_select "input[name=?]", "agreement[state]"

      assert_select "input[name=?]", "agreement[user_id]"
    end
  end
end
