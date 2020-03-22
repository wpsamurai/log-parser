# frozen_string_literal: true

# Opens file and allow to read lines one by one
module LogParser
  module Readers
    class Sequential
      def initialize(file)
        @file = file
      end

      def open
        File.new(@file)
      end
    end
  end
end
