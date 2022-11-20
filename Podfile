platform :ios, '13.0'

flutter_application_path = '../FlutterModule/flutter_playground'
load File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')

use_frameworks!

target 'HybridDemo' do
  install_all_flutter_pods(flutter_application_path)

  # Pods for HybridDemo
  
  
  post_install do |installer|
    flutter_post_install(installer) if defined?(flutter_post_install)
  end

end
