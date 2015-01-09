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

#import <sys/utsname.h>

#import <AFNetworking/AFNetworking.h>
#import <SVProgressHUD/SVProgressHUD.h>


@interface ViewController : UIViewController <NSXMLParserDelegate>

@property (nonatomic, strong) NSMutableArray * arregloAcumulador;
@property (nonatomic, strong) NSMutableString * cadenaAcumulador;
@property BOOL bandera;

@property (nonatomic, strong) EndPoint * elEndPointTemp;

- (IBAction)btnTipoIphone:(id)sender;
- (IBAction)btnImgCorrespondiente:(id)sender;
- (IBAction)btnImgFromAFnet:(id)sender;

- (IBAction)btnTipoIphoneAFNetwor:(id)sender;


@property (weak, nonatomic) IBOutlet UIImageView *imgFondo;

// -- Para sacar el codigo de la Imagen:

@property (nonatomic, strong) NSString * cod01;
@property (nonatomic, strong) NSString * cod02Pais;
@property (nonatomic, strong) NSString * cod03End;
@property (nonatomic, strong) NSString * codFinal;
@property (nonatomic, strong) NSString * urlImagen;
@property (nonatomic, strong) NSString * baseUrlImagen;

// - - - -
-(NSString *)machineName;
- (void)saveImage:(UIImage *)image withFilename:(NSString *)filename;


@end

