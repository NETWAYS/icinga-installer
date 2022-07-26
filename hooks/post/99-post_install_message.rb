# Puppet status codes say 0 for unchanged, 2 for changed succesfully
if [0, 2].include? @kafo.exit_code
  success_message

  if module_enabled?('install_web')
    new_install_message(@kafo) if new_install?
  end

  File.write(success_file, '') if !app_value(:noop) && new_install?
else
  failure_message
end

log_message(@kafo)
