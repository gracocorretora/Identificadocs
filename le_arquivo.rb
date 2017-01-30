require 'Spreadsheet'
Spreadsheet.client_encoding = 'UTF-8'


class Planilha

  attr_writer :arquivo


  def abre_xls
    @planilha = Spreadsheet.open "#{@arquivo}"
    return @planilha
  end

  def abre_worksheet(aba)
    @worksheet = @planilha.worksheet aba
    return @worksheet
  end

  def acha_coordenadas (titulo,dados)
    coord_titulo = planilha.row(0).index(titulo)
    coord_dados = planilha.row(0).index(dados)
    return coord_titulo,coord_dados
  end

  def converte_hash (coord_titulo,coord_dados,array = true)
     hash = Hash.new
    @worksheet.each do |row|
     titulo = row[coord_titulo]
     dado = row[coord_dados]
     if array == true
       if hash[titulo].class == NilClass
         hash[titulo] = []
         hash[titulo] << dado
       else
         hash[titulo] << dado
       end
     else
       hash[titulo] = dado
     end
    end
    return hash
  end

  def converte_array(coluna)
    array = []
    @worksheet.each do |row|
    array << row[coluna]
    end
    return array
  end

end

class Texto

  attr_writer :arquivo

  def abre_txt
    dados_brutos = File.open "#{@arquivo}"
    @dados = dados_brutos.read
  end

  def converte_array
    @array = @dados.split("\n")
  end


end
