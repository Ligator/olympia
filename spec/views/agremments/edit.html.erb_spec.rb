require 'rails_helper'

RSpec.describe "agremments/edit", type: :view do
  before(:each) do
    @agremment = assign(:agremment, Agremment.create!(
      title: "MyString",
      description: "MyText",
      state: "MyText",
      users: nil
    ))
  end

  it "renders the edit agremment form" do
    render

    assert_select "form[action=?][method=?]", agremment_path(@agremment), "post" do

      assert_select "input[name=?]", "agremment[title]"

      assert_select "textarea[name=?]", "agremment[description]"

      assert_select "textarea[name=?]", "agremment[state]"

      assert_select "input[name=?]", "agremment[users_id]"
    end
  end
end
