//
//  ViewController.m
//  PryParseoXML
//
//  Created by Henry AT on 1/7/15.
//  Copyright (c) 2015 Apps4s. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [self convertirXML];
    
    _baseUrlImagen = @"http://mobilesod1.cloudapp.net";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



// - - - - - Funcion Principal - - - - -

-(void)convertirXML {

    
    // Obtenemos la ruta:
    NSString *urlBase = [NSString stringWithFormat:@"http://mobilesod1.cloudapp.net/sodimac/api/get/endpoint/xml"];
    NSURL *sUrl = [NSURL URLWithString:urlBase];
    
    NSXMLParser * parser = [[NSXMLParser alloc] initWithContentsOfURL:sUrl];
    
    _arregloAcumulador = [[NSMutableArray alloc] init];
    parser.delegate = self;

    _bandera = NO;
    [parser parse];
}


#pragma mark -
#pragma mark - metodos para el parseo de XML
// Iniciar Documento
-(void)parserDidStartDocument:(NSXMLParser *)parser {

}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {

    static NSString * tagIdEndPoint = @"id_endpoint";
    static NSString * tagCodEndPoint = @"cod_endpoint";
    static NSString * tagDescEndPoint = @"desc_endpoint";
    static NSString * tagVersion = @"version";
    static NSString * tagHost = @"host";
    static NSString * tagPuerto = @"puerto";
    static NSString * tagRestoUrl = @"resto_url";
    static NSString * tagIdPais = @"id_pais";
    // - - - - - - - - - - - - - - - - - - - -
    static NSString * tagEndPoint = @"endpoint";
    
    if ([elementName isEqualToString:tagIdEndPoint] || [elementName isEqualToString:tagCodEndPoint] || [elementName isEqualToString:tagDescEndPoint] || [elementName isEqualToString:tagVersion]  || [elementName isEqualToString:tagHost]  || [elementName isEqualToString:tagPuerto]  || [elementName isEqualToString:tagRestoUrl]  || [elementName isEqualToString:tagIdPais]) {
        
        _cadenaAcumulador    = [[NSMutableString alloc] init];
        _bandera = YES;
    }
    if ([elementName isEqualToString:tagEndPoint]) {
        _elEndPointTemp = [[EndPoint alloc] init];
    }
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    if (_bandera) {
        [_cadenaAcumulador appendString:string];
    }
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    static NSString * tagIdEndPoint = @"id_endpoint";
    static NSString * tagCodEndPoint = @"cod_endpoint";
    static NSString * tagDescEndPoint = @"desc_endpoint";
    static NSString * tagVersion = @"version";
    static NSString * tagHost = @"host";
    static NSString * tagPuerto = @"puerto";
    static NSString * tagRestoUrl = @"resto_url";
    static NSString * tagIdPais = @"id_pais";
    // - - - - - - - - - - - - - - - - - - - -
    static NSString * tagEndPoint = @"endpoint";
    
    if ([elementName isEqualToString:tagIdEndPoint]) {
        _elEndPointTemp.idEndPoint = _cadenaAcumulador;
        _bandera = NO;
    }
    if ([elementName isEqualToString:tagCodEndPoint]) {
        _elEndPointTemp.codigoEndPoint = _cadenaAcumulador;
        _bandera = NO;
    }
    if ([elementName isEqualToString:tagDescEndPoint]) {
        _elEndPointTemp.descEndPoint = _cadenaAcumulador;
        _bandera = NO;
    }
    if ([elementName isEqualToString:tagVersion]) {
        _elEndPointTemp.version = _cadenaAcumulador;
        _bandera = NO;
    }
    if ([elementName isEqualToString:tagHost]) {
        _elEndPointTemp.host = _cadenaAcumulador;
        _bandera = NO;
    }
    if ([elementName isEqualToString:tagPuerto]) {
        _elEndPointTemp.puerto = _cadenaAcumulador;
        _bandera = NO;
    }
    if ([elementName isEqualToString:tagRestoUrl]) {
        _elEndPointTemp.restoUrl = _cadenaAcumulador;
        _bandera = NO;
    }
    if ([elementName isEqualToString:tagIdPais]) {
        _elEndPointTemp.idPais = _cadenaAcumulador;
        _bandera = NO;
    }
    // - - - - - - - - - - - - - - - - - - - -    
    if ([elementName isEqualToString:tagEndPoint]) {
        [_arregloAcumulador addObject:_elEndPointTemp];
    }



}
// Finalizar Documento
-(void)parserDidEndDocument:(NSXMLParser *)parser {
    NSLog(@"El endPoint es: %@",_elEndPointTemp);
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 
        TablaVC *tablaView  = segue.destinationViewController;
        tablaView.losDatos = _arregloAcumulador;

}
- (IBAction)btnTipoIphone:(id)sender {
    
    _cod01 = @"VI";
    _cod02Pais = @"CL";
    _cod03End = @"NORMAL";
//    _cod03End = @"RET3";
//    _cod03End = @"RET4";
    
    
    NSString * deviceType = [[NSString alloc] init];
    // - - - - -
    if ([[self machineName] isEqualToString:@"iPhone1,2"]) {
        deviceType = @"iPhone 3G";
        _cod03End = @"NORMAL";
    } else if ([[self machineName] isEqualToString:@"iPhone2,1"]) {
        deviceType = @"iPhone 3GS";
        _cod03End = @"NORMAL";
    } else if (([[self machineName] isEqualToString:@"iPhone3,1"]) || ([[self machineName] isEqualToString:@"iPhone3,2"]) || ([[self machineName] isEqualToString:@"iPhone3,3"])) {
        deviceType = @"iPhone 4";
        _cod03End = @"NORMAL";
    } else if ([[self machineName] isEqualToString:@"iPhone4,1"]) {
        deviceType = @"iPhone 4S";
        _cod03End = @"RET3";
    } else if ([[self machineName] isEqualToString:@"iPhone5,1"]) {
        deviceType = @"iPhone 5";
        _cod03End = @"RET4";
    } else if ([[self machineName] isEqualToString:@"iPhone6,1"]) {
        deviceType = @"iPhone 6";
        _cod03End = @"RET4";
    } else if ([[self machineName] isEqualToString:@"iPod1,1"]) {
        deviceType = @"iPod Touch 1G";
        _cod03End = @"NORMAL";
    } else if (([[self machineName] isEqualToString:@"iPod2,1"]) || ([[self machineName] isEqualToString:@"iPod2,2"])) {
        deviceType = @"iPod Touch 2G";
        _cod03End = @"NORMAL";
    } else if ([[self machineName] isEqualToString:@"iPod3,1"]) {
        deviceType = @"iPod Touch 3G";
        _cod03End = @"NORMAL";
    } else if ([[self machineName] isEqualToString:@"iPod4,1"]) {
        deviceType = @"iPod Touch 4G";
        _cod03End = @"RET3";
    } else if ([[self machineName] isEqualToString:@"iPod5,1"]) {
        deviceType = @"iPod Touch 5G";
        _cod03End = @"RET4";
    }
    
    _codFinal = [NSString stringWithFormat:@"%@%@%@",_cod01,_cod02Pais,_cod03End];
    NSLog(@"==>> %@ y su codigo final:%@",deviceType,_codFinal);
    
}

