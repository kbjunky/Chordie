

GRID_SIZE = 19.05;  //Socket outer size

CHOC_SOCKET = [["type", "choc"], ["height", 5.2]];
MX_SOCKET = [["type", "mx"], ["height", 8.2]];
ENC_SOCKET = [["type", "encoder"], ["height", 6]];
BASEPLATE = [["height", 4.2]];
EXPANDER = [["width", EXPANDER_WIDTH+expander_tolerance()], ["depth", EXPANDER_DEPTH+expander_tolerance()], ["position", [83.38, 1*GRID_SIZE, 0]]];
PROXIMITY_SENSOR = [["position", [71.44, 62.09, 0]]];

SOCKET = (GENERATE == "mx") ? MX_SOCKET : CHOC_SOCKET;

function TranslateSwitch(x, y, z) = [x*GRID_SIZE, y*GRID_SIZE, z*GRID_SIZE];    //Translate switch according to grid
function setup_generator(socket_type) = socket_type == "mx" ? MX_SOCKET : CHOC_SOCKET;
function lor(con, lval, rval) = (con) ? lval : rval; // "left or right", depending on which side is generated will return different value
function expander_tolerance() = lor(EXPANDER_EXPOSED, 0.1, 0.2);

//helper functions for managing lists, parameter extraction etc
function is_in(set, value) = set[0]==value ? true : false;
function tail(set) = len(set) >1 ? [for(i=[1:1:len(set)-1]) set[i]] : undef;
function head(set) = is_list(set) ? set[0] : undef;
function get(set, value) = set == undef ? undef : is_in(head(set), value) ? head(set)[1] : get(tail(set), value); 

function type_of(set) = get(set, "type");   

function position_of(set) = get(set, "position");   
function rotation_of(set) = get(set, "rotation");   

function height_of(set) = get(set, "height");    
function depth_of(set) = get(set, "depth");
function width_of(set) = get(set, "width");


switch_placement = [
    [   //TB3
        ["position", TranslateSwitch(0,0,TB3_Z)],
        ["rotation", [0,0,90]],
        ["type", type_of(SOCKET)]
    ],
    [   //TB2
        ["position", TranslateSwitch(1,0.25,TB2_Z)],
        ["rotation", [0,0,90]],
        ["type", type_of(SOCKET)]
    ],
    [   //TB1
        ["position", TranslateSwitch(2,0.5,TB1_Z)],
        ["rotation", [0,0,90]],
        ["type", type_of(SOCKET)]
    ],
    [   //FF
        ["position", TranslateSwitch(3,1.25,FF_Z)],
        ["rotation", [0,0,0]],
        ["type", type_of(SOCKET)]
    ],
    [   //AN
        ["position", TranslateSwitch(2.75,2.25,TN_Z)],
        ["rotation", [0,0,0]],
        ["type", type_of(SOCKET)]
    ],
    [   //SI
        ["position", TranslateSwitch(3.75,2.25,EI_Z)],
        ["rotation", [0,0,0]],
        ["type", type_of(SOCKET)]
    ],
    [   //EO
        ["position", TranslateSwitch(4.75,2.25,SO_Z)],
        ["rotation", [0,0,0]],
        ["type", type_of(SOCKET)]
    ],
    [   //TP
        ["position", TranslateSwitch(5.75,1.25,AP_Z)],
        ["rotation", [0,0,0]],
        ["type", type_of(SOCKET)]
    ],
    [
        //ENC
        ["position", TranslateSwitch(1.75, 2.25, ENC_Z)],
        ["rotation", [0,0,0]],
        ["type", type_of(ENC_SOCKET)]
    ]
];

baseplate_polygon = [
    [-9.53, -9.53],
    [9.53,  -9.53],
    [14.29, -4.76],
    [28.58, -4.76],
    [33.34, 0],
    [47.63, 0],
    [52.39, 4.76],
    [100.01, 4.76],
    [109.54, 14.29],
    [119.06, 14.29],
    [125.06, 20.29],
    [125.06, 27.34],
    [119.06, 33.34],
    [109.54, 33.34],
    [100.01, 42.86],
    [100.01, 52.39],
    [93.06, 59.34],
    [84.52, 59.34],
    [77.82, 66.04],
    [65.05, 66.04],
    [58.35, 59.34],
    [49.81, 59.34],
    [42.86, 52.39],
    [42.86, 19.05],
    [28.57, 19.05],
    [23.81, 14.29],
    [9.52, 14.29],
    [4.76, 9.53],
    [-9.53, 9.53],
    [-15.53, 3.53],
    [-15.53, -3.53]  
];

