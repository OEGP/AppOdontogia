package es.oaemdl.apkcavoshcafe202610.ui;

import android.content.SharedPreferences;
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
import es.oaemdl.apkcavoshcafe202610.databinding.FragmentPerfilBinding;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

public class Perfil extends Fragment {

    FragmentPerfilBinding binding;
    NavController navController;

    int userId;

    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        binding = FragmentPerfilBinding.inflate(inflater, container, false);
        return binding.getRoot();
    }

    @Override
    public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);

        navController = Navigation.findNavController(view);

        SharedPreferences prefs = requireContext().getSharedPreferences("user", getContext().MODE_PRIVATE);
        userId = prefs.getInt("id", -1);

        if (userId == -1) {
            Toast.makeText(getContext(), "Sesión no encontrada", Toast.LENGTH_SHORT).show();
            navController.navigate(R.id.navigation_login);
            return;
        }

        cargarPerfil();

        binding.btnCambiarContra.setOnClickListener(v -> {

            String nuevaPass = binding.NuevaContra.getEditText().getText().toString();

            if (nuevaPass.length() < 6) {
                Toast.makeText(getContext(), "Mínimo 6 caracteres", Toast.LENGTH_SHORT).show();
                return;
            }

            String url = "http://10.0.2.2:3000/update-password";

            StringRequest request = new StringRequest(Request.Method.POST, url,
                    response -> {
                        Toast.makeText(getContext(), "Contraseña actualizada", Toast.LENGTH_SHORT).show();
                    },
                    error -> {
                        Toast.makeText(getContext(), "Error al actualizar", Toast.LENGTH_SHORT).show();
                    }) {

                @Override
                protected Map<String, String> getParams() {
                    Map<String, String> params = new HashMap<>();
                    params.put("id", String.valueOf(userId));
                    params.put("password", nuevaPass);
                    return params;
                }
            };

            Volley.newRequestQueue(requireContext()).add(request);
        });

        // 🚪 Cerrar sesión
        binding.btnCerrarSesion.setOnClickListener(v -> {

            requireContext()
                    .getSharedPreferences("user", getContext().MODE_PRIVATE)
                    .edit()
                    .clear()
                    .apply();

            navController.popBackStack();
            navController.navigate(R.id.navigation_login);
        });
    }

    private void cargarPerfil() {

        String url = "http://10.0.2.2:3000/user/" + userId;

        StringRequest request = new StringRequest(Request.Method.GET, url,
                response -> {
                    try {
                        JSONObject json = new JSONObject(response);

                        String nombre = json.getString("nombre");
                        String correo = json.getString("correo");

                        binding.txtNombre.setText(nombre);
                        binding.txtCorreo.setText(correo);

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                },
                error -> {
                    Toast.makeText(getContext(), "Error al cargar perfil", Toast.LENGTH_SHORT).show();
                });

        RequestQueue queue = Volley.newRequestQueue(requireContext());
        queue.add(request);
    }

    @Override
    public void onDestroyView() {
        super.onDestroyView();
        binding = null;
    }
}
