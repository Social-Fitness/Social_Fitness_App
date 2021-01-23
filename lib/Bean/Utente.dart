class Utente {
  String nome;
  String cognome;
  String email;
  String cellulare;
  String dataNascita;
  String categoria;
  String password;
  String imgProfilo;

  Utente(this.nome, this.cognome, this.email, this.cellulare, this.dataNascita, this.categoria, this.password, this.imgProfilo);

  String getNome() {
    return nome;
  }

  String getCognome() {
    return cognome;
  }

  String getEmail() {
    return email;
  }

  String getCellulare() {
    return cellulare;
  }

  String getDataNascita() {
    return dataNascita;
  }

  String getCategoria() {
    return categoria;
  }

  String getPassword() {
    return password;
  }

  String getImgProfilo() {
    return imgProfilo;
  }

}