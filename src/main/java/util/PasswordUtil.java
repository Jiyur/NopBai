package util;

public class PasswordUtil {
    private static String upperCaseChar = "ABCDEFGHIJKKMNOPQRSTUVWXYZ";
    private static String lowerCaseChar = "abcdefghijklmnopqrstuvwxyz";
    private static String numberList = "0123456789";
    private static String specialCharList = /*" !\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~"*/"[!@#$%&*()_+=|<>?{}\\\\[\\\\]~-] ";

    public static boolean checkStrengthOfPassword(String pass) {
        if (pass.length() >= 8 && pass.matches(".*[" + upperCaseChar + "].*")
                && pass.matches(".*[" + lowerCaseChar + "].*")
                && pass.matches(".*[" + numberList + "].*")
                && pass.matches(".*[" + specialCharList + "].*") )
            return true;
        return false;
    }
}
