//
//  SecureView.h
//  Task7
//
//  Created by Evgeniy Petlitskiy on 5.07.21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_OPTIONS(NSUInteger, SecureViewState) {
    SecureViewStateDefault  = 0,
    SecureViewStateError    = 1,
    SecureViewStateSuccess  = 2
};

@interface SecureView : UIView

@property (nonatomic) SecureViewState state;

- (void)setSecureViewForState:(SecureViewState)state;

@end

NS_ASSUME_NONNULL_END
