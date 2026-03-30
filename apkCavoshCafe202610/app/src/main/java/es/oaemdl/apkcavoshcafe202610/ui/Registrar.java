package es.oaemdl.apkcavoshcafe202610.ui;

import android.content.Context;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import androidx.fragment.app.Fragment;
import androidx.navigation.NavController;
import androidx.navigation.Navigation;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.google.android.material.textfield.TextInputLayout;

import java.util.HashMap;
import java.util.Map;

import es.oaemdl.apkcavoshcafe202610.R;
import es.oaemdl.apkcavoshcafe202610.databinding.FragmentRegistrarBinding;


public class Registrar extends Fragment {
    FragmentRegistrarBinding binding;
    View view;
    Context context;
    NavController navController;

    @Override
    public void onDestroyView() {
        super.onDestroyView();
        binding = null;
    }

    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        View view = inflater.inflate(R.layout.fragment_registrar, container, false);


        TextInputLayout tilNombre = view.findViewById(R.id.tilNombres);
        TextInputLayout tilCorreo = view.findViewById(R.id.tilCorreo);
        TextInputLayout tilPassword = view.findViewById(R.id.tilPasswordd);
        TextInputLayout tilConfirm = view.findViewById(R.id.tilPassworddConfirmar);

        EditText nombre = tilNombre.getEditText();
        EditText correo = tilCorreo.getEditText();
        EditText password = tilPassword.getEditText();
        EditText contraconfirm = tilConfirm.getEditText();

        Button btnRegistrar = view.findViewById(R.id.btnRegistrar);
        Button btnIniciar = view.findViewById(R.id.tvIniciarSesion);

        btnRegistrar.setOnClickListener(v -> {

            String nom = nombre.getText().toString();
            String mail = correo.getText().toString();
            String pass = password.getText().toString();
            String conf = contraconfirm.getText().toString();

            if (TextUtils.isEmpty(nom) || TextUtils.isEmpty(mail) ||
                    TextUtils.isEmpty(pass) || TextUtils.isEmpty(conf)) {

                Toast.makeText(getContext(), "Completa todos los campos", Toast.LENGTH_SHORT).show();
                return;
            }

            if (!pass.equals(conf)) {
                Toast.makeText(getContext(), "Las contraseñas no coinciden", Toast.LENGTH_SHORT).show();
                return;
            }

            if (pass.length() < 6) {
                Toast.makeText(getContext(), "Mínimo 6 caracteres", Toast.LENGTH_SHORT).show();
                return;
            }

            String url = "http://10.0.2.2:3000/register";


            StringRequest request = new StringRequest(Request.Method.POST, url,
                    response -> {

                        Toast.makeText(getContext(), "Registrado correctamente", Toast.LENGTH_SHORT).show();

                        NavController navController = Navigation.findNavController(v);
                        navController.navigate(R.id.navigation_login);

                    },
                    error -> {
                        Toast.makeText(getContext(), "Error: " + error.toString(), Toast.LENGTH_LONG).show();
                    }) {

                @Override
                protected Map<String, String> getParams() {
                    Map<String, String> params = new HashMap<>();
                    params.put("nombre", nom);
                    params.put("correo", mail);
                    params.put("password", pass);
                    return params;
                }
            };

            RequestQueue queue = Volley.newRequestQueue(getContext());
            queue.add(request);
        });


        btnIniciar.setOnClickListener(v -> {

            NavController navController = Navigation.findNavController(v);
            navController.navigate(R.id.navigation_login);

        });

        return view;
    }





}