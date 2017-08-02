module Common_Methods  	
	def element(xpath)
        return $driver.find_element(:xpath, xpath)
        true
    rescue Selenium::WebDriver::Error::NoSuchElementError
        false
    end
    
    def element_visible?(xpath)
        return $driver.find_element(:xpath, xpath).displayed?
        true
    rescue Selenium::WebDriver::Error::NoSuchElementError
        false
    end
    
    def element_present?(xpath)
        return expect($driver.find_element(:xpath, xpath)).to be_truthy
        true
    rescue Selenium::WebDriver::Error::NoSuchElementError
        false
    end
    
    def element_not_present?(xpath)
        return expect($driver.find_element(:xpath, xpath)).to be_falsey
        true
    rescue Selenium::WebDriver::Error::NoSuchElementError
        false
    end
end

