# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

flutter_application_path = 'FlutterModule/flutter_playground'
load File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')


target 'HybridDemo' do
  install_all_flutter_pods(flutter_application_path)
  use_frameworks!

  # Pods for HybridDemo
  post_install do |installer|
    flutter_post_install(installer) if defined?(flutter_post_install)
  end

end
