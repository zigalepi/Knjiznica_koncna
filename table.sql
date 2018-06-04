create table Kraj(
idKraj int  auto_increment,
postanSt int not null,
naziv varchar(45),
primary key (idKraj)
);

create table Naslov(
idNaslov int auto_increment,
ulica varchar (45),
hisnaSt int not null,
tk_idKraj int not null,
primary key (idNaslov),
foreign key (tk_idKraj) references Kraj(idKraj)
);

create table Uporabnik (
idUporabnik int auto_increment,
ime varchar(45) not null,
priimek varchar(45) not null,
upIme varchar (45) not null,
geslo varchar (80) not null,
email varchar (45) not null,
tk_idNaslov int not null,
primary key(idUporabnik),
foreign key (tk_idNaslov)references Naslov (idNaslov)
);

create table Knjiga (
idKnjiga int auto_increment,
naslov varchar(45),
avtor varchar (45),
isbn int not null,
zalozba varchar(45) not null,
letoIzdaje int,
prevod varchar(45),
ilustracije varchar(45),
zanr varchar(45),
publika varchar(45),
lokacija varchar (60),
tk_idUporabnik int not null,
navoljo int not null,uporabnik
primary key (idKnjiga),
foreign key (tk_idUporabnik)references Uporabnik (idUporabnik)
);

create table Izposoja (
idIzposoja int auto_increment,
datumeIzposoje date not null,
datumVrnitve date,
tk_idUporabnik int not null,
tk_idKnjiga int not null,
primary key (idIzposoja),
foreign key (tk_idUporabnik)references Uporabnik (idUporabnik),
foreign key (tk_idKnjiga)references Knjiga (idKnjiga)
);

create table Komentar (
idKomentar int auto_increment,
vsebina varchar(150),
tk_idKnjiga int not null,
primary key (idKomentar),
foreign key(tk_idKnjiga)references Knjiga (idKnjiga)
);

create table tipKomentarja (
idtipKomentarja int auto_increment,
naziv varchar(45),
tk_idKomentar int not null,
primary key (idtipKomentarja),
foreign key(tk_idKomentar)references Komentar (idKomentar)

);