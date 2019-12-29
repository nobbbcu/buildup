require 'rails_helper'

describe TweetsController do
  let(:user) { create(:user) }
  let(:tweet) { create(:tweet) }

  describe '#new' do
    context 'log in' do
      before do
        login user
        get :new
      end

      it "@tweetがTweetクラスのインスタンスかつ未保存かどうか" do
        expect(assigns(:tweet)).to be_a_new(Tweet)
      end

      it "newビューが表示されるか" do
        expect(response).to render_template :new
      end
    end

    context 'not log in' do
      it 'ログインページにリダイレクトさせるか' do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe '#edit' do
    context 'log in' do
      before do
        login user
        get :edit, params: { id: tweet }
      end

      it "editアクションに正しい@tweetが渡されているか" do
        expect(assigns(:tweet)).to eq tweet
      end

      it "editビューが表示されるか" do
        expect(response).to render_template :edit
      end
    end

    context 'not log in' do
      it 'ログインページにリダイレクトさせるか' do
        get :edit, params: { id: tweet }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end


  describe '#index' do
    before do
      get :index
    end

    it "日付順に並べられたtweetの配列が正しく渡されるか" do
      tweets = create_list(:tweet, 3) 
      expect(assigns(:tweets)).to match(tweets.sort{ |a, b| b.created_at <=> a.created_at } )
    end

    it "indexビューが表示されるか" do
      expect(response).to render_template :index
    end
  end

  describe '#create' do
    let(:params) { {user_id: user.id, tweet: attributes_for(:tweet) } }

    context 'log in' do
      before do
        login user
      end

      context 'can save' do
        subject {
          post :create,
          params: params
        }
        it 'Tweetモデルのレコードが1増えるか' do
          expect{ subject }.to change(Tweet, :count).by(1)
        end

        it 'indexビューにリダイレクトされるか' do
          subject
          expect(response).to redirect_to(root_path)
        end
      end

      context 'can not save' do
        let(:invalid_params) { { user_id: user.id, tweet: attributes_for(:tweet, content: nil) } }
 
        subject {
          post :create,
          params: invalid_params
        }
     
        it 'Tweetモデルのレコードが増えないか' do
            expect{ subject }.not_to change(Tweet, :count)
        end
        it 'newページをrenderさせるか' do
          subject
          expect(response).to render_template :new
        end
      end
    end

    context 'not log in' do
      it 'ログインページにリダイレクトさせるか' do
        post :create, params: params
        expect(response).to redirect_to(new_user_session_path)
      end
    end

  end
end