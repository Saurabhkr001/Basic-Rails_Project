ActiveAdmin.register User do
  # Update these based on what columns exist in your users table
  # (Common columns are: email, name, role, password, etc.)
  permit_params :email, :name, :role, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column :name
    # column :role
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :name
  # filter :role
  filter :current_sign_in_at

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :name
      # f.input :role
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
