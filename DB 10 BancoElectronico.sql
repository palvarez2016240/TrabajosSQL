create database BancaElectronica;
use BancaElectronica;

#.............Creacion de tablas..............
delimiter $$
	create procedure tabla_1()
	begin 
		create table nacionalidad( id_nacionalidad int primary key auto_increment,
        nombre varchar(20)
        );
	end $$
delimiter ;

delimiter $$
	create procedure tabla_2()
	begin 
		create table identificacion( id_identificacion int primary key auto_increment,
        nombre varchar(20),
        numero int
        );
	end $$
delimiter ;

delimiter $$
	create procedure tabla_3()
	begin 
		create table tipoCuenta( id_tipoCuenta int primary key auto_increment,
        nombre varchar(20)
        );
	end $$
delimiter ;

delimiter $$
	create procedure tabla_4()
	begin 
		create table moneda( id_moneda int primary key auto_increment,
        nombre varchar(20)
        );
	end $$
delimiter ;

delimiter $$
	create procedure tabla_5()
	begin 
		create table tipoOperacion( id_tipoOperacion int primary key auto_increment,
        nombre varchar(20)
        );
	end $$
delimiter ;

delimiter $$
	create procedure tabla_6()
	begin 
		create table estado( id_estado int primary key auto_increment,
        nombre varchar(20)
        );
	end $$
delimiter ;

delimiter $$
	create procedure tabla_7()
	begin 
		create table servicio( id_servicio int primary key auto_increment,
        nombre varchar(20)
        );
	end $$
delimiter ;

delimiter $$
	create procedure tabla_8()
	begin 
		create table tarjetaCredito( id_tarjetaCredito int auto_increment,
        limiteCredito int,
        tasaInteres int,
        id_tipoCuenta int,
        primary key(id_tarjetaCredito),
        foreign key(id_tipoCuenta) references tipoCuenta(id_tipoCuenta)
        );
	end $$
delimiter ;

delimiter $$
	create procedure tabla_9()
	begin 
		create table prestamo( id_prestamo int auto_increment,
        capitalAdeudao int,
		capitalPagado int,
        tasaInteres int,
        id_tipoCuenta int,
        primary key(id_prestamo),
        foreign key(id_tipoCuenta) references tipoCuenta(id_tipoCuenta)
        );
	end $$
delimiter ;


delimiter $$
	create procedure tabla_10()
	begin 
		create table fondosPension( id_fondosPension int auto_increment,
        tasaInteres int,
        plazo varchar(20),
        id_tipoCuenta int,
        primary key(id_fondosPension),
        foreign key(id_tipoCuenta) references tipoCuenta(id_tipoCuenta)
        );
	end $$
delimiter ;

delimiter $$
	create procedure tabla_11()
	begin 
		create table cliente( id_cliente int auto_increment,
         nombre varchar(20),
         apellido varchar(20),
         direccion varchar(20),
         telefono int,
         celular int,
         sexo char,
         id_identificacion int,
         id_nacionalidad int,
        primary key(id_cliente),
        foreign key(id_identificacion) references identificacion(id_identificacion),
        foreign key(id_nacionalidad) references nacionalidad(id_nacionalidad)
        );
	end $$
delimiter ;

delimiter $$
	create procedure tabla_12()
	begin 
		create table usuario( id_usuario int auto_increment,
		id_cliente int,
        nombre varchar(15),
        contraseña varchar(10),
        fechaCreacion date,
        id_estado int,
        primary key(id_usuario),
        foreign key(id_cliente) references cliente(id_cliente),
        foreign key(id_estado) references estado(id_estado)
        );
	end $$
delimiter ;

delimiter $$
	create procedure tabla_13()
	begin 
		create table cuenta( numCuenta int auto_increment,
		Saldo int,
        id_tipoCuenta int,
        id_usuario int,
        id_moneda int,
        primary key(numCuenta),
        foreign key(id_tipoCuenta) references tipoCuenta(id_tipoCuenta),
        foreign key(id_usuario) references usuario(id_usuario),
        foreign key(id_moneda) references moneda(id_moneda)
        );
	end $$
delimiter ;

delimiter $$
	create procedure tabla_14()
	begin 
		create table proveedor( id_proveedor int auto_increment,
        nombre varchar(20),
        id_servicio int,
        primary key(id_proveedor),
        foreign key(id_servicio) references servicio(id_servicio)
        );
	end $$
delimiter ;

