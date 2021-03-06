RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model 'MainGuest' do
    object_label_method :full_name
    list do
      field :first_name
      field :last_name
      field :email
      field :invitations
    end
  end

  config.model 'Guest' do
    object_label_method :full_name
  end

  config.model 'Invitation' do
    object_label_method :guest_name
    list do
      field :event
      field :main_guest do
        searchable [:first_name, :last_name]
      end
      field :attendance do
        queryable false
      end
      field :adults
      field :kids
      field :guests do
        searchable [:first_name, :last_name]
      end
    end
  end

  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)
end
