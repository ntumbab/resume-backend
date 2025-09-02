import express from "express";
import { Firestore } from "@google-cloud/firestore";

const app = express();
app.use(express.json());

// Firestore instance (credentials come from GCP environment)
const db = new Firestore();

// Allow CORS
app.use((req, res, next) => {
  res.setHeader("Access-Control-Allow-Origin", "*");
  res.setHeader("Access-Control-Allow-Methods", "GET, POST, OPTIONS");
  res.setHeader("Access-Control-Allow-Headers", "Content-Type");
  if (req.method === "OPTIONS") {
    return res.sendStatus(204); // Stop here for preflight
  }
  next();
});

// UPDATE endpoint
app.post("/store", async (req, res) => {
    console.log("📄 STORE");
  try {
    const docRef = db.collection("data").doc("visitors");
    const docSnap = await docRef.get();
    let count = 1;

// Log raw snapshot and data for debugging
    console.log("📄 docSnap metadata:", docSnap);
    console.log("📦 docSnap data:", docSnap.data());
    
    if (docSnap.exists) {
      count = (docSnap.data().numberExample || 0) + 1;
    }

    await docRef.set({ numberExample: count });

    res.status(200).json({ numberExample: count });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: error.message });
  }
});


// Export the function for Cloud Functions
export const helloHttp = app;

