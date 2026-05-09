Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B35D38E5ED
	for <linux-staging@lists.linux.dev>; Sat,  9 May 2026 08:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778316075; cv=none; b=tK536A/S0o4TI2WtINOI+l+Ip3Gf0ILF418koWtmUgyOHbk3B8gJ9lobxE9PjbzJmLc1KiHxpU9hLd+Dml8DxtJVsnvO/33E3EXD31v2+kVnuCtiSukLPjXiRap/3p2fDGvaM7AVkzxMI19xvveg66JYaiwxomq3mliIE2sEQKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778316075; c=relaxed/simple;
	bh=7NVYnCMvS/7X3T3G89maX0Gdoroi3w8DAJG4EMNUKLk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IixyAhmdEH0TfNaQi293K9hhkAR1Xqv8dS54yt3/H/ruY89hMaxQW69r81W0s1gS79bvjlOoxzNT2VTwXWcF1kmpq0LYIgVh3YZEbRxoe1+7tatHPF9/vdmJ6j4eB+LInNa+MDqmmFba+U9xvaPmaJBHlw6UEAXVtuvrpGcl8nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RfK8hPYP; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RfK8hPYP"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48e56c1bf5dso16656815e9.3
        for <linux-staging@lists.linux.dev>; Sat, 09 May 2026 01:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778316073; x=1778920873; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CgQX5/FDdpguyCea7DnUd7QUmiY5RWdQxW1ZkTMJo1E=;
        b=RfK8hPYPv0cWTW1+oyqSPOas/1IHyB1p6yJ5DYE4TOAgFC587wWQZ5krNBE+76qoz3
         eaDkr7N/jR8cDqIUJFWo45m3XMuGBjFTFKoQHgX65PUkDl2of3PNT9XLF8HZdnwEeOTR
         KtEpkSPEVniOj2FBuShye6Dsq/7n++LgsjOLLYgrHmalk6u8UKTam56oOIAVoXKq+Gbb
         N5uhtoZz3bdZYpItF5p3bolMfkGpx0iz3JW24xKHxqJy0Iok5pVUkZW9N+jggdW8w/36
         eJJCVnMGrnSRLvB9gyb4qEx9Vui1voysbcilLOtDiib5huUf+s9OISHm0k6HjgLOpGug
         +p3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778316073; x=1778920873;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CgQX5/FDdpguyCea7DnUd7QUmiY5RWdQxW1ZkTMJo1E=;
        b=hHiSKVveGb4mE5tm9cfLHc1Ky5siYJJ0oBDTaGGqREBtfQac5jUwSJKCjSVaA3uLIV
         C4ffMZzF6XUVxkkw2bS/tgJQLaWA4IUZ7Nj0iAee90mq/qj+Bt2ZzmVLElLaDPOWtLCq
         NzPtITG15BN6ZaPJ7sxDxDRIQkUXnYU+rNunQydYlOCAbEsWmGIZphQUyR1H73qrRtDo
         y7DFhk/5xO3iNZ/p/LbqyyXx94rZZBLTRHdkDOFHaXLdQHnFoUvOAJe9E1+kQwwCc/dk
         ymjrGCnDcB/bW0kGid9K4vSBBDFIYObSAopKwL+B9F2GI+2AWNUhuDBqxPvj9rt50w1m
         bXmQ==
X-Forwarded-Encrypted: i=1; AFNElJ+9H6eiwGluLhN3HJlWR6fJF0HviY/frz2IXXw6IAq2V2wB5RUZ0rX7l08XbCMPeHR4YE9hX5TOHLWmtTRy@lists.linux.dev
X-Gm-Message-State: AOJu0YwyanGmaLIv0WoAqnV5oE6Cy42xlsf55ZKY3SIj/315OBhpUlos
	tkYnc2JfHNP+ER/ZmExhvkziJWCP7YRsqrgjH7gmkNHgGkl6zetBEBlmFq+Mxg==
