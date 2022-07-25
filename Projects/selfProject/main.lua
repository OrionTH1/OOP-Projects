local db = false

local function errorBank(error, code)
    if code == 1 then
        print("Houve algum erro ao "..error..", tente novamente selecionando \""..error.."\" no Menu")
        io.write("Precione enter para voltar para o Menu!")
        io.read()
        return Menu()
    
    elseif code == 2 then
        print("Saldo insuficiente para continuar o processo!")
        io.write("Precione enter para voltar para o Menu!")
        io.read()
        return Menu()
        
    end
end

local function registro()
    io.write("Primeiro, digite seu nome completo: ")
    local titular = tostring(io.read()):upper():gsub("%d", "")

    print("")

    io.write("Agora qual sera a senha da conta? ")
    local senha = tostring(io.read()):gsub("%s", "")

    print("")

    if (titular:len() > 1) and (senha:len() > 1) then 
        Conta = require("bank")
        Conta:new(titular, senha)
        print("Bem vindo ao nosso Banco :)")
        print("Acessando a conta...\n")
        
        return Menu()

    else
        print("Nao esqueca de preencher nenhum campo, tente novamente!\n")
        return registro()

    end
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
        if type(valor) ~= "number" then errorBank("Transferir", 1) end

        print("\nTransferindo para conta amiga salva...")
        if not Conta:transferir(valor) then errorBank("Transferencia", 2) end
        print("Transferencia realizada com sucesso!\n")
        db = false
        return Menu()

    elseif tostring(action:upper()):gsub("%s", "") == "2" then
        io.write("\nDigite o valor que voce deseja depositar: ")
        local valor = tonumber(io.read())
        if type(valor) ~= "number" then errorBank("Depositar", 1) end

        print("\nDepositando...")
        Conta:depositar(valor)
        print("Deposito realizado com sucesso!\n")
        db = false
        return Menu()

    elseif tostring(action:upper()):gsub("%s", "") == "3" then
        io.write("\nDigite o valor que voce deseja sacar: ")
        local valor = tonumber(io.read())
        if type(valor) ~= "number" then errorBank("Sacar", 1) end
        
        print("\nSacando...")
        if not Conta:sacar(valor) then errorBank("Sacar", 2) end
        print("Saque realido com sucesso!\n")
        db = false
        return Menu()

    elseif tostring(action:upper()):gsub("%s", "") == "4" then
        print("\nTitular da Conta: "..Conta.titular)
        print("Saldo da Conta: "..Conta.saldo)
        print("")
        io.write("Precione enter para voltar para o Menu!")
        io.read()
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