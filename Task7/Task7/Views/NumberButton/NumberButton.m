//
//  NumberButton.m
//  Task7
//
//  Created by Evgeniy Petlitskiy on 4.07.21.
//

#import "NumberButton.h"
#import "UIColor+HexColor.h"

@implementation NumberButton

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.titleLabel.font = [UIFont systemFontOfSize:24 weight:UIFontWeightSemibold];
        [self setTitleColor:[UIColor colorFromHexString:@"#80A4ED"] forState:UIControlStateNormal];
        self.layer.borderWidth = 1.5;
        self.layer.cornerRadius = 25;
        self.layer.borderColor = [UIColor colorFromHexString:@"#80A4ED"].CGColor;
        [self.heightAnchor constraintEqualToConstant:50].active = YES;
        [self.widthAnchor constraintEqualToConstant:50].active = YES;
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title
{
    self = [self init];
    if (self) {
        [self setTitle:title forState:UIControlStateNormal];
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    
    if (highlighted) {
        self.backgroundColor = [UIColor colorFromHexString:@"#80A4ED" withAlpha:0.2];
    } else {
        self.backgroundColor = [UIColor clearColor];
    }
}

@end
