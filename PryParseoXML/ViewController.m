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
    
    [self convertirXML];
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
@end
