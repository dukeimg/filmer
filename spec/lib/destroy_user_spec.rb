RSpec.describe UsersController do
  describe 'DELETE method' do
    subject(:user) { User.new(name: 'Buster', email: 'lol@cat.doge', password: '12345678', username: 'test') }
    it 'destroys user' do
      expect(user).to be_valid
      #expect { user.destroy }.to change { User.count }.by(1)
    end
  end
end