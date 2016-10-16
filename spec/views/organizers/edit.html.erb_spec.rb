require 'rails_helper'

RSpec.describe "organizers/edit", type: :view do
  before(:each) do
    @organizer = assign(:organizer, Organizer.create!(
      :relationship => 1,
      :side => 1,
      :wedding => nil,
      :user => nil
    ))
  end

  it "renders the edit organizer form" do
    render

    assert_select "form[action=?][method=?]", organizer_path(@organizer), "post" do

      assert_select "input#organizer_relationship[name=?]", "organizer[relationship]"

      assert_select "input#organizer_side[name=?]", "organizer[side]"

      assert_select "input#organizer_wedding_id[name=?]", "organizer[wedding_id]"

      assert_select "input#organizer_user_id[name=?]", "organizer[user_id]"
    end
  end
end
