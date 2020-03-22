# frozen_string_literal: true

require 'digest'

module LogParser
  module Parsers
    class Basic
      def self.parse(reader)
        new(reader).parse
      end

      def initialize(reader)
        @reader = reader
        reset
      end

      def parse
        reset

        @reader.open.each do |line|
          process_line(line) unless clean_line(line).empty?
        end

        @result
      end

      private

        def reset
          @result = {}
          @unique_requests = {}
        end

        def process_line(line)
          line = clean_line(line)
          page_path = page_path(line)

          @result[page_path] ||= {}

          @result[page_path][:all] ||= 0
          @result[page_path][:all] += 1

          line_hash = line_hash(line)
          return if @unique_requests[line_hash]

          @unique_requests[line_hash] = 1
          @result[page_path][:unique] ||= 0
          @result[page_path][:unique] += 1
        end

        def line_hash(line)
          ::Digest::MD5.hexdigest(line)
        end

        def clean_line(line)
          line.strip.chomp
        end

        def page_path(line)
          line.split.first
        end
    end
  end
end
