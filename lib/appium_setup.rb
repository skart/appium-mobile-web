require 'rubygems'
require 'appium_lib'
require 'selenium-webdriver'
require 'rspec'
require 'rspec/expectations'
require 'yaml'
	
#define device type, device name, and environment variables
    $real_device = ENV['REAL'] || 'no'
    $device_type = ENV['DEVICE'] || 'iphone'
    $device_name = ENV['NAME'] || 'iPhone 7'

    if $real_device == 'y'
        CONFIG = YAML::load(open(File.join(File.dirname(__FILE__),'hardware.yml')))[$device_name]
          $udid = CONFIG["udid"]
    end


#require methods and variables 
	require_relative './methods/common_methods'
		include Common_Methods

		require_relative 'global_variables.rb'
        	include Mobile_Variables
			
##SETUP & TEARDOWN
	def app_setup
		sleep 4
		##APPIUM DRIVER CAPABILITIES
        if $device_type == 'iphone'  && $real_device == 'no'#run on simulator
        	desired_caps = {
   			 	  platformName: "iOS",
            deviceName: $device_name,
            platformVersion: "10.3",
            browserName: "Safari",
            automationName: "XCUITest"
  					}
  		  elsif $device_type == 'android' && $real_device == 'no'
  			  desired_caps = {
   			 		platformName: "android",
            deviceName: $device_name,
            browserName: "Chrome"
  					}
        elsif $device_type == 'iphone' && $real_device == 'yes'
          desired_caps = {
            platformName: "iOS",
            deviceName: $device_name,
            udid:       $udid,
            browserName: "Safari",
            automationName: "XCUITest"
            }
  		  end

		$driver = Appium::Driver.new(caps: desired_caps).start_driver  ##launch the simulator  
    $driver.manage.timeouts.implicit_wait = 30
    $driver.get("http://www.******.com")   ##go to base URL
	end
	
	def app_teardown
		$driver.quit ##close browser and clean up 
	end