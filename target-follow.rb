require 'watir' # Crawler
require 'pry' # Ruby REPL
require 'rb-readline' # Ruby IRB
require 'awesome_print' # Console output
require_relative 'credentials' # Pulls in login credentials from credentials.rb

username = $username
password = $password
like_counter = 0
num_of_rounds = 0
MAX_LIKES = 1500

# Open Browser, Navigate to Login page
browser = Watir::Browser.new :chrome, switches: ['--incognito']
browser.goto "instagram.com/accounts/login/"

# Navigate to Username and Password fields, inject info
puts "Logging in..."
browser.text_field(:name => "username").set "#{username}"
browser.text_field(:name => "password").set "#{password}"

# Click Login Button
browser.button(:class => '_qv64e _gexxb _4tgw8 _njrw0').click
sleep(2)
puts "GROWBOT COMMENCING"

browser.goto "https://www.instagram.com/behindthecoin/"
browser.a(:class => '_t98z6').click
sleep(3)

# Continuous loop to break upon reaching the max likes
loop do

  if browser.button(:class => '_qv64e _gexxb _4tgw8 _njrw0').exists?
      ap "BUTTON DETECTED"

      browser.buttons(:class => "_qv64e _gexxb _4tgw8 _njrw0").each { |val|
        ap "#{val}" 
        sleep(1)
        # val.click
        like_counter += 1
        browser.driver.execute_script("window.scrollBy(0,document.body.scrollHeight)")
      }

      # browser.spans(:class => "_ov9ai").each { |val|
      #   ap "#{val}"
      #   # val.click
      #   sleep(3)
      #   like_counter += 1
      # }

      follow_counter += 1
      sleep(3)

      browser.driver.execute_script("window.scrollBy(0,document.body.scrollHeight)")

      sleep(3)

    elsif browser.button(:class => '_qv64e _t78yp _4tgw8 _njrw0').exists?
      ap "Unfollowing - jk"
      # browser.button(:class => '_qv64e _t78yp _4tgw8 _njrw0').click
      # unfollow_counter += 1
      sleep(1)
    end

  sleep(2) # Return to top of loop after this many seconds to check for new photos
end

# Leave this in to use the REPL at end of program
# Otherwise, take it out and program will just end
# Pry.start(binding)
