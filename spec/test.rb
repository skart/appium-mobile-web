require_relative "../lib/appium_setup"

describe "POC - " do
    before(:all) do
   		app_setup
  	end

  	after(:all) do
    	app_teardown
  	end
	
  it "Login with existing account" do
    #tap person icon
      element($person_icon).click
    #tap login with account
      element($login).click
    #enter email address
      element($login_email).send_keys "email@email.com"
    #enter password
      element($login_pwd).send_keys "password"
    #tap Log in button
      element($login_button).click
      sleep 3
    #verify user is logged in
      element($person_icon).click
      sleep 1
      expect(element_visible?("//.....")).to be_truthy
  end

  it "Browse a top category" do
    #click Search icon
      element($search_icon).click
    #select top category: Wedding invitations
      element($search_tcate_weddinginvite).click
    #verify Category header
      expect(element_visible?("//.....")).to be_truthy

  end

  it "Search for a card" do
    #click Search icon
      element($search_icon).click
    #Type a search term
      if $device_type == 'iphone'
        element($search_input).send_keys("summer") 
        
        current = $driver.current_context
        $driver.set_context("NATIVE_APP")
        Appium::TouchAction.new.press(x: 248, y: 93).wait(1000).release.perform #tap into the search field
        Appium::TouchAction.new.press(x: 332, y: 645).wait(1000).release.perform #tap 'Search' button on keyboard
        element("//XCUIElementTypeButton[@name='Search']").click
        $driver.set_context(current)
      elsif $device_type == 'android' 
        element($search_input).send_keys("summer"+"\n") 
      end
      
    #verify header
      expect(element_visible?("//....]")).to be_truthy
  end

  it "Logout" do
    #tap logout link
      element($logout).click
      sleep 5
    #verify logged out
      element($person_icon).click
      expect(element_visible?("//.....")).to be_truthy
  end
end