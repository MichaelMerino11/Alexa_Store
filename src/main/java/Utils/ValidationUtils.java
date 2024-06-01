package Utils;

public class ValidationUtils {
	public static boolean validarCedula(String cedula) {
        // Verificar que la cédula tenga 10 dígitos
        if (cedula.length() != 10) {
            return false;
        }

        // Verificar que todos los caracteres sean dígitos
        for (int i = 0; i < cedula.length(); i++) {
            if (!Character.isDigit(cedula.charAt(i))) {
                return false;
            }
        }

        // Verificar que el último dígito sea válido según el algoritmo de verificación de la cédula ecuatoriana
        int suma = 0;
        for (int i = 0; i < 9; i++) {
            int digito = Character.getNumericValue(cedula.charAt(i));
            if (i % 2 == 0) {
                digito *= 2;
                if (digito > 9) {
                    digito -= 9;
                }
            }
            suma += digito;
        }
        int digitoVerificador = suma % 10 == 0 ? 0 : 10 - (suma % 10);
        System.out.println(digitoVerificador);
        System.out.println(Character.getNumericValue(cedula.charAt(9)));
        return digitoVerificador == Character.getNumericValue(cedula.charAt(9));
        
    }

    public static boolean validarCorreo(String correo) {
        // Expresión regular para validar el formato del correo electrónico
        String regex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";
        return correo.matches(regex);
    }
}
