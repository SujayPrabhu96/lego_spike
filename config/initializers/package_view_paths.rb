package_dirs = Dir[Rails.root.join('packages', '*')]

package_dirs.each do |package_dir|
  shared_path = Rails.root.join(package_dir, 'shared')
  if Dir.exist?(shared_path)
    Rails.application.config.paths['app/views'].unshift(shared_path)
  end
end