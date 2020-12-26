package models.validators;

import java.util.ArrayList;
import java.util.List;

import models.Target;

public class TargetValidator {
    public static List<String> validate(Target tar) {
        List<String> errors = new ArrayList<String>();

        String real1_error = _validateReal1(tar.getReal1());
        if(!real1_error.equals("")) {
            errors.add(real1_error);
        }

        String rate1_error = _validateRate1(tar.getRate1());
        if(!rate1_error.equals("")) {
            errors.add(rate1_error);
        }

        String rank1_error = _validateRank1(tar.getRank1());
        if(!rank1_error.equals("")) {
            errors.add(rank1_error);
        }

        String reach1_error = _validateReach1(tar.getReach1());
        if(!reach1_error.equals("")) {
            errors.add(reach1_error);
        }

        String rival1_error = _validateRival1(tar.getRival1());
        if(!rival1_error.equals("")) {
            errors.add(rival1_error);
        }

        String response1_error = _validateResponse1(tar.getResponse1());
        if(!response1_error.equals("")) {
            errors.add(response1_error);
        }


        String real2_error = _validateReal2(tar.getReal2());
        if(!real2_error.equals("")) {
            errors.add(real2_error);
        }

        String rate2_error = _validateRate2(tar.getRate2());
        if(!rate2_error.equals("")) {
            errors.add(rate2_error);
        }

        String rank2_error = _validateRank2(tar.getRank2());
        if(!rank2_error.equals("")) {
            errors.add(rank2_error);
        }

        String reach2_error = _validateReach2(tar.getReach2());
        if(!reach2_error.equals("")) {
            errors.add(reach2_error);
        }

        String rival2_error = _validateRival2(tar.getRival2());
        if(!rival2_error.equals("")) {
            errors.add(rival2_error);
        }

        String response2_error = _validateResponse2(tar.getResponse2());
        if(!response2_error.equals("")) {
            errors.add(response2_error);
        }


        String real3_error = _validateReal3(tar.getReal3());
        if(!real3_error.equals("")) {
            errors.add(real3_error);
        }

        String rate3_error = _validateRate3(tar.getRate3());
        if(!rate3_error.equals("")) {
            errors.add(rate3_error);
        }

        String rank3_error = _validateRank3(tar.getRank3());
        if(!rank3_error.equals("")) {
            errors.add(rank3_error);
        }

        String reach3_error = _validateReach3(tar.getReach3());
        if(!reach3_error.equals("")) {
            errors.add(reach3_error);
        }

        String rival3_error = _validateRival3(tar.getRival3());
        if(!rival3_error.equals("")) {
            errors.add(rival3_error);
        }

        String response3_error = _validateResponse3(tar.getResponse3());
        if(!response3_error.equals("")) {
            errors.add(response3_error);
        }


        String real4_error = _validateReal4(tar.getReal4());
        if(!real4_error.equals("")) {
            errors.add(real4_error);
        }

        String rate4_error = _validateRate4(tar.getRate4());
        if(!rate4_error.equals("")) {
            errors.add(rate4_error);
        }

        String rank4_error = _validateRank4(tar.getRank4());
        if(!rank4_error.equals("")) {
            errors.add(rank4_error);
        }

        String reach4_error = _validateReach4(tar.getReach4());
        if(!reach4_error.equals("")) {
            errors.add(reach4_error);
        }

        String rival4_error = _validateRival4(tar.getRival4());
        if(!rival4_error.equals("")) {
            errors.add(rival4_error);
        }

        String response4_error = _validateResponse4(tar.getResponse4());
        if(!response4_error.equals("")) {
            errors.add(response4_error);
        }
        String choice_error = _validateChoice(tar.getChoice());
        if(!choice_error.equals("")) {
            errors.add(choice_error);
        }


        return errors;
    }

