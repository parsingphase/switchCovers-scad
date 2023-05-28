    
switch_length=68;
switch_width=34;
standoff=6.5;
thickness=2;
foot_length=8;

font="Chalkboard";
font_scale_factor=1.1;

total_depth=standoff+thickness;
total_length=switch_length+(foot_length*2);

module text_cutout () {
  translate([switch_width/2, total_length/2, -total_depth/4]) {
  linear_extrude(height = 2*total_depth) {
    text("?", font=font, size = switch_length/2*font_scale_factor, valign="center", halign="center");
  }
}}

module switch_body() {
      cube(center=false, [switch_width, total_length,total_depth]);
}

module switch_cutout() {
  translate([-0.1, foot_length, -0.1]) {
      cube(center=false, [switch_width+0.2, switch_length,standoff+0.1]);
  }}

difference() {
switch_body();
    switch_cutout();
    text_cutout();
  
}