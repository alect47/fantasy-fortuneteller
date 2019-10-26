require 'rails_helper'

describe 'Players' do
  before(:each) do
    @user = create(:user, user_name: "Jason Bourne")
    @tom_brady = Player.create!(display_name: 'Tom Brady', position: 'QB')
    @ryan_fitzpatrick = Player.create!(display_name: 'Ryan Fitzpatrick', position: 'QB')
    @christian = Player.create!(display_name: 'Christian McCaffrey', position: 'RB')
    @deandre = Player.create!(display_name: 'DeAndre Hopkins', position: 'WR')
    @ravens = Player.create!(display_name: 'Balitmore Ravens', position: 'DEF')
    @greg = Player.create!(display_name: 'Greg Zuerlein', position: 'K')
    @george = Player.create!(display_name: 'George Kittle', position: 'TE')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  it ' user can see players for specific position' do
    visit players_path

    click_on 'Position'
    within '#position-dropdown' do
      click_on 'Quarter Back'
    end

    expect(page).to have_content(@tom_brady.display_name)
    expect(page).to have_content(@ryan_fitzpatrick.display_name)
    expect(page).to_not have_content(@christian.display_name)
  end
end
