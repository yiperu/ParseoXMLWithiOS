//
//  TablaVC.h
//  PryParseoXML
//
//  Created by Henry AT on 1/7/15.
//  Copyright (c) 2015 Apps4s. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "EndPoint.h"

@interface TablaVC : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray * losDatos;
- (IBAction)btnSalir:(id)sender;

@end
