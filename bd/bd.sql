create database almacen;
use almacen;

Create table usuario(
id int auto_increment not null,
nombre varchar(100) not null,
apellidos varchar(255),
email varchar(255) not null,
password varchar(255) not null,
rol varchar(20),
imagen varchar(255),
Constraint pk_usuarios Primary key(id),
constraint uq_email unique(email)
)ENGINE=InnoDb;

insert into usuario values (NULL, "admin", "admin", "admin@admin.com", "123456", "admin", null);

create table categoria(
id int auto_increment not null, 
nombre varchar(100) not null,
Constraint pk_categoria Primary key(id)
)ENGINE=InnoDb;

insert into categoria values (NULL, "Categoria1");
insert into categoria values (NULL, "Categoria2");
insert into categoria values (NULL, "Categoria3");

Create table producto(
id int auto_increment not null,
id_categoria int not null,
nombre varchar(100) not null,
descripcion text,
precio float(100,2) not null,
stock int not null,
oferta varchar(2), 
fecha date not null,
imagen varchar(255),
Constraint pk_producto Primary key(id),
Constraint fk_producto_categoria Foreign key (id_categoria) references categoria(id)
)ENGINE=InnoDb;

insert into producto values (NULL, 2,"producto1", "producto de prueba", 100.22, "no","2022-09-09", null);

create table pedido(
id int auto_increment not null,
id_usuario int not null,
provincia varchar(100) not null,
localidad varchar(255) not null,
direccion varchar(255) not null,
total float(100,2) not null,
estado varchar(20) not null , 
fecha date,
hora time,
Constraint pk_pedido Primary key(id),
Constraint fk_pedido_usuario Foreign key (id_usuario) references usuario(id)
)ENGINE=InnoDb;

create table detalle_pedido(
id int auto_increment not null,
id_pedido int not null,
id_producto int not null,
constraint pk_detalle_pedido primary key (id),
constraint fk_detalle_pedido_pedido Foreign key (id_pedido) references pedido(id),
constraint fk_detalle_pedido_producto Foreign key (id_producto) references producto(id)
)ENGINE=InnoDb