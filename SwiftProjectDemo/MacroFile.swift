//
//  File.swift
//  GoToSchool-Student
//
//  Created by Improve on 2018/3/30.
//  Copyright © 2018年 Improve. All rights reserved.
//

import UIKit

// Appdelegate
let AppdelegateMacro:AppDelegate = UIApplication.shared.delegate as! AppDelegate

//项目路径
let BaseServerURL:String = "https://files.tyb001.com/"

    
public let loginType = "kg_ios"

//屏幕尺寸
let kScreenWidth = UIScreen.main.bounds.size.width
let kScreenHeight = UIScreen.main.bounds.size.height

//当前时间 年- 月- 日

//设置基础颜色
/*
 
 fe7a97   粉色
 f97d50  橙色
 ffc050   黄色
 c3d63d  绿色
 3acdef   蓝色
 ffdcd2   浅橙色
 
 《托优宝小程序规范》
 圆角：16
 边距：16
 块距：20
 一级标题：40、苹方、加粗、居中，上下各留
 二级标题：32、苹方、加粗、居左，上下各留30
 三级标题：28、苹方、不加粗、居中，上下各留
 分隔线：灰色，f3f3f3
 头像：166*166
 优托卡片：450*780，圆角24
 我的卡片：385高，通栏
 
 
 */

let gl_textColor = HEXColor(clolrString: "333333")
let gl_second_Color = HEXColor(clolrString: "666666")
let gl_third_Color = HEXColor(clolrString: "999999")
let gl_line_Color = HEXColor(clolrString: "DDDDDD")

let gl_blueColor = HEXColor(clolrString: "3acdef")
let gl_redColor = HEXColor(clolrString: "f97d50")
let gl_budgeRed_Color = HEXColor(clolrString: "F75050")
let gl_deepRed_Color = HEXColor(clolrString: "EA5427")
let gl_green_Color = HEXColor(clolrString: "c3d63d")

let start_Color = HEXColor(clolrString: "F97D50")
let end_Color = HEXColor(clolrString: "#FFF6F3")




// 注意，由于整个app 始终是横屏展示， 宽高是与竖向时 交换的
// 屏幕的物理高度
let kTopPadding : CGFloat = isIPhoneXType() ? 44 : 0
let kBottomPadding : CGFloat = isIPhoneXType() ? 34 : 0

// MARK: -------- 宽高比 -----------
let horizontalRate = kScreenWidth/375
let verticalrate =  kScreenHeight/666

let urlImageString = "http://b.hiphotos.baidu.com/image/pic/item/14ce36d3d539b600b36afca3e550352ac65cb77a.jpg"

// iPhone X
func isIPhoneXType() -> Bool {
    guard #available(iOS 11.0, *) else {
        return false
    }
    return UIApplication.shared.windows.first?.safeAreaInsets.bottom != 0
}

///安全区域
var safeAreaEdgeInsets: UIEdgeInsets {
    if #available(iOS 11.0, *) {
        return (UIApplication.shared.delegate as? AppDelegate)?.window?.safeAreaInsets ?? UIEdgeInsets.zero
    }else {
        return UIEdgeInsets.zero
    }
}
//获取当前控制器
func CurrentVC() ->UIViewController? {
    
    var vc = UIApplication.shared.keyWindow?.rootViewController
    if ((vc?.isKind(of: UITabBarController.self)) != nil) {
        vc = (vc as! UITabBarController).selectedViewController
    }else if ((vc?.isKind(of: UINavigationController.self)) != nil) {
        vc = (vc as! UINavigationController).visibleViewController
    }else if ((vc?.isKind(of: UITabBarController.self)) != nil) {
        vc = vc?.presentedViewController
    }
    return vc
}

func afterDecimals(value: Int) -> String {
     let intVal  = value / 10000
     let doubleVal = value % 10000
     let suffixValue = doubleVal / 1000
     let newValue = "\(intVal)" + "." + "\(suffixValue)" + "w"
     return newValue
}

