module ApiGuardian
  module Policies
    class UserPolicy < ApplicationPolicy
      def index?
        user.can?(['user:manage'])
      end

      def setting?
        user.can?(['setting:manage']) || record.id == user.id
      end

      def add_phone?
        true
      end

      def verify_phone?
        add_phone?
      end

      def expire_token?
        record.id == user.id
      end

      def verify_otp?
        true
      end
    end
  end
end
