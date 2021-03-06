require 'rails_helper'

context 'As a logged in user' do
  context 'I visit the league stats page' do
    before :each do
      @user = create(:user)
      allow_any_instance_of(ApplicationController)
        .to receive(:current_user)
        .and_return(@user)

      @qb1 = create(:player, position: 'QB', current_projection: 5)
      @qb2 = create(:player, position: 'QB', current_projection: 10)
      @qb3 = create(:player, position: 'QB', current_projection: 15)
      @qb4 = create(:player, position: 'QB', current_projection: 20)
      @qb5 = create(:player, position: 'QB', current_projection: 25)
      @qb6 = create(:player, position: 'QB', current_projection: 30)
      @qb7 = create(:player, position: 'QB', current_projection: 30.5)

      @rb1 = create(:player, position: 'RB', current_projection: 5)
      @rb2 = create(:player, position: 'RB', current_projection: 10)
      @rb3 = create(:player, position: 'RB', current_projection: 15)
      @rb4 = create(:player, position: 'RB', current_projection: 20)
      @rb5 = create(:player, position: 'RB', current_projection: 25)
      @rb6 = create(:player, position: 'RB', current_projection: 30)
      @rb7 = create(:player, position: 'RB', current_projection: 30.5)

      @wr1 = create(:player, position: 'WR', current_projection: 5)
      @wr2 = create(:player, position: 'WR', current_projection: 10)
      @wr3 = create(:player, position: 'WR', current_projection: 15)
      @wr4 = create(:player, position: 'WR', current_projection: 20)
      @wr5 = create(:player, position: 'WR', current_projection: 25)
      @wr6 = create(:player, position: 'WR', current_projection: 30)
      @wr7 = create(:player, position: 'WR', current_projection: 30.5)


      @te1 = create(:player, position: 'TE', current_projection: 5)
      @te2 = create(:player, position: 'TE', current_projection: 10)
      @te3 = create(:player, position: 'TE', current_projection: 15)
      @te4 = create(:player, position: 'TE', current_projection: 20)
      @te5 = create(:player, position: 'TE', current_projection: 25)
      @te6 = create(:player, position: 'TE', current_projection: 30)
      @te7 = create(:player, position: 'TE', current_projection: 30.5)

      @k1 = create(:player, position: 'K', current_projection: 5)
      @k2 = create(:player, position: 'K', current_projection: 10)
      @k3 = create(:player, position: 'K', current_projection: 15)
      @k4 = create(:player, position: 'K', current_projection: 20)
      @k5 = create(:player, position: 'K', current_projection: 25)
      @k6 = create(:player, position: 'K', current_projection: 30)
      @k7 = create(:player, position: 'K', current_projection: 30.5)


      @def1 = create(:player, position: 'DEF', current_projection: 5)
      @def2 = create(:player, position: 'DEF', current_projection: 10)
      @def3 = create(:player, position: 'DEF', current_projection: 15)
      @def4 = create(:player, position: 'DEF', current_projection: 20)
      @def5 = create(:player, position: 'DEF', current_projection: 25)
      @def6 = create(:player, position: 'DEF', current_projection: 30)
      @def7 = create(:player, position: 'DEF', current_projection: 30.5)
    end

    scenario 'I see a section for top 6 projected performances for each position' do
      visit leaguestats_path

      expect(current_path).to eq(leaguestats_path)

      within ".top-6-quarterbacks" do
        expect(page).to have_content(@qb7.display_name)
        expect(page).to have_content("(#{@qb7.team})")
        expect(page).to have_content(@qb7.current_projection)
        expect(@qb7.display_name).to appear_before(@qb6.display_name)
        expect(@qb6.display_name).to appear_before(@qb5.display_name)
        expect(@qb5.display_name).to appear_before(@qb4.display_name)
        expect(@qb4.display_name).to appear_before(@qb3.display_name)
        expect(@qb3.display_name).to appear_before(@qb2.display_name)
        expect(page).to_not have_content(@qb1.display_name)
      end

      within ".top-6-running-backs" do
        expect(page).to have_content(@rb7.display_name)
        expect(page).to have_content("(#{@rb7.team})")
        expect(page).to have_content(@rb7.current_projection)
        expect(@rb7.display_name).to appear_before(@rb6.display_name)
        expect(@rb6.display_name).to appear_before(@rb5.display_name)
        expect(@rb5.display_name).to appear_before(@rb4.display_name)
        expect(@rb4.display_name).to appear_before(@rb3.display_name)
        expect(@rb3.display_name).to appear_before(@rb2.display_name)
        expect(page).to_not have_content(@rb1.display_name)
      end

      within ".top-6-wide-receivers" do
        expect(page).to have_content(@wr6.display_name)
        expect(page).to have_content("(#{@wr6.team})")
        expect(page).to have_content(@wr6.current_projection)
        expect(@wr7.display_name).to appear_before(@wr6.display_name)
        expect(@wr6.display_name).to appear_before(@wr5.display_name)
        expect(@wr5.display_name).to appear_before(@wr4.display_name)
        expect(@wr4.display_name).to appear_before(@wr3.display_name)
        expect(@wr3.display_name).to appear_before(@wr2.display_name)
        expect(page).to_not have_content(@wr1.display_name)
      end

      within ".top-6-tight-ends" do
        expect(page).to have_content(@te6.display_name)
        expect(page).to have_content("(#{@te6.team})")
        expect(page).to have_content(@te6.current_projection)
        expect(@te7.display_name).to appear_before(@te6.display_name)
        expect(@te6.display_name).to appear_before(@te5.display_name)
        expect(@te5.display_name).to appear_before(@te4.display_name)
        expect(@te4.display_name).to appear_before(@te3.display_name)
        expect(@te3.display_name).to appear_before(@te2.display_name)
        expect(page).to_not have_content(@te1.display_name)
      end

      within ".top-6-kickers" do
        expect(page).to have_content(@k6.display_name)
        expect(page).to have_content("(#{@k6.team})")
        expect(page).to have_content(@k6.current_projection)
        expect(@k7.display_name).to appear_before(@k6.display_name)
        expect(@k6.display_name).to appear_before(@k5.display_name)
        expect(@k5.display_name).to appear_before(@k4.display_name)
        expect(@k4.display_name).to appear_before(@k3.display_name)
        expect(@k3.display_name).to appear_before(@k2.display_name)
        expect(page).to_not have_content(@k1.display_name)
      end

      within ".top-6-defenses" do
        expect(page).to have_content(@def6.display_name)
        expect(page).to have_content("(#{@def6.team})")
        expect(page).to have_content(@def6.current_projection)
        expect(@def7.display_name).to appear_before(@def6.display_name)
        expect(@def6.display_name).to appear_before(@def5.display_name)
        expect(@def5.display_name).to appear_before(@def4.display_name)
        expect(@def4.display_name).to appear_before(@def3.display_name)
        expect(@def3.display_name).to appear_before(@def2.display_name)
        expect(page).to_not have_content(@def1.display_name)
      end
    end

    scenario 'The players names are links to their show page' do
      visit leaguestats_path

      within ".top-6-quarterbacks" do
        click_link "#{@qb4.display_name}"
      end

      expect(current_path).to eq(player_path(@qb4))
    end
  end
end
