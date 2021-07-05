//
//  RegisterTextField.m
//  Task7
//
//  Created by Evgeniy Petlitskiy on 5.07.21.
//

#import "RegisterTextField.h"
#import "UIColor+HexColor.h"

@interface RegisterTextField ()

@property (nonatomic, readwrite) RegisterTextFieldState textFieldState;

@end

@implementation RegisterTextField

- (instancetype)init {
    self = [super init];
    if (self) {
        self.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
        self.leftViewMode = UITextFieldViewModeAlways;
        self.layer.borderWidth = 1.5;
        self.layer.cornerRadius = 5;
        self.autocapitalizationType = UITextAutocapitalizationTypeNone;
        [self setAutocorrectionType:UITextAutocorrectionTypeNo];
        [self setRegisterTextFieldForState:RegisterTextFieldStateActive];
        [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    }
    return self;
}

- (instancetype)initWithPlaceholder:(NSString *)placeholder {
    self = [self init];
    if (self) {
        self.placeholder = placeholder;
    }
    return self;
}

- (void)setRegisterTextFieldForState:(RegisterTextFieldState)state {
    switch (state) {
        case RegisterTextFieldStateActive:
            self.textFieldState = RegisterTextFieldStateActive;
            self.layer.borderColor = [UIColor colorFromHexString:@"#4C5C68"].CGColor;
            self.alpha = 1;
            [self setEnabled:YES];
            [self setText:@""];
            break;
        case RegisterTextFieldStateError:
            self.textFieldState = RegisterTextFieldStateError;
            self.layer.borderColor = [UIColor colorFromHexString:@"C20114"].CGColor;
            self.alpha = 1;
            [self setEnabled:YES];
            break;
        case RegisterTextFieldStateSuccess:
            self.textFieldState = RegisterTextFieldStateSuccess;
            self.layer.borderColor = [UIColor colorFromHexString:@"91C7B1"].CGColor;
            self.alpha = 0.5;
            [self setEnabled:NO];
            break;
    }
}

@end
