RSpec.describe LogParser::Console::Presenter do
  describe '.build' do
    context 'when the presenter class exists' do
      it 'returns presenter class with a module' do
        presenter_name = :default

        expect(described_class.build(presenter_name).to_s).to eq 'LogParser::Console::Presenters::Default'
      end

      it 'returns reader class with a module for a string' do
        presenter_name = 'default'

        expect(described_class.build(presenter_name).to_s).to eq 'LogParser::Console::Presenters::Default'
      end
    end

    context 'when the parser class is missing' do
      it 'raises an exception' do
        presenter_name = 'not_existing_presenter'

        expect{ described_class.build(presenter_name) }.to raise_exception NameError
      end
    end
  end
end
