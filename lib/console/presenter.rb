# frozen_string_literal: true

module LogParser
  module Console
    class Presenter
      def self.build(presenter)
        Object.const_get(
          "LogParser::Console::Presenters::#{presenter.capitalize}"
        )
      end
    end
  end
end
