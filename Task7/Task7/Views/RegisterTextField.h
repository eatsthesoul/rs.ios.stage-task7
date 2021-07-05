//
//  RegisterTextField.h
//  Task7
//
//  Created by Evgeniy Petlitskiy on 5.07.21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_OPTIONS(NSUInteger, RegisterTextFieldState) {
    RegisterTextFieldStateActive   = 0,
    RegisterTextFieldStateError    = 1,
    RegisterTextFieldStateSuccess  = 2
};

@interface RegisterTextField : UITextField

@property (nonatomic, readonly) RegisterTextFieldState textFieldState;

- (instancetype)initWithPlaceholder:(NSString *)placeholder;
- (void)setRegisterTextFieldForState:(RegisterTextFieldState)state;

@end

NS_ASSUME_NONNULL_END
