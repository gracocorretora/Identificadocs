require 'Spreadsheet'
Spreadsheet.client_encoding = 'UTF-8'

def define_formato (formato)
  if formato == 1
    extensao = '.txt'
  else
    extensao = '.xls'
  end
  extensao
end

def filtra_numeros_array(array)

  array.delete_if{|x| x.class!= Fixnum && x.class != Float}
  return array

end

def cpf_cnpj?(dado)
  if (dado.length < 11 && dado.length > 9)
    doc = 'CPF'
  elsif dado.length > 11
    doc = 'CNPJ'
  end
  return doc
end
