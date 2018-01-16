require 'watir' # Crawler
require 'pry' # Ruby REPL
require 'rb-readline' # Ruby IRB
require 'awesome_print' # Console output
require_relative 'credentials' # Pulls in login credentials from credentials.rb

username = $username
password = $password
users = ["cryptonary", "lordsofcrypto", "bitcoin.millions", "crypto.king", "cryptobuzz", "thecryptograph", "bitcointre", "litecoinofficial", "ethereum_updates", "cuebanks", "amannatt", "ripple_update", "profxtrader", "acuskelly", "nyse", "cnbc", "wsj", "techcrunch", "cnnmoney", "forbes", "theeconomist", "bloomberg", "financialtimes", "thenextweb", "producthunt", "bitcoin.info", "cointelegraph", "wired", "verge", "digitaltrends", "gizmodo", "engadget", "coindesknews", "recode", "marketwatch", "ethereumtony", "crypt0snews", "cryptohumor", "bitcoinprice", "bitcoincenternyc", "bitcoinsberlin", "bitcoindoc", "elonmusk", "timferriss", "garyvee", "zuck", "tonyrobbins", "daveramsey", "clevergirlfinance", "thewealthdesigner", "budgetbytes", "stefanieoconnell", "thefinancebar", "wisewomanwallet", "carefulcents", "thepennieswesaved", "gocurrycracker", "thefinancialdiet", "entrepreneur", "richardbranson", "thebriantracy", "thezigziglar", "mcuban", "lewishowes", "marieforleo", "lawofambition", "gerardadams", "berniesanders", "andyfrisella", "brenebrown", "peterjvoogd", "kevinrose", "gabbybernstein", "alexisohanian", "arvinsworld", "calebmaddix", "sarablakely", "paypal", "ebay", "amazon", "bloombergtv", "ted", "incmagazine", "apple", "square", "thisisbillgates", "teslamotors", "cnn", "money", "bitcoin", "worldstar", "spacex", "futurism", "cnet", "google", "facebook", "unitednations", "fastcompany", "mashable", "ibm", "github", "codeorg", "oculus", "time", "twitch", "android", "nytimes", "jeffbezos", "500startups", "madewithcode", "ieeecomsoc", "lifeatca", "csanz", "technologymogul", "morispasic", "vagaphile", "jeresig", "codinghorror", "paul_irish", "spolsky", "triketora", "rasmus", "retomeier", "malwareunicorn", "ashedryden", "lara_hogan", "dantwohundred", "saronyitbarek", "bendhalpern", "kwuchu", "pamasaur", "engineering_made_easy", "technologyreview", "technologyspot", "insiderscience", "engineering_memes", "mechanical_engineer357", "softwareengineer", "programmers_spot", "programmerrepublic", "engineering_funny", "engineering360", "ge_renewableenergy", "marscuriosity", "generalelectric", "amnh", "darpa"]
follow_counter = 0
unfollow_counter = 0
MAX_UNFOLLOWS = 200
start_time = Time.now

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
puts "We're in #hackerman"

# Continuous loop to run until you've unfollowed the max people for the day
loop do
  users.each { |val|
    # Navigate to user's page
    browser.goto "instagram.com/#{val}/"

    # If not following then follow
    if browser.button(:class => '_qv64e _gexxb _r9b8f _njrw0').exists?
      ap "Following #{val}"
      browser.button(:class => '_qv64e _gexxb _r9b8f _njrw0').click
      follow_counter += 1

    elsif browser.button(:class => '_qv64e _t78yp _r9b8f _njrw0').exists?
      ap "Unfollowing #{val}"
      browser.button(:class => '_qv64e _t78yp _r9b8f _njrw0').click
      unfollow_counter += 1
    end
    sleep(15) # Sleep half a second to not get tripped up when un/following many users at once
  }
  puts "--------- #{Time.now} ----------"
  break if unfollow_counter >= MAX_UNFOLLOWS
  sleep(3600) # Sleep 1 hour (3600 seconds)
end

ap "Followed #{follow_counter} users and unfollowed #{unfollow_counter} in #{((Time.now - start_time)/60).round(2)} minutes"

# Leave this in to use the REPL at end of program
# Otherwise, take it out and program will just end
Pry.start(binding)

# Top 100 users on Instagram
# users = ['instagram', 'selenagomez', 'arianagrande', 'taylorswift', 'beyonce', 'kimkardashian', 'cristiano', 'kyliejenner', 'justinbieber', 'kendalljenner', 'nickiminaj', 'natgeo', 'neymarjr', 'nike', 'leomessi','khloekardashian', 'mileycyrus', 'katyperry', 'jlo', 'ddlovato', 'kourtneykardash', 'victoriasecret', 'badgalriri', 'fcbarcelona', 'realmadrid', 'theellenshow', 'justintimberlake', 'zendaya' 'caradelevingne', '9gag', 'chrisbrownofficial', 'vindiesel', 'champagnepapi', 'davidbeckham', 'shakira', 'gigihadid', 'emmawatson', 'jamesrodiguez10', 'kingjames', 'garethbale11', 'nikefootball', 'adele', 'zacefron', 'vanessahudgens', 'ladygaga', 'maluma', 'nba', 'nasa', 'rondaldinho', 'luissuarez9', 'zayn', 'shawnmendes', 'adidasfootball', 'brumarquezine', 'hm', 'harrystyles','chanelofficial', 'ayutingting92', 'letthelordbewithyou', 'niallhoran', 'anitta', 'hudabeauty', 'camerondallas', 'adidasoriginals', 'marinaruybarbosa', 'lucyhale', 'karimbenzema', 'princessyahrini', 'zara', 'nickyjampr', 'onedirection', 'andresiniesta8', 'raffinagita1717', 'krisjenner', 'manchesterunited', 'natgeotravel', 'marcelottwelve', 'deepikapadukone', 'snoopdogg', 'davidluiz_4', 'kalbiminrozeti', 'priyankachopra', 'ashleybenson', 'shaym', 'lelepons', 'prillylatuconsina96','louisvuitton','britneyspears', 'sr4official', 'jbalvin', 'laudyacynthiabella', 'ciara', 'stephencurry30', 'instagrambrasil']
