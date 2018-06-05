//
//  Helpers.swift
//  TwitterProfileClone
//
//  Created by Sean Robertson on 3/16/15.
//  Copyright (c) 2015 Sean Robertson. All rights reserved.
//

import UIKit

func heightOfLabel(withString: String, ofSize: CGFloat, inWidth: CGFloat) -> CGFloat {
    //let labelFont = UIFont.systemFontOfSize(ofSize)
    let labelFont = UIFont(name: "HelveticaNeue-Light", size: ofSize)!
  let labelSize = (withString as NSString).boundingRect(with: CGSize(width: inWidth, height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [kCTFontAttributeName as NSAttributedString.Key: labelFont], context: nil)
    return ceil(labelSize.height)
}
