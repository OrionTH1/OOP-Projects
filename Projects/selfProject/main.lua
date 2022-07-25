local db = false
local conta2 = require('bank')
conta2:new()

local function registro()
    io.write("Primeiro, digite seu nome completo: ")
    local titular = tostring(io.read()):upper():gsub("%d", "")

    print("")

    io.write("Agora qual sera a senha da conta? ")
    local senha = tostring(io.read()):gsub("%s", "")

    print("")

    Conta = require("bank")
    Conta:new(titular, senha)
    print("Bem vindo ao nosso Banco :)")
    print("Acessando a conta...\n")
    
    Menu()
    
end

function Menu()
    if db == false then
        print("\nBem vindo, o que voce quer fazer?")
        print("---------------------------------")
        print("Transferir [1]")
        print("Depositar [2]")
        print("Sacar [3]")
        print("Ver saldo [4]")
        
    end
    
    local action = io.read("l")
    if tostring(action:upper()):gsub("%s", "") == "1" then
        io.write("\nDigite o valor que voce deseja Transferir: ")
        local valor = tonumber(io.read())
        print(type(tonumber(valor)))
        if type(valor) ~= "number" then 
            print("Houve algum erro ao transferir esse valor, tente novamente selecionando \"Transferencia\" no Menu\n") 
            return Menu()
        end
        print("\nTransferindo para conta amiga salva...")
        Conta:transferir(conta2, valor)
        print("Transferencia realizada com sucesso !\n")
        db = false
        return Menu()

    elseif tostring(action:upper()):gsub("%s", "") == "2" then
        io.write("\nDigite o valor que voce deseja depositar: ")
        local valor = tonumber(io.read())
        if type(valor) ~= "number" then
            print("Houve algum erro ao transferir esse valor, tente novamente selecionando \"Transferencia\" no Menu\n")
            return Menu()
        end

        print("\nDepositando...")
        Conta:depositar(valor)
        print("Deposito realizado com sucesso !\n")
        db = false
        return Menu()

    elseif tostring(action:upper()):gsub("%s", "") == "3" then
        io.write("\nDigite o valor que voce deseja sacar: ")
        local valor = io.read()
        if type(valor) ~= "number" then
            print("Houve algum erro ao transferir esse valor, tente novamente selecionando \"Transferencia\" no Menu\n") 
            return Menu()
        end
        
        print("\nSacando...")
        Conta:sacar(valor)
        print("Saque realido com sucesso !\n")
        db = false
        return Menu()

    elseif tostring(action:upper()):gsub("%s", "") == "4" then
        print("\nTitular da Conta: "..Conta.titular)
        print("Saldo da Conta: "..Conta.saldo)
        print("")
        db = false
        return Menu()
        
    else
        print("Escolha nao encontrada")
        db = true
        return Menu()

    end

end

io.write("Presione Enter para comecar com o seu registro no nosso Banco ! ")
io.read()
registro()