package models.validators;

import java.util.ArrayList;
import java.util.List;

import models.Seg;

public class SegValidator {
    public static List<String> validate(Seg se) {
        List<String> errors = new ArrayList<String>();

        String y_error = _validateY(se.getY());
        if(!y_error.equals("")) {
            errors.add(y_error);
        }

        String y1_error = _validateY1(se.getY1());
        if(!y1_error.equals("")) {
            errors.add(y1_error);
        }

        String y2_error = _validateY2(se.getY2());
        if(!y2_error.equals("")) {
            errors.add(y2_error);
        }

        String x_error = _validateX(se.getX());
        if(!x_error.equals("")) {
            errors.add(x_error);
        }

        String x1_error = _validateX1(se.getX1());
        if(!x1_error.equals("")) {
            errors.add(x1_error);
        }

        String x2_error = _validateX2(se.getX2());
        if(!x2_error.equals("")) {
            errors.add(x2_error);
        }

        String one_error = _validateOne(se.getOne());
        if(!one_error.equals("")) {
            errors.add(one_error);
        }

        String two_error = _validateTwo(se.getTwo());
        if(!two_error.equals("")) {
            errors.add(two_error);
        }

        String three_error = _validateThree(se.getThree());
        if(!three_error.equals("")) {
            errors.add(three_error);
        }

        String four_error = _validateFour(se.getFour());
        if(!four_error.equals("")) {
            errors.add(four_error);
        }
        return errors;
    }

    private static String _validateY(Integer integer) {
        if(integer == null || integer.equals("")) {
            return "縦軸の変数の内容を入力してください。";
            }

        return "";
    }
    private static String _validateY1(String y1) {
        if(y1 == null || y1.equals("")) {
            return "①の内容を入力してください。";
            }

        return "";
    }
    private static String _validateY2(String y2) {
        if(y2 == null || y2.equals("")) {
            return "②の内容を入力してください。";
            }

        return "";
    }
    private static String _validateX(Integer integer) {
        if(integer == null || integer.equals("")) {
            return "横軸の変数の内容を入力してください。";
            }

        return "";
    }
    private static String _validateX1(String x1) {
        if(x1 == null || x1.equals("")) {
            return "③の内容を入力してください。";
            }

        return "";
    }
    private static String _validateX2(String x2) {
        if(x2 == null || x2.equals("")) {
            return "④の内容を入力してください。";
            }

        return "";
    }
    private static String _validateOne(String one) {
        if(one == null || one.equals("")) {
            return "第1象限の内容を入力してください。";
            }

        return "";
    }
    private static String _validateTwo(String two) {
        if(two == null || two.equals("")) {
            return "第2象限の内容を入力してください。";
            }

        return "";
    }
    private static String _validateThree(String three) {
        if(three == null || three.equals("")) {
            return "第3象限の内容を入力してください。";
            }

        return "";
    }
    private static String _validateFour(String four) {
        if(four == null || four.equals("")) {
            return "第4象限の内容を入力してください。";
            }

        return "";
    }
}