proximity_sensor_polygon = [
    [-5.19, -2.75],
    [3.76, -2.75],
    [5.19, -1.32],
    [5.19, 1.32],
    [3.76, 2.75],
    [-5.19, 2.75]
];

proximity_sensor_base_polygon = [
    [50.42, 51.4],
    [92.46, 51.4],
    [77.82, 66.04],
    [65.05, 66.04],
];

encoder_cap_polygon = [
    [67.47, 8.54],
    [70.04, 5.96],
    [96.72, 5.96],
    [99.21, 8.45],
    [99.21, 29.64],
    [96.31, 32.54],
    [70.44, 32.54],
    [67.47, 29.57]
];

audio_socket_base_polygon = [
    [42.96, 18.95],
    [28.58, 18.95],
    [28.57, 24.64],
    [23.71, 24.64],
    [23.71, 33.44],
    [42.96, 33.44]
];

heat_insert_holes = [
    ["common", [[-12.21,0], [50.44, 7.52], [121.73, 23.81], [89.77, 55.55], [52.39, 55.55]]],
    ["left", [[33.77, 21.84]]],
    ["right", [[20.2, 29.25], [29.68, 65.21], [-6.2, 55.45]]]
];

module baseplate_extrude() {
    linear_extrude(height_of(BASEPLATE))   
        polygon(baseplate_polygon);
}

module proximity_sensor_extrude() {
    translate(position_of(PROXIMITY_SENSOR)+[0,0,-0.01])            
    linear_extrude(height_of(SOCKET)+position_of(switch_placement[5]).z+0.02+lor(type_of(SOCKET)=="mx",6,1.2))
        polygon(proximity_sensor_polygon);   
}

module proximity_sensor_base_extrude() { 
    linear_extrude(height_of(BASEPLATE)+min([SO_Z, EI_Z, TN_Z])*GRID_SIZE)
        polygon(proximity_sensor_base_polygon);
}

module encoder_cap_extrude () {
    linear_extrude(height_of(CHOC_SOCKET))
        polygon(encoder_cap_polygon);
}

module audio_socket_base_extrude() {
    linear_extrude(height_of(BASEPLATE))
        polygon(audio_socket_base_polygon);
}

module ProximitySensorSocket() {
    let(
        wall_thickness = 1.2,
        middle_finger_socket_index = 5
    ) {
        translate(position_of(PROXIMITY_SENSOR))
        linear_extrude(height_of(SOCKET) + position_of(switch_placement[middle_finger_socket_index]).z+lor(type_of(SOCKET)=="mx",6,1.2))
            offset(delta=wall_thickness)
                polygon(proximity_sensor_polygon);
    }
}
module EncoderSupport(w, r=[-90,0,0]){
    translate([0,-w/2,0])
    rotate(r)
    linear_extrude(w)
        polygon([[0,0], [1.201,0], [1.2,2.4]]);
}

module SocketEncoder(position, rotation) {
    let(
        enc_width = GRID_SIZE + 0.2,
        enc_depth = GRID_SIZE,
        cut_width = 16.8+ENCODER_SOCKET_TOLERANCE,
        cut_depth = 13.9+ENCODER_SOCKET_TOLERANCE,
        support_lenght = 7
    ){
        translate([position.x, position.y, position.z]){
            rotate(rotation){
                translate([0,0,height_of(ENC_SOCKET)/2])
                difference(){
                    cube([enc_width, enc_depth, height_of(ENC_SOCKET)], true);
                    cube([cut_width, cut_depth, height_of(ENC_SOCKET)+4], true);
                }
                
                //Bottom
                mirror([0,1,0])
                translate([0,cut_depth/2,0])
                rotate([0,0,90])
                translate([-1.199,0,height_of(ENC_SOCKET)-1.3])
                    EncoderSupport(support_lenght);

                //Top
                translate([0,cut_depth/2,0])
                rotate([0,0,90])
                translate([-1.199,0,height_of(ENC_SOCKET)-1.3])
                    EncoderSupport(support_lenght);
                
                //Left
                mirror([1,0,0])
                translate([cut_width/2-1.2,0,height_of(ENC_SOCKET)-1.3])
                    EncoderSupport(support_lenght);
                
                //Right
                translate([cut_width/2-1.2,0,height_of(ENC_SOCKET)-3.6])
                    EncoderSupport(support_lenght);        
                       
            }
        }
        //Column under the socket
        translate([position.x, position.y, position.z/2])
            rotate(rotation)
                difference(){
                    cube([enc_width+0.001, enc_depth+0.001, position.z], true);
                    cube([cut_width, cut_depth, position.z + 0.05], true);  
                }    
        }
}

