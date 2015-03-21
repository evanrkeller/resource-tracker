require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do

  context 'when not signed in' do
    context 'GET index' do
      it 'redirects to the sign in path' do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  context 'when signed in' do

    before do
      sign_in FactoryGirl.create(:user)
      stub_request(:get, "https://www.pivotaltracker.com/services/v5/projects").
        with(:headers => {'X-Trackertoken'=>'99999'}).
        to_return(:status => 200, :body => IO.read('./spec/data/projects.json'), :headers => {})
    end

    describe "GET index" do
      it "assigns all projects from Pivotal Tracker as @projects" do
        ClimateControl.modify PIVOTAL_TRACKER_TOKEN: "99999" do
          get :index
          expect(assigns(:projects).first).to be_a(TrackerApi::Resources::Project)
          expect(assigns(:projects).map(&:id)).to eq([1, 25, 24])
        end
      end
    end

  end

end
