// 📁 routes/addressRoutes.js
const express = require('express');
const router  = express.Router();
const Address = require('../models/address');

// Get all addresses for a user
router.get('/:userId', async (req, res) => {
  try {
    const addresses = await Address.find({ userId: req.params.userId });
    res.json(addresses);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

// Add a new address
router.post('/', async (req, res) => {
  const { userId, street, landmark, city, state, country, pincode, mobile } = req.body;
  const newAddress = new Address({ userId, street, landmark, city, state, country, pincode, mobile });

  try {
    const saved = await newAddress.save();
    res.status(201).json(saved);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

// Update address by ID
router.put('/:id', async (req, res) => {
  try {
    const updated = await Address.findByIdAndUpdate(req.params.id, req.body, { new: true });
    res.json(updated);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

// Delete address by ID
router.delete('/:id', async (req, res) => {
  try {
    await Address.findByIdAndDelete(req.params.id);
    res.json({ message: 'Address deleted successfully' });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

module.exports = router;

