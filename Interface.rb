require_relative 'logic'


def pede_arquivo_inicial(adendo = "")
  puts "--------------------------------------------------------------------------------------------"
  puts 'Insira o nome arquivo .xls' + adendo
  puts "--------------------------------------------------------------------------------------------"
  arquivo0 = gets.strip + '.xls'
  puts "..Procurando Arquivo"
  arquivo_existe = File.exist?(arquivo0)
  if  arquivo_existe == false
    while arquivo_existe != true
      puts "Nome do arquivo incorreto, por favor insira novamente"
      arquivo0 = gets.strip + '.xls'
    end
  end
  puts '..Arquivo Encontrado'
  return arquivo0

end


def colunas_titulos_e_valores
  puts 'Títulos são os dados a serem armazenados como únicos e que terá diversas subsequencias'

    puts 'Insira o nome da coluna que você deseja que seja usado como Títulos'
    titulo = gets.strip
    puts "\nInsira a coluna dos valores a serem armazenados nos Títulos"
    dados = gets.strip
    puts "\nA sua Coluna de Título é #{titulo} e de dados é #{dados}"
    return titulo,dados
end


  def menu0
    puts "--------------------------------------------------------------------------------------------"
    puts "O que deseja fazer?"
    puts " 1 - Consultar Documentação de uma empresa/pessoa físicas"
    puts " 2 - Relatório de empresas com documentação faltantes"
    puts " 3 - Comparar Documentação de uma ou mais empresas/pessoas físicas"
    puts " 0 - Fechar Programa"
    opção = gets.strip.to_i
    while opção.class != Fixnum
      puts "\nDigite somente o número da tarefa desejada"
      opção = gets.strip
    end
    return opção
  end

  def menu1
    puts "teste ok"
  end

  def menu3
    puts "------------------------------------------------------------------------------------------"
    puts "LEIA COM ATENÇÃO  "
    puts "Precisamos de um arquivo .xls importado do Exchange com a seguinte sequência"
    puts "CPF/CNPJ , TITULAR, DESCRICAO"
    puts "O arquivo tem que estar nesse pasta!"
    puts "AGORA INSIRA O NOME DO ARQUIVO!"
    nome_arquivo_cpf = gets.strip
    puts "..Procurando Arquivo"
    extensao = '.xls'
    nome_arquivo_cpf += extensao
    if File.exist?(nome_arquivo_cpf) == false
      while File.exist?(nome_arquivo_cpf) != true
      puts "..Arquivo não encontrado favor digitar de novo o nome do arquivo, ou pressiona CNTRL+C para cancelar"
      nome_arquivo_cpf = gets.strip
      nome_arquivo_cpf += extensao
      end
    end
    puts "..Arquivo Encontrado!"
    return nome_arquivo_cpf
  end

  def pede_nome_arquivo_saida
    puts "-----------------------------------------------------------------------"
    puts "Insira o nome do arquivo da comparação"
    arquivo = gets.strip
    return arquivo
  end

def posicao_ou_turismo
  puts "O tipo de comparação que você deseja é da posição própria ou do turismo?"
  puts "1 - Posição  2 - Turismo"
  turismo = gets.strip.to_i
  if turismo == 2
    return true
  else
    return false
  end
end
