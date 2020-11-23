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

        String strong_error = _validateStrong(s.getStrong());
        if(!strong_error.equals("")) {
            errors.add(strong_error);
        }

        String weak_error = _validateWeak(s.getWeak());
        if(!weak_error.equals("")) {
            errors.add(weak_error);
        }

        String opp_error = _validateOpp(s.getOpp());
        if(!opp_error.equals("")) {
            errors.add(opp_error);
        }

        String thre_error = _validateThre(s.getThre());
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

    private static String _validateStrong(String strong) {
        if(strong == null || strong.equals("")) {
            return "Strengthの内容を入力してください。";
            }

        return "";
    }
    private static String _validateWeak(String weak) {
        if(weak == null || weak.equals("")) {
            return "Weaknessの内容を入力してください。";
            }

        return "";
    }
    private static String _validateOpp(String opp) {
        if(opp == null || opp.equals("")) {
            return "Opportunityの内容を入力してください。";
            }

        return "";
    }
    private static String _validateThre(String thre) {
        if(thre == null || thre.equals("")) {
            return "Threatの内容を入力してください。";
            }

        return "";
    }
}