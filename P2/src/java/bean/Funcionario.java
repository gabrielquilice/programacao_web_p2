/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bean;

import java.sql.Timestamp;

public class Funcionario {
    private int idFuncionario;
    private String nome;
    private String cpf;
    private String rg;
    private String sexo;
    private String data_nascimento;
    private String sys_user;
    private String sys_password;
    private String fg_ativo;

    public int getIdFuncionario() {
        return idFuncionario;
    }

    public void setIdFuncionario(int idFuncionario) {
        this.idFuncionario = idFuncionario;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getRg() {
        return rg;
    }

    public void setRg(String rg) {
        this.rg = rg;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getData_nascimento() {
        return data_nascimento;
    }

    public void setData_nascimento(String data_nascimento) {
        this.data_nascimento = data_nascimento;
    }

    public String getSys_user() {
        return sys_user;
    }

    public void setSys_user(String sys_user) {
        this.sys_user = sys_user;
    }

    public String getSys_password() {
        return sys_password;
    }

    public void setSys_password(String sys_password) {
        this.sys_password = sys_password;
    }

    public String getFg_ativo() {
        return fg_ativo;
    }

    public void setFg_ativo(String fg_ativo) {
        this.fg_ativo = fg_ativo;
    }
}
