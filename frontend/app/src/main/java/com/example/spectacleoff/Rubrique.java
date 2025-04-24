package com.example.spectacleoff;

import com.google.gson.annotations.SerializedName;

public class Rubrique {

    @SerializedName("idRubrique")
    private int idRubrique;

    @SerializedName("idSpec")
    private int idSpec;

    @SerializedName("dateRubrique")
    private String dateRubrique;

    @SerializedName("heureRubrique")
    private String heureRubrique;

    @SerializedName("LieuRubrique")
    private String lieuRubrique;

    @SerializedName("nombreSpectateur")
    private int nombreSpectateur;

    @SerializedName("places_reservees")
    private String placesReservees;

    public String getPlacesReservees() {
        return placesReservees;
    }

    public void setPlacesReservees(String placesReservees) {
        this.placesReservees = placesReservees;
    }


    // Getters
    public int getIdRubrique() {
        return idRubrique;
    }

    public int getIdSpec() {
        return idSpec;
    }

    public String getDateRubrique() {
        return dateRubrique;
    }

    public String getHeureRubrique() {
        return heureRubrique;
    }

    public String getLieuRubrique() {
        return lieuRubrique;
    }
    @Override
    public String toString() {
        return "Rubrique {lieuRubrique='" + lieuRubrique + "', nombreSpectateur=" + nombreSpectateur + "}";
    }

    public int getNombreSpectateur() {
        return nombreSpectateur;
    }

    // Setters
    public void setIdRubrique(int idRubrique) {
        this.idRubrique = idRubrique;
    }

    public void setIdSpec(int idSpec) {
        this.idSpec = idSpec;
    }

    public void setDateRubrique(String dateRubrique) {
        this.dateRubrique = dateRubrique;
    }

    public void setHeureRubrique(String heureRubrique) {
        this.heureRubrique = heureRubrique;
    }

    public void setLieuRubrique(String lieuRubrique) {
        this.lieuRubrique = lieuRubrique;
    }

    public void setNombreSpectateur(int nombreSpectateur) {
        this.nombreSpectateur = nombreSpectateur;
    }
}
