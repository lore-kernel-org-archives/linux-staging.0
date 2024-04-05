Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FF416D318
	for <linux-staging@lists.linux.dev>; Fri,  5 Apr 2024 14:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712328033; cv=none; b=PBogOCM3LGlm9L/6SkKuyY+PIUB7j4irIXLtCJlX+6Z7OZvtk+clsd1fqhWBWAvaTW6xxHIH4CTw9T3mNEEw1wD+tvLYpHK17Z2QPqik8X9Qm/WVKwfxyMFirhrp898qqIBqjhMaRosszqesVOu3mi5dBAlGSaxzsKznju4jyck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712328033; c=relaxed/simple;
	bh=c4yb4IplAI+0OGktd9tOHSCtcIC7AkdOn5VaQjVfw4g=;
	h=Content-Type:Mime-Version:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=h+dPFDYM8pCAxkd3SaKuYUj4W1RG6y31hzM89UplZktyDvHsp2BdwTSuI61eppbspGwIuDCMUX5oAzyg0Sa6qcxZKX/JMK5RPfjIRaarrVCEnUsRoTOF1/dYGyq0giqW72yidNvqpv9KheaH7STzURn+q5ii9d+Nfug39UkBbas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cyya4M9T; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cyya4M9T"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-565c6cf4819so5898813a12.1
        for <linux-staging@lists.linux.dev>; Fri, 05 Apr 2024 07:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712328030; x=1712932830; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E5IZKUnR/lcDGYqJjN9LqFwnS+dvaJ2mez5Z+2uGzXI=;
        b=Cyya4M9TAfUTjW9D5oDJ9goYrH7iNEC8MfJOM4QgDJ2bs3Z+F7VXNkxz9EcD9KD9d1
         HkEGSdjqBQz6UTq5Ike7NbwGpC8FwwDotmAcSOkfi1etf+2xrHgTiQupA1cacaycUdcC
         u70ygveNODC+PeAX2XwBHwezJ48Z0h/rscUrER/EIMQJQoNlJoAtYDeMYT/OuCsaRNg3
         KSTWYF5Becs2uOi1kjEFg3uURXFK7TpgyXA3wZItbIAT5iGXnwOrIBLjy/1lsb20o3if
         KqQogol5jI82s5gG6M0JuLSWCFcPOobVeqHJE1IuDFHP8SxvrdVA+ottIb9mp6iz1E2V
         zesQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712328030; x=1712932830;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E5IZKUnR/lcDGYqJjN9LqFwnS+dvaJ2mez5Z+2uGzXI=;
        b=aIPq5jjmIhSJsafxWSfgDdYmeKU+Q0LQAVoZb3dG9lTvhDYh3lCMSMF+2vOKdP/fPG
         81AkFVy3Y1+5SuN0PVT+tMjksfS2C5LjLkmqIT+IWwzn8V+2AfVwO4eCxlQKgKNnJ9OI
         hfvbszdVKoeXbPTfexiN0G04dAS4y1j3AZnAUpJahYNGQnaDBkliB39+dHGRqmcywL8w
         ePV5baGU+M9bIET8regWV6AjTjDn/emK22jojZl2brrKqtk9WMr7AnRz9jEdFVeIbr93
         q8Npk9/yHsbo85zWy+6lq0kijzs+fMtoUpNCwnnb6l+/rvXcDM0tD9HMGhF9QNy9LJ6C
         SBpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVR2HYzVKzLwahYt4tHqsBUjnZx96WkOyY5d0bY7jDa/oX4e6GUJ4J0kaMBb1HYHMv7BUih72dXczMBm9NBn14MtlUna0iyfrNQenq+rQ==
X-Gm-Message-State: AOJu0YzSvvL9eVo4ZE9YFYjLu++4pxXQR/p35Xd9zFaW2rAJNu2aJf8h
	HsLpz21Qj3KYN2Q51bfJdZHtPsAtFpmLnpxHLorwufaP03WhmN4BVDzAHNbz
X-Google-Smtp-Source: AGHT+IEDOGcMGCCauLF2cK8I/z3LNNYxATbAaah5DShvvB8RooJtbCMZdkq8xhinj8oL+ZoBK3239A==
X-Received: by 2002:a17:906:13cf:b0:a51:8fd0:b1db with SMTP id g15-20020a17090613cf00b00a518fd0b1dbmr1787818ejc.20.1712328029834;
        Fri, 05 Apr 2024 07:40:29 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id m8-20020a1709061ec800b00a46d2e9fd73sm898707ejj.222.2024.04.05.07.40.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Apr 2024 07:40:29 -0700 (PDT)
Content-Type: multipart/signed;
 boundary=74c335071945a17e0f4583ec57e7b5eccdc8c901a8b78ef8ae93a0121cbb;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Date: Fri, 05 Apr 2024 16:40:29 +0200
Message-Id: <D0C9MKZ155E9.GRG2F9N6JHBU@gmail.com>
Cc: <linux-tegra@vger.kernel.org>, <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/4] staging: nvec: make touchpad init synchronous
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Marc Dietrich" <marvin24@gmx.de>, <linux-staging@lists.linux.dev>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240405140906.77831-1-marvin24@gmx.de>
 <20240405140906.77831-3-marvin24@gmx.de>
