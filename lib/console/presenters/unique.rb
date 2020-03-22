# frozen_string_literal: true

module LogParser
  module Console
    module Presenters
      class Unique
        def self.render(filename, result)
          new(filename, result).render
        end

        def initialize(filename, result)
          @result = result
          @filename = filename
        end

        def render
          puts @filename

          @result.sort_by{ |_k, v| -v[:unique] }.each do |page|
            puts "  #{page.first} #{page.last[:unique]} unique views"
          end

          puts
        end
      end
    end
  end
end
