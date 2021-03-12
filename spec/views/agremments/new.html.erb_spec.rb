require 'rails_helper'

RSpec.describe "agremments/new", type: :view do
  before(:each) do
    assign(:agremment, Agremment.new(
      title: "MyString",
      description: "MyText",
      state: "MyText",
      users: nil
    ))
  end

  it "renders new agremment form" do
    render

    assert_select "form[action=?][method=?]", agremments_path, "post" do

      assert_select "input[name=?]", "agremment[title]"

      assert_select "textarea[name=?]", "agremment[description]"

      assert_select "textarea[name=?]", "agremment[state]"

      assert_select "input[name=?]", "agremment[users_id]"
    end
  end
end
