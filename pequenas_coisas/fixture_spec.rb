class Parser
  def parse(filename)
    csv = CSVSplitter.new(filename).split
    return {
      :name => csv[0][0],
      :age => csv[0][1],
      :maritial => csv[0][2]
    }
  end
end

class CSVSplitter
  def initialize(file)
    @csv = File.read file
  end

  def split
    @csv.split("\n").map { |x| x.split(";") }[1..-1]
  end
end

describe Parser do
  it 'should be able to parse the CSV file' do
    csv_text = File.read('fixture.csv')
    File.should_receive(:read).with("anything").and_return(csv_text)
    csv = subject.parse('anything')
    csv[:name].should match(/Ariovaldo/)
  end

  it 'should be able to parse the CSV file' do
    mock_file_read "anything"
    csv = subject.parse('anything')
    csv[:name].should match(/Ariovaldo/)
  end

  def mock_file_read(filename)
    csv_text = File.read('fixture.csv')
    File.should_receive(:read).with(filename).and_return(csv_text)
  end
end
