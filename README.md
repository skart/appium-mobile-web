Appium Mobile Web Automated Testing POC
=========================================
For information on the project contact Stephanie

Installs
-------------------------------------
* Appium server 
	* http://appium.io 
	* Install using `sudo`
* Install/Upgrade Xcode to latest official version from the AppStore
* Install/Upgrade Android Studio (custom install, select emulators)
	* https://developer.android.com/studio/install.html
	* After install, launch Android Studio
	* Create an emulator >>Tools > Android > AVD Manager
		* Create Virtual Device
* Install ideviceinstaller via the terminal: `brew install ideviceinstaller`
* Install the Android SDK via the terminal
	* `brew tap caskroom/cask`
	* `brew cask install android-sdk`
	* Update `.bash_profile`
		* `export ANDROID_HOME=/usr/local/share/android-sdk
		   export ANDROID_SDK=$ANDROID_HOME
           export ANDROID_SDK_ROOT='/Users/username/Library/Android/sdk'`
* Install Java via the terminal
	* `brew cask install java`
* Ensure that at least Ruby 2.0 is installed on your system
* Perform a 'bundle install' within the directory and all the necessary gems will be installed

Command Line Run Options
-------------
Several command line options are available to customize and provide flexibility when running the Appium test scripts.
Some of these options were created to help the setup determine which set of desired capabilities to use.  

1. REAL
	* Tells Appium whether a real device or simulator is being used to run the tests
	* Default: `no`

2. DEVICE
	* The type of device to run the test against.  `iphone` or `android`
	* Default: 'iphone'
2. NAME 
	* The name of the device to run the tests against.
	* Default: 'iPhone 7'
	
Running Tips
------------
* Appium server needs to be running 
* To run an Android test, the emulator needs to be running and connected to the Android list
	* Launch an emulator from the terminal: `/Users/username/Library/Android/sdk/tools/emulator -avd Device_Name`
* Appium will automatically launch Apple simulators, but it is faster to launch the simulator prior to the test.
