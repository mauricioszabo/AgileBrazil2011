class Theater
  attr_accessor :structure
  attr_accessor :actors_status

  def initialize
    @structure = []
  end

  def present
    if actors_status == :happy
      ret = :satisfied
      def ret.satisfied?; return true; end
    else
      ret = :sad
      def ret.satisfied?; return false; end
    end
    return ret
  end
end

describe Theater do
  let(:theater) { Theater.new }

  before do
    theater.structure << :piano
  end

  it 'should be a success if actors are happy' do
    theater.actors = :happy
    users = theater.present
    users.should be_satisfied
  end
end
