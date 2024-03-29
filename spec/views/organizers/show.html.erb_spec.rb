require 'rails_helper'

RSpec.describe "organizers/show", type: :view do
  before(:each) do
    @organizer = assign(:organizer, Organizer.create!(
      :relationship => 2,
      :side => 3,
      :wedding => nil,
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
