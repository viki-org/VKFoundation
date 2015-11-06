//
//  Created by Viki.
//  Copyright (c) 2014 Viki Inc. All rights reserved.
//

#import "UILabel+VKFoundation.h"

@implementation UILabel (VKFoundation)

- (void)alignTop {
  CGSize fontSize = [self.text sizeWithAttributes:@{NSFontAttributeName: self.font}];
  CGFloat finalHeight = fontSize.height * self.numberOfLines;
  CGFloat finalWidth = self.frame.size.width;    //expected width of label
  CGSize theStringSize = CGRectIntegral([self boundingRectWithSize:CGSizeMake(finalWidth, finalHeight)]).size;
  int newLinesToPad = (finalHeight  - theStringSize.height) / fontSize.height;
  for (int i = 0; i < newLinesToPad; i++) {
    self.text = [self.text stringByAppendingString:@"\n "];
  }
}

- (void)alignBottom {
  CGSize fontSize = [self.text sizeWithAttributes:@{NSFontAttributeName: self.font}];
  CGFloat finalHeight = fontSize.height * self.numberOfLines;
  CGFloat finalWidth = self.frame.size.width;    //expected width of label
  CGSize theStringSize = CGRectIntegral([self boundingRectWithSize:CGSizeMake(finalWidth, finalHeight)]).size;
  int newLinesToPad = (finalHeight  - theStringSize.height) / fontSize.height;
  for(int i = 0; i < newLinesToPad; i++) {
    self.text = [NSString stringWithFormat:@" \n%@",self.text];
  }
}

- (void)sizeToFitMaxSize:(CGSize)size {
  NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
  paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
  paragraphStyle.alignment = self.textAlignment;
  CGRect targetRect = [self.text boundingRectWithSize:size
                                              options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
                                           attributes:@{
                                                        NSFontAttributeName: self.font,
                                                        NSParagraphStyleAttributeName : paragraphStyle,
                                                        }
                                              context:nil];
  CGSize targetSize = CGRectIntegral(targetRect).size;
  self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, targetSize.width, targetSize.height);
}

- (void)sizeToFitMaxHeight:(CGFloat)maxHeight {
  [self sizeToFitMaxSize:CGSizeMake(self.frame.size.width, maxHeight)];
}

- (void)sizeToFitMaxLines:(NSInteger)lines {
  [self sizeToFitMaxHeight:lines * self.font.lineHeight];
}

#pragma mark - Private
- (CGRect)boundingRectWithSize:(CGSize)size {
  NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
  paragraphStyle.lineBreakMode = self.lineBreakMode;
  paragraphStyle.alignment = self.textAlignment;
  CGRect theStringRect = [self.text boundingRectWithSize:size
                                                 options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                              attributes:@{
                                                           NSFontAttributeName: self.font,
                                                           NSParagraphStyleAttributeName : paragraphStyle,
                                                           }
                                                 context:nil];
  return theStringRect;
}
@end
