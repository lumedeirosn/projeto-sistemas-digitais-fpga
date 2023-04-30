module mem(Address_In, CS, WE, Data_In, Data_Out);
  input logic[0:3] Address_In, Data_In;
  input bit CS, WE;
  output logic[0:3] Data_Out;
  
  logic[0:3] P0, P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12, P13, P14, P15;
  
  always_comb begin
    if( (!CS) == 0) begin
      if( (!WE) == 0 ) begin // Write
        Data_Out = 4'bzzzz;
        case (Address_In)
          	0: P0 = Data_In;  
            1: P1 = Data_In;
            2: P2 = Data_In;
            3: P3 = Data_In;
            4: P4 = Data_In;
            5: P5 = Data_In;
            6: P6 = Data_In;
            7: P7 = Data_In;
            8: P8 = Data_In;
            9: P9 = Data_In;
            10: P10 = Data_In;
            11: P11 = Data_In;
            12: P12 = Data_In;
            13: P13 = Data_In;
            14: P14 = Data_In;
            15: P15 = Data_In;
      	endcase
      end
      else begin // read
      	case (Address_In)
          	0: Data_Out = ~P0;
            1: Data_Out = ~P1;
            2: Data_Out = ~P2;
            3: Data_Out = ~P3;
            4: Data_Out = ~P4;
            5: Data_Out = ~P5;
            6: Data_Out = ~P6;
            7: Data_Out = ~P7;
            8: Data_Out = ~P8;
            9: Data_Out = ~P9;
            10: Data_Out = ~P10;
            11: Data_Out = ~P11;
            12: Data_Out = ~P12;
            13: Data_Out = ~P13;
            14: Data_Out = ~P14;
            15: Data_Out = ~P15;
        endcase
      end
    end
    else begin
    	Data_Out = 4'bzzzz;
    end
  end
endmodule



module conversor( cont_bin, reset, cont_out_display);
 	input logic[0:3] cont_bin; 
 	input logic reset;
 	output logic[0:6] cont_out_display;
  
  	always_comb begin
      
      // A seguir, a lógica do conversor eh implementada com always_comb para sempre monitorar a lógica combinatória e a saída do conversor eh determinada pela lógica dos bits mais e menos significativos do display da FPGA. A saída também eh barrada, uma vez que o led acente em nível lógico baixo.
   		if(reset) begin
      		cont_out_display = ~7'b0000000;
        end
      	
      	else begin
          case(cont_bin)
          	0: cont_out_display = ~7'b0111111;
            1: cont_out_display = ~7'b0000110;
            2: cont_out_display = ~7'b1011011;
            3: cont_out_display = ~7'b1001111;
            4: cont_out_display = ~7'b1100110;
            5: cont_out_display = ~7'b1101101;
            6: cont_out_display = ~7'b1111101;
            7: cont_out_display = ~7'b0000111;
            8: cont_out_display = ~7'b1111111;
            9: cont_out_display = ~7'b1100111;
            10: cont_out_display = ~7'b1110111;
            11: cont_out_display = ~7'b1111100;
            12: cont_out_display = ~7'b0111001;
            13: cont_out_display = ~7'b1011110;
            14: cont_out_display = ~7'b1111001;
            15: cont_out_display = ~7'b1110001;
            default: cont_out_display = ~7'b0000000;
          endcase
        end
    end
endmodule:conversor

