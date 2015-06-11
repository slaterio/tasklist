require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe TasklistsController do

  # This should return the minimal set of attributes required to create a valid
  # Tasklist. As you add validations to Tasklist, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "title" => "MyString", "description" => "My description" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TasklistsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all tasklists as @tasklists" do
      tasklist = Tasklist.create! valid_attributes
      get :index, {}, valid_session
      assigns(:tasklists).should eq([tasklist])
    end
  end

  describe "GET show" do
    it "assigns the requested tasklist as @tasklist" do
      tasklist = Tasklist.create! valid_attributes
      get :show, {:id => tasklist.to_param}, valid_session
      assigns(:tasklist).should eq(tasklist)
    end
  end

  describe "GET new" do
    it "assigns a new tasklist as @tasklist" do
      get :new, {}, valid_session
      assigns(:tasklist).should be_a_new(Tasklist)
    end
  end

  describe "GET edit" do
    it "assigns the requested tasklist as @tasklist" do
      tasklist = Tasklist.create! valid_attributes
      get :edit, {:id => tasklist.to_param}, valid_session
      assigns(:tasklist).should eq(tasklist)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Tasklist" do
        expect {
          post :create, {:tasklist => valid_attributes}, valid_session
        }.to change(Tasklist, :count).by(1)
      end

      it "assigns a newly created tasklist as @tasklist" do
        post :create, {:tasklist => valid_attributes}, valid_session
        assigns(:tasklist).should be_a(Tasklist)
        assigns(:tasklist).should be_persisted
      end

      it "redirects to the created tasklist" do
        post :create, {:tasklist => valid_attributes}, valid_session
        response.should redirect_to(Tasklist.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved tasklist as @tasklist" do
        # Trigger the behavior that occurs when invalid params are submitted
        Tasklist.any_instance.stub(:save).and_return(false)
        post :create, {:tasklist => { "title" => "invalid value" }}, valid_session
        assigns(:tasklist).should be_a_new(Tasklist)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Tasklist.any_instance.stub(:save).and_return(false)
        post :create, {:tasklist => { "title" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested tasklist" do
        tasklist = Tasklist.create! valid_attributes
        # Assuming there are no other tasklists in the database, this
        # specifies that the Tasklist created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Tasklist.any_instance.should_receive(:update).with({ "title" => "MyString" })
        put :update, {:id => tasklist.to_param, :tasklist => { "title" => "MyString" }}, valid_session
      end

      it "assigns the requested tasklist as @tasklist" do
        tasklist = Tasklist.create! valid_attributes
        put :update, {:id => tasklist.to_param, :tasklist => valid_attributes}, valid_session
        assigns(:tasklist).should eq(tasklist)
      end

      it "redirects to the tasklist" do
        tasklist = Tasklist.create! valid_attributes
        put :update, {:id => tasklist.to_param, :tasklist => valid_attributes}, valid_session
        response.should redirect_to(tasklist)
      end
    end

    describe "with invalid params" do
      it "assigns the tasklist as @tasklist" do
        tasklist = Tasklist.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Tasklist.any_instance.stub(:save).and_return(false)
        put :update, {:id => tasklist.to_param, :tasklist => { "title" => "invalid value" }}, valid_session
        assigns(:tasklist).should eq(tasklist)
      end

      it "re-renders the 'edit' template" do
        tasklist = Tasklist.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Tasklist.any_instance.stub(:save).and_return(false)
        put :update, {:id => tasklist.to_param, :tasklist => { "title" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested tasklist" do
      tasklist = Tasklist.create! valid_attributes
      expect {
        delete :destroy, {:id => tasklist.to_param}, valid_session
      }.to change(Tasklist, :count).by(-1)
    end

    it "redirects to the tasklists list" do
      tasklist = Tasklist.create! valid_attributes
      delete :destroy, {:id => tasklist.to_param}, valid_session
      response.should redirect_to(tasklists_url)
    end
  end

end
