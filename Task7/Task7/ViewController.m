//
//  ViewController.m
//  Task7
//
//  Created by Evgeniy Petlitskiy on 3.07.21.
//

#import "ViewController.h"
#import "UIColor+HexColor.h"
#import "CustomButton.h"
#import "NumberButton.h"
#import "SecureView.h"
#import "RegisterTextField.h"

@interface ViewController () <UITextFieldDelegate>

@property (nonatomic, strong) UILabel *rsSchoolLabel;
@property (nonatomic, strong) RegisterTextField *loginTextField;
@property (nonatomic, strong) RegisterTextField *passwordTextField;
@property (nonatomic, strong) CustomButton *authorizeButton;
@property (nonatomic, strong) SecureView *secureView;
@property (nonatomic, strong) UILabel *pinLabel;
@property (nonatomic, strong) UIStackView *stackView;
@property (nonatomic, strong) UIButton *firstNumberButton;
@property (nonatomic, strong) UIButton *secondNumberButton;
@property (nonatomic, strong) UIButton *thirdNumberButton;

@end


@implementation ViewController

// MARK: - Lifecycle methods

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupViews];
    [self setupLayout];

    self.loginTextField.delegate = self;
    self.passwordTextField.delegate = self;
    
    [self hideKeyboardByTap];
    [self handleTextFieldsEditing];
    [self handleAuthorizeButton];
    [self hanleNumberButtons];
}


// MARK: - Setup UI methods

