require 'rails_helper'

RSpec.describe "UsersController", type: :request do
  describe "GET #new" do
    before { 
      get new_user_url 
    }
    it "レスポンスコードが200であること" do
      expect(response).to have_http_status(:ok) 
    end
    it "newテンプレートをレンダリングすること" do
      expect(response).to render_template :new 
    end
    it "新しいuserオブジェクトがビューにわたされること" do
      expect(assigns(:user)).to be_a_new User 
    end
  
  end
  describe "POST #create" do
    context "正しいユーザ情報が渡ってきた場合" do
      let(:params) do
        {
          user: {
            name: 'user',
            password: 'password',
            password_confirmation: 'password',

          }
        }
      end
      it "ユーザが一人増えていること" do
        expect { post users_path, params: params }.to change(User, :count).by(1)  
      end
      it "マイページにリダイレクトされること" do
        expect( post users_path, params: params).to redirect_to(mypage_path)
      end
      
    end
    
    
  end
  
end
