# frozen_string_literal: true

# Loads all lines into memory
module LogParser
  module Readers
    class Memory
      def initialize(file)
        @file = file
      end

      def open
        File.new(@file).readlines
      end
    end
  end
end
