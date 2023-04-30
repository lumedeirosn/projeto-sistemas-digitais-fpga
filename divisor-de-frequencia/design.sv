module cont( ck, reset, updown, out);
  	input logic ck, reset, updown;
  	output logic[0:3] out;
	
  	
  	always_ff @(posedge reset or posedge ck) begin // Monitorar a borda de subida do clock e implementar o funcionamento do reset.
      
      if(reset) begin // Lógica de funcionamento, caso reset esteja ativado. 
        out = 0;
      end
      
      else begin // se reset não está pressionado.
       
        if(updown) begin // se updown valer 1.
          if(out == 15) begin //caso atinja o limite da contagem. Essa condição eh opcional, uma vez que a variável out possui 4 bits e 15 em decimal eh o maior valor que ela pode atingir.
            out = 0;
          end
          else begin
        	out++; // incremento do output do contador.
          end
      	end
        
        else begin // caso updown não seja 1, obrigatoriamente ele eh 0.
          if(out == 0) begin
          	out = 15;
          end
          else begin
          	out--; // contagem decrescente caso updown esteja em 0.
          end
        end
      end
    end
endmodule:cont
    


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



module divisor_de_frequencia(cont_in, cont_out, reset);
  input logic cont_in, reset;
  output logic cont_out;
  
  int cont = 0;
  
  always_ff @(posedge reset or posedge cont_in) begin
    if (reset) begin // caso reset seja ativado.
     	cont_out = 0;
		cont = 0;
	end 
    else begin
      	if (cont > 5000000) begin // reinicialição de cont para dar inicio a um novo atraso e atualização com o barramento de cont_out.
			cont_out = ~cont_out;
			cont = 0;
		end  
      	else begin // implementação da espera ocupada.
			cont += 1;
		end
    end
	 
end
endmodule: divisor_de_frequencia
