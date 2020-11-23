package models.validators;

import java.util.ArrayList;
import java.util.List;

import models.Swot;

public class SwotValidator {
    public static List<String> validate(Swot s) {
        List<String> errors = new ArrayList<String>();

        String title_error = _validateTitle(s.getTitle());
        if(!title_error.equals("")) {
            errors.add(title_error);
        }

        String strong_error = _validateProduct(s.getStrong());
        if(!strong_error.equals("")) {
            errors.add(strong_error);
        }

        String week_error = _validatePrice(s.getWeek());
        if(!week_error.equals("")) {
            errors.add(week_error);
        }

        String opp_error = _validatePlace(s.getOpp());
        if(!opp_error.equals("")) {
            errors.add(opp_error);
        }

        String thre_error = _validatePromotion(s.getThre());
        if(!thre_error.equals("")) {
            errors.add(thre_error);
        }
        return errors;
    }

    private static String _validateTitle(String title) {
        if(title == null || title.equals("")) {
            return "タイトルを入力してください。";
            }

        return "";
    }

    private static String _validateProduct(String strong) {
        if(strong == null || strong.equals("")) {
            return "Strengthの内容を入力してください。";
            }

        return "";
    }
    private static String _validatePrice(String week) {
        if(week == null || week.equals("")) {
            return "Weeknessの内容を入力してください。";
            }

        return "";
    }
    private static String _validatePlace(String opp) {
        if(opp == null || opp.equals("")) {
            return "Opportunityの内容を入力してください。";
            }

        return "";
    }
    private static String _validatePromotion(String thre) {
        if(thre == null || thre.equals("")) {
            return "Threatの内容を入力してください。";
            }

        return "";
    }
}