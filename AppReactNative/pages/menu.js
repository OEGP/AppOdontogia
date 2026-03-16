import React from "react";
import { View, Text, TouchableOpacity, StyleSheet } from "react-native";
import Icon from "react-native-vector-icons/MaterialIcons";

export default function menu({ navigation }) {

  return (
    <View style={styles.container}>

      <Text style={styles.title}>Titulo de pagina</Text>

      <Text style={styles.subtitle}>
        Selecciona un área para marcar tu cita:
      </Text>

      <View style={styles.grid}>

        <TouchableOpacity style={styles.card}>
          <Icon name="medical-services" size={50} color="#2a86d1"/>
          <Text style={styles.cardText}>Odontología</Text>
        </TouchableOpacity>

        <TouchableOpacity style={styles.card}>
          <Icon name="accessibility" size={50} color="#2a86d1"/>
          <Text style={styles.cardText}>Traumatología</Text>
        </TouchableOpacity>

        <TouchableOpacity style={styles.card}>
          <Icon name="psychology" size={50} color="#2a86d1"/>
          <Text style={styles.cardText}>Psicología</Text>
        </TouchableOpacity>

        <TouchableOpacity style={styles.card}>
          <Icon name="local-hospital" size={50} color="#2a86d1"/>
          <Text style={styles.cardText}>Rayos X</Text>
        </TouchableOpacity>

      </View>

    </View>
  );
}

const styles = StyleSheet.create({

  container:{
    flex:1,
    backgroundColor:"#e5e3e8",
    paddingTop:40,
    alignItems:"center"
  },

  title:{
    fontSize:20,
    marginBottom:10
  },

  subtitle:{
    fontSize:18,
    fontWeight:"bold",
    textAlign:"center",
    marginBottom:30
  },

  grid:{
    width:"90%",
    flexDirection:"row",
    flexWrap:"wrap",
    justifyContent:"space-between"
  },

  card:{
    width:"45%",
    height:140,
    backgroundColor:"#f2f2f2",
    borderRadius:20,
    justifyContent:"center",
    alignItems:"center",
    marginBottom:20,
    elevation:5
  },

  cardText:{
    marginTop:10,
    fontSize:16,
    fontWeight:"bold"
  }

});
