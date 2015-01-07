//
//  ViewController.h
//  PryParseoXML
//
//  Created by Henry AT on 1/7/15.
//  Copyright (c) 2015 Apps4s. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "EndPoint.h"
#import "TablaVC.h"

@interface ViewController : UIViewController <NSXMLParserDelegate>

@property (nonatomic, strong) NSMutableArray * arregloAcumulador;
@property (nonatomic, strong) NSMutableString * cadenaAcumulador;
@property BOOL bandera;

@property (nonatomic, strong) EndPoint * elEndPointTemp;

@end

