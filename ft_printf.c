/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printf.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: aneme <aneme@student.42madrid.com>         +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/10/29 17:28:25 by aneme             #+#    #+#             */
/*   Updated: 2024/10/29 18:59:23 by aneme            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

int     type_format(char const *format, va_list args)
{
    if ()
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
        }
    }
}