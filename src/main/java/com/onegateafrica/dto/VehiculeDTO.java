package com.onegateafrica.dto;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.onegateafrica.entity.Agence;
import com.onegateafrica.entity.Categorie;
import com.onegateafrica.entity.Opt;
import com.onegateafrica.entity.Promotion;
import com.onegateafrica.entity.Utilisateur;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@JsonIgnoreProperties(ignoreUnknown = true)
@Data
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class VehiculeDTO implements Serializable {

  private long id;

  private String gouvernorat;//wileya//E2
  private String rue;//wileya//E2
  private String zip;//wileya//E2
  private String longitude;
  private String latitude;


  private String ville;//mo3tamdia wla blasa bdhbt//E2
  private int annee;//3am ly tsan3t fih //E1
  private int nbrCylindre;// 4,3.../E1
  private String gamme;//E1
  private String maison;//E1
  private int puissance;//5,4 chevaux...//E1
  private float kmCompteur;//E1
  private String boiteVitesse;//E1
  private String energie;//essence ou mazout//E1
  private float prix;//E4
  private boolean disponibilite;
  private String image1;//E3
  private String image2;//E3
  private String image3;//E3
  private String image4;//E3
  private String image5;//E3

  private int nbrPlace;//E1
  private Timestamp dateDebut;//E2

  private Timestamp dateFin;//E2
  private Date dateDebutDemande;
  private Date dateFinDemande;
  private int view;
  private int nbrVehicule; //3dad lkrahb m naw3ia adhika //E4
  private  String description;//E1
  //  private long categorieidd; //3dad lkrahb m naw3ia adhika //E4

  private transient Agence agence;

  private transient Utilisateur utilisateur;

  private transient Categorie categorie;

  private transient List<Opt> opt;

  private transient Promotion promotion;

  public VehiculeDTO( String gouvernorat, String rue, String zip, String ville, int annee, int nbrCylindre, String gamme, String maison, int puissance, float kmCompteur, String boiteVitesse, String energie, float prix, String image1, String image2, String image3, String image4, String image5, int nbrPlace, Timestamp dateDebut, Timestamp dateFin, int nbrVehicule, String description) {

    this.gouvernorat = gouvernorat;
    this.rue = rue;
    this.zip = zip;
    this.ville = ville;
    this.annee = annee;
    this.nbrCylindre = nbrCylindre;
    this.gamme = gamme;
    this.maison = maison;
    this.puissance = puissance;
    this.kmCompteur = kmCompteur;
    this.boiteVitesse = boiteVitesse;
    this.energie = energie;
    this.prix = prix;
    this.image1 = image1;
    this.image2 = image2;
    this.image3 = image3;
    this.image4 = image4;
    this.image5 = image5;
    this.nbrPlace = nbrPlace;
    this.dateDebut = dateDebut;
    this.dateFin = dateFin;
    this.nbrVehicule = nbrVehicule;
    this.description = description;
  }
}
