# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'CardsExercise' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for CardsExercise
  pod 'SnapKit'
  pod 'Reusable'


  target 'CardsExerciseTests' do
    inherit! :search_paths
    # Pods for testing
    pod 'Quick'
    pod 'Nimble'
    pod 'KIF'
    pod 'KIF-Quick'
    pod 'Nimble-Snapshots'

  end

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '4.0'
    end
  end
end
