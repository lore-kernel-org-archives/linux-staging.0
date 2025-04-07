Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8C01B87E2
	for <linux-staging@lists.linux.dev>; Mon,  7 Apr 2025 14:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744034620; cv=none; b=pHbOE+c1sWpYTuJPk1laaZ/UAOgFW6UGtRfHOJ0ibTaQRwIx9CpeSvLJ47B1nQ6tUJwEZj+UuRpTgLKdC0dUfB97FYDKzLJHPqPevBuI2O8TLtgxLiL0J1Dg6JpJW8wtXxYFOdrYur1mwmTbfYr1vA45qOdU6glQKmmG+9tuD28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744034620; c=relaxed/simple;
	bh=AVcNJrpPYIGA36U5G5+x66QY97yrjXIuXHF9RC3zkQU=;
	h=From:Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:To:
	 References:In-Reply-To; b=W95cHX7xU2QhE89OqD9icYvDjp4fgmsZO3qVlBpMGP6gD1ObDlXXInyOPcado35vcZ6Skgr44XPZvrQ2gG3oGlV6r1Uu/CXMxfoemmzWGrI2WVI2r7TK7FJPp3VU4E0qCAqKxpWC44B56Bmuc0nod5JkH9ws5KRSuxQ/xh6NTF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y++vk0A4; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y++vk0A4"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39c13fa05ebso2524386f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 07 Apr 2025 07:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744034617; x=1744639417; darn=lists.linux.dev;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IIlvgpw9XtwUaSV8K9n4TGTxcXwBT3cWEpS99F1AqXk=;
        b=Y++vk0A4a3RUEaRZ1EUU+IqLQJdYHOkjhpgqbVyaICRPWH/LfKt8EGkHtzaZoT4sJz
         9SjKKC5GDeQ5HZ42OX34jTWrls5W3U09EFE1dK0y++p1w03SxC5y3ur40HKTMxjjkmOw
         uHHukeeqUMDBSoH9XepgEqwsVIKoR5nNIDbu5wb6Vvrkzrd1pFEF7YELb8W+4NiKcYxP
         lwYjPw0Jsuo8elyFGjms+DST/ShDAMHPQehdhihZNQQ1c9sQbMugKzURBTCZGdOKgG2a
         6Cw8X0Ry6EZhuMVK1Nb9F39q/mPjItjgAgIqy0SdgYRl5+P9DpukRWfmwzLfJ0MYwKiP
         lZ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744034617; x=1744639417;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IIlvgpw9XtwUaSV8K9n4TGTxcXwBT3cWEpS99F1AqXk=;
        b=mjSCZfGywaVYnyR5gwk/srxu4Qd4iUv5Kq7oonZHy6mMPdEAp7e1bb23oSWX+M7Q/S
         SzW7Z+3JdZvCHxKyPx/qrgPOBj6a2iFoigjPWomjYMsIG0Vhrb8YylJe7vzIoFTvhzyP
         x7N4sT5hlpEahqkAI8dW9veCZ92sIl0w5NiYOpeB0jSI//2V53DNE+omaVt29ICsd/V3
         J5zhtMkFrQ5BRFu616TASjKs6GFapasONs4XLDX6RqaeyAwjxfatXk5DZB6M5HI9jvkU
         8pQFbMtfE1razuvSsUPW9CDhl1iaAlVgCCbH7lYRaCRVv6I6YspBjP8i+fA1K4uSjd/s
         u5wg==
X-Forwarded-Encrypted: i=1; AJvYcCWMAaT3k6TROWpZGWlkwGoAIoqZ5KyLSrGJaSv+46wsIwZJvFqanLMCr8WG2YX6euWDnBtfRAJtUkVBml79@lists.linux.dev
X-Gm-Message-State: AOJu0YyVDPxnHsKwaHQ66Il0657gsrNjM1Kqgaud0VF/PehfeMxyRVqm
	kMs2PwPatEIK6ebGNEXlZtkxJnDbdE60klKpz3qhc1dh7L2s1CTm
X-Gm-Gg: ASbGnctQDXAtmEmlMPfRoKlAwT3XVglG9maQQ80cHjeHu167gXGRXcOJrlBylwX3cZB
	9CflrUAt/K/mV65TRsXwqZUjQAfDkbeHTCdFbOGA5SrO2CBXguxL9EdTt1QzoffcNRcoT5XsL7G
	4lubXqbRlX+n+j4FfPEaMsWawmcdXeGMpnAUNcIno8y9xzLanJSf6Di6edIISq1uJnB60UDTcv4
	p8Pn8OlpGKDjy9z9IputCLQu+cUFKs5jOImRPZKuzD+qa6z9XdhYdbQ0+14DDY/d4RE/zqTcdAA
	5Q9oErl1X9d2IRviieKV5jjOpoD/Mv40lZyQ7HYh4Of2YOsi/4VLakJTNzhrkM6LmqEZJg==
X-Google-Smtp-Source: AGHT+IEn+6ojavR6tMMafF+SmH0WwvgludvtbX1hi0lpL0Cl0TXhJ1J3Nf3kTI2WVfqKrE0IPj037Q==
X-Received: by 2002:a5d:648b:0:b0:39a:d336:16 with SMTP id ffacd0b85a97d-39cb35aa6ffmr10795285f8f.34.1744034615187;
        Mon, 07 Apr 2025 07:03:35 -0700 (PDT)
