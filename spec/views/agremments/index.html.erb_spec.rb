require 'rails_helper'

RSpec.describe "agremments/index", type: :view do
  before(:each) do
    assign(:agremments, [
      Agremment.create!(
        title: "Title",
        description: "MyText",
        state: "MyText",
        users: nil
      ),
      Agremment.create!(
        title: "Title",
        description: "MyText",
        state: "MyText",
        users: nil
      )
    ])
  end

  it "renders a list of agremments" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
