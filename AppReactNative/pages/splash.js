import React, {useEffect} from "react";
import {View, Text, StyleSheet} from "react-native";

export default function SplashScreen({navigation}) {

  useEffect(() => {

    setTimeout(() => {
      navigation.replace("menu");
    }, 3000);

  }, []);

  return (

    <View style={styles.container}>
      <Text style={styles.text}>AppOdon</Text>
    </View>

  );

}

const styles = StyleSheet.create({

  container:{
    flex:1,
    justifyContent:"center",
    alignItems:"center",
    backgroundColor:"#2a86d1"
  },

  text:{
    fontSize:32,
    color:"#fff",
    fontWeight:"bold"
  }

});
