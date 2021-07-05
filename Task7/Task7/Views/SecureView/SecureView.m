//
//  SecureView.m
//  Task7
//
//  Created by Evgeniy Petlitskiy on 5.07.21.
//

#import "SecureView.h"
#import "UIColor+HexColor.h"

@implementation SecureView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setSecureViewForState:SecureViewStateDefault];
    }
    return self;
}

- (void)setSecureViewForState:(SecureViewState)state {
    switch (state) {
        case SecureViewStateDefault:
            self.layer.borderWidth = 0;
            break;
        case SecureViewStateSuccess:
            self.layer.borderWidth = 2;
            self.layer.cornerRadius = 10;
            self.layer.borderColor = [UIColor colorFromHexString:@"91C7B1"].CGColor;
            break;
        case SecureViewStateError:
            self.layer.borderWidth = 2;
            self.layer.cornerRadius = 10;
            self.layer.borderColor = [UIColor colorFromHexString:@"C20114"].CGColor;
            break;
    }
}

@end
