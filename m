Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495FB22759C
	for <linux-staging@lists.linux.dev>; Thu, 17 Apr 2025 10:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744884413; cv=none; b=LnInbzUSW+R5jNb9n9q6933WRIcm16LdiyNCELsJRjv59ZbsMFHbO5mnQ/NDK55jaJaRuUIPsLs0i8XYd0GR3aFcEgD/MMjrjswkkOrjIXXr5seyPGaXRqZdOAaMyRo73fVkwV/Cf3Mi1HcwurWb6ox2goJQD5PV5bgYxUFXp8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744884413; c=relaxed/simple;
	bh=cHFaPOyz6ZSDjFr47T4p6zy7Okm2xy12Ulmr5wJCibE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=efhAs8IDK21do9DbMwGeuE2L7xuH7AOsnkg1GKmvsoJ+6KyI9Fl8xNy47rFXGrHfQj7PNafUcCPIE1puWTuy5IP/ZZS6GX7Sh0hPmawA4oV0349ypyknYkQoxG4mkuJeZ494TaoUYkXPDknLXdnbVDQ+hRkqFSURUrO5nLT65Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S1lSWs8E; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S1lSWs8E"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43ed8d32a95so4327475e9.3
        for <linux-staging@lists.linux.dev>; Thu, 17 Apr 2025 03:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744884409; x=1745489209; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=h6KysCT5Lx4QdfHdeHf4ybFRVCeriAOoOxCKRAfn2hc=;
        b=S1lSWs8EbbpZdvTN7Zc2nwS4l3sbmwxMaxKN1oeWuW+h7esVfkPU6xrvOmOjfCjeCm
         c58chbC62IEcmT7YA/kohJ6X3ZuAoZv76W2RjyK8NynsNt6B8pu/bKwK5B4qUcW0Y2hF
         MFWanrOE/dc/HbsvuHlnrLWVI3RulFHSaiDiAPIyfru/VWzYkN1pAdfcMUIMGNCOR21Q
         AOUlbg5jKbMtV2IGkFufr/KprOqpzOTFvqQK14WV4DDvujpvkWzEoLkv6X8Jumogl6LM
         u3yw9uc0UupgJyPr+hoq5GnmrInF7YM+9lnaT4hc0da+0lkUqgw0qO6fIHy7nOt+Clk+
         Z0bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744884409; x=1745489209;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h6KysCT5Lx4QdfHdeHf4ybFRVCeriAOoOxCKRAfn2hc=;
        b=swfTaMnfKpEyuuuKuf444mAjXIqQSUdh/QVhcVrUjeQrL9Z4TC4drWVYb1/ZYQ6JDJ
         rqRIgmPbmTjMltg90f7fsPOa5tV+sRVa0BNxNINJFzuIvIJC6UpCiFcynZH2CllUbzKt
         TTviuc1erTyUNHTGumMoM00bZ+fNbP0JM3bNllpOOHZWIpu3WFHzxDTgWv9T/MgF+y9R
         CCj6Wc7jlyrtYGAtIxxrp9BWUxkQBFbb0pF2BwAAyyucHz/S+N1NwnqidWgom+GIQwOC
         HuJ/5O19csTFcRT3uNp8ZfaUrffukD3YsLxrgla5uSw7KMibYXbxE6xYFSBhKV+zDXkL
         MpUw==
X-Forwarded-Encrypted: i=1; AJvYcCWHwtZZWNHbSYIK8cE2uYI7zuLlWazDpc9Swcm03F874l7BcJ4+d3rvfVjN/tvoDRyfkou/wBN9HezKfjU2@lists.linux.dev
X-Gm-Message-State: AOJu0YwQSpAcOLDuh9m5F440chHq0SgFvQCyPWKFG7YBUsOyGziBgg7R
	WyI5ux6unzDo1JAXEnZVCvlFfRTES0kvIKhzNFkQvszVpr+o12kP
X-Gm-Gg: ASbGncvlHLhHSjC2rcYkaez5P41qsT7ISsX7Egu8RUFTtKWli6eBH/4ozYa/aap9H1f
	rESCm/Uk62nj8R/azyz6BEhRnHUL02szCUg4vVkMxzUEWrsUKnjtghtIwBHbn/3zcy0aenC+KZs
	LeZ8dXlgWr0qTxYtv/Uk9lihSZvCFqZJsYL8hbHirvcWKQ9tCkZn2Z5xN1eF5lfOuvHWyoNw6JV
	D7OZZOTPU83IrCSxhDocqIsKs+F2VjvXlqnfptFZOvN5PpBl+/XMwJwnYQjLxbeY3MYnghRIQNe
	fqjDLXqSp4UbcYXEMbjhsUej+2esZWy+N0I6gZBIPAr2AgMir4MFkpfBZA/moB4tKYemGQTk3kC
	pjJDzASoZpioCM/S99nbUpe4=
