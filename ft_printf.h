/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printf.h                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: hkocan <hkocan@student.42kocaeli.com.tr    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/11/06 13:03:12 by hkocan            #+#    #+#             */
/*   Updated: 2023/11/07 19:14:48 by hkocan           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef FT_PRINTF_H
# define FT_PRINTF_H
# include <stdarg.h>

int	ft_putstr(char *str, int i);
int	put_digit(long long int number, char *base, int bsize);
int	ft_formats(va_list args, const char formats);
int	put_digit_pointer(void *point, char *base, int bsize);
int	ft_printf(const char *format, ...);
#endif