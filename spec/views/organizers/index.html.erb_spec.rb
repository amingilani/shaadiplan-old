require 'rails_helper'

RSpec.describe "organizers/index", type: :view do
  before(:each) do
    assign(:organizers, [
      Organizer.create!(
        :relationship => 2,
        :side => 3,
        :wedding => nil,
        :user => nil
      ),
      Organizer.create!(
        :relationship => 2,
        :side => 3,
        :wedding => nil,
        :user => nil
      )
    ])
  end

  it "renders a list of organizers" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
