platform :ios, '5.0'
pod 'Reachability', '~> 3.1.1'
pod 'DTCoreText', '~> 1.6.11'
pod 'CocoaLumberjack', '~> 1.7.0'
pod 'FXImageView', '~> 1.3.3'

target 'VKFoundationTests' do
  pod 'Specta',      '~> 0.2.1'
  pod 'Expecta',     '~> 0.3.0'   # expecta matchers
  pod 'OCMock',      '~> 2.2.1'   # OCMock
end

# Remove 64-bit build architecture from Pods targets
post_install do |installer|
  installer.project.targets.each do |target|
    target.build_configurations.each do |configuration|
      target.build_settings(configuration.name)['ARCHS'] = '$(ARCHS_STANDARD_32_BIT)'
    end
  end
end
