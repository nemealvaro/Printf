/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printf.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: aneme <aneme@student.42madrid.com>         +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/10/29 17:28:25 by aneme             #+#    #+#             */
/*   Updated: 2024/11/14 16:55:32 by aneme            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

static int     type_format(char const *format, va_list args)
{
	int	ind;

	ind = 0;
	if (*format == 'c')
		return (ind += ft_putchar(va_arg(args, int)));
	else if (*format == 's')
		return (ind += ft_putstr(va_arg(args, char *)));
	else if (*format == 'p')
		return (ind += ft_putptr(va_arg(args, void *)));
	else if (*format == 'd' || *format == 'i')
		return (ind += ft_putnbr(va_arg(args, int)));
	else if (*format == 'u')
		return (ind += ft_putunsnbr(va_arg(args, unsigned int)));
	else if (*format == 'x' || *format == 'X')
	{
		ind += ft_puthex(va_arg(args, unsigned int), *format);
		return (ind);
	}
	else if (*format == '%')
		return (ind += ft_putchar('%'));
	else
		return (-1);
}

int     ft_printf(char const *format, ...)
{
    int i;

    va_list args;
    
    va_start(args, format);
    i = 0;
    while (*format)
    {
        if (*format == '%')
        {
            format++;
            i += type_format(format, args);
            if (i == -1)
            {
                va_end(args);
                return (-1);
            }
        }
        else
            i += ft_putchar(*format);
        format++;
    }
    va_end(args);
    return (i);
}