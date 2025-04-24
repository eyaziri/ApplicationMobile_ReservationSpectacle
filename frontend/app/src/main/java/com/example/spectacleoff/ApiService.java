package com.example.spectacleoff;

import retrofit2.Call;
import retrofit2.http.Body;
import retrofit2.http.GET;
import retrofit2.http.Headers;
import retrofit2.http.POST;
import retrofit2.http.PUT;
import retrofit2.http.Path;

import java.util.List;

public interface ApiService {

    // ==== RESERVATION ====

    @GET("personnes/{id}")
    Call<Personne> getPersonneById(@Path("id") int id);

    @GET("personnes/derniere")
    Call<Personne> getDernierePersonne();

    @POST("personnes")
    @Headers("Content-Type: application/json")
    Call<Personne> enregistrerReservation(@Body Personne reservation);

    // ==== SPECTACLE ====

    @POST("email/envoyerrem")
    Call<Void> envoyerEmailVerification(@Body EmailRequest emailRequest);

    @GET("spectacles")
    Call<List<Spectacle>> getSpectacles();

    @POST("spectacles")
    @Headers("Content-Type: application/json")
    Call<Void> ajouterSpectacle(@Body Spectacle spectacle);

    @GET("spectacles/date/{date}/genre/{genre}")
    Call<List<Spectacle>> getSpectaclesByGenreAndDate(@Path("genre") String genre, @Path("date") String date);

    @GET("spectacles/date/{date}")
    Call<List<Spectacle>> getSpectaclesByDate(@Path("date") String date);

    @GET("spectacles/genre/{genre}")
    Call<List<Spectacle>> getSpectaclesByGenre(@Path("genre") String genre);

    @GET("spectacles/{idSpec}")
    Call<Spectacle> getSpectacleById(@Path("idSpec") int idSpec);

    @GET("spectacles/titre/{title}")
    Call<List<Spectacle>> getSpectaclesByTitle(@Path("title") String title);

    @GET("spectacles/genre/{genre}/date/{date}/titre/{title}")
    Call<List<Spectacle>> getSpectaclesByGenreDateAndTitle(@Path("genre") String genre, @Path("date") String date, @Path("title") String title);

    @GET("spectacles/genre/{genre}/titre/{title}")
    Call<List<Spectacle>> getSpectaclesByGenreAndTitle(@Path("genre") String genre, @Path("title") String title);

    @GET("spectacles/date/{date}/titre/{title}")
    Call<List<Spectacle>> getSpectaclesByDateAndTitle(@Path("date") String date, @Path("title") String title);

    @GET("spectacles/genre/{genre}/date/{date}/title/{title}/lieu/{lieu}")
    Call<List<Spectacle>> getSpectaclesByAll(@Path("genre") String genre, @Path("date") String date, @Path("title") String title, @Path("lieu") String lieu);

    // ==== BILLET ====

    @GET("billet")
    Call<List<Billet>> getBillets();
    @POST("billets")
    @Headers("Content-Type: application/json")
    Call<Void> ajouterBillet(@Body Billet billet);


    // ==== RUBRIQUE ====

    @GET("rubriques")
    Call<List<Rubrique>> getRubriques();

    @POST("rubriques")
    @Headers("Content-Type: application/json")
    Call<Void> ajouterRubrique(@Body Rubrique rubrique);

    @PUT("rubriques/{idRubrique}/updatePlaces")
    Call<Void> updateRubriquePlaces(
            @Path("idRubrique") int idRubrique,
            @Body Rubrique rubrique
    );


    @GET("rubriques/{idRubrique}")
    Call<Rubrique> getRubriqueById(@Path("idRubrique") int idRubrique);


    @GET("rubriques/getLieuRubrique/{idRubrique}")
    Call<LieuResponse> getLieuRubrique(@Path("idRubrique") int idRubrique);


    @GET("rubriques/spectacle/{idSpec}")
    Call<List<Rubrique>> getRubriquesBySpectacle(@Path("idSpec") int idSpec);
}
