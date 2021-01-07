package models.validators;

import java.util.ArrayList;
import java.util.List;

import models.Position;

public class PositionValidator {
    public static List<String> validate(Position po) {
        List<String> errors = new ArrayList<String>();

        String attri_error = _validateAttri(po.getAttri());
        if(!attri_error.equals("")) {
            errors.add(attri_error);
        }

        String benefit_error = _validateBenefit(po.getBenefit());
        if(!benefit_error.equals("")) {
            errors.add(benefit_error);
        }

        String opp_error = _validateOpp(po.getOpp());
        if(!opp_error.equals("")) {
            errors.add(opp_error);
        }

        String relation_error = _validateRelation(po.getRelation());
        if(!relation_error.equals("")) {
            errors.add(relation_error);
        }

        String distance_error = _validateDistance(po.getDistance());
        if(!distance_error.equals("")) {
            errors.add(distance_error);
        }

        String kind_error = _validateKind(po.getKind());
        if(!kind_error.equals("")) {
            errors.add(kind_error);
        }

        String x_error = _validateX(po.getX());
        if(!x_error.equals("")) {
            errors.add(x_error);
        }

        String y_error = _validateY(po.getY());
        if(!y_error.equals("")) {
            errors.add(y_error);
        }

        String x1_error = _validateX1(po.getX1());
        if(!x1_error.equals("")) {
            errors.add(x1_error);
        }

        String x2_error = _validateX2(po.getX2());
        if(!x2_error.equals("")) {
            errors.add(x2_error);
        }

        String y1_error = _validateY1(po.getY1());
        if(!y1_error.equals("")) {
            errors.add(y1_error);
        }

        String y2_error = _validateY2(po.getY2());
        if(!y2_error.equals("")) {
            errors.add(y2_error);
        }
        return errors;
    }

    private static String _validateAttri(String attri) {
        if(attri == null || attri.equals("")) {
            return "製品属性の内容を入力してください。";
            }

        return "";
    }

    private static String _validateBenefit(String benefit) {
        if(benefit == null || benefit.equals("")) {
            return "ベネフィットの内容を入力してください。";
            }

        return "";
    }

    private static String _validateOpp(String opp) {
        if(opp == null || opp.equals("")) {
            return "機会の内容を入力してください。";
            }

        return "";
    }
    private static String _validateRelation(String relation) {
        if(relation == null || relation.equals("")) {
            return "関係の内容を入力してください。";
            }

        return "";
    }
    private static String _validateDistance(String distance) {
        if(distance == null || distance.equals("")) {
            return "距離の細分化の内容を入力してください。";
            }

        return "";
    }
    private static String _validateKind(String kind) {
        if(kind == null || kind.equals("")) {
            return "種類の内容を入力してください。";
            }

        return "";
    }
    private static String _validateX(String x) {
        if(x == null || x.equals("")) {
            return "①の内容を入力してください。";
            }

        return "";
    }

    private static String _validateY(String y) {
        if(y == null || y.equals("")) {
            return "②の内容を入力してください。";
            }

        return "";
    }

    private static String _validateX1(String x1) {
        if(x1 == null || x1.equals("")) {
            return "①の細分化の内容を入力してください。";
            }

        return "";
    }
    private static String _validateX2(String x2) {
        if(x2 == null || x2.equals("")) {
            return "①の細分化の内容を入力してください。";
            }

        return "";
    }
    private static String _validateY1(String y1) {
        if(y1 == null || y1.equals("")) {
            return "②の細分化の内容を入力してください。";
            }

        return "";
    }
    private static String _validateY2(String y2) {
        if(y2 == null || y2.equals("")) {
            return "②の細分化の内容を入力してください。";
            }

        return "";
    }
}