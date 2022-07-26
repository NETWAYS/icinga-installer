module MessageHookContextExtension
  def success_message
    say "  <%= color('Success!', :good) %>"
  end

  def new_install_message(kafo)
    say "      Initial credentials are <%= color('#{kafo.param('install_web', 'initial_admin_username').value}', :info) %> / <%= color('#{kafo.param('install_web', 'initial_admin_password').value}', :info) %>"
  end
end

Kafo::HookContext.send(:include, MessageHookContextExtension)