module MakeWireCanals() {
let(
        steps = 24,
        diameter = 1,
        spacing = 2.4,
        z_offset = 1.2, 
        pos = [
            [
                ["position", [60, 2.4*GRID_SIZE, z_offset]],
                ["rotation", [90,0,90]],
                ["height", 65]
            ],
            [
                ["position", [lor(!RIGHT_SIDE,75,85), 1.39*GRID_SIZE, z_offset]],
                ["rotation", [90,0,90]],
                ["height", lor(!RIGHT_SIDE,70, 60)]
            ],
            [
                ["position", [lor(!RIGHT_SIDE,80,85), 0.95*GRID_SIZE, z_offset]],
                ["rotation", [90,0,90]],
                ["height", 55]
            ],
            [
                ["position", [57, 0.65*GRID_SIZE, z_offset]],
                ["rotation", [90,0,90]],
                ["height", 30]
            ],
            [
                ["position", [27, 0.4*GRID_SIZE, z_offset]],
                ["rotation", [90,0,90]],
                ["height", 15]
            ],
            [
                ["position", [10, 0.15*GRID_SIZE, z_offset]],
                ["rotation", [90,0,90]],
                ["height", 15]
            ],
            [
                ["position", [70, 2.8*GRID_SIZE, z_offset]],
                ["rotation", [90,0,0]],
                ["height", 15]
            ],
            [
                ["position", [75, 1.75*GRID_SIZE, z_offset]],
                ["rotation", [90,0,0]],
                ["height", 8]
            ],
            [
                ["position", [85, 1.75*GRID_SIZE, z_offset]],
                ["rotation", [90,0,0]],
                ["height", 8]
            ],
            [
                ["position", [56, 1.75*GRID_SIZE, z_offset]],
                ["rotation", [90,0,0]],
                ["height", 8]
            ],
            [
                ["position", [38, 1.25*GRID_SIZE, z_offset]],
                ["rotation", [90,0,0]],
                ["height", lor(!RIGHT_SIDE,35,0)]
            ],
            [
                ["position", [101, 1.75*GRID_SIZE, z_offset]],
                ["rotation", [90,0,45]],
                ["height", 25]
            ],
            [
                ["position", [13, 1*GRID_SIZE, z_offset]],
                ["rotation", [90,0,15]],
                ["height", lor(!RIGHT_SIDE,0,25)]
            ]
        ]
    ){
        for(canal = pos) {
            translate(position_of(canal)) {
                rotate(rotation_of(canal))
                    cylinder(height_of(canal), d = diameter, $fn = steps, center = true);
            }

            translate(position_of(canal) + (rotation_of(canal)==[90,0,90] ? [0,spacing,0] : [spacing,0,0]))  {
                rotate(rotation_of(canal))
                    cylinder(height_of(canal), d = diameter, $fn = steps, center = true);
            }
                        
        }
    }
}

module MakeThreadedMounts() {
    let(
        steps = 24,
        dia = lor(HEAT_INSERTS, 3.6, 1.9),
        height = height_of(BASEPLATE)-1.2    
    ) {
        for(hole=concat(
                        get(heat_insert_holes, "common"), 
                        lor(RIGHT_SIDE, 
                            get(heat_insert_holes, "right"), 
                            get(heat_insert_holes, "left")
                            )
                        )
            ) {
            translate([hole.x, hole.y, height/2])
                cylinder(h=height+0.01, d=dia, $fn=steps, center = true);
        }
    }
}

module MakeHeatInsertsCaps() {
    let(
        steps = 24,
        dia = 5,
        height = 1.2
    ) {
         for(hole=concat(
                        get(heat_insert_holes, "common"), 
                        lor(RIGHT_SIDE, 
                            get(heat_insert_holes, "right"), 
                            get(heat_insert_holes, "left")
                            )
                        )
            ) {
            translate([hole.x, hole.y, height/2+height_of(BASEPLATE)])
                cylinder(h=height, d=dia, $fn=steps, center = true);
        }
    }
}

module MakeTrackballScrewHoles() {
     let(
        steps = 24,
        dia = 1.9,
        height = 45,
        holes = [
            [20.2, 29.25],
            [29.68, 65.21],
            [-6.2, 55.45]           
        ]
    ) {
        for(hole=holes) {
            translate([hole.x, hole.y, height/2])
                cylinder(h=height+0.01, d=dia, $fn=steps, center = true);
        }
    }
}

