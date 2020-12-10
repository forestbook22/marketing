package models.validators;

import java.util.ArrayList;
import java.util.List;

import models.Threec;

public class ThreecValidator {
    public static List<String> validate(Threec s) {
        List<String> errors = new ArrayList<String>();

        String cus_error = _validateCus(s.getCus());
        if(!cus_error.equals("")) {
            errors.add(cus_error);
        }

        String own_error = _validateOwn(s.getOwn());
        if(!own_error.equals("")) {
            errors.add(own_error);
        }

        String compe_error = _validateCompe(s.getCompe());
        if(!compe_error.equals("")) {
            errors.add(compe_error);
        }
        return errors;
    }

    private static String _validateCus(String cus) {
        if(cus == null || cus.equals("")) {
            return "Customerの内容を入力してください。";
            }

        return "";
    }
    private static String _validateOwn(String own) {
        if(own == null || own.equals("")) {
            return "Companyの内容を入力してください。";
            }

        return "";
    }
    private static String _validateCompe(String compe) {
        if(compe == null || compe.equals("")) {
            return "Competitorの内容を入力してください。";
            }

        return "";
    }
}