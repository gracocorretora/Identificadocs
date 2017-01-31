require_relative 'Interface'
require_relative 'le_arquivo'

def executa_3(planilha_docs)

  arquivo1 = menu3
  turismo = posicao_ou_turismo
  puts "Abrindo .xls inicial" ; planilha_docs.abre_xls
  puts "Abrindo WorkSheet" ; planilha_docs.abre_worksheet(0)
  puts "Pegando os documentos e agrupando por CPF/CNPJ" ; reg_e_docs = planilha_docs.converte_hash(2,1)
  puts "Pegando os nomes e agrupando por CPF/CNPJ" ; reg_e_nome = planilha_docs.converte_hash(2,4,false)
  #Importa lista de documentos
  doc_falta = Texto.new
  doc_falta.arquivo = "docs_names.txt"
  doc_falta.abre_txt
  puts "Importando Lista de Documentos.";doc_falta = doc_falta.converte_array


  puts "Coletando CPF/CNPJ do arquivo de comparação"; dados_reg_w = Planilha.new
  dados_reg_w.arquivo = arquivo1
  dados_reg_w.abre_xls
  dados_reg_w.abre_worksheet(0)
  dados_reg = dados_reg_w.converte_hash(6,7,false)


   puts "Criando Planilha de Saida" ; planilha_saida = Spreadsheet::Workbook.new
   puts "Adicionando Worksheet" ; planilha_saida.create_worksheet :name => "COMPARACAO"
  sheet_final = planilha_saida.worksheet 'COMPARACAO'

  #dados_cpf = filtra_numeros_array dados_cpf
  cabecalho = sheet_final.row(0)
   puts "Inserindo o Cabeçalho" ; cabecalho.push('NOME','REGISTRO','DOCS INSERIDOS')
  puts sheet_final.row(0)

  puts "Adicionando Valores a Planilha de Saida"
  adiciona_valor_planilha_saida dados_reg,sheet_final,reg_e_docs

  nome_arquivo_saida = pede_nome_arquivo_saida
  planilha_saida.write "#{nome_arquivo_saida}.xls" ; puts "Arquivo #{nome_arquivo_saida}.xls salvo com sucesso"

end

def adiciona_valor_planilha_saida (dados_reg,sheet_final,reg_e_docs)

  conta_linha = 1
  dados_reg.each do |valor,nome|
    linha_atual = sheet_final.row(conta_linha)
    tem_docs_no_registro = (reg_e_docs[valor] != NilClass && reg_e_docs[valor] != nil)
#      linha_atual.push(nome,valor,reg_e_docs[valor])
      linha_atual.push(nome,valor)
      if tem_docs_no_registro
        reg_e_docs[valor].each {|doc| linha_atual.push(doc)}
      else
        linha_atual.push("N.C.")
      end
  conta_linha += 1
  end

  return sheet_final

end
