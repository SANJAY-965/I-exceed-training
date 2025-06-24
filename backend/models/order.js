const mongoose = require('mongoose');

const orderSchema = new mongoose.Schema({
  userId:   { type: String, required: true },
  items:    { type: Array,  required: true },
  address:  { type: Object, required: true },  // stores full structured address object
  total:    { type: Number, required: true },
  paymentMethod: { type: String, required: true }, // New field
  date:     { type: Date,   default: Date.now },
}, { timestamps: true });

module.exports = mongoose.model('Order', orderSchema);
