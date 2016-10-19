//
//  LucioTextView.m
//  LucioTextView_OC
//
//  Created by 李新新 on 2016/10/19.
//  Copyright © 2016年 LucioLee. All rights reserved.
//

#import "LucioTextView.h"

@interface LucioTextView()
    
@property (nonatomic, strong) UILabel *placeHolderLabel;

@end

IB_DESIGNABLE
@implementation LucioTextView
    
- (void)setPlaceHolder:(NSString *)placeHolder {
    _placeHolder = [placeHolder copy];
    _placeHolderLabel.text = _placeHolder;
    [self setNeedsLayout];
}
    
- (void)setAttributedPlaceHolder:(NSAttributedString *)attributedPlaceHolder {
    _attributedPlaceHolder = [attributedPlaceHolder copy];
    _placeHolderLabel.attributedText = _attributedPlaceHolder;
    [self setNeedsLayout];
}

- (void)setText:(NSString *)text {
    [super setText:text];
    [self textDidChange];
}

- (void)setFont:(UIFont *)font {
    [super setFont:font];
    self.placeHolderLabel.font = font;
}

- (UILabel *)placeHolderLabel {
    if (_placeHolderLabel != nil) {
        return _placeHolderLabel;
    }
    _placeHolderLabel = [[UILabel alloc] init];
    _placeHolderLabel.numberOfLines = 0;
    _placeHolderLabel.font = self.font;
    _placeHolderLabel.textColor = [UIColor lightGrayColor];
    _placeHolderLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:_placeHolderLabel];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textDidChange)
                                                 name:UITextViewTextDidChangeNotification
                                               object:nil];
    return _placeHolderLabel;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat textContainerLeftInset = self.textContainerInset.left;
    CGFloat textContainerRightInset = self.textContainerInset.right;
    CGFloat textContainerTopInset = self.textContainerInset.top;
    CGFloat textContainerBottomInset = self.textContainerInset.bottom;
    
    CGFloat leftPadding = self.textContainer.lineFragmentPadding;
    CGFloat rightPadding = leftPadding;
    
    CGFloat leftInset = self.contentInset.left;
    CGFloat rightInset = self.contentInset.right;
    CGFloat topInset = self.contentInset.top;
    CGFloat bottomInset = self.contentInset.bottom;
    
    
    CGFloat width = CGRectGetWidth(self.frame) - leftInset - rightInset - textContainerLeftInset - textContainerRightInset - leftPadding - rightPadding;
    CGFloat height = CGRectGetHeight(self.frame) - topInset - bottomInset - textContainerTopInset - textContainerBottomInset;
    
    CGSize labelSize =  [self.placeHolderLabel sizeThatFits:CGSizeMake(width, height)];
    self.placeHolderLabel.frame = (CGRect){ CGPointMake(textContainerLeftInset + leftInset + leftPadding, topInset + textContainerTopInset),labelSize };
}
    
- (void)textDidChange {
    _placeHolderLabel.hidden = [self.text isEqualToString:@""] ? NO : YES;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

@end
