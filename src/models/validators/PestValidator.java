package models.validators;

import java.util.ArrayList;
import java.util.List;

import models.Pest;

public class PestValidator {
    public static List<String> validate(Pest p) {
        List<String> errors = new ArrayList<String>();

        String poli_error = _validatePoli(p.getPoli());
        if(!poli_error.equals("")) {
            errors.add(poli_error);
        }

        String eco_error = _validateEco(p.getEco());
        if(!eco_error.equals("")) {
            errors.add(eco_error);
        }

        String soci_error = _validateSoci(p.getSoci());
        if(!soci_error.equals("")) {
            errors.add(soci_error);
        }

        String tech_error = _validateTech(p.getTech());
        if(!tech_error.equals("")) {
            errors.add(tech_error);
        }
        return errors;
    }

    private static String _validatePoli(String poli) {
        if(poli == null || poli.equals("")) {
            return "Politicsの内容を入力してください。";
            }

        return "";
    }
    private static String _validateEco(String eco) {
        if(eco == null || eco.equals("")) {
            return "Economyの内容を入力してください。";
            }

        return "";
    }
    private static String _validateSoci(String soci) {
        if(soci == null || soci.equals("")) {
            return "Societyの内容を入力してください。";
            }

        return "";
    }
    private static String _validateTech(String tech) {
        if(tech == null || tech.equals("")) {
            return "Technologyの内容を入力してください。";
            }

        return "";
    }
}
