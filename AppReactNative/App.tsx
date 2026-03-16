import React from "react";
import {NavigationContainer} from "@react-navigation/native";
import {createNativeStackNavigator} from "@react-navigation/native-stack";

import login from "./pages/login";
import register from "./pages/register";
import SplashScreen from "./pages/splash";
import menu from "./pages/menu";

const Stack = createNativeStackNavigator();

export default function App(){

  return(

    <NavigationContainer>

      <Stack.Navigator screenOptions={{headerShown:false}}>

        <Stack.Screen name="splash" component={SplashScreen}/>
        <Stack.Screen name="login" component={login}/>
        <Stack.Screen name="register" component={register}/>
        <Stack.Screen name="menu" component={menu}/>

      </Stack.Navigator>

    </NavigationContainer>

  );

}
