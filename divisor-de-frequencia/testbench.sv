module teste1;
  logic ck, reset, updown;
  logic[0:3] out;
  
  cont contador(.ck(ck), .reset(reset), .updown(updown), .out(out));
  	
  always begin // implementação do clock
    #10 ck = ~ck;
  end
  
  initial begin
    $dumpfile("test.vcd");
    $dumpvars();
    #600 $finish;
  end

  initial begin // inicializando as váriaveis sem delay, para que as essas linhas de código sejam lidas  primeiro.
    ck = 1;
    reset = 0;
    updown = 0;
  end
  
  initial begin // thread relacionada a reset.
    #10 reset = 1;
    #30 reset = 0;
    #100 reset = 1;
    #120 reset = 0;
    #130 reset = 1;
  end
    
  initial begin // thread relacionada a updown.
	#20 updown = 1;
    #50 updown = 0;
    #120 updown = 1;
    #160 updown = 0;
  end
endmodule 



module teste2;
  logic[0:3] cont_bin;
  logic reset;
  logic[0:6] cont_out_display;
  
  
  
  conversor converter(.cont_bin(cont_bin), .reset(reset), .cont_out_display(cont_out_display));
  
  initial begin // inicialização das variáveis
	reset = 0;
    cont_bin = 5;
    
    for(int i = 0; i < 10; i++)begin
       #1 cont_bin++;
      if(i == 5) begin
      	#1 reset = 1;
      end
      #1 $display("entrada-> %d, reset-> %d, cont_out_display-> %b", cont_bin, reset, cont_out_display);
    end
    
    	#1 reset = 0;
    #1 $display("entrada-> %d, reset-> %d, cont_out_display-> %b", cont_bin, reset, cont_out_display);
      
    for(int i = 0; i < 8; i++)begin
       #1 cont_bin++;
      if(i == 5) begin
      	#1 reset = 1;
      end
      #1 $display("entrada-> %d, reset-> %d, cont_out_display-> %b", cont_bin, reset, cont_out_display);
    end
  end
endmodule

// Abaixo encontra uma das etapas de sintetição no quartus com a utilização do divisor de frequência no momento das conexões.
/*
module teste3;
	wire [3:0] OUT;
	wire ck;
  	
  	divisor_de_frequencia div(.cont_in(CLOCK2_50), .cont_out(ck), .reset(SW[0]));

  cont contador(.ck(ck), .reset(SW[0]), .updown(SW[1]), .out(OUT));
  
  conversor converter(.cont_in(OUT), .reset(SW[0]), .cont_out({HEX0[0], HEX0[1], HEX0[2], HEX0[3], HEX0[4], HEX0[5], HEX0[6]}));
 */
