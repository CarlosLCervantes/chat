module Authentication
  class AuthenticateUser
    prepend SimpleCommand

    def initialize(handle)
      @handle = handle
    end

    def call
      if user = User.find_by(handle: @handle)
        user
      else
        errors.add(:authentication, I18n.t("authenticate_user.failure"))
        nil
      end
    end
  end
end