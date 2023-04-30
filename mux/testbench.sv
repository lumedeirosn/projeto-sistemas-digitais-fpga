module teste; // modulo de teste
  
  // estruturas
  logic[7:0][7:0] entrada; // definição de um array para armazenar 8 valores de 8 bits
  logic[7:0] saida; // variavel output
  logic[2:0] seletor; // select do mux
  
  //uso do mudulo multiplexador
  multiplexador mux(.entrada(entrada), .saida(saida), .seletor(seletor));
  
  initial begin
    
    // atribuição de valores das entradas do mux
    for(integer i = 0 ; i < 10 ; i++) begin
      #1 entrada[i] = $urandom;
    end
    
    for(integer i = 0 ; i < 10 ; i++) begin // loop para modificar o valor do selector aleatoriamente e imprir os valores
      #1 seletor = $urandom;//atribui valor aleatorio para o seletor
      #1 $display("Input: %b => %d em decimal / Output: %b => %d em decimal / Selector: %b => %d em decimal" ,entrada[seletor], entrada[seletor], saida, saida, seletor, seletor); // imprime os valores de entrada saida e seletor para confirmar a atribuição corretamente quando muda o seletor
    end
    
  end
endmodule
