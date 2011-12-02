class ImportarController < ApplicationController
  def index
    @import = Temp.all
  end
  def uploadFile
    post = DataFile.save(params[:upload])
    flash[:notice] = "Upload bem sucedido. Efetive a importação "
    redirect_to(importar_index_path)
  end

#  def efetivar_importacao
#    temp = Temp.all
#    temp.each do |f|
#      importacao = Contato.new
#      importacao.nome = f.nome
#      importacao.email = f.email
#      importacao.telefone = f.telefone
#      importacao.save
#      f.destroy
#      t = 0
#    end
#    flash[:notice] = "Importação realizada com sucesso!."
#    redirect_to(importar_index_path)

#  end

  def efetivar_importacao
    temp = Temp.all
    temp.each do |f|
      importacao = Editora.new
      importacao.nome = f.nome
      importacao.cidade = f.cidade
      importacao.pais = f.pais
      importacao.save
      f.destroy
    end
    flash[:notice] = "Importação realizada com sucesso!."
    redirect_to(importar_index_path)
  end

end
