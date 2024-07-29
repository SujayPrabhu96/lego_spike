namespace :lego do
  namespace :views do
    desc "Override views from specified engines"
    task :override, [:engine_name, :view_paths] => :environment do |t, args|
      engine_name = args[:engine_name]
      view_paths = args[:view_paths]

      if engine_name.nil? || view_paths.nil?
        puts "Usage: rake lego:views:override[engine_name,view_paths]"
        puts "Example: rake lego:views:override\[orders,'purchase_orders/show'\]"
        exit
      end

      puts "ENGINE NAME: #{engine_name}"
      puts "VIEW PATHS: #{view_paths}"

      engine_views_directory = Rails.root.join('packages', engine_name, 'app', 'views', engine_name)
      main_app_views_directory = Rails.root.join('app', 'views', engine_name)
      
      view_paths.split.each do |view_path|
        view_path += ".html.erb" unless view_path.end_with?(".html.erb")

        engine_view_path = engine_views_directory.join(view_path)
        target_path = main_app_views_directory.join(view_path)

        if File.exist?(engine_view_path)
          # Create the directories if they don't exist
          FileUtils.mkdir_p(File.dirname(target_path))

          # Copy the view file to the main app's views directory
          FileUtils.cp(engine_view_path, target_path)

          puts "Copied #{engine_view_path} to #{target_path}"
        else
          puts "View file #{engine_view_path} does not exist."
        end
      end
    end
  end
end
