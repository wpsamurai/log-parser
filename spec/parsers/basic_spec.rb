RSpec.describe LogParser::Parsers::Basic do
  describe '#parse' do
    subject (:parser) { described_class.new(reader) }
    let(:reader) { LogParser::Readers::Memory.new(filename) }

    context 'when log file is empty' do
      let(:filename) { "#{RSPEC_ROOT}/fixtures/webserver-empty.log" }

      it 'returns empty result' do
        expect(parser.parse).to be_empty
      end
    end

    context 'when log file contains only empty lines' do
      let(:filename) { "#{RSPEC_ROOT}/fixtures/webserver-empty-lines.log" }

      it 'returns empty result' do
        expect(parser.parse).to be_empty
      end
    end

    context 'when log file a mix with empty lines' do
      let(:filename) { "#{RSPEC_ROOT}/fixtures/webserver-mix-empty.log" }

      it 'skips empty lines' do
        result = parser.parse

        expect(result.count).to eq 4
      end
    end

    context 'when there are duplicates' do
      let(:filename) { "#{RSPEC_ROOT}/fixtures/webserver-requests-with-duplicates.log" }

      it 'counts unique entries' do
        result = parser.parse

        expect(result['/contact'][:unique]).to eq 2
      end

      it 'counts all entries' do
        result = parser.parse

        expect(result['/contact'][:all]).to eq 3
      end
    end
  end
end
