platform :ios, '9.0'

def pods
    pod 'ActionSheetPicker-3.0'
    pod 'Alamofire'
    pod 'BRYXBanner'
    pod 'Charts'
    pod 'Firebase/Auth'
    pod 'GoogleSignIn'
    pod 'Material'
    pod 'MBProgressHUD'
    pod 'RxCocoa'
    pod 'RxSwift'
    pod 'SlideMenuControllerSwift'
    pod 'SwiftyJSON'
    pod 'UIColor_Hex_Swift'
    pod 'XLPagerTabStrip'
end

target 'ReceiptBot' do
    use_frameworks!
    pods
end

target 'ReceiptBotTests' do
    use_frameworks!
    pods
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end
