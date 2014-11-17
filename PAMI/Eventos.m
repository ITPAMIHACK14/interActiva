//
//  Eventos.m
//  PAMI
//
//  Created by Estefania Soledad Miguel on 15/11/14.
//  Copyright (c) 2014 EstefaniaMiguel. All rights reserved.
//

#import "Eventos.h"
#import "EventoTableViewCell.h"
@interface Eventos ()

@end

@implementation Eventos

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 66;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return @"30 de noviembre";
            break;
        case 1:
            return @"31 de noviembre";
            break;
        case 2:
            return @"32 de noviembre";
            break;
        default:
            break;
    }
    return @"20 de diciembre";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EventoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EventoTableViewCell"];

    if (cell == nil) {
        cell = [[EventoTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"EventoTableViewCell"];
    }
    if (indexPath.row == 1) {
        cell.imagen.image = [UIImage imageNamed:@"img_listado.png"];
        cell.descripcion.text = @"Vamos a hacer temblar Buenos Aires! Vení a descargar energía con el grupo de percusión formado por la profesora Mariela Dalmonte.";
        cell.titulo.text = @"Percusión";
    } else {
    cell.imagen.image = [UIImage imageNamed:@"img_listado.png"];
    cell.descripcion.text = @"Vení y movete con nosotros. Juntos aprenderemos formas de lograr más flexibilidad";
    cell.titulo.text = @"Técnicas de trabajo corporal";
    }
    return cell;
}

@end