X-Google-Smtp-Source: AGHT+IGFF+Ix12FNw157+6rzhtUnIoDjLmttVUpIm1dLdHy1xPMMwF7r2GAq56rSCkut3Q2GeHiZSA==
X-Received: by 2002:a05:6000:420d:b0:39c:2b28:604a with SMTP id ffacd0b85a97d-39ee5bb0c8fmr3985511f8f.50.1744884409297;
        Thu, 17 Apr 2025 03:06:49 -0700 (PDT)
Received: from ?IPv6:2001:818:ea8e:7f00:2575:914:eedd:620e? ([2001:818:ea8e:7f00:2575:914:eedd:620e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4c8263sm48251595e9.4.2025.04.17.03.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 03:06:48 -0700 (PDT)
Message-ID: <fb712c034eda0d5d711a90a00b6382315fb5f929.camel@gmail.com>
Subject: Re: [PATCH] iio: adc: Revoke valid channel for error path
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Gabriel Shahrouzi <gshahrouzi@gmail.com>, gregkh@linuxfoundation.org, 
	jic23@kernel.org, lars@metafoo.de, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	Michael.Hennerich@analog.com, sonic.zhang@analog.com, vapier@gentoo.org
Cc: skhan@linuxfoundation.org, kernelmentees@lists.linuxfoundation.org, 
	stable@vger.kernel.org
Date: Thu, 17 Apr 2025 11:06:51 +0100
In-Reply-To: <20250415182038.523186-1-gshahrouzi@gmail.com>
References: <20250415182038.523186-1-gshahrouzi@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2025-04-15 at 14:20 -0400, Gabriel Shahrouzi wrote:
> According to the datasheet on page 9 under the channel selection table,
> all devices (AD7816/7/8) are able to use the channel marked as 7. This
> channel is used for diagnostic purposes by routing the internal 1.23V
> bandgap source through the MUX to the input of the ADC.
>=20
> Replace checking for string equality with checking for the same chip ID
> to reduce time complexity.
>=20
> Group invalid channels for all devices together because they are
> processed the same way.
>=20
> Fixes: 7924425db04a ("staging: iio: adc: new driver for AD7816 devices")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> ---
> =C2=A0drivers/staging/iio/adc/ad7816.c | 15 +++++----------
> =C2=A01 file changed, 5 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/staging/iio/adc/ad7816.c
> b/drivers/staging/iio/adc/ad7816.c
> index 6c14d7bcdd675..d880fe0257697 100644
> --- a/drivers/staging/iio/adc/ad7816.c
> +++ b/drivers/staging/iio/adc/ad7816.c
> @@ -186,17 +186,12 @@ static ssize_t ad7816_store_channel(struct device *=
dev,
> =C2=A0	if (ret)
> =C2=A0		return ret;
> =C2=A0
> -	if (data > AD7816_CS_MAX && data !=3D AD7816_CS_MASK) {
> -		dev_err(&chip->spi_dev->dev, "Invalid channel id %lu for
> %s.\n",
> -			data, indio_dev->name);
> -		return -EINVAL;
> -	} else if (strcmp(indio_dev->name, "ad7818") =3D=3D 0 && data > 1) {
> -		dev_err(&chip->spi_dev->dev,
> -			"Invalid channel id %lu for ad7818.\n", data);
> -		return -EINVAL;
> -	} else if (strcmp(indio_dev->name, "ad7816") =3D=3D 0 && data > 0) {
> +	if (data !=3D AD7816_CS_MASK &&
> +	=C2=A0=C2=A0=C2=A0 (data > AD7816_CS_MAX ||
> +	=C2=A0=C2=A0=C2=A0 (chip->id =3D=3D ID_AD7818 && data > 1) ||
> +	=C2=A0=C2=A0=C2=A0 (chip->id =3D=3D ID_AD7816 && data > 0))) {
> =C2=A0		dev_err(&chip->spi_dev->dev,
> -			"Invalid channel id %lu for ad7816.\n", data);
> +			"Invalid channel id %lu for %s.\n", data, indio_dev-
> >name);
> =C2=A0		return -EINVAL;
> =C2=A0	}

Hmm, maybe I'm missing something but the code just looks the same as before
(from a functionality point of view)? I'm really not seeing any fix...

Having said the above, not sure if grouping helps with readability. But I d=
o
agree with moving from string comparison to use chip->id. And we also have
redundants 'else'

- Nuno S=C3=A1

