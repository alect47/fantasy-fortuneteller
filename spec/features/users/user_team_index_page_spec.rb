require 'rails_helper'

describe "A logged in user" do
  before(:each) do
    @user = create(:user)
    @team_1 = @user.teams.create(name: "What The Flacco")
    @team_2 = @user.teams.create(name: "The Brady Bunch")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  scenario "can see a list of their teams with names that link to the team show page" do
    visit user_teams_path

    within('.table') do
      expect(page).to have_link("What The Flacco")
      click_link("The Brady Bunch")
    end

    expect(current_path).to eq user_team_path(@team_2)
  end

  scenario "can add a new team" do
    visit user_teams_path

    click_link("New Team")

    expect(current_path).to eq new_user_team_path

    fill_in "Name", with: "Test Team"
    click_button("Create Team")

    expect(current_path).to eq user_teams_path

    within('.table') do
      expect(page).to have_link("Test Team")
    end
  end
end