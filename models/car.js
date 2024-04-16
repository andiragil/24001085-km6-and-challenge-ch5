'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class car extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      car.belongsTo(models.details, { foreignKey: "detail_id" });
    }
  }
  car.init({
    name: DataTypes.STRING,
    image: DataTypes.TEXT,
    detail_id: DataTypes.INTEGER,
    rentPerDay: DataTypes.INTEGER,
    size: DataTypes.STRING
  }, {
    sequelize,
    modelName: "car",
    paranoid: true, // enable soft delete
  });
  return car;
};