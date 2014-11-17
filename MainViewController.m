//
//  MainViewController.m
//  PAMI
//
//  Created by Estefania Soledad Miguel on 15/11/14.
//  Copyright (c) 2014 EstefaniaMiguel. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *localidadesPicker;
@property (weak, nonatomic) IBOutlet UIView *localidadView;
@property (weak, nonatomic) IBOutlet UIView *provinciasView;
@property (weak, nonatomic) IBOutlet UIPickerView *provinciasPicker;
@property (nonatomic) NSArray * provincias;
@property (nonatomic) NSArray * localidades;

@end

@implementation MainViewController

- (IBAction)onSeleccioneLocalidad:(id)sender {
    CGRect frame = self.localidadView.frame;
    frame.origin.y = self.view.frame.size.height - frame.size.height;
    [UIView animateWithDuration:0.3 animations:^{
        self.localidadView.frame = frame;
    } completion:nil];
}

- (IBAction)onSeleccioneProvincia:(id)sender {
    CGRect frame = self.provinciasView.frame;
    frame.origin.y = self.view.frame.size.height - frame.size.height;
    [UIView animateWithDuration:0.3 animations:^{
        self.provinciasView.frame = frame;
    } completion:nil];
}

- (IBAction)onSeleccionoProvincia:(id)sender {
    [self sacar:sender];
    [self onSeleccioneLocalidad:sender];
}

- (IBAction)onSeleccionoLocalidad:(id)sender {
    [self sacarLocalidad:sender];
    [self performSegueWithIdentifier: @"perinola" sender: self];
}

- (IBAction)sacar:(id)sender {
    CGRect frame = self.provinciasView.frame;
    frame.origin.y = self.view.frame.size.height + frame.size.height;
    [UIView animateWithDuration:0.3 animations:^{
        self.provinciasView.frame = frame;
    } completion:nil];
}

- (IBAction)sacarLocalidad:(id)sender {
    CGRect frame = self.localidadView.frame;
    frame.origin.y = self.view.frame.size.height + frame.size.height;
    [UIView animateWithDuration:0.3 animations:^{
        self.localidadView.frame = frame;
    } completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.provincias = [[NSArray alloc] initWithObjects:@"Buenos Aires", @"Capital Federal", @"Catamarca", @"Chaco", @"Chubut", @"Córdoba", @"Corrientes", @"Entre Ríos", @"Formosa", @"Jujuy", @"La Pampa", @"La Rioja", @"Mendoza", @"Misiones", @"Neuquén", @"Río Negro", @"Salta", @"San Juan", @"San Luis", @"Santa Cruz", @"Santa Fe", @"Santiego del Estero", @"Tierra del Fuego", @"Tucumán", nil];
    
    self.localidades = [[NSArray alloc] initWithObjects:@"Abasto", @"Agronomía", @"Almagro", @"Balvanera", @"Barracas", @"Barrio Norte", @"Belgrano", @"Boedo", @"Caballito", @"Centro", @"Chacarita", @"Coghlan", @"Colegiales", @"Constitución", @"Flores", @"Floresta", @"La Boca", @"Liniers", @"Mataderos", @"Microcentro", @"Monserrat", @"Monte Castro", @"Nuñes", @"Nueva Pompeya", @"Palermo", @"Palermo Viejo", @"Parque Avellaneda", @"Paque Chacabuco", @"Parque Patricios", @"Paternal", @"Puerto Madero", @"Recoleta", @"Retiro", @"Saavedra", @"San Cristobal", @"San Nicolas", @"San Telmo", @"Velez Sarsfield", @"Versalles", @"Villa Crespo", @"Villa Devoto", @"Villa General Mitre", @"Villa Lugano", @"Villa Luro", @"Villa Ortuzar", @"Villa Pueyrredon", @"Villa Real", @"Villa Riachuelo", @"Villa Santa Rita", @"Villa Soldati", @"Villa Urquiza", @"Villa del Parque", nil];
    
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Listo" style:UIBarButtonItemStyleBordered target:self action:@selector(onSeleccionoProvincia:)];
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancelar" style:UIBarButtonItemStyleBordered target:self action:@selector(sacar:)];
    UIBarButtonItem *flexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    [toolBar setItems:[NSArray arrayWithObjects:cancelButton, flexible, doneButton, nil]];
    
    [self.provinciasView addSubview:toolBar];
    
    UIToolbar *toolBarLocalidad = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    UIBarButtonItem *doneButtonLocalidad = [[UIBarButtonItem alloc] initWithTitle:@"Listo" style:UIBarButtonItemStyleBordered target:self action:@selector(onSeleccionoLocalidad:)];
    UIBarButtonItem *cancelButtonLocalidad = [[UIBarButtonItem alloc] initWithTitle:@"Cancelar" style:UIBarButtonItemStyleBordered target:self action:@selector(sacarLocalidad:)];
    UIBarButtonItem *flexibleLocalidad = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    [toolBarLocalidad setItems:[NSArray arrayWithObjects:cancelButtonLocalidad, flexibleLocalidad, doneButtonLocalidad, nil]];
    [self.localidadView addSubview:toolBarLocalidad];
}


-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    //One column
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    //set number of rows
    if (pickerView == self.provinciasPicker) {
        return self.provincias.count;
    }
    if (pickerView == self.localidadesPicker) {
        return self.localidades.count;
    }
    return nil;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    //set item per row
    if (pickerView == self.provinciasPicker) {
        return [self.provincias objectAtIndex:row];
    }
    if (pickerView == self.localidadesPicker) {
        return [self.localidades objectAtIndex:row];
    }
    
    return nil;
}



@end
