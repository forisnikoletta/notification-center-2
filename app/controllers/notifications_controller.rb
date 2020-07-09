class NotificationsController < ApplicationController
  before_action :set_notification, only: [:show, :edit, :update, :destroy]
  access client: [:show, :index_client], client: {except: [:new, :create, :update, :edit]}, admin: :all

  # GET /notifications
  def index_admin
    @notifications_admin = Notification.all
  end

  def index_client
    @notifications_client = Notification.where(users_id: current_user.id)
  end

  def index
  end

  # GET /notifications/1
  # GET /notifications/1.json
  def show
    if @notification.users_id == current_user.id.to_s
      @notification.update_attributes(:seen => Time.now)
    end
  end

  # GET /notifications/new
  def new
    @notification = Notification.new
  end

  # GET /notifications/1/edit
  def edit
    @notification.update_attributes(:seen => nil)
  end

  # POST /notifications
  # POST /notifications.json
  def create
    @notification = Notification.new(notification_params)

    respond_to do |format|
      if @notification.save
        format.html { redirect_to @notification, notice: 'Notification was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /notifications/1
  # PATCH/PUT /notifications/1.json
  def update
    respond_to do |format|
      if @notification.update(notification_params)
        format.html { redirect_to @notification, notice: 'Notification was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /notifications/1
  # DELETE /notifications/1.json
  def destroy
    @notification.destroy
    respond_to do |format|
      format.html { redirect_to notifications_url, notice: 'Notification was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification
      @notification = Notification.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def notification_params
      params.require(:notification).permit(:title, :body, :users_id)
    end
end
