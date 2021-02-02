//
//  Corners.swift
//  CustomInlineCurvesAndShapes
//
//  Created by Keunna Lee on 2021/02/02.
//

import SwiftUI

struct Corners: Shape {
    
    var corner: UIRectCorner
    var size: CGSize
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: size)
        
        return Path(path.cgPath)
    }
}
