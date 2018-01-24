require 'watir' # Crawler
require 'pry' # Ruby REPL
require 'rb-readline' # Ruby IRB
require 'awesome_print' # Console output
require_relative 'credentials' # Pulls in login credentials from credentials.rb

username = $username
password = $password
like_counter = 0
follow_counter = 0
MAX_LIKES = 800

# Open Browser, Navigate to Login page
browser = Watir::Browser.new :chrome, switches: ['--incognito']
browser.goto "instagram.com/accounts/login/"

# Navigate to Username and Password fields, inject info
puts "Logging in..."
browser.text_field(:name => "username").set "#{username}"
browser.text_field(:name => "password").set "#{password}"
browser.button(:class => '_qv64e _gexxb _4tgw8 _njrw0').click
sleep(4)
puts "We're in #DatCrawlLifeDoe"

# Navigate to tag page
# browser.goto "instagram.com/explore/tags/smartcontracts/"
# browser.goto "instagram.com/explore/tags/metamask/"
# browser.goto "instagram.com/explore/tags/cryptokitties/"
browser.goto "instagram.com/explore/tags/linux/"
# browser.goto "instagram.com/explore/tags/erc20/"
# browser.goto "instagram.com/explore/tags/storj"
# browser.goto "instagram.com/explore/tags/augur"
# browser.goto "instagram.com/explore/tags/dropbox"
# browser.goto "instagram.com/explore/tags/heroku"
# browser.goto "instagram.com/explore/tags/brooklyntech"
# browser.goto "instagram.com/explore/tags/wordpress"
# browser.goto "instagram.com/explore/tags/git"
# browser.goto "instagram.com/explore/tags/freecodecamp"
# browser.goto "instagram.com/explore/tags/algorithm"
# browser.goto "instagram.com/explore/tags/mongodb"
# browser.goto "instagram.com/explore/tags/xcode"
# browser.goto "instagram.com/explore/tags/codecademy"
# browser.goto "instagram.com/explore/tags/girlsintech"
# browser.goto "instagram.com/explore/tags/womenintech"
# browser.goto "instagram.com/explore/tags/girlswhocode"
# browser.goto "instagram.com/explore/tags/javascript"
# browser.goto "instagram.com/explore/tags/rubyonrails"
# browser.goto "instagram.com/explore/tags/html"
# browser.goto "instagram.com/explore/tags/37signals"
# browser.goto "instagram.com/explore/tags/android"
# browser.goto "instagram.com/explore/tags/mysql"
# browser.goto "instagram.com/explore/tags/augmentedreality"
# browser.goto "instagram.com/explore/tags/virtualreality"
# browser.goto "instagram.com/explore/tags/compsci"
# browser.goto "instagram.com/explore/tags/compsci"
# browser.goto "instagram.com/explore/tags/nodejs"
# browser.goto "instagram.com/explore/tags/angular"
# browser.goto "instagram.com/explore/tags/meteorjs"
# browser.goto "instagram.com/explore/tags/hackathon"
# browser.goto "instagram.com/explore/tags/clojure"
# browser.goto "instagram.com/explore/tags/lisk"
# browser.goto "instagram.com/explore/tags/startupweekend"
# browser.goto "instagram.com/explore/tags/gitlab"
# browser.goto "instagram.com/explore/tags/computerscience"
# browser.goto "instagram.com/explore/tags/cryptography"
# browser.goto "instagram.com/explore/tags/cypherpunk"
# browser.goto "instagram.com/explore/tags/netneutrality"
# browser.goto "instagram.com/explore/tags/netneutrality"
# browser.goto "instagram.com/explore/tags/php"
# browser.goto "instagram.com/explore/tags/webdev"
# browser.goto "instagram.com/explore/tags/webapp"
# browser.goto "instagram.com/explore/tags/chatbot"
# browser.goto "instagram.com/explore/tags/deepmind"
# browser.goto "instagram.com/explore/tags/machinelearning"
# browser.goto "instagram.com/explore/tags/neuralnetwork"
# browser.goto "instagram.com/explore/tags/github"
# browser.goto "instagram.com/explore/tags/aws"
# browser.goto "instagram.com/explore/tags/salesforce"
# browser.goto "instagram.com/explore/tags/altcoin/"
# browser.goto "instagram.com/explore/tags/vitalikbuterin/"
# browser.goto "instagram.com/explore/tags/andreasantononpolous/"
# browser.goto "instagram.com/explore/tags/devcon/"
# browser.goto "instagram.com/explore/tags/hashgraph/"
# browser.goto "instagram.com/explore/tags/decentralization/"
# browser.goto "instagram.com/explore/tags/atomicswaps/"
# browser.goto "instagram.com/explore/tags/lightningnetwork/"
# browser.goto "instagram.com/explore/tags/p2p/"
# browser.goto "instagram.com/explore/tags/coinbase/"
# browser.goto "instagram.com/explore/tags/gdax/"
# browser.goto "instagram.com/explore/tags/bittrex/"
# browser.goto "instagram.com/explore/tags/binance/"
# browser.goto "instagram.com/explore/tags/dapps/"
# browser.goto "instagram.com/explore/tags/poloniex/"
# browser.goto "instagram.com/explore/tags/daytrading/"
# browser.goto "instagram.com/explore/tags/pennystock/"
# browser.goto "instagram.com/explore/tags/korbit/"
# browser.goto "instagram.com/explore/tags/rogerver/"
# browser.goto "instagram.com/explore/tags/hodlgang/"
# browser.goto "instagram.com/explore/tags/XRP/"
# browser.goto "instagram.com/explore/tags/fintech/"
# browser.goto "instagram.com/explore/tags/jpmorgan/"
# browser.goto "instagram.com/explore/tags/banking"
# browser.goto "instagram.com/explore/tags/chasebank"
# browser.goto "instagram.com/explore/tags/federalreserve"
# browser.goto "instagram.com/explore/tags/libertarian"
# browser.goto "instagram.com/explore/tags/ronpaul"
# browser.goto "instagram.com/explore/tags/randpaul"
# browser.goto "instagram.com/explore/tags/peterthiel"
# browser.goto "instagram.com/explore/tags/winklevoss"
# browser.goto "instagram.com/explore/tags/hedgefund"
# browser.goto "instagram.com/explore/tags/mortgage"
# browser.goto "instagram.com/explore/tags/wellsfargo"
# browser.goto "instagram.com/explore/tags/chasebank"
# browser.goto "instagram.com/explore/tags/angelinvesting"
# browser.goto "instagram.com/explore/tags/lamborghini"
# browser.goto "instagram.com/explore/tags/siliconvalley"
# browser.goto "instagram.com/explore/tags/techcrunch"
# browser.goto "instagram.com/explore/tags/techstartup"
# browser.goto "instagram.com/explore/tags/ycombinator"
# browser.goto "instagram.com/explore/tags/500startups"
# browser.goto "instagram.com/explore/tags/techstars"
# browser.goto "instagram.com/explore/tags/incubator"
# browser.goto "instagram.com/explore/tags/farmersandmerchants"
# browser.goto "instagram.com/explore/tags/capitalism"
# browser.goto "instagram.com/explore/tags/banking"
# browser.goto "instagram.com/explore/tags/financialcrisis"
# browser.goto "instagram.com/explore/tags/occupywallstreet"
# browser.goto "instagram.com/explore/tags/russellbrand"
# browser.goto "instagram.com/explore/tags/joerogan"
# browser.goto "instagram.com/explore/tags/economics"
# browser.goto "instagram.com/explore/tags/fundraising"
# browser.goto "instagram.com/explore/tags/kickstarter"
# browser.goto "instagram.com/explore/tags/indiegogo"
# browser.goto "instagram.com/explore/tags/debt"
# browser.goto "instagram.com/explore/tags/profit"
# browser.goto "instagram.com/explore/tags/investmentbanker/"
# browser.goto "instagram.com/explore/tags/ibanker/"
# browser.goto "instagram.com/explore/tags/bloomberg/"
sleep(3)
browser.div(:class => '_si7dy').click
sleep(3)
loop do
  # follow
  if browser.button(:class => '_qv64e _iokts _4tgw8 _njrw0').exists?
      sleep(2)
      browser.button(:class => '_qv64e _iokts _4tgw8 _njrw0').click
      ap "Following"
      follow_counter += 1
      ap "# new followed: #{follow_counter}"
      sleep(7)
  elsif browser.button(:class => '_qv64e _jqf0k _4tgw8 _njrw0').exists?
    # browser.button(:class => '_qv64e _jqf0k _4tgw8 _njrw0').click
    # ap "Unfollowing jk"
  end
  sleep(1)

  # like
  if browser.span(:class => "_8scx2 coreSpriteHeartOpen").exists?
    ap "button detected"
    sleep(3)
    # browser.spans(:class => "_8scx2 coreSpriteHeartOpen").click
    browser.spans(:class => "_8scx2 coreSpriteHeartOpen").each { |val|
      puts val
      val.click
      like_counter += 1
    }
    like_counter += 1 
    ap "Photos liked: #{like_counter}"
  else
    ap "We already liked!"
  end

  # next
  browser.send_keys :arrow_right
  sleep(1)  
  break if like_counter >= MAX_LIKES
end


# Continuous loop to break upon reaching the max likes
# loop do
# browser.div(:class => '_1se52').click
# sleep(3)
# browser.a(:class => '_3a693 coreSpriteRightPaginationArrow').click
# browser.button(:class => '_3a693 coreSpriteRightPaginationArrow').click
# sleep(3)
# browser.link(:class => '_3a693 coreSpriteRightPaginationArrow').click
  
# end


# Leave this in to use the REPL at end of program
# Otherwise, take it out and program will just end
# Pry.start(binding)
