# frozen_string_literal: true

module LogParser
  module Console
    module Presenters
      class Default
        def self.render(filename, result)
          new(filename, result).render
        end

        def initialize(filename, result)
          @result = result
          @filename = filename
        end

        def render
          puts @filename

          @result.sort_by{ |_k, v| -v[:all] }.each do |page|
            puts "  #{page.first} #{page.last[:all]} views"
          end

          puts
        end
      end
    end
  end
end
