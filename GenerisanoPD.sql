/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     1/23/2020 2:44:25 PM                         */
/*==============================================================*/


drop table if exists CIVIJE;

drop table if exists DELOVI;

drop table if exists KOBILICE;

drop table if exists KORPUS;

drop table if exists MUZICKI_INSTRUMENT;

drop table if exists PODPROIZVODJAC_CIVIJA;

drop table if exists PODPROIZVODJAC_KOBILICA;

drop table if exists PRODAJA;

drop table if exists PRODAJA_INSTRUMENTA;

drop table if exists TIP_INSTRUMENTA;

drop table if exists ZICE;

/*==============================================================*/
/* Table: CIVIJE                                                */
/*==============================================================*/
create table CIVIJE
(
   CIVIJE_ID            int not null,
   PP_CIVIJE_ID         int,
   TIP                  text not null,
   primary key (CIVIJE_ID)
);

/*==============================================================*/
/* Table: DELOVI                                                */
/*==============================================================*/
create table DELOVI
(
   DELOVI_ID            int not null,
   CIVIJE_ID            int,
   KOBILICE_ID          int,
   KORPUS_ID            int,
   ZICE_ID              int,
   primary key (DELOVI_ID)
);

/*==============================================================*/
/* Table: KOBILICE                                              */
/*==============================================================*/
create table KOBILICE
(
   KOBILICE_ID          int not null,
   PP_KOBILICE_ID       int,
   primary key (KOBILICE_ID)
);

/*==============================================================*/
/* Table: KORPUS                                                */
/*==============================================================*/
create table KORPUS
(
   KORPUS_ID            int not null,
   TIP                  text not null,
   VELICINA             text not null,
   CENA                 text not null,
   DATUM_PRAVLJENJA     date not null,
   primary key (KORPUS_ID)
);

/*==============================================================*/
/* Table: MUZICKI_INSTRUMENT                                    */
/*==============================================================*/
create table MUZICKI_INSTRUMENT
(
   INSTRUMENT_ID        int not null,
   TIP_INSTRUMENTA_ID   int,
   DELOVI_ID            int,
   SERIJSKI_BROJ        text not null,
   CENA                 text not null,
   primary key (INSTRUMENT_ID)
);

/*==============================================================*/
/* Table: PODPROIZVODJAC_CIVIJA                                 */
/*==============================================================*/
create table PODPROIZVODJAC_CIVIJA
(
   PP_CIVIJE_ID         int not null,
   MARKA                text not null,
   VELICINA             text not null,
   CENA                 text not null,
   DATUM_PRAVLJENJA     date not null,
   primary key (PP_CIVIJE_ID)
);

/*==============================================================*/
/* Table: PODPROIZVODJAC_KOBILICA                               */
/*==============================================================*/
create table PODPROIZVODJAC_KOBILICA
(
   PP_KOBILICE_ID       int not null,
   MARKA                text not null,
   CENA                 text not null,
   DATUM_PRAVLJENJA     date not null,
   primary key (PP_KOBILICE_ID)
);

/*==============================================================*/
/* Table: PRODAJA                                               */
/*==============================================================*/
create table PRODAJA
(
   PRODAJA_ID           int not null,
   CENA                 text not null,
   LOKACIJA             text not null,
   DATUM                date not null,
   primary key (PRODAJA_ID)
);

/*==============================================================*/
/* Table: PRODAJA_INSTRUMENTA                                   */
/*==============================================================*/
create table PRODAJA_INSTRUMENTA
(
   PRODAJA_INSTRUMENTA_ID int not null,
   PRODAJA_ID           int,
   INSTRUMENT_ID        int,
   primary key (PRODAJA_INSTRUMENTA_ID)
);

/*==============================================================*/
/* Table: TIP_INSTRUMENTA                                       */
/*==============================================================*/
create table TIP_INSTRUMENTA
(
   TIP_INSTRUMENTA_ID   int not null,
   TIP_INSTRUMENTA      text not null,
   primary key (TIP_INSTRUMENTA_ID)
);

/*==============================================================*/
/* Table: ZICE                                                  */
/*==============================================================*/
create table ZICE
(
   ZICE_ID              int not null,
   TIP                  text,
   DATUM_PRAVLJENJA     date,
   primary key (ZICE_ID)
);

alter table CIVIJE add constraint FK_9 foreign key (PP_CIVIJE_ID)
      references PODPROIZVODJAC_CIVIJA (PP_CIVIJE_ID) on delete restrict on update restrict;

alter table DELOVI add constraint FK_5 foreign key (CIVIJE_ID)
      references CIVIJE (CIVIJE_ID) on delete restrict on update restrict;

alter table DELOVI add constraint FK_6 foreign key (KOBILICE_ID)
      references KOBILICE (KOBILICE_ID) on delete restrict on update restrict;

alter table DELOVI add constraint FK_7 foreign key (KORPUS_ID)
      references KORPUS (KORPUS_ID) on delete restrict on update restrict;

alter table DELOVI add constraint FK_8 foreign key (ZICE_ID)
      references ZICE (ZICE_ID) on delete restrict on update restrict;

alter table KOBILICE add constraint FK_10 foreign key (PP_KOBILICE_ID)
      references PODPROIZVODJAC_KOBILICA (PP_KOBILICE_ID) on delete restrict on update restrict;

alter table MUZICKI_INSTRUMENT add constraint FK_3 foreign key (TIP_INSTRUMENTA_ID)
      references TIP_INSTRUMENTA (TIP_INSTRUMENTA_ID) on delete restrict on update restrict;

alter table MUZICKI_INSTRUMENT add constraint FK_4 foreign key (DELOVI_ID)
      references DELOVI (DELOVI_ID) on delete restrict on update restrict;

alter table PRODAJA_INSTRUMENTA add constraint FK_1 foreign key (PRODAJA_ID)
      references PRODAJA (PRODAJA_ID) on delete restrict on update restrict;

alter table PRODAJA_INSTRUMENTA add constraint FK_2 foreign key (INSTRUMENT_ID)
      references MUZICKI_INSTRUMENT (INSTRUMENT_ID) on delete restrict on update restrict;

