require 'watir' # Crawler
require 'pry' # Ruby REPL
require 'rb-readline' # Ruby IRB
require 'awesome_print' # Console output
# require_relative 'credentials' # Pulls in login credentials from credentials.rb
# require 'headless'

puts "hello"
# username = $username
# password = $password
username = "cryptospotlight"
password = "Alex91$$+cryptogram"
like_counter = 0
num_of_rounds = 0
MAX_LIKES = 1500

# Open Browser, Navigate to Login page
browser = Watir::Browser.new :chrome, headless: true
browser.goto "instagram.com/accounts/login/"

# Navigate to Username and Password fields, inject info
puts "Logging in..."
browser.text_field(:name => "username").set "#{username}"
browser.text_field(:name => "password").set "#{password}"

# Click Login Button
browser.button(:class => '_qv64e _gexxb _4tgw8 _njrw0').click
sleep(2)
puts "GROWBOT COMMENCING"

# Continuous loop to break upon reaching the max likes
loop do

  # Call all unliked like buttons on page and click each one.
  if browser.span(:class => "_8scx2 coreSpriteHeartOpen").exists?
    puts "button detected"
    sleep(1)
    browser.spans(:class => "_8scx2 coreSpriteHeartOpen").each { |val|
      val.click
      like_counter += 1
    }
    ap "Photos liked: #{like_counter}"
  else
    ap "No media to like rn, yo. Sorry homie, we tried."
    ap "Scrolling down"
    browser.driver.execute_script("window.scrollBy(0,document.body.scrollHeight)")
  end
  
  num_of_rounds += 1
  ap "number of rounds #{num_of_rounds}"
  break if like_counter >= MAX_LIKES
  sleep(2) # Return to top of loop after this many seconds to check for new photos
end

# Leave this in to use the REPL at end of program
# Otherwise, take it out and program will just end
# Pry.start(binding)
