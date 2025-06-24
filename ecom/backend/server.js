require('dotenv').config();
const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');

const app = express();
const PORT = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());

mongoose.connect('mongodb+srv://sanjaybalu:Sanjay_123@cluster0.l4sbzxs.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0', {
  useNewUrlParser: true,
  useUnifiedTopology: true,
})
.then(() => console.log('✅ MongoDB connected'))
.catch(err => console.error('❌ MongoDB Error:', err));

const addressRoutes = require('./routes/addressRoutes');
const Order = require('./models/order');

app.use('/add', addressRoutes);

// POST /checkout
app.post('/checkout', async (req, res) => {
  const { userId, items, address, total, paymentMethod } = req.body;

  if (!userId || !items || !address || !total || !paymentMethod) {
    return res.status(400).json({ message: 'Missing required fields' });
  }

  try {
    const newOrder = new Order({ userId, items, address, total, paymentMethod });
    await newOrder.save();
    res.status(201).json({ message: 'Order placed successfully' });
  } catch (err) {
    console.error('Order Error:', err);
    res.status(500).json({ message: 'Order failed' });
  }
});

app.listen(PORT, () => {
  console.log(`🚀 Server running at http://localhost:${PORT}`);
});
