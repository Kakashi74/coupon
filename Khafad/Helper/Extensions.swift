//
//  Extensions.swift
//  Sallah
//
//  Created by Ahmed on 12/18/19.
//  Copyright © 2019 AhmedDev. All rights reserved.
//

import Foundation
import SwiftyJSON


extension Double {
    func metersToMiles(places : Int) -> Double{
        let div = pow(10.0 , Double(places))
        return ((self / 1609.34) * div).rounded() / div
        
    }
}


extension Sequence where Element: AdditiveArithmetic {
    @inlinable
    @warn_unqualified_access
    public func sum() -> Element? {
        var it = makeIterator()
        guard var result = it.next() else { return nil }
        while let e = it.next() {
            result += e
        }
        return result
    }
}





extension Collection where Element: Numeric {
    func sum() -> Element {
        return reduce(0, +)
    }
}

extension Collection {
    func sum<T: Numeric>(_ transform: (Element) throws -> T) rethrows -> T {
        return try map(transform).sum()
    }
}

//
//extension String {
//
//    var trimmed : String {
//        return self.trimmingCharacters(in: .whitespacesAndNewlines)
//    }
//
//
//    func isValidEmail() -> Bool {
//           let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
//           let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
//           return emailTest.evaluate(with: self)
//       }
//
//       func isValidPassword() -> Bool {
//
//           if self.count >= 8 {
//               return true
//           }
//
//           return false
//       }
//
//       func extractTime() -> String {
//
//           let formatter = DateFormatter()
//           formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
//           let date = formatter.date(from: self)
//
//         //   print(date)
//
//           formatter.dateFormat = "yyyy-MM-dd HH:mm"
//           let stringDate = formatter.string(from: date!).capitalized
//
//           //  print(stringDate)
//           return stringDate
//       }
//
//       public func localized() -> String {
//           return NSLocalizedString(self, comment: "")
//       }
//
//}
//
//
//extension JSON{
//    var toInt: Int? {
//        if let int = self.int {return int}
//        if let string = self.string , let int = Int(string){
//            return int
//        }
//        return nil
//    }
//
//    var imagePath: String?{
//        guard let string = self.string, !string.isEmpty else {
//            return nil
//        }
//        return URLs.image_Path + string
//    }
    
// }
