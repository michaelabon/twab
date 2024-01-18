# frozen_string_literal: true

def find_twab
  url = 'https://www.bungie.net/en/Rss/NewsByCategory'

  f = SimpleRSS.parse(URI.open(url))

  first_twab = f.entries.find { |e| e.title.match(/This Week (?:At Bungie|In Destiny)/i) }

  raise NoTwabFoundError unless first_twab

  redirect_url = URI.parse(first_twab.link)

  fix_relative_url redirect_url
end

def fix_relative_url(url)
  return url unless url.relative?

  URI::HTTPS.build(host: 'www.bungie.net', path: url.path)
end

class NoTwabFoundError < StandardError
  def initialize(msg = 'No TWAB found')
    super(msg)
  end
end
