Gem::Specification.new do |s|
  s.name        = 'bb-jouer'
  s.version     = '0.0.0'
  s.date        = Time.now.strftime("%Y-%m-%d")
  s.summary     = "Elementary simulated results from a batter in certain limited situations"
  s.description = "Run 'jouer' in terminal after installing"
  s.authors     = ["David L Baynes"]
  s.email       = 'dlbaynes@gmail.com'
  s.files       = ["lib/bb_jouer.rb"]
  s.homepage    = 'https://github.com/dbaynes/bb-jouer'
  s.license     = 'MIT'
  s.executables << 'jouer'
end