delimiter $$
	create procedure tabla_15()
	begin 
		create table pagoCole( id_pagoCole int auto_increment,
        carne int,
        monto int,
        id_servicio int,
        id_proveedor int,
        primary key(id_pagoCole),
        foreign key(id_servicio) references servicio(id_servicio),
        foreign key(id_proveedor) references proveedor(id_proveedor)
        );
	end $$
delimiter ;

delimiter $$
	create procedure tabla_16()
	begin 
		create table pagoUni( id_pagoUni int auto_increment,
        carne int,
        monto int,
        id_servicio int,
        id_proveedor int,
        primary key(id_pagoUni),
        foreign key(id_servicio) references servicio(id_servicio),
        foreign key(id_proveedor) references proveedor(id_proveedor)
        );
	end $$
delimiter ;

delimiter $$
	create procedure tabla_17()
	begin 
		create table pagoLuz( id_pagoLuz int auto_increment,
        numCorrelativo int,
        monto int,
        id_servicio int,
        id_proveedor int,
        primary key(id_pagoLuz),
        foreign key(id_servicio) references servicio(id_servicio),
        foreign key(id_proveedor) references proveedor(id_proveedor)
        );
	end $$
delimiter ;

delimiter $$
	create procedure tabla_18()
	begin 
		create table pagoTelefono( id_pagoTelefono int auto_increment,
		numCelular int,
        monto int,
        id_servicio int,
        id_proveedor int,
        primary key(id_pagoTelefono),
        foreign key(id_servicio) references servicio(id_servicio),
        foreign key(id_proveedor) references proveedor(id_proveedor)
        );
	end $$
delimiter ;

delimiter $$
	create procedure tabla_19()
	begin 
		create table pagoAgua( id_pagoAgua int auto_increment,
		numCasa int,
        monto int,
        id_servicio int,
        id_proveedor int,
        primary key(id_pagoAgua),
        foreign key(id_servicio) references servicio(id_servicio),
        foreign key(id_proveedor) references proveedor(id_proveedor)
        );
	end $$
delimiter ;

delimiter $$
	create procedure tabla_20()
	begin 
		create table transaccion( id_transaccion int auto_increment,
        id_usuario int,
        numCuenta int,
        id_servicio int,
        id_proveedor int,
        primary key(id_transaccion),
        foreign key(id_usuario) references usuario(id_usuario),
        foreign key(numCuenta) references cuenta(numCuenta),
        foreign key(id_servicio) references servicio(id_servicio),
        foreign key(id_proveedor) references proveedor(id_proveedor)
        );
	end $$
delimiter ;

delimiter $$
	create procedure tabla_21()
	begin 
		create table historial( id_historial int auto_increment,
		fecha date,
        descripcion varchar(50),
        monto int,
        id_tipoOperacion int,
        id_transaccion int,
        primary key(id_historial),
        foreign key(id_tipoOperacion) references tipoOperacion(id_tipoOperacion),
        foreign key(id_transaccion) references transaccion(id_transaccion)
        );
	end $$
delimiter ;

#....................Llamada de tablas............
call tabla_1; 
call tabla_2; 
call tabla_3; 
call tabla_4; 
call tabla_5; 
call tabla_6; 
call tabla_7; 
call tabla_8;
call tabla_9; 
call tabla_10; 
call tabla_11; 
call tabla_12; 
call tabla_13; 
call tabla_14; 
call tabla_15; 
call tabla_16;
call tabla_17; 
call tabla_18; 
call tabla_19; 
call tabla_20; 
call tabla_21; 

#...............Ingreso de datos en tabla...................
delimiter $$
create procedure ingresarNacionalidad(in nombre varchar(20))
begin 
	insert into nacionalidad(nombre) values (nombre);
end $$
delimiter ;

delimiter $$
create procedure ingresarIdentificacion(in nombre varchar(20), in numero int)
begin 
	insert into identificacion(nombre,numero) values (nombre,numero);
end $$
delimiter ;

delimiter $$
create procedure ingresarTipoCuenta(in nombre varchar(20))
begin 
	insert into tipoCuenta(nombre) values (nombre);
end $$
delimiter ;

delimiter $$
create procedure ingresarMoneda(in nombre varchar(20))
begin 
	insert into moneda(nombre) values (nombre);
end $$
delimiter ;

delimiter $$
create procedure ingresarTipoOperacion(in nombre varchar(20))
begin 
	insert into tipoOperacion(nombre) values (nombre);
end $$
delimiter ;

