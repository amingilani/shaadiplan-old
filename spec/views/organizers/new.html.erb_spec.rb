require 'rails_helper'

RSpec.describe "organizers/new", type: :view do
  before(:each) do
    assign(:organizer, Organizer.new(
      :relationship => 1,
      :side => 1,
      :wedding => nil,
      :user => nil
    ))
  end

  it "renders new organizer form" do
    render

    assert_select "form[action=?][method=?]", organizers_path, "post" do

      assert_select "input#organizer_relationship[name=?]", "organizer[relationship]"

      assert_select "input#organizer_side[name=?]", "organizer[side]"

      assert_select "input#organizer_wedding_id[name=?]", "organizer[wedding_id]"

      assert_select "input#organizer_user_id[name=?]", "organizer[user_id]"
    end
  end
end
