module MessageHookContextExtension
  def success_message
    say "  <%= color('Success!', :good) %>"
  end

  def new_install_message(kafo)
    say "      Initial credentials are <%= color('#{kafo.param('install_web', 'initial_admin_username').value}', :info) %> / <%= color('#{kafo.param('install_web', 'initial_admin_password').value}', :info) %>"
  end

  def failure_message
    say "\n  <%= color('There were errors detected during install.', :bad) %>"
    say "  Please address the errors and re-run the installer to ensure the system is properly configured."
    say "  Failing to do so is likely to result in broken functionality."
  end

  def log_message(kafo)
    say "\n  The full log is at <%= color('#{kafo.config.log_file}', :info) %>"
  end
end

Kafo::HookContext.send(:include, MessageHookContextExtension)
