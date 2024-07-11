using System;
using System.ComponentModel.DataAnnotations;
using System.Text.RegularExpressions;

public class CedulaEcuatoriana : ValidationAttribute
{
    

    protected override ValidationResult IsValid(object value, ValidationContext validationContext)
    {
        if (value == null || string.IsNullOrWhiteSpace(value.ToString()))
        {
            return new ValidationResult("La cédula es requerida.");
        }

        var Cedula = value.ToString();

        // Validar longitud de la cédula
        if (Cedula.Length != 10)
        {
            return new ValidationResult("La cédula debe tener 10 dígitos.");
        }

        // Validar que la cédula contiene solo números
        if (!Regex.IsMatch(Cedula, @"^\d+$"))
        {
            return new ValidationResult("La cédula debe contener solo números.");
        }

        // Extraer los valores necesarios para la validación
        var provincia = int.Parse(Cedula.Substring(0, 2));
        var tercerDigito = int.Parse(Cedula.Substring(2, 1));

        // Validar la provincia y el tercer dígito
        if (provincia < 1 || provincia > 24 || tercerDigito < 0 || tercerDigito > 5)
        {
            return new ValidationResult("La cédula ingresada no es válida.");
        }

        // Validación del dígito verificador usando el algoritmo de módulo 10
        try
        {
            int[] coeficientes = { 2, 1, 2, 1, 2, 1, 2, 1, 2 };
            int suma = 0;

            for (int i = 0; i < coeficientes.Length; i++)
            {
                int digito = int.Parse(Cedula[i].ToString());
                int producto = digito * coeficientes[i];
                suma += producto >= 10 ? producto - 9 : producto;
            }

            int residuo = suma % 10;
            int digitoVerificador = residuo == 0 ? 0 : 10 - residuo;

            if (digitoVerificador != int.Parse(Cedula[9].ToString()))
            {
                return new ValidationResult("La cédula ingresada no es válida.");
            }
        }
        catch (Exception)

        {
            return new ValidationResult("Error al validar la cédula");
        }

        return ValidationResult.Success;

    }
}
