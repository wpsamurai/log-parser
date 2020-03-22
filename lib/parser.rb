# frozen_string_literal: true

module LogParser
  class Parser
    def self.build(parser)
      Object.const_get(
        "LogParser::Parsers::#{parser.capitalize}"
      )
    end
  end
end
