use <write/Write.scad>




ticket_laenge=200;
ticket_breite=81;

spatzig=5;
rand=2;

hoehe=80;

translate([-(ticket_laenge+spatzig+2*rand)/2,-(ticket_breite+spatzig+2*rand)/2,0]){
difference(){
cube([ticket_laenge+spatzig+2*rand,ticket_breite+spatzig+2*rand,hoehe]);

translate([rand,rand,rand])cube([ticket_laenge*2,ticket_breite+spatzig,hoehe]);
}
}



writecube("STAGE DAYS",[0,0,hoehe/2],[ticket_laenge+spatzig+2*rand,ticket_breite+spatzig+2*rand,hoehe],face="front",h=20); 

writecube("STAGE DAYS",[0,0,hoehe/2],[ticket_laenge+spatzig+2*rand,ticket_breite+spatzig+2*rand,hoehe],face="back",h=20); 