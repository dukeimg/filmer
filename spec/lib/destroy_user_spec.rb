RSpec.describe UsersController, type: :controller do
  describe 'destroy' do
    login_user

    it "should have a current_user" do
      # note the fact that you should remove the "validate_session" parameter if this was a scaffold-generated controller
      expect(subject.current_user).to_not eq(nil)
    end

    it 'destroys user' do
      expect(subject.current_user).to be_valid
      id = subject.current_user.id
      expect { Album.find_by_title('album') } != nil
      delete :destroy, { :id => id }
      expect { User.find_by_id(id) } == nil
      expect { Album.find_by_title('album') } == nil
    end
  end
end
