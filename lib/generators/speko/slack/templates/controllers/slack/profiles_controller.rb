class Slack::ProfilesController < ApplicationController

  before_action :set_profile, only: [:show, :update, :edit, :destroy]
  before_action :set_profiles, only: [:index]
  before_action :set_new_profile, only: [:new, :create]

  def index
    @slack_profiles = Slack::Profile.all
  end

  def show
  end

  def new
    @slack_profile = Slack::Profile.new
  end

  def edit
  end

  def create
    @slack_profile.assign_attributes(slack_profile_params)
    respond_to do |format|
      if @slack_profile.save
        format.html { redirect_to slack_profile_path(@slack_profile), notice: 'Slack Profile created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @slack_profile.update(slack_profile_params)
        format.html { redirect_to slack_profile_path(@slack_profile), notice: 'Slack Profile updated.' }
        format.json { render :show, status: :ok, location: slack_profile_path(@slack_profile) }
      else
        format.html { render :edit }
        format.json { render json: @slack_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @slack_profile.destroy
    flash.now[:notice] = "#{@slack_profile.name} deleted."
    redirect_to slack_profiles_path
  end

  private

  def slack_profile_params
    params.require(:slack_profile).permit(
      :name,
      :description,
      :encrypted_api_key,
      channel_list: [],
      profile_ids: []
    )
  end

  def set_profile
    @slack_profile = Slack::Profile.find(params[:id])
  end

  def set_new_profile
    @slack_profile = Slack::Profile.new
  end

  def set_profiles
    @slack_profiles = Slack::Profile.all
  end
end