/**
     获取日期信息
     - parameter i: 传参为今天开始的第几天 今天为0， 明天为1， -1则代表昨天 以此类推
     - return    时间信息
 */
func getDateInfo(i: Int) -> (yearStr: String, monthStr: String, dayStr: String) {
    
    //获取当前时间
    let cuurentDate = Date.init()
    //对自己需要的时间进行处理
    let needTime: TimeInterval = TimeInterval(i * (24*60*60))
    let needDate = cuurentDate.addingTimeInterval(needTime)
    
    //格式化
    let yearFormatter = DateFormatter()
    yearFormatter.dateFormat = "yyyy"
    let monthFormatter = DateFormatter()
    monthFormatter.dateFormat = "MM"
    let dayFormatter = DateFormatter()
    dayFormatter.dateFormat = "dd"
    
    let year = yearFormatter.string(from: needDate)
    let month = monthFormatter.string(from: needDate)
    let day = dayFormatter.string(from: needDate)
    return (year, month, day)
}

// - 根据后台时间戳返回几分钟前，几小时前，几天前
func updateTimeToCurrennTime(timeStamp: Double) -> String {
    //获取当前的时间戳
    let currentTime = Date().timeIntervalSince1970
    //时间戳为毫秒级要 ／ 1000， 秒就不用除1000，参数带没带000
    let timeSta: TimeInterval = TimeInterval(timeStamp / 1000)
    //时间差
    let reduceTime: TimeInterval = currentTime - timeSta
    //时间差小于60秒
    if reduceTime < 60 {
        return "刚刚"
    }
    //时间差大于一分钟小于60分钟内
    let mins = Int(reduceTime / 60)
    if mins < 60 {
        return "\(mins)分钟前"
    }
    let hours = Int(reduceTime / 3600)
    if hours < 24 {
        return "\(hours)小时前"
    }
    let days = Int(reduceTime / 3600 / 24)
    if days < 30 {
        return "\(days)天前"
    }
    //不满足上述条件---或者是未来日期-----直接返回日期
    let date = NSDate(timeIntervalSince1970: timeSta)
    let dfmatter = DateFormatter()
    //yyyy-MM-dd HH:mm:ss
    dfmatter.dateFormat="yyyy年MM月"
    return dfmatter.string(from: date as Date)
}

// 尺寸比例
func kCurrentScale(_ a:CGFloat) -> CGFloat {
    var floatValue:CGFloat = kScreenWidth / 375 * a
    floatValue = CGFloat(Int(floatValue))//10.0
    return floatValue
}

//图片
func kImage(_ imageName: String) -> UIImage? {
    if imageName.isEmpty {
        return nil
    }
    let img = UIImage(named: imageName)
    if img?.size.width == 0 || img?.size.height == 0 {
        return nil
    }
    return img
}


//时间格式
func ktime(_ timeFormtter:String,time:String) -> NSDate {
    //创建一个DateFormatter来作为转换的桥梁
    let dateFormatter = DateFormatter()
    //设置转换格式
    dateFormatter.dateFormat = timeFormtter
    //按照转换格式设置时间（月份缩写 日期 年 时区代码（GMT指格林威治时间，相当于零时区））
    let str = time
    if str == "" {
        return NSDate()
    }
    //进行转换
    let newDate = dateFormatter.date(from: str)
    
    if newDate == nil {
        return NSDate()
    }
    return newDate! as NSDate
    
}

///
/// - Parameters:
///   - time: 时间戳（单位：s）
///   - format: 转换手的字符串格式
/// - Returns: 转换后得到的字符串
public func formatTimeStamp(time:Int ,format:String) -> String {
    let timeInterval = TimeInterval(time)
    let date = Date.init(timeIntervalSince1970: timeInterval)
    let dateFormatte = DateFormatter()
    dateFormatte.dateFormat = format
    return dateFormatte.string(from: date)
}

