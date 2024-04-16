'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class details extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      details.hasMany(models.car, { foreignKey: "detail_id" });
    }
  }
  details.init({
    type: DataTypes.STRING
  }, {
    sequelize,
    modelName: "details",
    tableName: "details",
    paranoid: true, // enable soft delete
  });
  return details;
};