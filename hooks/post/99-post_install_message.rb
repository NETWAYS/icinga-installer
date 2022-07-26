# Puppet status codes say 0 for unchanged, 2 for changed succesfully
if [0, 2].include? @kafo.exit_code
  success_message

  if module_enabled?('install_web')
    new_install_message(@kafo) 
  end
end
