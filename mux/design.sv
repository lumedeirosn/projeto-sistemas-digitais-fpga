module multiplexador(entrada, saida, seletor);
  
  //definição das variaveis de input e output
  input logic[7:0][7:0] entrada;
  input logic[2:0] seletor;
  output logic[7:0] saida;
  
  //aways_comb para lógica combinatória de saída e entradas
  always_comb
    begin
      //seleção do canal
      case (seletor)
        0: saida = entrada[0];
        1: saida = entrada[1];
        2: saida = entrada[2];
        3: saida = entrada[3];
        4: saida = entrada[4];
        5: saida = entrada[5];
        6: saida = entrada[6];
        7: saida = entrada[7];
        default: saida <= 0;
      endcase
    end
endmodule
