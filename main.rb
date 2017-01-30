require_relative 'Interface'
require_relative 'programa3'

def executa_main
  arquivo = pede_arquivo_inicial " exportado do PRIMECASE."
  #arquivo = 'docs.xls'
  planilha = Planilha.new
  planilha.arquivo = arquivo

  loop do
    opcao = menu0
    break if opcao == 0
    case opcao
    when 1
    when 2
    when 3
      puts "--------------------------------------------------------------------------------------------"
      puts "INICIANDO PROGRAMA 3"
      puts "--------------------------------------------------------------------------------------------"
      executa_3(planilha)
    end
  end
end

executa_main