In-Reply-To: <20240405140906.77831-3-marvin24@gmx.de>

--74c335071945a17e0f4583ec57e7b5eccdc8c901a8b78ef8ae93a0121cbb
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Apr 5, 2024 at 4:09 PM CEST, Marc Dietrich wrote:
> Improve initialization stability by waiting for command completion before
> sending the next one.
>
> Signed-off-by: Marc Dietrich <marvin24@gmx.de>
> ---
>  drivers/staging/nvec/nvec_ps2.c | 31 +++++++++++++++++++++----------
>  1 file changed, 21 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/staging/nvec/nvec_ps2.c b/drivers/staging/nvec/nvec_=
ps2.c
> index cb6d71b8dc83..f34016c4a26b 100644
> --- a/drivers/staging/nvec/nvec_ps2.c
> +++ b/drivers/staging/nvec/nvec_ps2.c
> @@ -60,16 +60,6 @@ static void ps2_stopstreaming(struct serio *ser_dev)
>  	nvec_write_async(ps2_dev.nvec, buf, sizeof(buf));
>  }
>
> -static int ps2_sendcommand(struct serio *ser_dev, unsigned char cmd)
> -{
> -	unsigned char buf[] =3D { NVEC_PS2, SEND_COMMAND, ENABLE_MOUSE, 1 };
> -
> -	buf[2] =3D cmd & 0xff;
> -
> -	dev_dbg(&ser_dev->dev, "Sending ps2 cmd %02x\n", cmd);
> -	return nvec_write_async(ps2_dev.nvec, buf, sizeof(buf));
> -}
> -
>  static int nvec_ps2_notifier(struct notifier_block *nb,
>  			     unsigned long event_type, void *data)
>  {
> @@ -98,6 +88,27 @@ static int nvec_ps2_notifier(struct notifier_block *nb=
,
>  	return NOTIFY_DONE;
>  }
>
> +static int ps2_sendcommand(struct serio *ser_dev, unsigned char cmd)
> +{
> +	unsigned char buf[] =3D { NVEC_PS2, SEND_COMMAND, ENABLE_MOUSE, 1 };
> +	struct nvec_msg *msg;
> +	int ret;
> +
> +	buf[2] =3D cmd & 0xff;
> +
> +	dev_dbg(&ser_dev->dev, "Sending ps2 cmd %02x\n", cmd);
> +
> +	ret =3D nvec_write_sync(ps2_dev.nvec, buf, sizeof(buf), &msg);
> +	if (ret < 0)
> +		return ret;
> +
> +	nvec_ps2_notifier(NULL, NVEC_PS2, msg->data);
> +
> +	nvec_msg_free(ps2_dev.nvec, msg);
> +
> +	return 0;
> +}
> +

Is there a particular reason why you've moved the function around? It'd
probably make the patch a tiny bit smaller if you kept it in the right
spot.

Thierry

--74c335071945a17e0f4583ec57e7b5eccdc8c901a8b78ef8ae93a0121cbb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmYQDV0ACgkQ3SOs138+
s6HsCBAAkMotTVdMPL95hG7YPTXve1UyctiIW3bxkdfstNi3fr33ODyFgCmtPllY
KKLsiWqvWbl4AL0FGnJpqyUr6cLRM6BjLyv8B+GX42EDev0sCzEG3VKBc70VUe9M
AXMXj4zd+0dlfh5h2g+1S/ykVGvHXlw1UvtKP97clMuz6zdOhLvo/FJCcKrEeNGM
8pfW2hxKN5Z2X8RrI+xJjBHok0TVJpKkp3BzzC82kwXPnF8e7dNd1BxUh29Z3N6u
iC8jKNfoTIikeDqkV0TEX7KAIvM7fHDxyM4k6KlCnt790fuHV1/M6qoeu1Mg+B+z
i4KIdhrnUlnx/f/u2Bcdzx56roL/0yHYqsm1LPE3UkIdrRutt+Flk9FxdoSAJScI
hH4hsnML2Sdg3gX7u+tchB0/zAT+CDpHJTkoF/58FoRMcQBvVdVEbNFoktaVhODX
e3O5IYi5BTLPQB9DVZICHXZJdgzLeaMZ8swoy0pnfxNY80zqsMd2WxirIrqPQdjO
SmAj2NoS1wbQ632xAsO+bG8Llqjkmyx3LJtY2DAccbJ4tj3dxMM8bB6Ap9eSWrO2
IJ9vubUjRifCrbi8zAhUxb9twvwflMvKUOrwvY4quhayY6j9wUUHYmFOiuETxxue
efWg6PUbhe+N4mtIsoT4ncKs8RAio3cpJyg01TIgCNCEXHRcoyA=
=f4fx
-----END PGP SIGNATURE-----

--74c335071945a17e0f4583ec57e7b5eccdc8c901a8b78ef8ae93a0121cbb--