- (IBAction)btnImgCorrespondiente:(id)sender {
    

    NSString * cadDeApp = [_codFinal uppercaseString];
    
    for (EndPoint * punto in _arregloAcumulador) {
        NSString * cadDeServ = [punto.codigoEndPoint uppercaseString];
        if ([cadDeApp isEqualToString:cadDeServ]) {
    //http://mobilesod1.cloudapp.net /imagenesapp/appsodimac/cl/iOS/640x1136_iOS.png
            _urlImagen = [NSString stringWithFormat:@"%@%@",_baseUrlImagen,punto.restoUrl];
            NSLog(@"==>> |%@|",_urlImagen);
        }
    }
    // = = = = = = = =
//    NSURL *url = [NSURL URLWithString:@"http://mobilesod1.cloudapp.net/imagenesapp/appsodimac/cl/iOS/640x1136_iOS.png"];
    NSURL *url = [NSURL URLWithString:_urlImagen];
    
    // Obtenemos la cola de segundo plano
    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    // Invocamos en modo asíncrono un bloque en la cola que hemos recuperado
    dispatch_async(backgroundQueue, ^{
        
        // Obtenemos los datos de la imagen (esto tardara un poco al
        // tratarse de una imagen de alta resolución)
        NSData *dataImagen = [NSData dataWithContentsOfURL:url];
        
        // Creamos un UIImage con los datos obtenidos
        UIImage *imagen = [[UIImage alloc] initWithData:dataImagen];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            // Asignamos al UIImageView de nuestra vista dicho UIImage
            self.imgFondo.image = imagen;
            NSLog(@" - - - - -  >>>> Listo");
            
        });
        
    });
}