module MakeSocketColumns() {
    union(){
        for(switch = switch_placement) {
            if(type_of(switch) != type_of(ENC_SOCKET)) {
                    SocketColumn(position_of(switch));
            } else {
                if(!RIGHT_SIDE) 
                    SocketEncoder(position_of(switch), rotation_of(switch));
            }     
        }
    
        //connector between AP and SO 
        translate([5.25*GRID_SIZE,1.75*GRID_SIZE]) {
            rotate([0,0,45])
            union() {
                translate([0,0,lor(AP_Z>=SO_Z, (SO_Z*GRID_SIZE)/2, (AP_Z*GRID_SIZE)/2)])
                    cube([4.7625, 4.7625, lor(AP_Z>=SO_Z, (SO_Z*GRID_SIZE), (AP_Z*GRID_SIZE))], center = true);
                translate([0,0,lor(AP_Z>=SO_Z, (SO_Z*GRID_SIZE)+height_of(SOCKET)/2, (AP_Z*GRID_SIZE)+height_of(SOCKET)/2)])
                    cube([4.7625, 4.7625, lor(AP_Z>=AP_Z, height_of(SOCKET), (AP_Z*GRID_SIZE))], center = true);
            }
        }

        //connector between FF and EI
        translate([3.5*GRID_SIZE,1.75*GRID_SIZE]) {
            rotate([0,0,135])
            union() {
                translate([0,0,lor(FF_Z>=EI_Z, (EI_Z*GRID_SIZE)/2, (FF_Z*GRID_SIZE)/2)])
                    cube([4.7625, 4.7625, lor(FF_Z>=EI_Z, (EI_Z*GRID_SIZE), (FF_Z*GRID_SIZE))], center = true);
                translate([0,0,lor(FF_Z>=EI_Z, (EI_Z*GRID_SIZE)+height_of(SOCKET)/2, (FF_Z*GRID_SIZE)+height_of(SOCKET)/2)])
                    cube([4.7625, 4.7625, lor(FF_Z>=FF_Z, height_of(SOCKET), (FF_Z*GRID_SIZE))], center = true);
            }
                
        }       
    }
}

module MakeBaseplate() {
    union() {
        if(IR_SENSOR) {
            difference(){            
                union() {
                    baseplate_extrude();
                    ProximitySensorSocket();
                    proximity_sensor_base_extrude();
                }
                proximity_sensor_extrude();
                
            }
        } else {
            baseplate_extrude();
        }
        if(!EXPANDER_EXPOSED)
            MakeI2CExpanderCap();
    }
}

module MakeSwitchCutouts() {
    for(switch = switch_placement){
        if(type_of(switch) != type_of(ENC_SOCKET)) {
            if(type_of(SOCKET) == type_of(CHOC_SOCKET))
                ChockCutout(position_of(switch), rotation_of(switch));
            else
                MXCutout(position_of(switch), rotation_of(switch));
        }
    }   
}

module ChockCutout(position, rotation) {
    let(
        x = 13.6+SOCKET_TOLERANCE,
        y = 13.7+SOCKET_TOLERANCE,
        x2 = 14.5            
    ) {
        translate([position.x, position.y, (position.z/2) + height_of(SOCKET)/2]) 
        rotate(rotation)
            cube([x, y, position.z + height_of(SOCKET)+0.1], center = true);        
         
        translate([position.x, position.y, (position.z/2) + height_of(SOCKET)/2-1.2]) 
        rotate(rotation)
            cube([x2, y, position.z + height_of(SOCKET)], center = true);
        
    }
}

module MXCutout(position, rotation) {
    let(
        x = 13.9+SOCKET_TOLERANCE,
        y = 13.8+SOCKET_TOLERANCE,
        x2 = 5,
        y2 = 16        
    ){       
        translate([position.x, position.y, (position.z/2) + height_of(SOCKET)/2]) 
        rotate(rotation)
            cube([x, y, position.z + height_of(SOCKET)+0.1], center = true);        

        translate([position.x, position.y, (position.z/2) + height_of(SOCKET)/2-1.4])
        rotate(rotation)
            cube([x2, y2, position.z + height_of(SOCKET)], center = true);
    }
}

module SocketColumn(position) {
    union(){
        translate([position.x, position.y, position.z + height_of(SOCKET)/2]) 
            cube([GRID_SIZE, GRID_SIZE, height_of(SOCKET)], center = true);

