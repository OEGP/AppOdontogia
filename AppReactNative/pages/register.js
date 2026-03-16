import React, { useState } from "react";
import {
  View,
  Text,
  TextInput,
  TouchableOpacity,
  StyleSheet
} from "react-native";

import LinearGradient from "react-native-linear-gradient";
import Icon from "react-native-vector-icons/MaterialIcons";

export default function register({ navigation }) {

  const [usuario, setUsuario] = useState("");
  const [correo, setCorreo] = useState("");
  const [password, setPassword] = useState("");
  const [confirmar, setConfirmar] = useState("");

  const registrar = () => {
    if (password !== confirmar) {
      alert("Las contraseñas no coinciden");
      return;
    }

    alert("Usuario registrado");
  };

  return (
    <LinearGradient
      colors={["#2a86d1", "#3fb0d9"]}
      style={styles.container}
    >
      <View style={styles.card}>

        <Icon name="person-add" size={60} color="#fff" />

        <Text style={styles.title}>Register</Text>

        <View style={styles.inputContainer}>
          <Icon name="person" size={22} color="#555" />
          <TextInput
            placeholder="Usuario"
            style={styles.input}
            onChangeText={setUsuario}
          />
        </View>

        <View style={styles.inputContainer}>
          <Icon name="email" size={22} color="#555" />
          <TextInput
            placeholder="Correo"
            style={styles.input}
            onChangeText={setCorreo}
          />
        </View>

        <View style={styles.inputContainer}>
          <Icon name="lock" size={22} color="#555" />
          <TextInput
            placeholder="Contraseña"
            secureTextEntry
            style={styles.input}
            onChangeText={setPassword}
          />
        </View>

        <View style={styles.inputContainer}>
          <Icon name="lock-outline" size={22} color="#555" />
          <TextInput
            placeholder="Confirmar contraseña"
            secureTextEntry
            style={styles.input}
            onChangeText={setConfirmar}
          />
        </View>

        <TouchableOpacity style={styles.button} onPress={registrar}>
          <Text style={styles.buttonText}>Registrarse</Text>
        </TouchableOpacity>

        <Text style={styles.loginText}>
          ¿Ya tienes cuenta?{" "}
          <Text
            style={styles.loginLink}
            onPress={() => navigation.navigate("login")}
          >
            Inicia sesión
          </Text>
        </Text>

      </View>
    </LinearGradient>
  );
}

const styles = StyleSheet.create({

  container: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center"
  },

  card: {
    width: "80%",
    backgroundColor: "#4fb6dc",
    padding: 30,
    borderRadius: 20,
    alignItems: "center"
  },

  title: {
    fontSize: 26,
    color: "#fff",
    marginBottom: 20,
    marginTop: 10
  },

  inputContainer: {
    flexDirection: "row",
    backgroundColor: "#e6e6e6",
    borderRadius: 10,
    alignItems: "center",
    paddingHorizontal: 10,
    marginBottom: 15
  },

  input: {
    flex: 1,
    padding: 10
  },

  button: {
    backgroundColor: "#e0dce9",
    padding: 12,
    borderRadius: 25,
    width: "100%",
    alignItems: "center",
    marginTop: 10
  },

  buttonText: {
    color: "#5a3bbf",
    fontWeight: "bold"
  },

  loginText: {
    marginTop: 15,
    color: "#fff"
  },

  loginLink: {
    color: "#1b4ed8",
    fontWeight: "bold"
  }

});