- (IBAction)btnImgFromAFnet:(id)sender {

            NSLog(@"Click ...");
    NSString * cadDeApp = [_codFinal uppercaseString];
    
    for (EndPoint * punto in _arregloAcumulador) {
        NSString * cadDeServ = [punto.codigoEndPoint uppercaseString];
        if ([cadDeApp isEqualToString:cadDeServ]) {
            //http://mobilesod1.cloudapp.net /imagenesapp/appsodimac/cl/iOS/640x1136_iOS.png
            _urlImagen = [NSString stringWithFormat:@"%@%@",_baseUrlImagen,punto.restoUrl];
            NSLog(@"==>> |%@|",_urlImagen);
        }
    }
    
// Ejecutar tipo iPhone para saber la URL de la Imagen
    NSURL *url = [NSURL URLWithString:_urlImagen];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFImageResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        self.imgFondo.image = responseObject;
        [self saveImage:responseObject withFilename:@"background.png"];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];
    
    [operation start];
}



// - - - - - - - - -
- (IBAction)btnTipoIphoneAFNetwor:(id)sender {
    /*
    // Obtenemos la ruta:
    NSString *urlBase = [NSString stringWithFormat:@"http://mobilesod1.cloudapp.net/sodimac/api/get/endpoint/xml"];
    NSURL *sUrl = [NSURL URLWithString:urlBase];
    NSXMLParser * parser = [[NSXMLParser alloc] initWithContentsOfURL:sUrl];
    _arregloAcumulador = [[NSMutableArray alloc] init];
    parser.delegate = self;
    _bandera = NO;
    [parser parse];
    */
    
    
//    NSString *string = [NSString stringWithFormat:@"%@weather.php?format=xml", BaseURLString];
    NSString *string = [NSString stringWithFormat:@"http://mobilesod1.cloudapp.net/sodimac/api/get/endpoint/xml"];
    
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    _arregloAcumulador = [[NSMutableArray alloc] init];
    _bandera = NO;
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
//    [SVProgressHUD show];
    [SVProgressHUD showWithStatus:@"Cargando desde el Serivcio los datos"];
    // Make sure to set the responseSerializer correctly
    operation.responseSerializer = [AFXMLParserResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        [SVProgressHUD dismiss];
        NSXMLParser *XMLParser = (NSXMLParser *)responseObject;
        [XMLParser setShouldProcessNamespaces:YES];
        
        // Leave these commented for now (you first need to add the delegate methods)
         XMLParser.delegate = self;
         [XMLParser parse];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [SVProgressHUD dismiss];
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Weather"
                                                            message:[error localizedDescription]
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
        [alertView show];
        
    }];
    
    [operation start];
    
    
    
}



//NSString* machineName()
-(NSString *)machineName
{
    struct utsname systemInfo;
    uname(&systemInfo);
    
    NSString * resultado = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    return resultado;
}

- (void)saveImage:(UIImage *)image withFilename:(NSString *)filename
{
    NSString *path;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    path = [paths[0] stringByAppendingPathComponent:@"HTTPClientImgs/"];
	   
    BOOL isDir;
    
    if(![[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&isDir]) {
        if(!isDir) {
            NSError *error;
            [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error];
            
            NSLog(@"%@",error);
        }
    }
    
    path = [path stringByAppendingPathComponent:filename];
    NSData *imageData = UIImagePNGRepresentation(image);
    NSLog(@"Written: %d",[imageData writeToFile:path atomically:YES]);
}






@end
