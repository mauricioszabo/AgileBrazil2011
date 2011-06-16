describe "Access controller" do
  let(:controller) { Controller.new }
  let(:logged_user) { controller.logged_user }

  it 'should have permission to access the page' do
    required_role = controller.class.authorized_role
    logged_user.roles.should include(required_role)
  end

  it 'should have permission to access the page' do
    logged_user.can_access(controller).should be_true
  end
end


class Controller
  attr_reader :logged_user
  def initialize
    @logged_user = User.new(:admin)
  end

  def self.authorized_role
    :admin
  end
end

class User
  attr_reader :roles
  def initialize(*roles)
    @roles = roles
  end
  
  def can_access(controller)
    @roles.include? controller.class.authorized_role
  end
end
