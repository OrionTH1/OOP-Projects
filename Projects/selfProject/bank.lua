local bank = {}

function bank:new(titular, senha)
    self.titular = titular
    self.senha = senha
    self.saldo = 0
    return self

end

function bank:sacar(valor)
    self.saldo = self.saldo + valor
    return self.saldo

end

function bank:transferir(conta, valor)
    conta.saldo = conta.saldo + valor
    self.saldo = self.saldo - valor
    return self.saldo

end

function bank:depositar(valor)
    self.saldo = self.saldo + valor
    return self.saldo

end

return bank