Received: from localhost (a109-49-32-45.cpe.netcabo.pt. [109.49.32.45])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c30226b23sm12049412f8f.86.2025.04.07.07.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 07:03:34 -0700 (PDT)
From: Rui Miguel Silva <rmfrfs@gmail.com>
X-Google-Original-From: "Rui Miguel Silva" <rui.silva@linaro.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Apr 2025 15:03:33 +0100
Message-Id: <D90GO8QLAESS.PN6CB62OS6OY@linaro.com>
Cc: <greybus-dev@lists.linaro.org>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>, "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] staging: greybus: use new GPIO line value setter
 callbacks
To: "Alex Elder" <elder@riscstar.com>, "Bartosz Golaszewski"
 <brgl@bgdev.pl>, "Rui Miguel Silva" <rmfrfs@gmail.com>, "Johan Hovold"
 <johan@kernel.org>, "Alex Elder" <elder@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Linus Walleij" <linus.walleij@linaro.org>
References: <20250407-gpiochip-set-rv-greybus-v1-1-9d4f721db7ca@linaro.org>
 <184ecf87-823a-42ef-9903-a21c787e0c5d@riscstar.com>
In-Reply-To: <184ecf87-823a-42ef-9903-a21c787e0c5d@riscstar.com>

Hi Bartosz,
Thanks for the patch.

On Mon Apr 7, 2025 at 2:49 PM WEST, Alex Elder wrote:

> On 4/7/25 2:14 AM, Bartosz Golaszewski wrote:
>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>=20
>> struct gpio_chip now has callbacks for setting line values that return
>> an integer, allowing to indicate failures. Convert the driver to using
>> them.
>>=20
>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Here is the commit that enabled these:
>    98ce1eb1fd87e gpiolib: introduce gpio_chip setters that return values
>
> This looks good.  Thank you.
>
> Reviewed-by: Alex Elder <elder@riscstar.com>

Agree with Alex.
LGTM.

Reviewed-by: Rui Miguel Silva <rui.silva@linaro.org>

Cheers,
   Rui
>
>> ---
>>   drivers/staging/greybus/gpio.c | 16 +++++++++-------
>>   1 file changed, 9 insertions(+), 7 deletions(-)
>>=20
>> diff --git a/drivers/staging/greybus/gpio.c b/drivers/staging/greybus/gp=
io.c
>> index 16bcf7fc8158..f81c34160f72 100644
>> --- a/drivers/staging/greybus/gpio.c
>> +++ b/drivers/staging/greybus/gpio.c
>> @@ -185,8 +185,8 @@ static int gb_gpio_get_value_operation(struct gb_gpi=
o_controller *ggc,
>>   	return 0;
>>   }
>>  =20
>> -static void gb_gpio_set_value_operation(struct gb_gpio_controller *ggc,
>> -					u8 which, bool value_high)
>> +static int gb_gpio_set_value_operation(struct gb_gpio_controller *ggc,
>> +				       u8 which, bool value_high)
>>   {
>>   	struct device *dev =3D &ggc->gbphy_dev->dev;
>>   	struct gb_gpio_set_value_request request;
>> @@ -195,7 +195,7 @@ static void gb_gpio_set_value_operation(struct gb_gp=
io_controller *ggc,
>>   	if (ggc->lines[which].direction =3D=3D 1) {
>>   		dev_warn(dev, "refusing to set value of input gpio %u\n",
>>   			 which);
>> -		return;
>> +		return -EPERM;
>>   	}
>>  =20
>>   	request.which =3D which;
>> @@ -204,10 +204,12 @@ static void gb_gpio_set_value_operation(struct gb_=
gpio_controller *ggc,
>>   				&request, sizeof(request), NULL, 0);
>>   	if (ret) {
>>   		dev_err(dev, "failed to set value of gpio %u\n", which);
>> -		return;
>> +		return ret;
>>   	}
>>  =20
>>   	ggc->lines[which].value =3D request.value;
>> +
>> +	return 0;
>>   }
>>  =20
>>   static int gb_gpio_set_debounce_operation(struct gb_gpio_controller *g=
gc,
>> @@ -457,11 +459,11 @@ static int gb_gpio_get(struct gpio_chip *chip, uns=
igned int offset)
>>   	return ggc->lines[which].value;
>>   }
>>  =20
>> -static void gb_gpio_set(struct gpio_chip *chip, unsigned int offset, in=
t value)
>> +static int gb_gpio_set(struct gpio_chip *chip, unsigned int offset, int=
 value)
>>   {
>>   	struct gb_gpio_controller *ggc =3D gpiochip_get_data(chip);
>>  =20
>> -	gb_gpio_set_value_operation(ggc, (u8)offset, !!value);
>> +	return gb_gpio_set_value_operation(ggc, (u8)offset, !!value);
>>   }
>>  =20
>>   static int gb_gpio_set_config(struct gpio_chip *chip, unsigned int off=
set,
>> @@ -555,7 +557,7 @@ static int gb_gpio_probe(struct gbphy_device *gbphy_=
dev,
>>   	gpio->direction_input =3D gb_gpio_direction_input;
>>   	gpio->direction_output =3D gb_gpio_direction_output;
>>   	gpio->get =3D gb_gpio_get;
>> -	gpio->set =3D gb_gpio_set;
>> +	gpio->set_rv =3D gb_gpio_set;
>>   	gpio->set_config =3D gb_gpio_set_config;
>>   	gpio->base =3D -1;		/* Allocate base dynamically */
>>   	gpio->ngpio =3D ggc->line_max + 1;
>>=20
>> ---
>> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
>> change-id: 20250331-gpiochip-set-rv-greybus-cd2365755186
>>=20
>> Best regards,



