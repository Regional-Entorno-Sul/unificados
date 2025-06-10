Function main()
cls
set color to g+/
set century on
set date to british

cAno := HB_ArgV ( 1 )

if empty(cAno) = .T.
set color to r+/
? "Falta o argumento do ano na linha de comando."
? "Fim do programa!"
? ""
quit
else
set color to gr+/
? "Ano:" + alltrim(cAno)
? ""
endif

set color to g+/
use "c:\hb30\bin\unificados.dbf"

do while .not. eof()
replace ano with right(data_notif,4)

skip
enddo

goto top

do while .not. eof()
if ano = alltrim("2024") .or. ano = alltrim("2025")
replace marca with "x"
endif
skip
enddo

close

use "c:\hb30\bin\unificados.dbf"

delete for marca <> "x"
pack
close

use "c:\hb30\bin\unificados.dbf"

count to nTotal for ano = alltrim(cAno)
count to nConfirm for classifica = alltrim("CONFIRMADO") .and. ano = alltrim(cAno)
count to nDescart for classifica = alltrim("DESCARTADO") .and. ano = alltrim(cAno)
count to nSg_ne for classifica = alltrim("SINDROME GRIPAL NAO ESPECIFICADA") .and. ano = alltrim(cAno)
count to nSRAG_ne for classifica = alltrim("SRAG NAO ESPECIFICADO") .and. ano = alltrim(cAno)
count to nSRAG_influ for classifica = alltrim("SRAG POR INFLUENZA") .and. ano = alltrim(cAno)
count to nSRAG_oae for classifica = alltrim("SRAG POR OUTRO AGENTE ETIOLOGICO") .and. ano = alltrim(cAno)
count to nSRAG_ovr for classifica = alltrim("SRAG POR OUTRO VIRUS RESPIRATORIO") .and. ano = alltrim(cAno)
count to nSuspeito for classifica = alltrim("SUSPEITO") .and. ano = alltrim(cAno)

? "Classificacao"
? "============="
? "Total:" + alltrim(str(nTotal))
? "Confirmados:" + alltrim(str(nConfirm))
? "Descartados:" + alltrim(str(nDescart))
? "SG nao especificada:" + alltrim(str(nSg_ne))
? "SRAG nao especificada:" + alltrim(str(nSRAG_ne))
? "SRAG por influenza:" + alltrim(str(nSRAG_influ))
? "SRAG por outro agente etiologico:" + alltrim(str(nSRAG_oae))
? "SRAG por outro virus respiratorio:" + alltrim(str(nSRAG_ovr))
? "Suspeitos:" + alltrim(str(nSuspeito))
? ""

count to nClinico for criterio_c = alltrim("CLINICO") .and. ano = alltrim(cAno)
count to nClin_epid for criterio_c = alltrim("CLINICO-EPIDEMIOLOGICO") .and. ano = alltrim(cAno)
count to nClin_imagem for criterio_c = alltrim("CLINICO-IMAGEM") .and. ano = alltrim(cAno)
count to nLaborat for criterio_c = alltrim("LABORATORIAL") .and. ano = alltrim(cAno)

? "Criterio"
? "========"
? "Clinico:" + alltrim(str(nClinico))
? "Clinico-epidemiologico:" + alltrim(str(nClin_epid))
? "Clinico-imagem:" + alltrim(str(nClin_imagem))
? "Laboratorial:" + alltrim(str(nLaborat))
? ""

count to nCura for evolucao = alltrim("CURA") .and. ano = alltrim(cAno)
count to nTratDom for evolucao = alltrim("EM TRATAMENTO DOMICILIAR") .and. ano = alltrim(cAno)
count to nIgnorado for evolucao = alltrim("IGNORADO") .and. ano = alltrim(cAno)
count to nInternado for evolucao = alltrim("INTERNADO") .and. ano = alltrim(cAno)
count to nInternado_UTI for evolucao = alltrim("INTERNADO EM UTI") .and. ano = alltrim(cAno)
count to nObito for evolucao = alltrim("OBITO") .and. ano = alltrim(cAno)
count to nObito_outras for evolucao = alltrim("OBITO POR OUTRAS CAUSAS") .and. ano = alltrim(cAno)

? "Evolucao"
? "========"
? "Cura:" + alltrim(str(nCura))
? "Tratamento domiciliar:" + alltrim(str(nTratDom))
? "Ignorado:" + alltrim(str(nIgnorado))
? "Internado:" + alltrim(str(nInternado))
? "Internado em UTI:" + alltrim(str(nInternado_UTI))
? "Obito:" + alltrim(str(nObito))
? "Obito por outras causas:" + alltrim(str(nObito_outras))
? ""

count to nEsus for fonte = alltrim("ESUS") .and. ano = alltrim(cAno)
count to nSivep for fonte = alltrim("SIVEP") .and. ano = alltrim(cAno)

? "Fonte"
? "====="
? "ESUS:" + alltrim(str(nEsus))
? "SIVEP:" + alltrim(str(nSivep))
? ""

return nil