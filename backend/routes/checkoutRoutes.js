// routes/checkoutRoutes.js
const express = require('express');
const router = express.Router();
const Order = require('../models/order');

router.post('/', async (req, res) => {
  const { userId, items, address, total } = req.body;
  if (!userId || !items || !address || !total) {
    return res.status(400).json({ message: 'Missing required fields' });
  }

  try {
    const newOrder = new Order({ userId, items, address, total });
    await newOrder.save();
    res.status(201).json({ message: 'Order placed successfully' });
  } catch (err) {
    res.status(500).json({ message: 'Order failed', error: err.message });
  }
});

module.exports = router;