delimiter $$
create procedure ingresarEstado(in nombre varchar(20))
begin 
	insert into estado(nombre) values (nombre);
end $$
delimiter ;

delimiter $$
create procedure ingresarServicio(in nombre varchar(20))
begin 
	insert into servicio(nombre) values (nombre);
end $$
delimiter ;

delimiter $$
create procedure ingresarTarjetaCredito(in limiteCredito int, in tasaInteres int, in id_tipoCuenta int)
begin 
	insert into tarjetaCredito(limiteCredito,tasaInteres,id_tipoCuenta) values (limiteCredito,tasaInteres,id_tipoCuenta);
end $$
delimiter ;

delimiter $$
create procedure ingresarPrestamo(in capitalAdeudado int, in capitalPagado int, in tasaInteres int, in id_tipoCuenta int)
begin 
	insert into prestamo(capitalAdeudao,capitalPagado,tasaInteres,id_tipoCuenta) values (capitalAdeudado,capitalPagado,tasaInteres,id_tipoCuenta);
end $$
delimiter ;

delimiter $$
create procedure ingresarFondosPension(in tasaInteres int, in plazo varchar(20),in id_tipoCuenta int)
begin 
	insert into fondosPension(tasaInteres,plazo,id_tipoCuenta) values (tasaInteres,plazo,id_tipoCuenta);
end $$
delimiter ;

delimiter $$
create procedure ingresarCliente(in nombre varchar(20), in apellido varchar(20),in direccion varchar(20), in telefono int, in celular int, in sexo char,
	in id_identificacion int, in id_nacionalidad int)
begin 
	insert into cliente(nombre,apellido,direccion,telefono,celular,sexo,id_identificacion,id_nacionalidad) values (nombre,apellido,direccion,telefono,celular,
    sexo,id_identificacion,id_nacionalidad);
end $$
delimiter ;

delimiter $$
create procedure ingresarUsuario(in id_cliente int, in nombre varchar(20),in contraseña varchar(20), in fechaCreacion date, in id_estado int)
begin 
	insert into usuario(id_cliente,nombre,contraseña,fechaCreacion,id_estado) values (id_cliente,nombre,contraseña,fechaCreacion,id_estado);
end $$
delimiter ;

delimiter $$
create procedure ingresarCuenta(in saldo int, in id_tipoCuenta int, in id_usuario int ,in id_moneda int)
begin 
	insert into cuenta(saldo,id_tipoCuenta,id_usuario,id_moneda) values (saldo,id_tipoCuenta,id_usuario,id_moneda);
end $$
delimiter ;

 delimiter $$
create procedure ingresarProveedor(in nombre varchar(20), in id_servicio int)
begin 
	insert into proveedor(nombre,id_servicio) values (nombre,id_servicio);
end $$
delimiter ;

 delimiter $$
create procedure ingresarPagoCole(in carne int, in monto int, in id_servicio int, in id_proveedor int)
begin 
	insert into pagoCole(carne,monto,id_servicio,id_proveedor) values (carne,monto,id_servicio,id_proveedor);
end $$
delimiter ;

 delimiter $$
create procedure ingresarPagoUni(in carne int, in monto int, in id_servicio int, in id_proveedor int)
begin 
	insert into pagoUni(carne,monto,id_servicio,id_proveedor) values (carne,monto,id_servicio,id_proveedor);
end $$
delimiter ;

 delimiter $$
create procedure ingresarPagoLuz(in numCorrelativo int, in monto int, in id_servicio int, in id_proveedor int)
begin 
	insert into pagoLuz(numCorrelativo,monto,id_servicio,id_proveedor) values (numCorrelativo,monto,id_servicio,id_proveedor);
end $$
delimiter ;

 delimiter $$
create procedure ingresarPagoTelefono(in numCelular int, in monto int, in id_servicio int, in id_proveedor int)
begin 
	insert into pagoTelefono(numCelular,monto,id_servicio,id_proveedor) values (numCelular,monto,id_servicio,id_proveedor);
end $$
delimiter ;

 delimiter $$
create procedure ingresarPagoAgua(in numCasa int, in monto int, in id_servicio int, in id_proveedor int)
begin 
	insert into PagoAgua(numCasa,monto,id_servicio,id_proveedor) values (numCasa,monto,id_servicio,id_proveedor);
end $$
delimiter ;

 delimiter $$
