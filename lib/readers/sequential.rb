# frozen_string_literal: true

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
