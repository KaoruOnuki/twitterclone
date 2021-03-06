class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_action :your_contact, only: [:index, :new, :edit, :show]
  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.all
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)
    @contact.user_id = current_user.id
    if @contact.name.empty?
      @contact.name = current_user.name
    end

    if @contact.email.empty?
      @contact.email = current_user.email
    end

    respond_to do |format|
      if @contact.save
        ContactMailer.contact_mail(@contact).deliver
        format.html { redirect_to @contact, notice: 'お問い合わせを送信しました' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    @contact.user_id = current_user.id
    respond_to do |format|
      if @contact.update(contact_params)
        ContactMailer.contact_mail(@contact).deliver
        format.html { redirect_to @contact, notice: 'お問い合わせを再送信しました' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: '削除しました' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:name, :email, :content)
    end

    def your_contact
      unless logged_in?
        redirect_to new_session_path
      end
    end
end
