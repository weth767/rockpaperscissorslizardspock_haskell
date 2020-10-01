import Graphics.UI.Gtk
import System.Random

randomStuff :: IO Int
randomStuff =
    do { randomRIO (1,5) }

buttonClick label label2 label3 id = 
    do
        playCmp <- randomStuff
        if playCmp == 1 then labelSetText label2 "O computador mostrou Pedra"
        else if playCmp == 2 then labelSetText label2 "O computador mostrou Papel"
        else if playCmp == 3 then labelSetText label2 "O computador mostrou Tesoura"
        else if playCmp == 4 then labelSetText label2 "O computador mostrou Lagarto"
        else labelSetText label2 "O computador mostrou Spock"

        if id == 1 then labelSetText label "O jogador mostrou Pedra"
        else if id == 2 then labelSetText label "O jogador mostrou Papel"
        else if id == 3 then labelSetText label "O jogador mostrou Tesoura"
        else if id == 4 then labelSetText label "O jogador mostrou Lagarto"
        else labelSetText label "O jogador mostrou Spock"

        rpsls id playCmp label3

{-
 1 - Pedra
 2 - Papel
 3 - Tesoura
 4 - Lagarto
 5 - Spock
-}

rpsls p1 p2 label = 
    do 
        if p1 == 1 && p2 == 1 then labelSetText label "EMPATE!"
        else if p1 == 1 && p2 == 2 then labelSetText label "Papel enrola pedra, COMPUTADOR GANHOU!"
        else if p1 == 1 && p2 == 3 then labelSetText label "Pedra esmaga tesoura, JOGADOR GANHOU!"
        else if p1 == 1 && p2 == 4 then labelSetText label "Pedra esmaga lagarto, JOGADOR GANHOU!"
        else if p1 == 1 && p2 == 5 then labelSetText label "Spock vaporiza pedra, COMPUTADOR GANHOU!"
        else if p1 == 2 && p2 == 1 then labelSetText label "Papel enrola pedra, JOGADOR GANHOU!"
        else if p1 == 2 && p2 == 2 then labelSetText label "EMPATE!"
        else if p1 == 2 && p2 == 3 then labelSetText label "Tesoura corta Papel, COMPUTADOR GANHOU!"
        else if p1 == 2 && p2 == 4 then labelSetText label "Lagarto come Papel, COMPUTADOR GANHOU!"
        else if p1 == 2 && p2 == 5 then labelSetText label "Papel refuta Spock, JOGADOR GANHOU!"
        else if p1 == 3 && p2 == 1 then labelSetText label "Pedra esmaga Tesoura, COMPUTADOR GANHOU!"
        else if p1 == 3 && p2 == 2 then labelSetText label "Tesoura corta Papel, JOGADOR GANHOU!"
        else if p1 == 3 && p2 == 3 then labelSetText label "EMPATE!"
        else if p1 == 3 && p2 == 4 then labelSetText label "Tesoura decapita Lagarto, JOGADOR GANHOU!"
        else if p1 == 3 && p2 == 5 then labelSetText label "Spock derrete Tesoura, COMPUTADOR GANHOU!"
        else if p1 == 4 && p2 == 1 then labelSetText label "Pedra esmaga lagarto, COMPUTADOR GANHOU!"
        else if p1 == 4 && p2 == 2 then labelSetText label "Pedra esmaga lagarto, COMPUTADOR GANHOU!"
        else if p1 == 4 && p2 == 3 then labelSetText label "Tesoura decapita Lagarto, COMPUTADOR GANHOU!"
        else if p1 == 4 && p2 == 4 then labelSetText label "EMPATE!"
        else if p1 == 4 && p2 == 5 then labelSetText label "Lagarto envenena Spock, JOGADOR GANHOU"
        else if p1 == 5 && p2 == 1 then labelSetText label "Spock vaporiza pedra, JOGADOR GANHOU!"
        else if p1 == 5 && p2 == 2 then labelSetText label "Papel refuta Spock, COMPUTADOR GANHOU!"
        else if p1 == 5 && p2 == 3 then labelSetText label "Spock derrete Tesoura, JOGADOR GANHOU!"
        else if p1 == 5 && p2 == 4 then labelSetText label "Lagarto envenena Spock, COMPUTADOR GANHOU"
        else labelSetText label "EMPATE!"
                

main :: IO ()
main = do
    initGUI
    -- cria a janela -- 
    window <- windowNew
    -- configurações da janela principal
    set window [
            windowDefaultWidth := 500,
            windowDefaultHeight := 500,
            containerBorderWidth := 10,
            windowTitle := "Rock Paper Scissor Lizard Spock"
            ]
    -- cria a tabela
    table <- tableNew 8 1 True
    -- adiciona a tabela na janela
    containerAdd window table
    -- cria os botões
    button1 <- buttonNewWithLabel "Rock (Pedra)"
    button2 <- buttonNewWithLabel "Paper (Papel)"
    button3 <- buttonNewWithLabel "Scissor (Tesoura)"
    button4 <- buttonNewWithLabel "Lizard (Lagarto)"
    button5 <- buttonNewWithLabel "Spock"

    -- cria os labels
    label1 <- labelNew (Just "")
    label2 <- labelNew (Just "")
    label3 <- labelNew (Just "")
    
    -- adiciona os botões na tabela
    tableAttachDefaults table button1 0 1 0 1
    tableAttachDefaults table button2 0 1 1 2
    tableAttachDefaults table button3 0 1 2 3
    tableAttachDefaults table button4 0 1 3 4
    tableAttachDefaults table button5 0 1 4 5

    --adiciona os labels na tabela
    tableAttachDefaults table label1 0 1 5 6
    tableAttachDefaults table label2 0 1 6 7
    tableAttachDefaults table label3 0 1 7 8

    -- seta evento de click nos botões
    on button1 buttonActivated $ buttonClick label1 label2 label3 1
    on button2 buttonActivated $ buttonClick label1 label2 label3 2
    on button3 buttonActivated $ buttonClick label1 label2 label3 3
    on button4 buttonActivated $ buttonClick label1 label2 label3 4
    on button5 buttonActivated $ buttonClick label1 label2 label3 5
    
    

    onDestroy window mainQuit
    widgetShowAll window
    mainGUI
