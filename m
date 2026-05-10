Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1FA308F32
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 08:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778401225; cv=pass; b=gW3uEie827WqZtMw7Oj1SAZSoGPNtGoj070peiILOc8JEVKNxVV3VD+UBsTAe5RcrewO7Pnxin1HfcsXOrTZcerI7wD2LEC26Ql+xzWnuqRtbwr3IXoO8Rtr6Nt8uciRadTRH3SFTKZkZ7FivQL/BgQrmCS4rIInfKlZqCVzbtM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778401225; c=relaxed/simple;
	bh=226qSkdwAuGxE3RyDwqiSlo2IOVonGu8uER8+95vIoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AZSyEEoGQKXDa8Pplik8S/cLDqATiQLsygmnnF8//ocy2dXlQU9nimlogRur4i+Fhc/+8Jl5xVfYYUz86iRDwx9Y6yHYW9pYMqY+p/7g32Ywch3M2QpRLhv4BAQA+0/xw2fDFtUve/aFy3fA4xpZJV/DI8E8v2zYtZmQpMPtuxY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eVjhGBAm; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eVjhGBAm"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-651d6347a69so3672922d50.0
        for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 01:20:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778401223; cv=none;
        d=google.com; s=arc-20240605;
        b=NN0BMiNyhihlGK2e+S72D+I4mREbSgH3Zw5Nvo1Jm0G5Ga9+bqJ9prbbE6w6QmWljm
         AwtSGjXBQG2vlKDpoK1Odqdim+a+hTRYqkakQ+n7/xQhKjhJmAS+J9TgSJSeAi0KFTsi
         1+50i2U/fgBm7ACikHf3bJowHT2CpClKK3Ynh4N21B9S/K/HIOXXPrE3Ns15Drhhs+6v
         j9NpkhsVPWqhYqZLm2hjg32ez5AAJeMROaRPX3LNVXxbXPXpRkgkVbrkAo/Ynrvo5Ixm
         B68NDSyMtn8oP+au1Zd0oy3OhaNtKt0c2t7JYuxutdpJ5Sqv9Ncm9C8OdXb39gtvFoql
         LqdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gCbOhGmC2ASoNRhJ45rrQzr1riSuWbHWDX3kRpzdSDY=;
        fh=cBvG2cpsnJWEC2pEWGtrvR6A9N+03/e0YlkfFLmHM3U=;
        b=jih59rFBmU7ql0iLViCDUUHzOd34Loc+UMTpRLCKzvDhCZRlFragCzrpH+LXvCC6LL
         fV2NCtMJma6LwLXECgM7uAVUy6CN691u7lHLjuIqmIEGv9oBSh1RXxIQs62A3qxYn41F
         ST0CYwVUMCmDtY83TPCu9RFGdzUnE1jqswi7/OYVC5UozYp0G/NW9tHPjp7OGFm7Nrup
         6GwyVDJ5kgyGA1Pq05zo7V0SEmkHrgnFYn+TaNFJH85zxN8UdNriT02KNHX0+JZaR/pA
         UrL0rMlbYXqwD9O4/cSBLENmN95p4XvtTbgopscJKkW4Badd2sO9xjMvJQoRqOyiJI7t
         JWpQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778401223; x=1779006023; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gCbOhGmC2ASoNRhJ45rrQzr1riSuWbHWDX3kRpzdSDY=;
        b=eVjhGBAm1192/t9D1K/vTdgi+G0LrqcbXKvq3b3maHHvWzaKiipr4OVi6eI/jxPaoB
         pJoMESnRmXs6pf6ln3LLO4H1DbYvsN7QI6+3TEeMNJygLNpSrxwNPCnJ4Tbubf09Oa5b
         l4wrC7jliWztXpwZUs0984S7ZsNJZdFxn3Jf9RNSfuevRBH60+W0TWnr2ubchLdUgLcq
         I11AgJMAlvQ7F9IKkrOBrn0y+raFdZvn+VAXHwmDtFkRkx6gQZ7LmEXr9aEulO3OPWF6
         hioUkHL9T8h4HqXG41cPGV1M+vN0G0XqhPO2fydcd0KXzSQwAUt7szOMMKqwO30N3YvP
         mvgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778401223; x=1779006023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gCbOhGmC2ASoNRhJ45rrQzr1riSuWbHWDX3kRpzdSDY=;
        b=IW5d3+fi64obPspwN8I21JksE6rSNboiVfWrpZlTDdcn8K10vDgXngJ/H0mSqRaP9C
         92p9BdPMJuLmk42nELr2TROru7lkeUJzH9i7XiKbIBjGKqDCtpv6Vg/MlExKUMUKnIJT
         QPgjWoJNGzsi1YH/W1x19jNvixxAthnP4t6u5GYKY4Vy/ekFmVsfP34yWVO2GiPXvAbk
         UUHKSZSINQFRPWS3b2zZwPqexUcAo/Zk93THLbdU52aIo+nt2S0hq0/u5jr6qBdmLUF9
         raAJpHidUoksojq8qZ/C3JPio0qYPugMubmuKwRILOS/4yD4OhDAvMq5pjJ7WnMyZLY/
         iHtw==
