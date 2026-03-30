package es.oaemdl.apkcavoshcafe202610.ui;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.navigation.NavController;
import androidx.navigation.Navigation;

import es.oaemdl.apkcavoshcafe202610.R;
import es.oaemdl.apkcavoshcafe202610.databinding.FragmentLoginBinding;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

public class Login extends Fragment {

    FragmentLoginBinding binding;
    NavController navController;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        binding = FragmentLoginBinding.inflate(inflater, container, false);
        return binding.getRoot();
    }

    @Override
    public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);

        navController = Navigation.findNavController(view);

        // 🔐 BOTÓN LOGIN
        binding.btnIniciar.setOnClickListener(v -> {

            String correo = binding.tilCorreo.getEditText().getText().toString();
            String contra = binding.tilPasswordd.getEditText().getText().toString();

            if (correo.isEmpty() || contra.isEmpty()) {
                Toast.makeText(getContext(), "Completa los campos", Toast.LENGTH_SHORT).show();
                return;
            }

            String url = "http://10.0.2.2:3000/login";

            StringRequest request = new StringRequest(Request.Method.POST, url,
                    response -> {
                        try {
                            JSONObject json = new JSONObject(response);

                            int id = json.getInt("id");
                            String nombre = json.getString("nombre");

                            requireContext()
                                    .getSharedPreferences("user", requireContext().MODE_PRIVATE)
                                    .edit()
                                    .putInt("id", id)
                                    .apply();

                            Toast.makeText(getContext(), "Bienvenido " + nombre, Toast.LENGTH_SHORT).show();

                            navController.navigate(R.id.navigation_inicio);

                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    },
                    error -> {
                        Toast.makeText(getContext(), "Correo o contraseña incorrectos", Toast.LENGTH_SHORT).show();
                    }) {

                @Override
                protected Map<String, String> getParams() {
                    Map<String, String> params = new HashMap<>();
                    params.put("correo", correo);
                    params.put("password", contra);
                    return params;
                }
            };

            RequestQueue queue = Volley.newRequestQueue(requireContext());
            queue.add(request);
        });

        binding.tvRegistrar01.setOnClickListener(v -> {
            navController.navigate(R.id.navigation_registrar);
        });
    }

    @Override
    public void onDestroyView() {
        super.onDestroyView();
        binding = null;
    }
}
