describe "the signin process", type: :feature do
  before :each do
    FactoryBot.create(:user, email: 'aauser@example.com', password: 'password', password_confirmation: 'password')
  end

  it "signs me in" do
    visit '/users/sign_in'
    fill_in 'Email', with: 'aauser@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully'
  end
end
