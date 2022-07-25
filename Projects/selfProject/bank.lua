local bank = {}

function bank:new(titular, senha)
    self.titular = titular
    self.senha = senha
    self.saldo = 0
    return true

end

function bank:sacar(valor)
    if valor <= self.saldo then
        self.saldo = self.saldo - valor
        return true

    else
        return false

    end
end

function bank:transferir(valor)
    if valor <= self.saldo then
        self.saldo = self.saldo - valor
        return true
    
    else
        return false

    end
end

function bank:depositar(valor)
    self.saldo = self.saldo + valor
    return true
end

return bank