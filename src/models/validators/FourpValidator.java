package models.validators;

import java.util.ArrayList;
import java.util.List;

import models.Fourp;

public class FourpValidator {
    public static List<String> validate(Fourp f) {
        List<String> errors = new ArrayList<String>();

        String title_error = _validateTitle(f.getTitle());
        if(!title_error.equals("")) {
            errors.add(title_error);
        }

        String product_error = _validateProduct(f.getProduct());
        if(!product_error.equals("")) {
            errors.add(product_error);
        }

        String price_error = _validatePrice(f.getPrice());
        if(!price_error.equals("")) {
            errors.add(price_error);
        }

        String place_error = _validatePlace(f.getPlace());
        if(!place_error.equals("")) {
            errors.add(place_error);
        }

        String promotion_error = _validatePromotion(f.getPromotion());
        if(!promotion_error.equals("")) {
            errors.add(promotion_error);
        }
        return errors;
    }

    private static String _validateTitle(String title) {
        if(title == null || title.equals("")) {
            return "タイトルを入力してください。";
            }

        return "";
    }

    private static String _validateProduct(String product) {
        if(product == null || product.equals("")) {
            return "Productの内容を入力してください。";
            }

        return "";
    }
    private static String _validatePrice(String price) {
        if(price == null || price.equals("")) {
            return "Priceの内容を入力してください。";
            }

        return "";
    }
    private static String _validatePlace(String place) {
        if(place == null || place.equals("")) {
            return "Placeの内容を入力してください。";
            }

        return "";
    }
    private static String _validatePromotion(String promotion) {
        if(promotion == null || promotion.equals("")) {
            return "Promotionの内容を入力してください。";
            }

        return "";
    }
}