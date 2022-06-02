class Converter {
  static String convertAgeGroup(int index) {
    String _result = "";
    switch (index) {
      case 0:
        _result = "0 - 5";
        break;
      case 1:
        _result = "6 - 10";
        break;
      case 2:
        _result = "11 - 15";
        break;
      case 3:
        _result = "16 - 20";
        break;
      case 4:
        _result = "21 - 30";
        break;
      case 5:
        _result = "31 - ...";
        break;
    }
    return _result;
  }

  static String convertCategories(Set<int> indexes) {
    String _result = "";
    if (indexes.length == 1) {
      switch (indexes.first) {
        case 0:
          _result = _result + "Educational";
          break;
        case 1:
          _result = _result + "Wooden";
          break;
        case 2:
          _result = _result + "Board Games";
          break;
        case 3:
          _result = _result + "Robot";
          break;
        case 4:
          _result = _result + "Military";
          break;
        case 5:
          _result = _result + "Beach";
          break;
        case 6:
          _result = _result + "Kitchen";
          break;
        case 7:
          _result = _result + "Slime";
          break;
        case 8:
          _result = _result + "Doll";
          break;
        case 9:
          _result = _result + "Teddy Bears";
          break;
        case 10:
          _result = _result + "Food";
          break;
        case 11:
          _result = _result + "Others";
          break;
      }
      _result = _result + ".";
    } else {
      for (var index in indexes) {
        switch (index) {
          case 0:
            _result = _result + "Educational";
            break;
          case 1:
            _result = _result + "Wooden";
            break;
          case 2:
            _result = _result + "Board Games";
            break;
          case 3:
            _result = _result + "Robot";
            break;
          case 4:
            _result = _result + "Military";
            break;
          case 5:
            _result = _result + "Beach";
            break;
          case 6:
            _result = _result + "Kitchen";
            break;
          case 7:
            _result = _result + "Slime";
            break;
          case 8:
            _result = _result + "Doll";
            break;
          case 9:
            _result = _result + "Teddy Bears";
            break;
          case 10:
            _result = _result + "Food";
            break;
          case 11:
            _result = _result + "Others";
            break;
        }
        if (indexes.last == index) {
          _result = _result + ". ";
        } else {
          _result = _result + ", ";
        }
      }
    }
    return _result;
  }

  static String convertCondition(int index) {
    String _result = "";
    switch (index) {
      case 0:
        _result = "New";
        break;
      case 1:
        _result = "Used";
        break;
    }
    return _result;
  }

  static String convertGenderType(int index) {
    String _result = "";
    switch (index) {
      case 0:
        _result = "Boy";
        break;
      case 1:
        _result = "Girl";
        break;
      case 2:
        _result = "Both";
        break;
    }
    return _result;
  }
}
