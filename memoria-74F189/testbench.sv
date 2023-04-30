module testeMemoria;
  logic[0:3] Address_In, Data_In;
  	logic CS, WE, reset;
  	logic[0:3] Data_Out;
  	//logic[0:6] cont_out_display1, cont_out_display2, cont_out_display3;
  
  mem memoria(.Address_In(Address_In), .CS(CS), .WE(WE), .Data_In(Data_In), .Data_Out(Data_Out));
  
   initial begin
    	#1 reset = 0;
    	#1 CS = 1; //
    	#1 WE = 1; //
     	for(int i = 0; i < 16; i++) begin
        	#1 Address_In = i;
          	#1 Data_In = i;
          	#1 $display("Address_In-> %d, reset-> %d, Data_Out-> %d", Address_In, reset, Data_Out);
     	end
     	
     	#2 WE = 0; //
     for(int j = 0; j < 16; j++) begin
          	#2 Address_In = j;
        	#2 $display("Address_In-> %d, reset-> %d, Data_Out-> %d", Address_In, reset, Data_Out);
        end
  	end
endmodule


/*
// Sintetização no Quartus

wire[0:3] Data_Out;

mem memoria ( .Address_In({SW[3], SW[2], SW[1], SW[0]}), CS(SW[8], WE(SW[9], .Data_In({SW[7], SW[6], SW[5], SW[4]}, .Data_Out(Data_Out) );
 
                                                                                           conversor converter1(.cont_bin({SW[3], SW[2], SW[1], SW[0]}), .reset(KEY0), .cont_out_display(HEX0));
                                                                      
                                                                                          conversor converter2(.cont_bin({SW[7], SW[6], SW[5], SW[4]}), .reset(KEY0), .cont_out_display(HEX1));
                                                                                          conversor converter3(.cont_bin(~Data_Out), .reset(KEY0), .cont_out_display(HEX2)); 
 
 */
