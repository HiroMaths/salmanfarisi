program SMS;
     uses wincrt;
type
 Jam = Record
  HH1 : integer[0..23] ;
  HH2 : integer[0..23] ;
  MM1 : integer[0..59] ;
  MM2 : integer[0..59] ;
  SS1 : integer[0..59] ;
  SS2 : integer[0..59] ;
end;


 var
   J : Jam;
   S : real;  {sqrt(xySum)}
   HHDif : integer;  {beda jam}
   MMDif : integer;  {beda menit}
   SSDif : integer; {beda detik}
   SStDif : integer; {beda detik setelah dikonversi ke detik}
   HHS1 : integer; {jam setelah dikonversi ke detik}
   MMS1 : integer; {menit setelah dikonversi ke detik}
   HHS2 : integer; {jam setelah dikonversi ke detik}
   MMS2 : integer; {menit setelah dikonversi ke detik}


 begin
   {membaca informasi jam}
   writeln('Waktu mengirim SMS (J1) : ');
   writeln('Format HH MM SS');
   read(J.HH1);
   read(J.MM1);
   read(J.SS1);
   writeln(' ');

   writeln('Waktu menerima SMS (J2) : ');
   writeln('Format HH MM SS');
   read(J.HH2);
   read(J.MM2);
   read(J.SS2);
   writeln(' ');

   {menampilkan data yang telah dimasukan}
   write('Informasi waktu pengiriman SMS : ');
   write(J.HH1);
   write(J.MM1);
   writeln(J.SS1);

   write('Informasi waktu penerimaan SMS : ');
   write(J.HH2);
   write(J.MM2);
   writeln(J.SS2);

   HHS1 := HH1 *3600;  {mengubah jam ke detik}
   HHS2 := HH2 *3600;
   MMS1 := MM1 *60; {mengubah menit ke detik}
   MMS2 := MM2 *60;
   SSDif := SS2-SS1;     {beda detik}
   MMDif := MM2-MM1;     {beda menit}
   HHDif := HH2-HH1;     {beda jam}
   SStDif := SSDif + MMDif*60 + HHDif *3600 {beda dalam detik}

   write('beda waktu J1 dan J2 adalah : ');
   writeln(SStDif, 'detik'); {masih dalam detik}
   write('dalam jam : ');
   write(SStDif/3600); {bisa dibagi karena jika integer dibagi akan membulatkan kebawah}
                      {contohnya 3/2 = 1}
                      {akan menunjukkan perbedaan jam}
   write(':');
   write(mod((SStDif/3600)/60)); {sisa pembagian dengan jam akan menunjukkan menit}
   write(':');
   write(mod(mod((SStDif/3600)/60))/60); {sisa pembagian dengan menit akan menunjukkan bagian detik}

   readln;
 end.