        translate([position.x, position.y, (position.z/2)]) 
            cube([GRID_SIZE, GRID_SIZE, position.z], center = true);
    }       
}

module MakeI2CExpanderCap() {
    encoder_cap_extrude();
}

module MakeI2CExpanderCutout(width, depth) {
    let(        
        pcb_thickness = 1.7,
        components_height = 2.1,
        support_thickness = 0.4,
        baseplate_distance = 1.2               
    ) {
        if(EXPANDER_EXPOSED) {
            translate([position_of(EXPANDER).x, position_of(EXPANDER).y, height_of(BASEPLATE)-pcb_thickness/2+0.01])
                cube([width, depth, pcb_thickness], center = true);
            //support
            translate([position_of(EXPANDER).x, position_of(EXPANDER).y, height_of(BASEPLATE)/2])
                cube([width-support_thickness, depth-support_thickness, height_of(BASEPLATE)+0.01], center = true);
            }
        else {
            translate([position_of(EXPANDER).x, position_of(EXPANDER).y, (height_of(CHOC_SOCKET)-baseplate_distance)/2])
                cube([width, depth, height_of(CHOC_SOCKET)-baseplate_distance+0.01], center = true);    
        }
    }
}

module MakeAudioSocket() {
    let(
        socket_height = 8.25,
        socket_polygon = [
            [42.96, 33.44],
            [42.96, 24.64],
            [23.71, 24.64],
            [23.71, 33.44]
        ],
        cavity_height = 7.05,
        cavity_polygon = [
            [41.66, 32.14],
            [41.66, 25.84],
            [24.91, 25.84],
            [24.91, 32.14]
        ],
        plug_cutout_position = [24.31, 28.99, 4.43]
    ) {
        difference() {
            union() {
                audio_socket_base_extrude();
                linear_extrude(socket_height)
                    polygon(socket_polygon);
            }
            translate([0,0,-0.01])
            linear_extrude(cavity_height+0.01)
                polygon(cavity_polygon);            

            translate(plug_cutout_position)
            rotate([0,90,0])
                cylinder(h=6, d=5.15, $fn=24, center = true);
        }
    }

}

module MakeTrackballMount() {
    let(
        outer_wall_dia =  50.5,
        inner_wall_dia =  35.4,
        cavity_height = 7.05,
        height = 9,        
        steps = 512
    ){
        difference() {
            union() {
                translate([0,0,height/2])                            
                    cylinder(h=height, d=outer_wall_dia, $fn=steps, center=true);  

                translate([2,-30.11,height_of(BASEPLATE)/2])
                        cube([14.29,13.5,height_of(BASEPLATE)], center=true);
                    
                translate([23.83,-7,height_of(BASEPLATE)/2])
                        cube([10,19.05,height_of(BASEPLATE)], center=true);

                //*translate([0,-26.61,height_of(BASEPLATE)/2])
                        //cube([14.29,11,height_of(BASEPLATE)], center=true);
                    
            
                difference() {
                    translate([-11.67,-20.95,height/2])
                        cube([12.11,7.16,height], center=true);
                
                }
            }
            translate([0,0,height/2])   
            cylinder(h=height+0.05, d=inner_wall_dia, $fn=steps, center=true); 
            //inner cut for MCU
            translate([0,18.7,0])
                cube([19,7.52, height+0.05], center=true);          
            //outer cut for MCU
            translate([0,23.6,0])
                cube([10,5,height+0.05], center=true);

             translate([-8.15,-20.17,cavity_height/2])
                    cube([16.75, 6.3, cavity_height+0.05], center=true);

            translate([-18.52,-20.15,4.43])
            rotate([0,90,0])
                cylinder(h=6, d=5.15, $fn=32, center=true);
        }
    }
}




mirror((!RIGHT_SIDE) ? [-20,0,0] : [0,0,0])
difference() {
    union() {
        union() {
            difference() {
                MakeBaseplate();
                MakeI2CExpanderCutout(EXPANDER_WIDTH, EXPANDER_DEPTH);
            }        
        }            
        MakeSocketColumns();
        if(HEAT_INSERTS) {
            MakeHeatInsertsCaps();
        }
        
        if(!RIGHT_SIDE){
            MakeAudioSocket();            
        }else {
            translate([14.56,49.97,0])
                MakeTrackballMount();
        }
        
    }    
    MakeSwitchCutouts();
    MakeWireCanals();
    MakeThreadedMounts();
    MakeTrackballScrewHoles();
}