func dateConvertString(date:Date) -> String {
    
    let timeZone = TimeZone.init(identifier: "UTC")
    let formatter = DateFormatter()
    formatter.timeZone = timeZone
    formatter.locale = Locale.init(identifier: "zh_CN")
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    
    let date = formatter.string(from: date)
//    date.components(separatedBy: " ").first!
    return date
}

//日期 -> 字符串
func date2String(_ date:Date, dateFormat:String = "yyyy-MM-dd HH:mm:ss") -> String {
    let formatter = DateFormatter()
    formatter.locale = Locale.init(identifier: "zh_CN")
    formatter.dateFormat = dateFormat
    let date = formatter.string(from: date)
    return date
}

//给富文本做扩展  --- 字符串扩展
extension String{
/// 富文本设置 字体大小 行间距 字间距
    func attributedString(font: UIFont, textColor: UIColor, lineSpaceing: CGFloat, wordSpaceing: CGFloat) -> NSAttributedString {
        
        let style = NSMutableParagraphStyle()
        style.lineSpacing = lineSpaceing
        let attributes = [
                NSAttributedString.Key.font             : font,
                NSAttributedString.Key.foregroundColor  : textColor,
                NSAttributedString.Key.paragraphStyle   : style,
                NSAttributedString.Key.kern             : wordSpaceing]
            
            as [NSAttributedString.Key : Any]
        let attrStr = NSMutableAttributedString.init(string: self, attributes: attributes)
        
        // 设置某一范围样式
        // attrStr.addAttribute(<#T##name: NSAttributedString.Key##NSAttributedString.Key#>, value: <#T##Any#>, range: <#T##NSRange#>)
        return attrStr
    }
}



//字体
//func kFontSize(_ a:CGFloat) -> CGFloat {
//    return a * kScreenWidth / 375 * 0.9
//}
func RGBAArrayColor(rgbaArray:[CGFloat])-> UIColor{
    let color:UIColor!
    if (rgbaArray.count == 4) {
        color = UIColor.init(red: rgbaArray[0]/255.0, green: rgbaArray[1]/255.0, blue: rgbaArray[2]/255.0, alpha:rgbaArray[3])
    }else{
       color = UIColor.init(red: rgbaArray[0]/255.0, green: rgbaArray[1]/255.0, blue: rgbaArray[2]/255.0, alpha:1)
    }
    return color
}
//16进制颜色 //用数值初始化颜色，便于生成设计图上标明的十六进制颜色
//func HEXColor(valueRGB: UInt,alpha: CGFloat) -> UIColor {
//    return UIColor.init(red: CGFloat((valueRGB & 0xFF0000) >> 16) / 255.0, green: CGFloat((valueRGB & 0x00FF00) >> 8) / 255.0, blue: CGFloat(valueRGB & 0x0000FF) / 255.0, alpha:alpha)
//    //let components = solid.colorHex.hexColorComponents()
//    //self.colorProperty = NodeProperty(provider: SingleValueProvider(Color(r: Double(components.red), g: Double(components.green), b: Double(components.blue), a: 1)))
//}

func HEXColor(clolrString:String) -> UIColor {
    
    if clolrString.contains("#") {
        let color = UIColor.hexStringToUIColor(hex: clolrString)
        return color
    }
    let color = UIColor.hexStringToUIColor(hex: "#" + clolrString)
    return color
}

//尺寸
func gl_font(font:CGFloat) -> UIFont {
    
    return UIFont.systemFont(ofSize: CGFloat(font))
}
func swiftClassFromString(className: String) -> AnyClass! {
    // get the project name
    if  let appName: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as! String? {
        // generate the full name of your class (take a look into your "YourProject-swift.h" file)
        let classStringName = appName + "." + className
        // return the class!
        return NSClassFromString(classStringName)
    }
    return nil;
}

/* 转Json  */
func dataToJson(data:NSData) ->AnyObject? {
    do {
        return try JSONSerialization.jsonObject(with: data as Data, options: .mutableContainers) as AnyObject
    } catch  {
        print(error)
    }
    return nil
}

