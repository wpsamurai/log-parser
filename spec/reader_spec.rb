RSpec.describe LogParser::Reader do
  describe '.build' do
    context 'when the reader class exists' do
      it 'returns reader class with a module' do
        reader_name = :memory

        expect(described_class.build(reader_name).to_s).to eq 'LogParser::Readers::Memory'
      end

      it 'returns reader class with a module for a string' do
        reader_name = 'memory'

        expect(described_class.build(reader_name).to_s).to eq 'LogParser::Readers::Memory'
      end
    end

    context 'when the parser class is missing' do
      it 'raises an exception' do
        reader_name = 'not_existing_reader'

        expect{ described_class.build(reader_name) }.to raise_exception NameError
      end
    end
  end
end
