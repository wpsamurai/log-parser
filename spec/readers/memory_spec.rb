RSpec.describe LogParser::Readers::Memory do
  describe '#open' do
    context 'when file exists' do
      it 'allows to read lines using each' do
        filename = "#{RSPEC_ROOT}/fixtures/webserver-4-different-requests.log"

        reader = described_class.new(filename)

        expect(reader.open).to respond_to(:each)
      end

      it 'loads all elements to array' do
        filename = "#{RSPEC_ROOT}/fixtures/webserver-4-different-requests.log"

        reader = described_class.new(filename)

        expect(reader.open.count).to eq 4
      end
    end

    context 'when file does not exist' do
      it 'raises no such file or directory exception' do
        filename = 'not_existing_file'

        reader = described_class.new(filename)

        expect{ reader.open }.to raise_exception Errno::ENOENT
      end
    end
  end
end