//数组(里面类型为字典)转字符串
func dicArrayToJson(_ dicArray:[Dictionary<String,String>])->String{
    
    //首先判断能不能转换
    if (!JSONSerialization.isValidJSONObject(dicArray)) {
        print("is not a valid json object")
        return ""
    }
    
    //利用OC的json库转换成OC的NSData，
    //如果设置options为NSJSONWritingOptions.PrettyPrinted，则打印格式更好阅读
    let data : Data! = try? JSONSerialization.data(withJSONObject: dicArray, options: [])
    //NSData转换成NSString打印输出
    let str = NSString(data:data, encoding: String.Encoding.utf8.rawValue)
    //输出json字符串
    return str! as String
}


/// 根据类名创建类
///
/// - Parameter className: 类名
/// - Returns: 任意类
func getClass(className:String) -> AnyClass! {
    guard let namedSpace:String = NSStringFromClass(AppdelegateMacro.classForCoder).components(separatedBy: ".").first else {
        return nil
    }
    let anyClass:AnyClass? = NSClassFromString(namedSpace + "." + className)
    return anyClass
}
//打印
func PrintLog<T>(_ message: T, fileName: String = #file, methodName: String = #function, lineNumber: Int = #line){
    #if DEBUG
    let fileName = (fileName as NSString).lastPathComponent
    print("\n>>> \(Date())  \(fileName) (line: \(lineNumber)): \(message)\n")
    #endif
}



// 判断输入的字符串是否为数字，不含其它字符

 func isPurnInt(string: String) -> Bool {
     let scan: Scanner = Scanner(string: string)
     var val:Int = 0
     return scan.scanInt(&val) && scan.isAtEnd
 }

private var apiToken:String!

//数组转json
func getJSONStringFromArray(array:NSArray) -> String {
     
    if (!JSONSerialization.isValidJSONObject(array)) {
        print("无法解析出JSONString")
        return ""
    }
     
    let data : Data! = try? JSONSerialization.data(withJSONObject: array, options: []) as Data?
    let JSONString = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue)
    return JSONString! as String
     
}
/** json 字符串数组*/
func jsonToArray(jsonString:String)->Array<Dictionary<String, Any>>{
    
    let arr = [Dictionary<String,Any>()]
    do{
        let data = jsonString.data(using: String.Encoding.utf8)!
        //把NSData对象转换回JSON对象
        let json : Any! = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.mutableContainers)
        return json as! [Dictionary<String, Any>]
    }catch{
        return arr
    }
}


//PingFang-SC-Heavy
func kSystemFontHeavy(size: CGFloat) -> UIFont {
    let font: UIFont = UIFont.systemFont(ofSize: size, weight: .heavy)
    return font
}

func kSystemFontUltraLight(size: CGFloat) -> UIFont {
    let font: UIFont = UIFont.systemFont(ofSize: size, weight: .ultraLight)
    return font
}

func kSystemFontThin(size: CGFloat) -> UIFont {
    let font: UIFont = UIFont.systemFont(ofSize: size, weight: .thin)
    return font
}

func kSystemFontLight(size: CGFloat) -> UIFont {
    let font: UIFont = UIFont.systemFont(ofSize: size, weight: .light)
    return font
}

func kSystemFontRegular(size: CGFloat) -> UIFont {
    let font: UIFont = UIFont.systemFont(ofSize: size, weight: .regular)
    return font
}

func kSystemFontMedium(size: CGFloat) -> UIFont {
    let font: UIFont = UIFont.systemFont(ofSize: size, weight: .medium)
    return font
}

func kSystemFontSemibold(size: CGFloat) -> UIFont {
    let font: UIFont = UIFont.systemFont(ofSize: size, weight: .semibold)
    return font
}

func kSystemFontBold(size: CGFloat) -> UIFont {
    let font: UIFont = UIFont.systemFont(ofSize: size, weight: .bold)
    return font
}

func kSystemFontBlack(size: CGFloat) -> UIFont {
    let font: UIFont = UIFont.systemFont(ofSize: size, weight: .black)
    return font
}


