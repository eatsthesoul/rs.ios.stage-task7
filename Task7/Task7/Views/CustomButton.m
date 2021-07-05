//
//  CustomButton.m
//  Task7
//
//  Created by Evgeniy Petlitskiy on 4.07.21.
//

#import "CustomButton.h"
#import "UIColor+HexColor.h"

@implementation CustomButton

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setTitle:@"Authorize" forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightSemibold];
        self.layer.borderWidth = 2;
        self.layer.cornerRadius = 10;
        //normal state
        self.layer.borderColor = [UIColor colorFromHexString:@"#80A4ED"].CGColor;
        [self setTitleColor:[UIColor colorFromHexString:@"#80A4ED"] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"person"] forState:UIControlStateNormal];
        self.imageEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0);
        [self sizeToFit];
        //highlighted state
        [self setImage:[UIImage imageNamed:@"person-fill"] forState:UIControlStateHighlighted];
        [self setTitleColor:[UIColor colorFromHexString:@"#80A4ED" withAlpha:0.4] forState:UIControlStateHighlighted];
        [self setTranslatesAutoresizingMaskIntoConstraints:NO];
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
