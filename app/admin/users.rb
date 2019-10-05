ActiveAdmin.register User do
  # active_admin_paranoia

  menu priority: 3

  permit_params :name,
                :email,
                :address,
                :role_id,
                :password,
                :password_confirmation,
                :phone_number,
                :line_id,
                :document_address,
                :active,
                :otp_method,
                :otp_enabled,
                setting_attributes: [:notification, :language, :mid],
                user_cars_attributes: [:id, :car_model_id, :license_plate, :body_number]

  index do
    selectable_column
    id_column
    column :code
    column :name
    column :email
    column :phone_number
    column :line_id
    column :active
    column :otp_method
    column :current_sign_in_at
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :code
      row :email
      row :name
      row :phone_number
      row :line_id
      row :otp_method
      row :otp_enabled
      row :active
      row :role
      row :address
      row :document_address
      attributes_table_for user.setting do
        row :notification
        row :language
        row :mid
      end
      table_for user.user_cars do
        column "User's cars" do |user_car|
          table_for user_car do
            column('Model'){|user_car| user_car.car_model}
            column('Plate no'){|user_car| "#{user_car.license_alphabet_group} #{user_car.license_number_group} #{user_car.license_province}"}
            column('Body no'){|user_car| user_car.body_number}
            column('Add car at'){|user_car| user_car.created_at}
            column do
              link_to 'View', [ :admin, user_car ]
            end
            column do
              link_to 'Edit', [ :edit, :admin, user_car ]
            end
            column  do
              link_to 'Delete', [:admin, user_car], method: :delete, data: { confirm: 'Are you sure to delete user\'s car' }
            end
          end
        end
      end
    end
  end

  filter :name
  filter :email
  filter :phone_number
  filter :active
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :name
      f.input :phone_number
      f.input :line_id
      f.input :otp_method
      f.input :otp_enabled
      f.input :active
      f.input :role
      f.input :address
      f.input :document_address
      f.input :password
      f.input :password_confirmation

      f.semantic_fields_for :setting do |t|
        t.input :notification
        t.input :language, as: :select, collection: [:en, :th], include_blank: false
      end

      f.has_many :user_cars do |uc|
        uc.input :car_model, as: :select, include_blank: false
        uc.input :license_plate
        uc.input :body_number
      end
    end
    f.actions
  end

  controller do
    def destroy
      super
      User.only_deleted.find(params[:id]).really_destroy!
    end
  end

end
