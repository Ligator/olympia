require 'rails_helper'

RSpec.describe "agreements/index", type: :view do
  before(:each) do
    assign(:agreements, [
      Agreement.create!(
        title: "Title",
        description: "MyText",
        state: "State",
        user: nil
      ),
      Agreement.create!(
        title: "Title",
        description: "MyText",
        state: "State",
        user: nil
      )
    ])
  end

  it "renders a list of agreements" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "State".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
