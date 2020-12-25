package models.validators;

import java.util.ArrayList;
import java.util.List;

import models.Target;

public class TargetValidator {
    public static List<String> validate(Target se) {
        List<String> errors = new ArrayList<String>();

        String real_error = _validateReal(se.getReal());
        if(!real_error.equals("")) {
            errors.add(real_error);
        }

        String rate_error = _validateRate(se.getRate());
        if(!rate_error.equals("")) {
            errors.add(rate_error);
        }

        String rank_error = _validateRank(se.getRank());
        if(!rank_error.equals("")) {
            errors.add(rank_error);
        }

        String reach_error = _validateReach(se.getReach());
        if(!reach_error.equals("")) {
            errors.add(reach_error);
        }

        String rival_error = _validateRival(se.getRival());
        if(!rival_error.equals("")) {
            errors.add(rival_error);
        }

        String response_error = _validateResponse(se.getResponse());
        if(!response_error.equals("")) {
            errors.add(response_error);
        }
        return errors;
    }

    private static String _validateReal(Integer integer) {
        if(integer == null || integer.equals("")) {
            return "Realistic Scaleを入力してください。";
            }

        return "";
    }
    private static String _validateRate(Integer integer) {
        if(integer == null || integer.equals("")) {
            return "Rate of Growthの内容を入力してください。";
            }

        return "";
    }
    private static String _validateRank(Integer integer) {
        if(integer == null || integer.equals("")) {
            return "Rankの内容を入力してください。";
            }

        return "";
    }
    private static String _validateReach(Integer integer) {
        if(integer == null || integer.equals("")) {
            return "Reachを入力してください。";
            }

        return "";
    }
    private static String _validateRival(Integer integer) {
        if(integer == null || integer.equals("")) {
            return "Rivalの内容を入力してください。";
            }

        return "";
    }
    private static String _validateResponse(Integer integer) {
        if(integer == null || integer.equals("")) {
            return "Responseの内容を入力してください。";
            }

        return "";
    }
}
