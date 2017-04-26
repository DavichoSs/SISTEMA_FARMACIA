/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     25/04/2017 21:07:25                          */
/*==============================================================*/
/*INTEGRANTES:*/
/*CHAMBA JEAN CARLOS*/
/*FIGUEROA ALEXANDER*/
/*POZO RUBEN*/

CREATE DATABASE FARMACIA
USE FARMACIA


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CABECERA_FAC') and o.name = 'FK_CABECERA_RELATIONS_CLIENTE')
alter table CABECERA_FAC
   drop constraint FK_CABECERA_RELATIONS_CLIENTE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CLIENTE') and o.name = 'FK_CLIENTE_RELATIONS_SUCURSAL')
alter table CLIENTE
   drop constraint FK_CLIENTE_RELATIONS_SUCURSAL
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DETALLE_FAC') and o.name = 'FK_DETALLE__RELATIONS_CABECERA')
alter table DETALLE_FAC
   drop constraint FK_DETALLE__RELATIONS_CABECERA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('EMPLEADO') and o.name = 'FK_EMPLEADO_RELATIONS_CARGO')
alter table EMPLEADO
   drop constraint FK_EMPLEADO_RELATIONS_CARGO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('EMPLEADO') and o.name = 'FK_EMPLEADO_RELATIONS_SUCURSAL')
alter table EMPLEADO
   drop constraint FK_EMPLEADO_RELATIONS_SUCURSAL
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PRODUCTO') and o.name = 'FK_PRODUCTO_RELATIONS_PRODUCTO')
alter table PRODUCTO
   drop constraint FK_PRODUCTO_RELATIONS_PRODUCTO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PRODUCTO') and o.name = 'FK_PRODUCTO_RELATIONS_SUCURSAL')
alter table PRODUCTO
   drop constraint FK_PRODUCTO_RELATIONS_SUCURSAL
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PRODUCTO') and o.name = 'FK_PRODUCTO_RELATIONS_PROVEEDO')
alter table PRODUCTO
   drop constraint FK_PRODUCTO_RELATIONS_PROVEEDO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SUCURSAL') and o.name = 'FK_SUCURSAL_RELATIONS_TIPO_SUC')
alter table SUCURSAL
   drop constraint FK_SUCURSAL_RELATIONS_TIPO_SUC
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CABECERA_FAC')
            and   name  = 'RELATIONSHIP_4_FK'
            and   indid > 0
            and   indid < 255)
   drop index CABECERA_FAC.RELATIONSHIP_4_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CABECERA_FAC')
            and   type = 'U')
   drop table CABECERA_FAC
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CARGO')
            and   type = 'U')
   drop table CARGO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CLIENTE')
            and   name  = 'RELATIONSHIP_13_FK'
            and   indid > 0
            and   indid < 255)
   drop index CLIENTE.RELATIONSHIP_13_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CLIENTE')
            and   type = 'U')
   drop table CLIENTE
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DETALLE_FAC')
            and   name  = 'RELATIONSHIP_12_FK'
            and   indid > 0
            and   indid < 255)
   drop index DETALLE_FAC.RELATIONSHIP_12_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DETALLE_FAC')
            and   type = 'U')
   drop table DETALLE_FAC
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('EMPLEADO')
            and   name  = 'RELATIONSHIP_5_FK'
            and   indid > 0
            and   indid < 255)
   drop index EMPLEADO.RELATIONSHIP_5_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('EMPLEADO')
            and   name  = 'RELATIONSHIP_1_FK'
            and   indid > 0
            and   indid < 255)
   drop index EMPLEADO.RELATIONSHIP_1_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('EMPLEADO')
            and   type = 'U')
   drop table EMPLEADO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PRODUCTO')
            and   name  = 'RELATIONSHIP_9_FK'
            and   indid > 0
            and   indid < 255)
   drop index PRODUCTO.RELATIONSHIP_9_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PRODUCTO')
            and   name  = 'RELATIONSHIP_8_FK'
            and   indid > 0
            and   indid < 255)
   drop index PRODUCTO.RELATIONSHIP_8_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PRODUCTO')
            and   type = 'U')
   drop table PRODUCTO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PROVEEDOR')
            and   type = 'U')
   drop table PROVEEDOR
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SUCURSAL')
            and   name  = 'RELATIONSHIP_10_FK'
            and   indid > 0
            and   indid < 255)
   drop index SUCURSAL.RELATIONSHIP_10_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SUCURSAL')
            and   type = 'U')
   drop table SUCURSAL
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TIPO_SUCURSAL')
            and   type = 'U')
   drop table TIPO_SUCURSAL
go

