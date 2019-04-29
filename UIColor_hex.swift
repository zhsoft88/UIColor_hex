//
//  UIColor_hex.swift
//
//  Created by zhsoft88 on 2019/4/29.
//  Copyright © 2019 zhuatang. All rights reserved.
//

import Foundation

extension UIColor {

  convenience init?(hex: String) {
    guard hex.hasPrefix("#") else { return nil }

    var input = hex.uppercased()
    if input.count == 4 {
      // #RGB -> #RRGGBBAA
      let r = String(hex[hex.index(hex.startIndex, offsetBy: 1)])
      let g = String(hex[hex.index(hex.startIndex, offsetBy: 2)])
      let b = String(hex[hex.index(hex.startIndex, offsetBy: 3)])
      input = "#" + r + r + g + g + b + b + "FF"
    } else if input.count == 5 {
      // #RGBA -> #RRGGBBAA
      let r = String(hex[hex.index(hex.startIndex, offsetBy: 1)])
      let g = String(hex[hex.index(hex.startIndex, offsetBy: 2)])
      let b = String(hex[hex.index(hex.startIndex, offsetBy: 3)])
      let a = String(hex[hex.index(hex.startIndex, offsetBy: 4)])
      input = "#" + r + r + g + g + b + b + a + a
    } else if input.count == 7 {
      // #RRGGBB -> #RRGGBBAA
      input += "FF"
    }
    guard input.count == 9 else { return nil }

    let ri = input.index(input.startIndex, offsetBy: 1)
    let gi = input.index(input.startIndex, offsetBy: 3)
    let bi = input.index(input.startIndex, offsetBy: 5)
    let ai = input.index(input.startIndex, offsetBy: 7)
    let rr = String(input[ri..<gi])
    let gg = String(input[gi..<bi])
    let bb = String(input[bi..<ai])
    let aa = String(input[ai...])
    guard let r = UInt8(rr, radix: 16),
      let g = UInt8(gg, radix: 16),
      let b = UInt8(bb, radix: 16),
      let a = UInt8(aa, radix: 16)
      else { return nil }

    self.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: CGFloat(a)/255.0)
  }

  func toHex(withAlpha: Bool = false) -> String {
    var r: CGFloat = 0
    var g: CGFloat = 0
    var b: CGFloat = 0
    var a: CGFloat = 0
    getRed(&r, green: &g, blue: &b, alpha: &a)
    var result = String(format: "#%02X%02X%02X", UInt8(r * 255.0), UInt8(g * 255.0), UInt8(b * 255.0))
    if withAlpha {
      result += String(format: "%02X", UInt8(a * 255.0))
    }
    return result
  }

}
