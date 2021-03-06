# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  skip_before_action :verify_authenticity_token, only: [:update_current_or_guest_user]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  def edit
    render layout: 'profile'
    #super
  end

  # PUT /resource
  def update
    super
    if resource.address.nil?
      address = Address.new(address_params.merge(user_id: resource.id))
      address.save
    else
      resource.address.update(address_params)
    end
  end

  def update_current_or_guest_user
    current_or_guest_user.update(user_params)
    current_or_guest_user.address.update(address_params)
    head :ok
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected
    def address_params
      params.require(:address).permit(:street,:number, :colony, :postal_code,
                                                    :city, :state
                                          )
    end

    def demo_images_params
      params.require(:user).permit(demo_images: [])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :phone, :email, :password, :password_confirmation, :current_password, :avatar)
    end
    # If you have extra params to permit, append them to the sanitizer.
    # def configure_sign_up_params
    #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
    # end

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_account_update_params
    #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
    # end

    # The path used after sign up.
    def after_sign_up_path_for(resource)
      if params[:new_partner]
        resource.update(demo_images_params.merge(role: "applicant"))
        statics_suscription_path
      else
        super(resource)
      end
    end

    # The path used after sign up for inactive accounts.
    def after_inactive_sign_up_path_for(resource)
      super(resource)
    end

    def after_update_path_for(resource)
      case resource
      when :user, User
        resource.store.present? ? profile_show_path : root_path
      else
        super
      end
    end
end
