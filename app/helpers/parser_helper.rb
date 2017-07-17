require 'CSV'

module ParserHelper
  def self.parse(filename)
    deck_name = File.basename(filename, ".*").gsub(/[_]/, ' ')
    deck = Deck.create(name: deck_name)

    CSV.foreach(filename, headers: true, header_converters: :symbol) do |row|
      deck.cards.create({question: row[:question],
                         answer: row[:answer]
                        })
    end
  end
end
