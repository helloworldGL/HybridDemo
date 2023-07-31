install! 'cocoapods',
  :warn_for_unused_master_specs_repo => false

platform :ios,'11.0'

flutter_application_path = '../mix_flutter'
load File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')

def shared_pods
    ui_pods
    rx_pods
    networking_pods
    etc_pods
end

def ui_pods
  pod 'SnapKit', '~> 4.0.0'
  pod 'MBProgressHUD'
  pod "SVProgressHUD"

  pod 'IQKeyboardManagerSwift', '~> 6.0'
  pod 'DZNEmptyDataSet'
#  pod 'UITextView+Placeholder'
#  pod 'SDWebImage'
#  pod 'SDWebImage', '~> 5.13.2'

#  pod 'SDWebImage/GIF'

end

def rx_pods
    pod 'RxSwift' , '~> 5.1'
    pod 'RxDataSources', '~> 4.0'
    pod 'RxGesture', '~> 3.0'
    
end

def networking_pods
  
  pod 'Alamofire'
  pod 'Moya/RxSwift', '~> 14'
  #轻量级的图片下载缓存的库
  pod 'Kingfisher', '~> 5.0'
  #    Tiercel 是一个简单易用、功能丰富的纯 Swift 下载框架，支持原生级别后台下载，拥有强大的任务管理功能，可以满足下载类 APP 的大部分需求
  pod 'Tiercel', '~> 3'
  #阿里云
#  pod 'AliyunOSSiOS', '~> 2.10.0'
#  pod 'AWSS3'
  # other pods . . .
#  pod 'AWSMobileClient'

end

def etc_pods
  pod 'ObjectMapper', '3.3.0'
  pod 'R.swift', '~> 5.0'
  pod "Deviice"
  pod 'CryptoSwift', '~> 1.3.1'
  pod 'HandyJSON'
  pod 'SwiftyJSON'

end


target 'SwiftProjectDemo' do

  pod 'Masonry'
  pod 'GKNavigationBar'
  use_frameworks!
  inhibit_all_warnings!#消除警告
  shared_pods
  install_all_flutter_pods(flutter_application_path)

end

post_install do |installer|
    flutter_post_install(installer) if defined?(flutter_post_install)
end
