package com.example.spectacleoff;

import com.google.gson.annotations.SerializedName;

public class Billet {

    @SerializedName("idBillet")
    private int idBillet;

    @SerializedName("categorie")
    private String categorie;

    @SerializedName("prix")
    private double prix;

    @SerializedName("idSpec")
    private int idSpec;

    @SerializedName("Vendu")
    private boolean vendu;

    @SerializedName("idPersonne")
    private Integer idPersonne; // nullable (car dans la base il peut être NULL)

    // Constructeur
    public Billet(String categorie, double prix, int idSpec, boolean vendu, Integer idPersonne) {
        this.categorie = categorie;
        this.prix = prix;
        this.idSpec = idSpec;
        this.vendu = vendu;
        this.idPersonne = idPersonne;
    }

    // Getters et setters
    public int getIdBillet() {
        return idBillet;
    }

    public void setIdBillet(int idBillet) {
        this.idBillet = idBillet;
    }

    public String getCategorie() {
        return categorie;
    }

    public void setCategorie(String categorie) {
        this.categorie = categorie;
    }

    public double getPrix() {
        return prix;
    }

    public void setPrix(double prix) {
        this.prix = prix;
    }

    public int getIdSpec() {
        return idSpec;
    }

    public void setIdSpec(int idSpec) {
        this.idSpec = idSpec;
    }

    public boolean isVendu() {
        return vendu;
    }

    public void setVendu(boolean vendu) {
        this.vendu = vendu;
    }

    public Integer getIdPersonne() {
        return idPersonne;
    }

    public void setIdPersonne(Integer idPersonne) {
        this.idPersonne = idPersonne;
    }
}
