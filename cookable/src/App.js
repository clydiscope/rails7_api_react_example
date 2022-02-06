import logo from './logo.svg';
import './App.css';
import axios from "axios";
import Cooks from "./components/cooks"
import { useEffect, useState } from 'react';

const API_URL = "http://localhost:3000/api/v1/cooks";

function getAPIData() {
  return axios.get(API_URL).then((response) => response.data)
}

function App() {
  const [cooks, setCooks] = useState([])

useEffect(() => {
  let mounted = true;
  getAPIData().then((items) => {
    if (mounted) {
      setCooks(items);
    }
  });
  return () => (mounted = false);
}, []);

  return (
    <div className="App">
      <h1>Hello</h1>
      <Cooks cooks={cooks} />
    </div>
  );
}

export default App;
