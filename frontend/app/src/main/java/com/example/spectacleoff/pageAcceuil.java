package com.example.spectacleoff;

import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.Log;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.Spinner;
import android.widget.AdapterView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.google.android.material.bottomnavigation.BottomNavigationView;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class pageAcceuil extends AppCompatActivity {

    private RecyclerView recyclerView;
    private SpectacleAdapter adapter;
    private List<Spectacle> spectacles = new ArrayList<>();

    private EditText searchEditText;
    private ImageButton searchButton;
    private Spinner searchTypeSpinner;

    private String currentSearchType = "Recherche par titre";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_page_acceuil);

        recyclerView = findViewById(R.id.recyclerViewFilms);
        recyclerView.setLayoutManager(new GridLayoutManager(this, 2));

        searchEditText = findViewById(R.id.searchEditText);
        searchButton = findViewById(R.id.recherche);
        searchTypeSpinner = findViewById(R.id.searchTypeSpinner);
        searchTypeSpinner.setVisibility(View.GONE);


        setupSpinner();
        setupSearchButton();
        setupSearchListener();
        setupBottomNavigation();

        loadSpectaclesFromAPI();
    }

    private void setupSpinner() {
        ArrayAdapter<CharSequence> spinnerAdapter = ArrayAdapter.createFromResource(
                this,
                R.array.search_options,
                R.layout.spinner_item_white
        );
        spinnerAdapter.setDropDownViewResource(R.layout.spinner_dropdown_item_white);
        searchTypeSpinner.setAdapter(spinnerAdapter);

        searchTypeSpinner.setBackgroundColor(getResources().getColor(android.R.color.transparent));
        searchTypeSpinner.setPopupBackgroundDrawable(getDrawable(R.drawable.spinner_dropdown_background));

        searchTypeSpinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                currentSearchType = parent.getItemAtPosition(position).toString();
                searchEditText.setHint(currentSearchType.equals("Recherche par lieu")
                        ? "Lieu du spectacle..." : "Titre du spectacle...");
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {}
        });
    }

    private void setupSearchButton() {
        searchButton.setOnClickListener(v -> {
            if (searchEditText.getVisibility() == View.GONE) {
                searchEditText.setVisibility(View.VISIBLE);
                searchTypeSpinner.setVisibility(View.VISIBLE); // Afficher le Spinner
                searchEditText.requestFocus();
            } else {
                searchEditText.setVisibility(View.GONE);
                searchTypeSpinner.setVisibility(View.GONE); // Cacher le Spinner
            }
        });
    }


    private void setupSearchListener() {
        searchEditText.addTextChangedListener(new TextWatcher() {
            @Override public void beforeTextChanged(CharSequence s, int start, int count, int after) {}
            @Override public void afterTextChanged(Editable s) {}

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
                String query = s.toString();
                if (currentSearchType.equals("Recherche par lieu")) {
                    filterSpectaclesByLieu(query);
                } else {
                    filterSpectaclesByTitle(query);
                }
            }
        });
    }

    private void setupBottomNavigation() {
        BottomNavigationView bottomNavigationView = findViewById(R.id.bottom_navigation);
        bottomNavigationView.setOnItemSelectedListener(item -> {
            String selectedGenre = item.getTitle().toString();
            filterSpectaclesByGenre(selectedGenre);
            return true;
        });
    }

    private void loadSpectaclesFromAPI() {
        ApiService apiService = RetrofitClient.getApiService();
        apiService.getSpectacles().enqueue(new Callback<List<Spectacle>>() {
            @Override
            public void onResponse(Call<List<Spectacle>> call, Response<List<Spectacle>> response) {
                if (response.isSuccessful() && response.body() != null) {
                    spectacles = response.body();
                    adapter = new SpectacleAdapter(pageAcceuil.this, spectacles);
                    recyclerView.setAdapter(adapter);
                } else {
                    showToast("Erreur de réponse");
                }
            }

            @Override
            public void onFailure(Call<List<Spectacle>> call, Throwable t) {
                Log.e("API_ERROR", t.getMessage());
                showToast("Erreur : " + t.getMessage());
            }
        });
    }

    private void filterSpectaclesByGenre(String genre) {
        if (spectacles != null) {
            List<Spectacle> filtered = spectacles.stream()
                    .filter(s -> s.getGenre().equalsIgnoreCase(genre))
                    .collect(Collectors.toList());

            updateAdapter(filtered);
        }
    }

    private void filterSpectaclesByTitle(String query) {
        if (spectacles != null) {
            List<Spectacle> filtered = spectacles.stream()
                    .filter(s -> s.getTitre().toLowerCase().contains(query.toLowerCase()))
                    .collect(Collectors.toList());

            updateAdapter(filtered);
        }
    }

    private void filterSpectaclesByLieu(String query) {
        if (spectacles == null || query.isEmpty()) return;

        List<Spectacle> filtered = new ArrayList<>();
        int[] counter = {0};

        for (Spectacle spectacle : spectacles) {
            ApiService apiService = RetrofitClient.getApiService();
            apiService.getRubriquesBySpectacle(spectacle.getIdSpec()).enqueue(new Callback<List<Rubrique>>() {
                @Override
                public void onResponse(Call<List<Rubrique>> call, Response<List<Rubrique>> response) {
                    counter[0]++;
                    if (response.isSuccessful() && response.body() != null) {
                        for (Rubrique r : response.body()) {
                            if (r.getLieuRubrique().toLowerCase().contains(query.toLowerCase())) {
                                filtered.add(spectacle);
                                break;
                            }
                        }
                    }
                    if (counter[0] == spectacles.size()) {
                        updateAdapter(filtered);
                    }
                }

                @Override
                public void onFailure(Call<List<Rubrique>> call, Throwable t) {
                    counter[0]++;
                    if (counter[0] == spectacles.size()) {
                        updateAdapter(filtered);
                    }
                    Log.e("API_ERROR", t.getMessage());
                    showToast("Erreur : " + t.getMessage());
                }
            });
        }
    }

    private void updateAdapter(List<Spectacle> newList) {
        adapter = new SpectacleAdapter(this, newList);
        recyclerView.setAdapter(adapter);
    }

    private void showToast(String message) {
        Toast.makeText(pageAcceuil.this, message, Toast.LENGTH_SHORT).show();
    }
}