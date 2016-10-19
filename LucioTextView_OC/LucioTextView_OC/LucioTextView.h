//
//  LucioTextView.h
//  LucioTextView_OC
//
//  Created by 李新新 on 2016/10/19.
//  Copyright © 2016年 LucioLee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LucioTextView : UITextView

@property (nonatomic, copy, nullable) IBInspectable NSString *placeHolder;
// if attributedPlaceHolder is set, placeHolder is ignored.
// attributedPlaceHolder no support IBInspectable
@property (nonatomic, copy, nullable) NSAttributedString *attributedPlaceHolder;
    
@end
