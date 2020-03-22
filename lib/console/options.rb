# frozen_string_literal: true

require 'optparse'

module LogParser
  module Console
    class Options
      DEFAULT_OPTIONS = {
        parser: :basic,
        reader: :memory,
        style: :default
      }

      def self.parse(args)
        options = DEFAULT_OPTIONS

        parser = OptionParser.new do |opts|
          opts.banner = "Usage: log_parser.rb [options] file"

          opts.on(
            '-pPARSER',
            '--parser=PARSER',
            "Select parser (default: #{DEFAULT_OPTIONS[:parser]})"
          ) do |p|
            options[:parser] = p
          end

          opts.on(
            '-rREADER',
            '--reader=READER',
            "Select reader (default: #{DEFAULT_OPTIONS[:reader]})"
          ) do |r|
            options[:reader] = r
          end

          opts.on(
            '-sSTYLE',
            '--style=STYLE',
            "Select output style (default: #{DEFAULT_OPTIONS[:style]})"
          ) do |s|
            options[:style] = s
          end

          opts.on('-h', '--help', 'Displays help') do
            puts opts
            exit
          end
        end

        parser.parse!(args)

        options.transform_values(&:to_sym)
      end
    end
  end
end
