#!/usr/bin/ruby
# frozen_string_literal: true

require_relative 'lib/console/options.rb'
require_relative 'lib/console/presenter.rb'
require_relative 'lib/console/presenters/default'
require_relative 'lib/parser.rb'
require_relative 'lib/parsers/basic.rb'
require_relative 'lib/reader.rb'
require_relative 'lib/readers/memory.rb'
require_relative 'lib/readers/sequential.rb'

options = LogParser::Console::Options.parse(ARGV)
parser_class = LogParser::Parser.build(options[:parser])
reader_class = LogParser::Reader.build(options[:reader])
presenter_class = LogParser::Console::Presenter.build(options[:style])

ARGV.each do |filename|
  reader = reader_class.new(filename)
  result = parser_class.parse(reader)
  presenter_class.render(filename, result)
end