X-Forwarded-Encrypted: i=1; AFNElJ8B1+qEkec2Vd3MrjqWob/aCG7bRIIm5QD0pcadjpD8936hzCuljXR3magSIJOipxFpVjiBysVYNZaRseIv@lists.linux.dev
X-Gm-Message-State: AOJu0Yx79XzMzG9lF/wm6QHpblqZJdYVL2cvF/fLsEGGS/f/nqiBCSph
	65RRwgZ6VmYeMQgyNQcGVHlOdM8EGGLL5hu/gLIy3esGK0q7yHzP3cM5oUIYwSZ2Po83nk/FpdU
	9jBGjtW0ewWcDtpMyU399XgJjXLEbggs=
X-Gm-Gg: Acq92OFmJaVPs8QY0BGFdlOsE2PysetoUkF7jX8BvnAqt+V8omjmux0Ee5SK+uBpeOS
	4xMTm0dOP7n6bfvq3KDJtp5+z5FiBpV2rPS8WEiSEIsFxbIV+u1kqvrhzZhViGTKCGUhlTetXBG
	buA5CGMOtcsoHDRYDXgZFS5gkEq0hbwxWICvxerittul7ZTZaYmEC+0buWUSTTDa9vG5xpl9lYC
	pzD/lpIB+276nhmtr4zEI2TS+NiYbe0yU+plF4hz014WXRL0BfflfmOPvq3F5xoZcUT3KQiKoiU
	c6CJ
X-Received: by 2002:a05:690e:d84:b0:657:a6a4:6ee2 with SMTP id
 956f58d0204a3-65d7e7000e8mr11017061d50.3.1778401223591; Sun, 10 May 2026
 01:20:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260510081041.85880-1-dennylin0707@gmail.com>
In-Reply-To: <20260510081041.85880-1-dennylin0707@gmail.com>
From: Maxwell Doose <m32285159@gmail.com>
Date: Sun, 10 May 2026 03:20:12 -0500
X-Gm-Features: AVHnY4LpQ1hQb4HZvp8qOey_Vx13xFcgP7QYhhLIOenZ3Ym5fNoAtrTVgU_tL30
Message-ID: <CAKqfh0GECZgj5aQZhTq8y4myp62Q7uVXhwKHUD-K2Sq-KH6UJA@mail.gmail.com>
Subject: Re: [PATCH v2] staging: iio: addac: adt7316: document SPI interface
 switching sequence
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: jic23@kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com, 
	gregkh@linuxfoundation.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 10, 2026 at 3:11=E2=80=AFAM Hungyu Lin <dennylin0707@gmail.com>=
 wrote:
>
> The device powers up in I2C mode. Switching to SPI mode
> requires sending a sequence of SPI writes as described in
> the datasheet.
>
> During this sequence, the device may still be in I2C mode,
> so SPI transactions may not be recognized and can fail.
> Such errors are expected and are ignored.
>
> Add a comment to clarify this behavior.
>
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
> Changes in v2:
> - Add datasheet reference
> - Add TL;DR note
>
>  drivers/staging/iio/addac/adt7316-spi.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/staging/iio/addac/adt7316-spi.c b/drivers/staging/ii=
o/addac/adt7316-spi.c
> index f91325d11394..980532b7fa1e 100644
> --- a/drivers/staging/iio/addac/adt7316-spi.c
> +++ b/drivers/staging/iio/addac/adt7316-spi.c
> @@ -106,7 +106,17 @@ static int adt7316_spi_probe(struct spi_device *spi_=
dev)
>                 return -EINVAL;
>         }
>
> -       /* switch from default I2C protocol to SPI protocol */
> +       /*
> +        * The device powers up in I2C mode. Switching to SPI mode
> +        * requires sending a sequence of SPI writes as described in
> +        * the datasheet ("Serial Interface Selection" section).
> +        *
> +        * During this sequence, the device may still be in I2C mode,
> +        * so SPI transactions may not be recognized and can fail.
> +        * Such errors are expected and are ignored.
> +        *
> +        * TL;DR: Do not change this!
> +        */
>         adt7316_spi_write(spi_dev, 0, 0);
>         adt7316_spi_write(spi_dev, 0, 0);
>         adt7316_spi_write(spi_dev, 0, 0);
> --
> 2.34.1
>
>

Reviewed-by: Maxwell Doose <m32285159@gmail.com>

but please, wait at least 24hrs before submitting a new version...

best regards,
max
