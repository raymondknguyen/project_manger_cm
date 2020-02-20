RSpec.describe "User", type: :feature do
  it "keeps a user logged in after registering" do
    user = User.create(username: "user", password: "password")
    visit "/login_page"

    click_on "Log In"

    expect(current_path).to eq("/login")

    fill_in :username, with: user.username
    fill_in :password, with: user.password

    click_on "Sign In"

    expect(current_path).to eq('/profile')
   
    expect(page).to have_content("Welcome, #{user.username}!")
  end

  it "cannot log in with bad credentials" do
    user = User.create(username: "user", password: "password")

    visit "/login_page"

    click_on "Log In"
    expect(current_path).to eq("/login")

    fill_in :username, with: user.username
    fill_in :password, with: "incorrect password"

    click_on "Sign In"

    expect(current_path).to eq('/login')

    expect(page).to have_content("Sorry, your credentials are bad.")
  end

  it "can log out" do
    user = User.create(username: "ray", password: "password123")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/login_page"

    expect(user.username).to eq("ray")

    click_link("Log Out")
    expect(current_path).to eq('/')
    expect(page).to have_content("You are now logged out.")
  end
end