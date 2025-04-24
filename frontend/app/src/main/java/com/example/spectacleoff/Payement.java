package com.example.spectacleoff;

import android.content.Intent;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.os.Bundle;
import android.util.Log;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

import java.io.IOException;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class Payement extends AppCompatActivity {

    private int idSpec, idRubrique, prixSpectacle, seatsReserved, identite;
    private int prixTotal;
    private String movieGenre;
    private String nom, prenom, mail;

    private EditText editNom, editPrenom, editEmail;
    private Button payerButton;

    private ApiService apiService;
    private Personne personne;
    private Personne p1;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_payement);

        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.paiement), (v, insets) -> {
            Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
            return insets;
        });

        Intent intent = getIntent();
        idSpec = intent.getIntExtra("idSpec", -1);
        idRubrique = intent.getIntExtra("idRubrique", -1);
        prixSpectacle = intent.getIntExtra("prix", 0);
        seatsReserved = intent.getIntExtra("seatsReserved", 0);
        prixTotal = intent.getIntExtra("prixTotal", 0);
        movieGenre = intent.getStringExtra("movieGenre");

        if (idSpec == -1 || idRubrique == -1) {
            Toast.makeText(this, "Erreur dans les informations de réservation", Toast.LENGTH_SHORT).show();
            finish();
            return;
        }

        apiService = RetrofitClient.getApiService();

        editNom = findViewById(R.id.nom);
        editPrenom = findViewById(R.id.prenom);
        editEmail = findViewById(R.id.email);
        payerButton = findViewById(R.id.payer);
        payerButton.setText(prixTotal + " DT | Payer");

        CheckBox cbCarte = findViewById(R.id.checkbox_carte);
        CheckBox cbD17 = findViewById(R.id.checkbox_d17);
        CheckBox cbCash = findViewById(R.id.checkbox_cash);

        CheckBox[] checkBoxes = {cbCarte, cbD17, cbCash};
        for (CheckBox cb : checkBoxes) {
            cb.setOnClickListener(v -> {
                for (CheckBox otherCb : checkBoxes) {
                    if (otherCb != cb) {
                        otherCb.setChecked(false);
                        otherCb.setButtonTintList(null);
                        otherCb.setTextColor(Color.WHITE);
                    }
                }
                if (cb.isChecked()) {
                    cb.setButtonTintList(ColorStateList.valueOf(Color.parseColor("#22C55E")));
                    cb.setTextColor(Color.parseColor("#22C55E"));
                } else {
                    cb.setButtonTintList(null);
                    cb.setTextColor(Color.WHITE);
                }
            });
        }

        payerButton.setOnClickListener(v -> {
            String nom = editNom.getText().toString().trim();
            String prenom = editPrenom.getText().toString().trim();
            String email = editEmail.getText().toString().trim();

            if (nom.isEmpty() || prenom.isEmpty() || email.isEmpty()) {
                Toast.makeText(this, "Veuillez remplir tous les champs", Toast.LENGTH_SHORT).show();
                return;
            }

            Personne nouvellePersonne = new Personne(nom, prenom, email, seatsReserved, idSpec);

            apiService.enregistrerReservation(nouvellePersonne).enqueue(new Callback<Personne>() {
                @Override
                public void onResponse(Call<Personne> call, Response<Personne> response) {
                    if (response.isSuccessful()) {
                        Toast.makeText(Payement.this, "Passez à la réception du ticket", Toast.LENGTH_SHORT).show();
                        Personne personneEnregistree = response.body();
                        if (personneEnregistree != null) {
                            identite = personneEnregistree.getId();
                            mail = personneEnregistree.getEmail();
                            personne = personneEnregistree;
                            p1 = new Personne(nouvellePersonne.getNom(), nouvellePersonne.getPrenom(), nouvellePersonne.getEmail(), nouvellePersonne.getNombreDePlace(), nouvellePersonne.getIdRubrique());

                            payerBillet(prixTotal);
                        }
                    } else {
                        try {
                            String errorBody = response.errorBody().string();
                            Toast.makeText(Payement.this, "Erreur: " + errorBody, Toast.LENGTH_SHORT).show();
                            Log.e("Erreur d'enregistrement", errorBody);
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                }

                @Override
                public void onFailure(Call<Personne> call, Throwable t) {
                    Toast.makeText(Payement.this, "Erreur de connexion: " + t.getMessage(), Toast.LENGTH_SHORT).show();
                }
            });
        });
    }

    private void payerBillet(int prixTotal) {
        if (identite == 0) {
            Toast.makeText(Payement.this, "ID de la personne invalide", Toast.LENGTH_SHORT).show();
            return;
        }

        Billet billet = new Billet("Spectacle", prixTotal, idSpec, true, identite);

        apiService.ajouterBillet(billet).enqueue(new Callback<Void>() {
            @Override
            public void onResponse(Call<Void> call, Response<Void> response) {
                if (response.isSuccessful()) {
                    Toast.makeText(Payement.this, "Merci pour votre confiance.", Toast.LENGTH_SHORT).show();
                    Intent intent = new Intent(Payement.this, Remerciement_activity.class);
                    intent.putExtra("idRubrique", idRubrique);
                    intent.putExtra("idSpec", idSpec);
                    intent.putExtra("seatsReserved", seatsReserved);
                    intent.putExtra("prixTotal", prixTotal);
                    intent.putExtra("movieGenre", movieGenre);
                    intent.putExtra("personne", p1);
                    startActivity(intent);
                    finish();
                } else {
                    try {
                        String errorBody = response.errorBody().string();
                        Log.e("Erreur billet", errorBody);
                        Toast.makeText(Payement.this, "Erreur d'enregistrement du billet", Toast.LENGTH_SHORT).show();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }

            @Override
            public void onFailure(Call<Void> call, Throwable t) {
                Toast.makeText(Payement.this, "Erreur de connexion", Toast.LENGTH_SHORT).show();
            }
        });
    }
}
