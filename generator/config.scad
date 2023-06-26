/*
    Set your I2C expander dimensions, provide exact values measured. Tolerance will be added automatically
*/
EXPANDER_WIDTH = 26.6;
EXPANDER_DEPTH = 21.3;
EXPANDER_EXPOSED = true;

/*
    Z position of individual keys. 1.0 = 19.05mm. Use 0.25 step ie. 0.25, 0.5, 0.75, 2.5, 2.75 etc.

                | ENC | TN | EI | SO |
                | TB1 | FF |         | AP |
          | TB2 |
    | TB3 |

*/
TB3_Z = 0.75;    
TB2_Z = 0.75;
TB1_Z = 0.75;
FF_Z = 0.375;
TN_Z = 0.5;
EI_Z = 0.25;
SO_Z = 0.125;
AP_Z = 0.25;
ENC_Z = 0.625;

/* 
    If true will generate right side with trackball etc. otherwise left side with encoder
*/
RIGHT_SIDE = false; 

/*
    Type of socket to generate. "choc" for Choc or "mx" for MX compatible socket
*/
GENERATE = "choc";

/*
    Generate holes for heat inserts?If false then M2 screw
*/
HEAT_INSERTS = true;

/* 
    Proximity sensor
*/
IR_SENSOR = true;

/* 
    Socket tolerance, change to make sockets tighter/more lose
*/
SOCKET_TOLERANCE = -0.11;

/*
    Encoder socket tolerance, only for horizontal encoder
*/
ENCODER_SOCKET_TOLERANCE = 0;


include <chordie.scad>