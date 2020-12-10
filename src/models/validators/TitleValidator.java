package models.validators;

import java.util.ArrayList;
import java.util.List;

import models.Title;

public class TitleValidator {
    public static List<String> validate(Title ti) {
        List<String> errors = new ArrayList<String>();

        String title_error = _validateTitle(ti.getTitle());
        if(!title_error.equals("")) {
            errors.add(title_error);
        }
        return errors;
    }

    private static String _validateTitle(String title) {
        if(title == null || title.equals("")) {
            return "タイトルを入力してください。";
            }

        return "";
    }
}
