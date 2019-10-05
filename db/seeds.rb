# User resource
ApiGuardian.configuration.permission_class.destroy_all
ApiGuardian.configuration.permission_class.find_or_create_by!(name: 'user:manage'){|obj| obj.desc = 'Ability to manage user'}
ApiGuardian.configuration.permission_class.find_or_create_by!(name: 'user:read'){|obj| obj.desc ='Ability to access user detail'}
ApiGuardian.configuration.permission_class.find_or_create_by!(name: 'user:update'){|obj| obj.desc ='Ability to update user detail'}
ApiGuardian.configuration.permission_class.find_or_create_by!(name: 'user:create'){|obj| obj.desc ='Ability to create new user'}
ApiGuardian.configuration.permission_class.find_or_create_by!(name: 'user:delete'){|obj| obj.desc = 'Ability to delete user'}

# Role resource
ApiGuardian.configuration.permission_class.find_or_create_by!(name: 'role:manage'){|obj| obj.desc = 'Ability to delete role'}
ApiGuardian.configuration.permission_class.find_or_create_by!(name: 'role:read'){|obj| obj.desc = 'Ability to delete role'}
ApiGuardian.configuration.permission_class.find_or_create_by!(name: 'role:update'){|obj| obj.desc = 'Ability to delete role'}
ApiGuardian.configuration.permission_class.find_or_create_by!(name: 'role:create'){|obj| obj.desc = 'Ability to delete role'}
ApiGuardian.configuration.permission_class.find_or_create_by!(name: 'role:delete'){|obj| obj.desc = 'Ability to delete role'}

# Permission resource
ApiGuardian.configuration.permission_class.find_or_create_by!(name: 'permission:read'){|obj| obj.desc = 'Ability to delete permission'}
ApiGuardian.configuration.permission_class.find_or_create_by!(name: 'permission:manage'){|obj| obj.desc = 'Ability to delete permission'}

# Setting resouce
ApiGuardian.configuration.permission_class.find_or_create_by!(name: 'setting:manage'){|obj| obj.desc = 'Ability to manage setting'}
ApiGuardian.configuration.permission_class.find_or_create_by!(name: 'setting:read'){|obj| obj.desc = 'Ability to read setting'}
ApiGuardian.configuration.permission_class.find_or_create_by!(name: 'setting:update'){|obj| obj.desc = 'Ability to update setting'}
ApiGuardian.configuration.permission_class.find_or_create_by!(name: 'setting:create'){|obj| obj.desc = 'Ability to create setting'}
ApiGuardian.configuration.permission_class.find_or_create_by!(name: 'setting:delete'){|obj| obj.desc = 'Ability to delete setting'}

ApiGuardian.configuration.role_class.destroy_all
admin = ApiGuardian.configuration.role_class.find_or_create_by!(name: 'administrator')
admin.add_permission('user:manage')
admin.add_permission('role:manage')
admin.add_permission('permission:manage')
admin.add_permission('setting:manage')

stuff = ApiGuardian.configuration.role_class.find_or_create_by!(name: 'stuff')
stuff.add_permission('user:read')
stuff.add_permission('user:update')
stuff.add_permission('user:create')
stuff.add_permission('role:read')
stuff.add_permission('role:update')
stuff.add_permission('permission:read')


customer = ApiGuardian.configuration.role_class.find_or_create_by!(name: 'customer', default: true)
customer.add_permission('user:read')
customer.add_permission('user:update')
customer.add_permission('setting:read')
customer.add_permission('setting:update')

ApiGuardian.configuration.user_class.destroy_all
ApiGuardian.configuration.user_class.with_deleted.each{|user| user.really_destroy! }
ApiGuardian.configuration.user_class.find_or_create_by!(email: "admin@#{ENV['DOMAIN_NAME']}") do |user|
  user.name = 'i am admin'
  user.password = 'changeme123'
  user.password_confirmation = 'changeme123'
  user.active = true
  user.role = admin
  user.phone_number = '66874352540'
  user.save
end

AdminUser.create!(email: "superadmin@#{ENV['DOMAIN_NAME']}", password: 'changeme', password_confirmation: 'changeme')
