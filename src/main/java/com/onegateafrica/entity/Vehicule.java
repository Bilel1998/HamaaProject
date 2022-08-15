package com.onegateafrica.entity;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Entity
public class Vehicule {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
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
  private int nbrPlace;
  private String image1;//E3
  private String image2;//E3
  private String image3;//E3
  private String image4;//E3
  private String image5;//E3    private int nbrPlace;//E1
  @DateTimeFormat(iso = DateTimeFormat.ISO.DATE, pattern = "yyyy-MM-dd")
  private Date dateDebut;//E2
  @DateTimeFormat(iso = DateTimeFormat.ISO.DATE, pattern = "yyyy-MM-dd")
  private Date dateFin;//E2
  @DateTimeFormat(iso = ISO.DATE, pattern = "yyyy-MM-dd")
  private Date dateDebutDemande;
  @DateTimeFormat(iso = ISO.DATE, pattern = "yyyy-MM-dd")
  private Date dateFinDemande;
  private int view;
  private int nbrVehicule; //3dad lkrahb m naw3ia adhika //E4
  private  String description;//E1

  public Vehicule(String maison,String gouvernorat, String rue, String zip, String ville, int annee, int nbrCylindre, String gamme, int puissance, float kmCompteur, String boiteVitesse, String energie, float prix, int nbrPlace, String image1, String image2, String image3, String image4, String image5, Date dateDebut, Date dateFin, int nbrVehicule, String description,  Categorie categorie) {
    this.maison=maison;
    this.gouvernorat = gouvernorat;
    this.rue = rue;
    this.zip = zip;
    this.ville = ville;
    this.annee = annee;
    this.nbrCylindre = nbrCylindre;
    this.gamme = gamme;
    this.puissance = puissance;
    this.kmCompteur = kmCompteur;
    this.boiteVitesse = boiteVitesse;
    this.energie = energie;
    this.prix = prix;
    this.nbrPlace = nbrPlace;
    this.image1 = image1;
    this.image2 = image2;
    this.image3 = image3;
    this.image4 = image4;
    this.image5 = image5;
    this.dateDebut = dateDebut;
    this.dateFin = dateFin;
    this.nbrVehicule = nbrVehicule;
    this.description = description;
    this.categorie = categorie;
  }

  //  @JsonBackReference
  //@JsonIgnore
  @ManyToOne()
  private Agence agence;

  //  @JsonBackReference
  //@JsonIgnore
  @ManyToOne()
  private Utilisateur utilisateur;

  //  @JsonBackReference
  //@JsonIgnore
  @ManyToOne()
  private Categorie categorie;//E1

  //  @JsonBackReference
  //@JsonIgnore
  @ManyToMany(cascade = CascadeType.MERGE)
  private List<Opt> opt;//E1

  @JsonIgnore
  @OneToOne(cascade = CascadeType.MERGE,mappedBy = "vehicule")
  private Promotion promotion;


}
