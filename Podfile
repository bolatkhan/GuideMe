# Uncomment the next line to define a global platform for your project
platform :ios, '9.1 '

target 'AT' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
   # Pods for AT
   pod 'AKSideMenu', '~> 1.3.1'
   pod 'EasyPeasy'
   pod 'ChameleonFramework/Swift', :git => 'https://github.com/ViccAlexander/Chameleon.git'
   pod 'Typist'
   pod 'DeviceKit', '~> 1.0'
   pod 'LBTAComponents'
   pod 'TRON', '~> 2.0.0'
   pod 'Device', '~> 3.0.1'
   pod 'Reusable'
 
   
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end
