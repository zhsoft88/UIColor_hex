# UIColor_hex
Simple Swift extension for Converting UIColor from hex string or to hex string

Color hex string formats:  

#RGB  
#RGBA  
#RRGGBB  
#RRGGBBAA  

Usage:

```swift
// Color from hex string
// #RGB color
let color1 = UIColor(hex: "#ABC")!
// #RGBA color with alpha
let color2 = UIColor(hex: "#ABCD")!
// #RRGGBB color
let color3 = UIColor(hex: "#ABCDEF")!
// #RRGGBBAA color with alpha
let color4 = UIColor(hex: "#ABCDEFAA")!

// Color to hex string
print(color1.toHex())
// Output: #AABBCC
print(color4.toHex(withAlpha: true))
// Output: #ABCDEFAA

```
