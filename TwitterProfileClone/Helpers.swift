//
//  Helpers.swift
//  TwitterProfileClone
//
//  Created by Sean Robertson on 3/16/15.
//  Copyright (c) 2015 Sean Robertson. All rights reserved.
//

import UIKit

func heightOfLabel(withString: String, ofSize: CGFloat, inWidth: CGFloat) -> CGFloat {
    let labelFont = UIFont.systemFontOfSize(ofSize)
    let labelSize = (withString as NSString).boundingRectWithSize(CGSizeMake(inWidth, CGFloat.max), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: labelFont], context: nil)
    return ceil(labelSize.height)
}