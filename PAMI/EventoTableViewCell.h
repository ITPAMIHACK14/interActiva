//
//  EventoTableViewCell.h
//  PAMI
//
//  Created by Estefania Soledad Miguel on 15/11/14.
//  Copyright (c) 2014 EstefaniaMiguel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventoTableViewCell : UITableViewCell
@property (nonatomic) IBOutlet UIImageView * imagen;
@property (nonatomic) IBOutlet UILabel * titulo;
@property (nonatomic) IBOutlet UILabel * descripcion;
@end