- (void)setupViews {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //rsSchoolLabel
    self.rsSchoolLabel = [[UILabel alloc] init];
    self.rsSchoolLabel.text = @"RSSchool";
    self.rsSchoolLabel.font = [UIFont boldSystemFontOfSize:36];
    self.rsSchoolLabel.textAlignment = NSTextAlignmentCenter;
    [self.rsSchoolLabel sizeToFit];
    [self.rsSchoolLabel setTranslatesAutoresizingMaskIntoConstraints:NO];

    //login and password text fields
    self.loginTextField = [[RegisterTextField alloc] initWithPlaceholder:@"Login"];
    self.passwordTextField = [[RegisterTextField alloc] initWithPlaceholder:@"Password"];
    [self.passwordTextField setSecureTextEntry:YES];
    
    //authorizeButton
    self.authorizeButton = [[CustomButton alloc] init];
    
    //secureView
    self.secureView = [[SecureView alloc] init];
    [self.secureView setHidden:YES];
    [self.secureView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    //pinLabel
    self.pinLabel = [[UILabel alloc] init];
    self.pinLabel.text = @"_";
    [self.pinLabel setTextColor:[UIColor blackColor]];
    [self.pinLabel setFont:[UIFont systemFontOfSize:18 weight:UIFontWeightSemibold]];
    [self.pinLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    //secureView number buttons
    self.firstNumberButton = [[NumberButton alloc] initWithTitle:@"1"];
    self.secondNumberButton = [[NumberButton alloc] initWithTitle:@"2"];
    self.thirdNumberButton = [[NumberButton alloc] initWithTitle:@"3"];

    //stackView for secureView number buttons
    self.stackView = [[UIStackView alloc] init];
    self.stackView.axis = UILayoutConstraintAxisHorizontal;
    self.stackView.distribution = UIStackViewDistributionFillEqually;
    self.stackView.alignment = UIStackViewAlignmentCenter;
    self.stackView.spacing = 20;
    [self.stackView addArrangedSubview:self.firstNumberButton];
    [self.stackView addArrangedSubview:self.secondNumberButton];
    [self.stackView addArrangedSubview:self.thirdNumberButton];
    [self.stackView setTranslatesAutoresizingMaskIntoConstraints:NO];
}

- (void)setupLayout {
    
    //rsSchoolLabel
    [self.view addSubview:self.rsSchoolLabel];
    [NSLayoutConstraint activateConstraints:@[
        [self.rsSchoolLabel.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:80],
        [self.rsSchoolLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor]
    ]];
    
    //loginTextField
    [self.view addSubview:self.loginTextField];
    [NSLayoutConstraint activateConstraints:@[
        [self.loginTextField.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:220],
        [self.loginTextField.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:36],
        [self.loginTextField.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-36],
        [self.loginTextField.heightAnchor constraintEqualToConstant:38]
    ]];
    
    //passwordTextField
    [self.view addSubview:self.passwordTextField];
    [NSLayoutConstraint activateConstraints:@[
        [self.passwordTextField.topAnchor constraintEqualToAnchor:self.loginTextField.bottomAnchor constant:27],
        [self.passwordTextField.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:36],
        [self.passwordTextField.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-36],
        [self.passwordTextField.heightAnchor constraintEqualToConstant:38]
    ]];
    
    //authorizeButton
    [self.view addSubview:self.authorizeButton];
    [NSLayoutConstraint activateConstraints:@[
        [self.authorizeButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.authorizeButton.topAnchor constraintEqualToAnchor:self.passwordTextField.bottomAnchor constant:60],
        [self.authorizeButton.heightAnchor constraintEqualToConstant:42],
        [self.authorizeButton.widthAnchor constraintEqualToConstant:156]
    ]];
    
    //secureView
    [self.view addSubview:self.secureView];
    [NSLayoutConstraint activateConstraints:@[
        [self.secureView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.secureView.topAnchor constraintEqualToAnchor:self.authorizeButton.bottomAnchor constant:67]
    ]];

    //pinLabel
    [self.secureView addSubview:self.pinLabel];
    [NSLayoutConstraint activateConstraints:@[
        [self.pinLabel.topAnchor constraintEqualToAnchor:self.secureView.topAnchor constant:15],
        [self.pinLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor]
    ]];
    
    //stackView
    [self.secureView addSubview:self.stackView];
    [NSLayoutConstraint activateConstraints:@[
        [self.stackView.trailingAnchor constraintEqualToAnchor:self.secureView.trailingAnchor constant:-23],
        [self.stackView.topAnchor constraintEqualToAnchor:self.secureView.topAnchor constant:45],
        [self.stackView.leadingAnchor constraintEqualToAnchor:self.secureView.leadingAnchor constant:23],
        [self.stackView.bottomAnchor constraintEqualToAnchor:self.secureView.bottomAnchor constant:-15]
    ]];
}

// MARK: - Keyboard handlers

- (void)hideKeyboardByTap {
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
}

- (void)dismissKeyboard {
    [self.loginTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self dismissKeyboard];
    return YES;
}

// MARK: - Text fields handlers

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSCharacterSet *allowedCharacters = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"];
    
    if([string rangeOfCharacterFromSet:allowedCharacters.invertedSet].location == NSNotFound){
        return YES;
    }
    return NO;
}

- (void)handleTextFieldsEditing {
    [self.loginTextField addTarget:self action:@selector(handleTextFieldDidChange) forControlEvents:UIControlEventEditingChanged];
    [self.passwordTextField addTarget:self action:@selector(handleTextFieldDidChange) forControlEvents:UIControlEventEditingChanged];
}

- (void)handleTextFieldDidChange {
    if (self.loginTextField.isFirstResponder) { [self textFieldDidChange:self.loginTextField]; }
    if (self.passwordTextField.isFirstResponder) { [self textFieldDidChange:self.passwordTextField]; }
}

- (void)textFieldDidChange:(RegisterTextField *)textField {
    if (textField.textFieldState == RegisterTextFieldStateError) {
        [textField setRegisterTextFieldForState:RegisterTextFieldStateActive];
    }
}


// MARK: - Authorize Button Handlers

- (void)handleAuthorizeButton {
    [self.authorizeButton addTarget:self action:@selector(authorizeButtonHandler) forControlEvents:UIControlEventTouchUpInside];
}

- (void)authorizeButtonHandler {
    
    BOOL loginIsRight = [self.loginTextField.text isEqualToString: @"username"];
    BOOL passwordIsRight = [self.passwordTextField.text isEqualToString: @"password"];
    
    if (loginIsRight && passwordIsRight) {
        [self.loginTextField setRegisterTextFieldForState:RegisterTextFieldStateSuccess];
        [self.passwordTextField setRegisterTextFieldForState:RegisterTextFieldStateSuccess];
        [self.authorizeButton setSuccessButton];
        [self.secureView setHidden:NO];
    } else {
        if (!loginIsRight) {
            [self.loginTextField setRegisterTextFieldForState:RegisterTextFieldStateError];
        }
        if (!passwordIsRight) {
            [self.passwordTextField setRegisterTextFieldForState:RegisterTextFieldStateError];
        }
    }
}

// MARK: - Secure view handlers

- (void)hanleNumberButtons {
    [self.firstNumberButton addTarget:self action:@selector(numberButtonHandler:) forControlEvents:UIControlEventTouchUpInside];
    [self.secondNumberButton addTarget:self action:@selector(numberButtonHandler:) forControlEvents:UIControlEventTouchUpInside];
    [self.thirdNumberButton addTarget:self action:@selector(numberButtonHandler:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)numberButtonHandler:(UIButton *)sender {
    
    //add number
    if ([self.pinLabel.text isEqualToString: @"_"]) {
        self.pinLabel.text = sender.titleLabel.text;
    } else {
        self.pinLabel.text = [self.pinLabel.text stringByAppendingString:sender.titleLabel.text];
    }
    
    //check if pinLabel is full
    if (self.pinLabel.text.length > 2) {
        if ([self.pinLabel.text isEqualToString:@"132"]) {
            [self.secureView setSecureViewForState:SecureViewStateSuccess];
            //add alert
        } else {
            [self.secureView setSecureViewForState:SecureViewStateError];
            self.pinLabel.text = @"";
        }
    }
}

@end