X-Gm-Gg: AeBDiesGu4LJwPz/PsTthtUBvWaq6f+geqV5alIq/Dp5ZXxlodxbXBjObOeTuP9EtmS
	U1FZ+A4T/m/8/WKsxTLd1hGMo0P8grp1O2hTEfhRb+UmuiB40IrqF1OFctMzGuGwv0+eJ+RQVUm
	C4X2N+MNrbg8MdCjO/EkWMSrL9Y5y89KfAbk82RtGgUK8wH1oEL8JMLkNMMTsrr1vVwsgZ7qgCa
	PWs7r8pK6ThtgrLvm9WqnwyMxASN39xpmKfQ+A2Aq80uY75mcHI0mCG4ROaRp1o7xch6+BKXWBH
	8pVhMbf6gktFaR2SqB5n4PHIqeJhUC//VnxfAdxKAKK2kvHCFiV55iqcwGnK4y4JeZcpUnGskEx
	IMgyJXxaF9lWoBYUYeXDF3aH2qvOXhgad6+4lF7bM1kAKqBkWHeLWuCB7xtErGeZu3gCkQUPJkT
	n7WIMFlCtNK9z5bEe82HKHnv1XTyemcp+GsBFfpDq7s43SbuIuXu+qIOtMCHO5UdGaCmy/flmwU
	Q==
X-Received: by 2002:a05:600c:17c3:b0:489:1ff1:74df with SMTP id 5b1f17b1804b1-48e70687ec7mr13078515e9.1.1778316072356;
        Sat, 09 May 2026 01:41:12 -0700 (PDT)
Received: from ?IPv6:2001:818:ea56:d000:56e0:ceba:7da4:6673? ([2001:818:ea56:d000:56e0:ceba:7da4:6673])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6db0b08asm24056555e9.8.2026.05.09.01.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 01:41:11 -0700 (PDT)
Message-ID: <a0d363994bc55ef2b4c3c5c70b0cd91e94acaeef.camel@gmail.com>
Subject: Re: [PATCH] staging: iio: addac: adt7316: check SPI write errors in
 probe
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Hungyu Lin <dennylin0707@gmail.com>, linux-iio@vger.kernel.org, Jonathan
 Cameron <jic23@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich	
 <Michael.Hennerich@analog.com>, David Lechner <dlechner@baylibre.com>, Nuno
 =?ISO-8859-1?Q?S=E1?=	 <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, Greg Kroah-Hartman	 <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, 	linux-staging@lists.linux.dev
Date: Sat, 09 May 2026 09:42:12 +0100
In-Reply-To: <20260509082636.85114-1-dennylin0707@gmail.com>
References: <20260509082636.85114-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sat, 2026-05-09 at 08:26 +0000, Hungyu Lin wrote:
> The probe function issues three SPI writes to switch the device
> from the default I2C protocol to SPI protocol, but ignores their
> return values.
>=20
> Add error checking and emit a warning if any of these writes fail,
> to improve error visibility without changing existing behavior.
>=20
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---

Hi Hungyu,

Small comment from me. With that addressed:

Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>

> =C2=A0drivers/staging/iio/addac/adt7316-spi.c | 9 ++++++---
> =C2=A01 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/staging/iio/addac/adt7316-spi.c
> b/drivers/staging/iio/addac/adt7316-spi.c
> index f91325d11394..25b7772bd05f 100644
> --- a/drivers/staging/iio/addac/adt7316-spi.c
> +++ b/drivers/staging/iio/addac/adt7316-spi.c
> @@ -98,6 +98,7 @@ static int adt7316_spi_probe(struct spi_device *spi_dev=
)
> =C2=A0		.multi_read =3D adt7316_spi_multi_read,
> =C2=A0		.multi_write =3D adt7316_spi_multi_write,
> =C2=A0	};
> +	int i, ret;
> =C2=A0
> =C2=A0	/* don't exceed max specified SPI CLK frequency */
> =C2=A0	if (spi_dev->max_speed_hz > ADT7316_SPI_MAX_FREQ_HZ) {
> @@ -107,9 +108,11 @@ static int adt7316_spi_probe(struct spi_device *spi_=
dev)
> =C2=A0	}
> =C2=A0
> =C2=A0	/* switch from default I2C protocol to SPI protocol */
> -	adt7316_spi_write(spi_dev, 0, 0);
> -	adt7316_spi_write(spi_dev, 0, 0);
> -	adt7316_spi_write(spi_dev, 0, 0);
> +	for (i =3D 0; i < 3; i++) {
> +		ret =3D adt7316_spi_write(spi_dev, 0, 0);
> +		if (ret)
> +			dev_warn(&spi_dev->dev, "SPI init write %d failed: %d\n",
> i, ret);
> +	}

Hmm this is a bit useless no :)? Agree we should check for error codes but =
we should
bail in case of errors. You can also mention the loop() introduction. =20

- Nuno S=C3=A1
> =C2=A0
> =C2=A0	return adt7316_probe(&spi_dev->dev, &bus, spi_dev->modalias);
> =C2=A0}