    private static String _validateReal1(Integer integer) {
        if(integer == null || integer.equals(0)) {
            return "①のRealistic Scaleを入力してください。";
            }

        return "";
    }
    private static String _validateRate1(Integer integer) {
        if(integer == null || integer.equals(0)) {
            return "①のRate of Growthの内容を入力してください。";
            }

        return "";
    }
    private static String _validateRank1(Integer integer) {
        if(integer == null || integer.equals(0)) {
            return "①のRankの内容を入力してください。";
            }

        return "";
    }
    private static String _validateReach1(Integer integer) {
        if(integer == null || integer.equals(0)) {
            return "①のReachを入力してください。";
            }

        return "";
    }
    private static String _validateRival1(Integer integer) {
        if(integer == null || integer.equals(0)) {
            return "①のRivalの内容を入力してください。";
            }

        return "";
    }
    private static String _validateResponse1(Integer integer) {
        if(integer == null || integer.equals(0)) {
            return "①のResponseの内容を入力してください。";
            }

        return "";
    }
    private static String _validateReal2(Integer integer) {
        if(integer == null || integer.equals(0)) {
            return "②のRealistic Scaleを入力してください。";
            }

        return "";
    }
    private static String _validateRate2(Integer integer) {
        if(integer == null || integer.equals(0)) {
            return "②のRate of Growthの内容を入力してください。";
            }

        return "";
    }
    private static String _validateRank2(Integer integer) {
        if(integer == null || integer.equals(0)) {
            return "②のRankの内容を入力してください。";
            }

        return "";
    }
    private static String _validateReach2(Integer integer) {
        if(integer == null || integer.equals(0)) {
            return "②のReachを入力してください。";
            }

        return "";
    }
    private static String _validateRival2(Integer integer) {
        if(integer == null || integer.equals(0)) {
            return "②のRivalの内容を入力してください。";
            }

        return "";
    }
    private static String _validateResponse2(Integer integer) {
        if(integer == null || integer.equals(0)) {
            return "②のResponseの内容を入力してください。";
            }

        return "";
    }
    private static String _validateReal3(Integer integer) {
        if(integer == null || integer.equals(0)) {
            return "③のRealistic Scaleを入力してください。";
            }

        return "";
    }
    private static String _validateRate3(Integer integer) {
        if(integer == null || integer.equals(0)) {
            return "③のRate of Growthの内容を入力してください。";
            }

        return "";
    }
    private static String _validateRank3(Integer integer) {
        if(integer == null || integer.equals(0)) {
            return "③のRankの内容を入力してください。";
            }

        return "";
    }
    private static String _validateReach3(Integer integer) {
        if(integer == null || integer.equals(0)) {
            return "③のReachを入力してください。";
            }

        return "";
    }
    private static String _validateRival3(Integer integer) {
        if(integer == null || integer.equals(0)) {
            return "③のRivalの内容を入力してください。";
            }

        return "";
    }
    private static String _validateResponse3(Integer integer) {
        if(integer == null || integer.equals(0)) {
            return "③のResponseの内容を入力してください。";
            }

        return "";
    }
    private static String _validateReal4(Integer integer) {
        if(integer == null || integer.equals(0)) {
            return "④のRealistic Scaleを入力してください。";
            }

        return "";
    }
    private static String _validateRate4(Integer integer) {
        if(integer == null || integer.equals(0)) {
            return "④のRate of Growthの内容を入力してください。";
            }

        return "";
    }
    private static String _validateRank4(Integer integer) {
        if(integer == null || integer.equals(0)) {
            return "④のRankの内容を入力してください。";
            }

        return "";
    }
    private static String _validateReach4(Integer integer) {
        if(integer == null || integer.equals(0)) {
            return "④のReachを入力してください。";
            }

        return "";
    }
    private static String _validateRival4(Integer integer) {
        if(integer == null || integer.equals(0)) {
            return "④のRivalの内容を入力してください。";
            }

        return "";
    }
    private static String _validateResponse4(Integer integer) {
        if(integer == null || integer.equals(0)) {
            return "④のResponseの内容を入力してください。";
            }

        return "";
    }

    private static String _validateChoice(Integer integer) {
        if(integer == null || integer.equals(0)) {
            return "選択の内容を入力してください。";
            }

        return "";
    }
}
