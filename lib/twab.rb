def find_twab
  url = 'https://www.bungie.net/en/Rss/NewsByCategory'

  f = SimpleRSS.parse(URI.open(url))

  first_twab = f.entries.find { |e| e.title.match(/This Week At Bungie/i) }

  if !first_twab
    raise NoTwabFoundError.new
  end

  return first_twab.link
end

class NoTwabFoundError < StandardError
  def initialize(msg="No TWAB found")
    super(msg)
  end
end
