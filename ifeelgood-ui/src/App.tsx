import { ApiProvider } from "@reduxjs/toolkit/query/react";
import "./App.css";
import { Home } from "./pages/Home/Home";
import { api } from "./services/api/api";

function App() {
  return (
    <ApiProvider api={api}>
      <Home />
    </ApiProvider>
  );
}

export default App;