/*==============================================================*/
/* Table: CABECERA_FAC                                          */
/*==============================================================*/
create table CABECERA_FAC (
   NUMFAC_CAB           int                  not null,
   CI_CLI               int                  null,
   SRI_CAB              int                  not null,
   constraint PK_CABECERA_FAC primary key nonclustered (NUMFAC_CAB)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_4_FK on CABECERA_FAC (
CI_CLI ASC
)
go

/*==============================================================*/
/* Table: CARGO                                                 */
/*==============================================================*/
create table CARGO (
   ID_CAR               int                  not null,
   DES_CAR              varchar(15)          not null,
   constraint PK_CARGO primary key nonclustered (ID_CAR)
)
go

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   CI_CLI               int                  not null,
   ID_SUC               int                  null,
   NOM_CLI              varchar(30)          not null,
   APE_CLI              varchar(30)          not null,
   EMAIL_CLI            varchar(30)          not null,
   TLF_CLI              int                  not null,
   constraint PK_CLIENTE primary key nonclustered (CI_CLI)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_13_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_13_FK on CLIENTE (
ID_SUC ASC
)
go

/*==============================================================*/
/* Table: DETALLE_FAC                                           */
/*==============================================================*/
create table DETALLE_FAC (
   CANT_DET             int                  not null,
   ID_PROD              int                  null,
   NUMFAC_CAB           int                  null,
   DESC_DET             varchar(30)          not null,
   VT_DET               decimal              not null,
   IVA_DET              decimal              not null,
   DSCTO_DET            decimal              not null,
   TOTALPAGAR_DET       decimal              not null,
   constraint PK_DETALLE_FAC primary key nonclustered (CANT_DET)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_12_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_12_FK on DETALLE_FAC (
NUMFAC_CAB ASC
)
go

/*==============================================================*/
/* Table: EMPLEADO                                              */
/*==============================================================*/
create table EMPLEADO (
   CI_EMPL              int                  not null,
   ID_CAR               int                  null,
   ID_SUC               int                  null,
   NOM_EMPL             varchar(30)          not null,
   APE_EMPL             varchar(30)          not null,
   EMAIL_EMPL           varchar(30)          null,
   TLF_EMPL             int                  not null,
   constraint PK_EMPLEADO primary key nonclustered (CI_EMPL)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_1_FK on EMPLEADO (
ID_CAR ASC
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_5_FK on EMPLEADO (
ID_SUC ASC
)
go

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO (
   ID_PROD              int                  not null,
   ID_SUC               int                  null,
   RUC_PVDR             int                  null,
   NOM_PROD             varchar(30)          not null,
   DES_PROD             varchar(30)          not null,
   PU_PROD              decimal              not null,
   STOCK_PROD           decimal              not null,
   constraint PK_PRODUCTO primary key nonclustered (ID_PROD)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_8_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_8_FK on PRODUCTO (
ID_SUC ASC
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_9_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_9_FK on PRODUCTO (
RUC_PVDR ASC
)
go

/*==============================================================*/
/* Table: PROVEEDOR                                             */
/*==============================================================*/
create table PROVEEDOR (
   RUC_PVDR             int                  not null,
   NOM_PVDR             varchar(30)          not null,
   RAZONSOCIAL_PVDR     varchar(30)          not null,
   DIR_PVDR             varchar(30)          not null,
   TLF_PVDR             int                  not null,
   EMAIL_PVDR           varchar(30)          not null,
   constraint PK_PROVEEDOR primary key nonclustered (RUC_PVDR)
)
go

/*==============================================================*/
/* Table: SUCURSAL                                              */
/*==============================================================*/
create table SUCURSAL (
   ID_SUC               int                  not null,
   ID_TIPO              int                  null,
   DIR_SUC              varchar(30)          not null,
   TLF_SUC              int                  not null,
   RESPONSABLE_SUC      varchar(30)          not null,
   CIUDAD_SUC           varchar(30)          not null,
   constraint PK_SUCURSAL primary key nonclustered (ID_SUC)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_10_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_10_FK on SUCURSAL (
ID_TIPO ASC
)
go

/*==============================================================*/
/* Table: TIPO_SUCURSAL                                         */
/*==============================================================*/
create table TIPO_SUCURSAL (
   ID_TIPO              int                  not null,
   DES_TIPO             varchar(30)          not null,
   constraint PK_TIPO_SUCURSAL primary key nonclustered (ID_TIPO)
)
go

alter table CABECERA_FAC
   add constraint FK_CABECERA_RELATIONS_CLIENTE foreign key (CI_CLI)
      references CLIENTE (CI_CLI)
go

alter table CLIENTE
   add constraint FK_CLIENTE_RELATIONS_SUCURSAL foreign key (ID_SUC)
      references SUCURSAL (ID_SUC)
go

alter table DETALLE_FAC
   add constraint FK_DETALLE__RELATIONS_CABECERA foreign key (NUMFAC_CAB)
      references CABECERA_FAC (NUMFAC_CAB)
go

alter table EMPLEADO
   add constraint FK_EMPLEADO_RELATIONS_CARGO foreign key (ID_CAR)
      references CARGO (ID_CAR)
go

alter table EMPLEADO
   add constraint FK_EMPLEADO_RELATIONS_SUCURSAL foreign key (ID_SUC)
      references SUCURSAL (ID_SUC)
go

alter table PRODUCTO
   add constraint FK_PRODUCTO_RELATIONS_PRODUCTO foreign key (ID_PROD)
      references PRODUCTO (ID_PROD)
go

alter table PRODUCTO
   add constraint FK_PRODUCTO_RELATIONS_SUCURSAL foreign key (ID_SUC)
      references SUCURSAL (ID_SUC)
go

alter table PRODUCTO
   add constraint FK_PRODUCTO_RELATIONS_PROVEEDO foreign key (RUC_PVDR)
      references PROVEEDOR (RUC_PVDR)
go

alter table SUCURSAL
   add constraint FK_SUCURSAL_RELATIONS_TIPO_SUC foreign key (ID_TIPO)
      references TIPO_SUCURSAL (ID_TIPO)
go


insert into TIPO_SUCURSAL values(1,'Principal')
insert into TIPO_SUCURSAL values(2,'Suc_Norte')
insert into TIPO_SUCURSAL values(3,'Suc_Sur')
insert into TIPO_SUCURSAL values(4,'Suc_Valle')

insert into CARGO values(11,'Gerente')
insert into CARGO values(22,'Sub Gerente')
insert into CARGO values(33,'Administador')
insert into CARGO values(44,'Cajero')
insert into CARGO values(55,'Empleado')
insert into CARGO values(66,'Auxiliar')

insert into CLIENTE values(1718130733,1,'Rubén', 'Pozo','rpozo@gmail.com',5006327)
insert into CLIENTE values(1712457733,1,'María', 'Pérez','mperez@gmail.com',5124527)
insert into CLIENTE values(1712130733,2,'Carlos', 'Ochoa','cochoa@gmail.com',2014327)
insert into CLIENTE values(1718140235,2,'José', 'Terán','jteran@gmail.com',1105327)
insert into CLIENTE values(1719130722,2,'Isabel', 'Pantoja','ipantoja@gmail.com',5006111)
insert into CLIENTE values(17201307300,3,'Jean', 'Chamba','jchamba@gmail.com',1206311)
insert into CLIENTE values(1717130705,3,'Marco', 'Zurita','mzurita@gmail.com',6006327)
insert into CLIENTE values(19548130111,4,'Susana', 'Peña','speña@gmail.com',4525365)

insert into SUCURSAL values(1,1,'Amazonas n12', 5688522,'Angel Mena','Quito')
insert into SUCURSAL values(2,4,'Carcelen n66', 3338522,'patricia Flores','Quito')
insert into SUCURSAL values(3,2,'Chillogallo E10', 2288524,'Carolina Suarez','Guayaquil')
insert into SUCURSAL values(4,3,'Cumbaya S05', 5688147,'José Chamba','Esmeraldas')

insert into PROVEEDOR values(1,'TECNOFARM','FARMACI','QUITO',59897654,'farm1@gmail.com')
insert into PROVEEDOR values(2,'CURASAN','FARMACI2','GUAYAQUIL',112497654,'farm2@gmail.com')
insert into PROVEEDOR values(3,'MEDICTEC','FARMACI3','MANTA',14563654,'farm3@gmail.com')
insert into PROVEEDOR values(4,'FARMLIN','FARMACI4','CUANCA',3357654,'farm4@gmail.com')

insert into PRODUCTO values(10,2,3,'ASPIRINA','CURA DOLOR DE CABEZA',5.20,45)
insert into PRODUCTO values(20,1,4,'TEMPRA','BAJA LA FIEBRE',6.90,20)
insert into PRODUCTO values(30,3,2,'IBUPROFENO','CALMA EL DOLOR',3.50,30)
insert into PRODUCTO values(40,4,1,'CURITAS','PARA CORTADURAS',1.810,10)

insert into EMPLEADO values(191161301,44,1,'Susana', 'Peña','speña@gmail.com',4526665)
insert into EMPLEADO values(195481303,33,2,'Carmen', 'Lopez','cperez@gmail.com',3655365)
insert into EMPLEADO values(19548130,11,3,'Teresa', 'León','tleon@gmail.com',4525311)
insert into EMPLEADO values(18568130,22,4,'Mario', 'Simbaña','msimbaña@gmail.com',5895365)

Insert into DETALLE_FAC values (2,10,1,'curitas',3.52,0.14,0.5, 3.69)
Insert into DETALLE_FAC values (6,30,2,'aspirinas',5.52,0.14,0.3, 9.69)
Insert into DETALLE_FAC values (8,40,3,'tempra',7.52,0.14,0.2, 8.69)
Insert into DETALLE_FAC values (10,20,4,'ibuprofeno',6.45,0.14,0.8, 7.69)

Insert into CABECERA_FAC values (1,1718130733,4)
Insert into CABECERA_FAC values (2,1712457733,3)
Insert into CABECERA_FAC values (3,1712130733,2)
Insert into CABECERA_FAC values (4,1718140235,1)