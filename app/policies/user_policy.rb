class UserPolicy < ApiGuardian::Policies::UserPolicy
  def delete
    user.can?(['user:delete', 'user:manage'])
  end

  def destroy
    user.can?(['user:delete', 'user:manage'])
  end

  def destroy_user_car
    user.can?(['user:delete', 'user:manage']) || record.id == user.id
  end
end