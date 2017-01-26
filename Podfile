# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

target 'AT' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  pod 'AKSideMenu', '~> 1.3.1'
  # Pods for AT

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end
