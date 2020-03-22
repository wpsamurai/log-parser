# frozen_string_literal: true

module LogParser
  class Reader
    def self.build(reader)
      Object.const_get(
        "LogParser::Readers::#{reader.capitalize}"
      )
    end
  end
end