create procedure ingresarTrasanccion(in id_usuario int, in numCuenta int, in id_servicio int, in id_proveedor int)
begin 
	insert into transaccion(id_usuario,numCuenta,id_servicio,id_proveedor) values (id_usuario,numCuenta,id_servicio,id_proveedor);
end $$
delimiter ;

 delimiter $$
create procedure ingresarHistorial(in fecha date, in descripcion varchar(100), in monto int, in id_tipoOperacion int, in id_transaccion int)
begin 
	insert into historial(fecha,descripcion,monto,id_tipoOperacion,id_transaccion) values (fecha,descripcion,monto,id_tipoOperacion,id_transaccion);
end $$
delimiter ;

#...........Ingreso de datos.............
call ingresarNacionalidad('Guatemala');
call ingresarNacionalidad('China');

call ingresarIdentificacion('DPI',1);
call ingresarIdentificacion('DPI',2);
call ingresarIdentificacion('Pasaporte',30);

call ingresarTipoCuenta('Tarjeta de Credito');
call ingresarTipoCuenta('Prestamos');
call ingresarTipoCuenta('Fondos Pension');

call ingresarMoneda('Quetzales');
call ingresarMoneda('Dolares');
call ingresarMoneda('Euros');

call ingresarTipoOperacion('Credito');
call ingresarTipoOperacion('Debito');

call ingresarEstado('Habilitado');
call ingresarEstado('Deshabilitado Temp.');

call ingresarServicio('Pago Luz');
call ingresarServicio('Pago Agua');
call ingresarServicio('Pago Telefono');
call ingresarServicio('Pago Universidad');
call ingresarServicio('Pago Colegio');

call ingresarTarjetaCredito(15000,23,1);
call ingresarTarjetaCredito(20000,20,1);

call ingresarPrestamo(5000,3000,40,2);
call ingresarPrestamo(50000,20000,25,2);

call ingresarFondosPension(10,12,3);
call ingresarFondosPension(15,24,3);

call ingresarCliente('Marcela','Stegen','Zona 15',28749434,59838523,'M',1,1);
call ingresarCliente('Jasper','Cillisen','Zona 1',20837564,57349275,'F',2,1);
call ingresarCliente('Megan','Raphinoe','Zona 21',24872412,50348971,'F',3,2);

call ingresarUsuario(1,'MarcelaSteg21','U7dMujhu76','2019-2-23',1);
call ingresarUsuario(2,'JasperCilli13','fd8AHD57uH','2019-4-11',2);
call ingresarUsuario(3,'MeganRaph10','jniu6F6F32','2019-6-30',1);

call ingresarCuenta(23000,1,1,1);
call ingresarCuenta(27000,2,1,2);
call ingresarCuenta(30000,1,2,3);
call ingresarCuenta(35000,3,2,1);
call ingresarCuenta(10000,2,3,2);
call ingresarCuenta(18000,3,3,3);

call ingresarProveedor('EEGSA',1);
call ingresarProveedor('EMPAGUA',2);
call ingresarProveedor('Claro',3);
call ingresarProveedor('Landivar',4);
call ingresarProveedor('KINAL',5);

call ingresarPagoCole(1,2000,5,5);
call ingresarPagoCole(2,3000,5,5);

call ingresarPagoUni(3,10000,4,4);
call ingresarPagoUni(4,8000,4,4);

call ingresarPagoLuz(412,89,1,1);
call ingresarPagoLuz(673,93,1,1);

call ingresarPagoTelefono(57349821,450,3,3);
call ingresarPagoTelefono(52394811,300,3,3);

call ingresarPagoAgua(535,150,2,2);
call ingresarPagoAgua(1123,120,2,2);

call ingresarTrasanccion(1,1,1,1);
call ingresarTrasanccion(1,2,2,2);
call ingresarTrasanccion(2,3,3,3);
call ingresarTrasanccion(2,4,4,4);
call ingresarTrasanccion(3,5,5,5);
call ingresarTrasanccion(3,6,3,3);

call ingresarHistorial('2019-4-5','Pago de luz mensual de su casa',412,1,1);
call ingresarHistorial('2019-5-10','Pago de agua mensual de su casa',150,2,2);
call ingresarHistorial('2019-6-15','Pago de telefono mensual',450,1,3);
call ingresarHistorial('2019-7-20','Pago de universidad mensual',10000,2,4);
call ingresarHistorial('2019-8-25','Pago de colegio mensual',2000,1,5);
call ingresarHistorial('2019-9-30','Pago de telefono mensual',300,2,6);