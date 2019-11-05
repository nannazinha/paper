RailsAdmin.config do |config|

  #Title in Dashboard
  config.main_app_name = ['Papero', '']

  # #Sidebar links
  # config.navigation_static_links = {'nome do site' => 'http://enddosite'}
  # config.navigation_static_label = 'links uteis'

  config.model Unit do
    navigation_icon 'fas fa-hotel'
  end

  config.model User do
    navigation_icon 'fas fa-users'
  end

  config.model Contract do
    navigation_icon 'fas fa-file-contract'
  end

  config.model Invoice do
    navigation_icon 'fas fa-file-invoice-dollar'
  end

  config.model Service do
    navigation_icon 'fas fa-concierge-bell'
  end

  ### Popular gems integration

  # == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :admin
  end
  config.current_user_method(&:current_admin)

  ## == CancanCan ==
  # config.authorize_with :cancancan

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


end
