*** Settings ***
Documentation       Verificar as operações matemáticas de soma, subtração, multiplicação e divisão

Library             AutoItLibrary

Suite Setup         Quando eu abro a calculadora
Suite Teardown      Então fecho a calculadora

*** Keywords ***
Quando eu abro a calculadora
    Run    calc.exe
    Win Wait Active    Calculadora

E faço uma operação de soma simples
    Sleep              2s
    Send               5
    Sleep              0.5s 
    Send               {+}
    Sleep              0.5s
    Send               1 
    Sleep              0.5s
    Send               {=}
    
E faço uma operação de soma com dois números inteiros
    Sleep              2s
    Send               5 4
    Sleep              0.5s 
    Send               {+}
    Sleep              0.5s
    Send               1 6
    Sleep              0.5s
    Send               {=}
        
E faço uma operação de subtração simples
    Sleep              2s
    Send               7
    Sleep              0.5s 
    Send               {-}
    Sleep              0.5s
    Send               4 
    Sleep              0.5s
    Send               {=}
    
E faço uma operação de subtração com dois números inteiros
    Sleep              2s
    Send               7 5
    Sleep              0.5s 
    Send               {-}
    Sleep              0.5s
    Send               4 2
    Sleep              0.5s
    Send               {=}
    
E faço uma operação de multiplicação simples
    Sleep              2s
    Send               5
    Sleep              0.5s 
    Send               {*}
    Sleep              0.5s
    Send               4 
    Sleep              0.5s
    Send               {=}
    
E faço uma operação de multiplicação com dois números inteiros
    Sleep              2s
    Send               10
    Sleep              0.5s 
    Send               {*}
    Sleep              0.5s
    Send               15 
    Sleep              0.5s
    Send               {=}
    
E faço uma operação de divisão simples
    Sleep              2s
    Send               9
    Sleep              0.5s 
    Send               {/}
    Sleep              0.5s
    Send               3 
    Sleep              0.5s
    Send               {=}
    
E faço uma operação de divisão com dois números inteiros
    Sleep              2s
    Send               9 0
    Sleep              0.5s 
    Send               {/}
    Sleep              0.5s
    Send               1 5
    Sleep              0.5s
    Send               {=}
    
E faço um cálculo com mais de uma operação matemática
    Sleep              2s
    Send               9 0
    Sleep              0.5s 
    Send               {/}
    Sleep              0.5s
    Send               1 5
    Sleep              0.5s
    Send               {*}
    Sleep              0.5s
    Send               6
    Sleep              0.5s
    Send               {-}
    Send               6
    Sleep              0.5s
    Send               {+}
    Send               1 0   
    Send               {=}
    
E valido o número de dígitos permitidos na calculadora
    Sleep              2s
    Send               9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9  

E verifico o limite do valor de resposta da calculadora
    Sleep              2s
    Send               9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 
    Sleep              0.5s 
    Send               {+}
    Sleep              0.5s
    Send               1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
    Sleep              0.5s
    Send               {=}
    Sleep              2s
    Send               {ESC}
    Sleep              2s
    Send               8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 
    Sleep              0.5s 
    Send               {+}
    Sleep              0.5s
    Send               1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
    Sleep              0.5s
    Send               {=}
    
E verifico se o botão C limpa todos os dígitos e operações inseridos
    Sleep              2s
    Send               9 9 9 9 9
    Sleep              2s
    Send               {ESC}
    
E verifico se o botão backspace funciona
    Sleep              2s
    Send               9
    Sleep              2s
    Send               {BS}
    
E verifico se a divisão de um número por zero resulta em erro
    Sleep              2s
    Send               7
    Sleep              0.5s 
    Send               {/}
    Sleep              0.5s
    Send               0 
    Sleep              0.5s
    Send               {=}
    
E verifico se a divisão de zero por qualquer número resulta em zero
    Sleep              2s
    Send               0
    Sleep              0.5s 
    Send               {/}
    Sleep              0.5s
    Send               5 
    Sleep              0.5s
    Send               {=}
    
Então fecho a calculadora
    BuiltIn.Sleep    2s
    Win Close    Calculadora

*** Test Cases ***
TC01
    [Documentation]  Executar soma
    E faço uma operação de soma simples
    
TC02
    [Documentation]  Executar subtração
    E faço uma operação de subtração simples
    

TC03 
    [Documentation]  Executar multiplicação
    E faço uma operação de multiplicação simples

TC04
    [Documentation]  Executar divisão
    E faço uma operação de divisão simples

TC05
    [Documentation]  Executar soma com dois números inteiros
    E faço uma operação de soma com dois números inteiros
    
TC06
    [Documentation]  Executar subtração com dois números inteiros
    E faço uma operação de subtração com dois números inteiros
    
TC07
    [Documentation]  Executar multiplicação com dois números inteiros
    E faço uma operação de multiplicação com dois números inteiros
    
TC08
    [Documentation]  Executar divisão com dois números inteiros
    E faço uma operação de divisão com dois números inteiros
    
TC09
    [Documentation]  Executar um cálculo com multiplas operações
    E faço um cálculo com mais de uma operação matemática

TC10
    [Documentation]  Verificar a quantidade de digitos permitidos
    E valido o número de dígitos permitidos na calculadora

TC11
    [Documentation]  Verificar limite de valor de resposta na calculadora
    E verifico o limite do valor de resposta da calculadora

TC12
    [Documentation]  Verificar se o botão C limpa todos dígitos
    E verifico se o botão C limpa todos os dígitos e operações inseridos

TC13
    [Documentation]  Verificar a função backspace
    E verifico se o botão backspace funciona

TC14
    [Documentation]  Verificar a divisão por zero
    E verifico se a divisão de um número por zero resulta em erro

TC15
    [Documentation]  Verificar a divisão de zero
    E verifico se a divisão de zero por qualquer número resulta em zero