Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C187423A7D
	for <linux-staging@lists.linux.dev>; Thu,  8 Jan 2026 11:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767870330; cv=none; b=VdNFt9DBZCLhe3AEMJGgWlbwOoRW8D7G6d1ETffEPlaAhRqfedn8bWsnmo3qRiQTjVVyV2m9YCGm5H6aIr5+oQRZ7gg93goNkAykKxyO7AMnLNoY+BOtpJstFFXH6pmgFO7UdcKEwl6B67u2UwJgaFvvRMnSPz9Ss0sQn8z84y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767870330; c=relaxed/simple;
	bh=Y8yjqHqG57G3fx5nuEBV+XOYIn6MXJdwPT1PCD1Iuso=;
	h=From:Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:
	 References:In-Reply-To; b=iE6/hextcrkeNqNLbGs4WeTMF8RvyOFAUAA0Q+iwClBa2ssAkDwXLda+w+XH+eCBnDSrlRg9L1+AqVhotkjO54GVvtiR7QYMSITdSdiYxAUTVIwJ3B4NoaDexQ11/hwKPm5rIom/82ctcXwFJVed6wjgq6grICJkVR16xRhg7Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cGBsKhjj; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cGBsKhjj"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47796a837c7so22677605e9.0
        for <linux-staging@lists.linux.dev>; Thu, 08 Jan 2026 03:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767870312; x=1768475112; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7wi0cLxVYTkjjMZXxZy4zeQFvgVDMeogFnmSnZc8m8I=;
        b=cGBsKhjjzQ8/k46qDLzLqvo3T2ia5Rs7hDHJ7+frd8/w/hgnXULgDDaUaILDultXRX
         ZgeDmXglvyg/2GkmB9eNH5PANmXNMB5ishhK4j/+19olrCW/2MfoiEv9N4hWX+wtkJit
         Xt2SG7TjOOk8x1S+xi46CF6KjCcjqA038Q/t7i19ibOoU3Kxq0EJM6MpvDW33+ZW+IlO
         MeOdI10cRpAjGo3dDYOfURtSYH5DdLwm73KyUHxTVfocIPGJn9tZITINOQ2/0QQQ2O+t
         gr93p4I0mLkMCzwZ1IL97vd6S4CI1eZ5me3t2IT6ny6sG5pRBodlCWowSmuxJbLD+dMb
         Hutw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767870312; x=1768475112;
        h=in-reply-to:references:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7wi0cLxVYTkjjMZXxZy4zeQFvgVDMeogFnmSnZc8m8I=;
        b=kOZ9MFO+TaQtYf6PGnRt+Ebm9XUxFPwWdcenWRIXNwz3jFxAkNXt8pyPI9UONRs2cT
         tnemn0PZanR0gLlaQFiKLGhLPUT6Ifo8CttYgbkjOVcSjeCGb2taTq+SSE+TSqBHix++
         LWAlMT1CET6EYOdx4LEKOikFEtxo8pbHCNfoL3XJkMDlIFV8LyV5eE7g7ooIAhkXFYpT
         r5DvD0z6IqMV+ZiL5Dwcctr2bigdRxVqEtF7IBapTvSPdU9HiNUimideA7vP7qHQQKUq
         WxgAzGbqc55u12EkDMd7hnnZVYLoKEkFgY434C04Ujkdj9ravQE6ucAnSB+h7uQaGb0v
         i9gQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8qwGoFw7/Ta83tHZHqlBpvt95HcwywYsL8Yo7R1PWGYW240Pk0CQM8fokbi9KvyLwMMFh0PwPUz2BDQYH@lists.linux.dev
X-Gm-Message-State: AOJu0YzZwm3UKUzv/wLvsfl9oMvHbjQzc7waZFPlaGGYaXXUkR+MFZfz
	3KgWiCOHJR57+qwv70fbunfbjYxv/OqoR59SBQEBnHHzLoAOEvos36l/EUWi2mFV7o4qJv0wgRf
	s5Gpr
X-Gm-Gg: AY/fxX6/LbmjMLE0VlFWPs19/24IkV32B6kLuHuh+z233Tf79tVwEl5VxD7HB9Nr8Y/
	BDAu2iMz2LOSJksGGdhLPGVYUQprqBsKMeRSmrri7w++wvAWTVSfF/tP6krHsSJFWBNknJzjAPo
	+8uyUQJPvnBjULaKud65LIezTXMEO7Pnzli8sGIJe5JXPk8R/TRtwZgFcRvIZXzaH5irEoQp2wh
	8LZROXQUwkOYduYBj/lJ0lM4dhjSoTjJGwNioBFyx6dhQ+hbDj7oL3DYQTOA6irQC2PUCNDxaSw
	dJ5EesAHQVzQgLM8Uz8LxMLrmHKA1QXlrqAnsyYMA158joom4UDOR0xJfF5bEpo6IdpAwUEcP70
	51sFDT7TTgBKX0O8Vjbgb5slpuokGVpzi8ZD22rtIEkKtF5myogBacsJszm8APmlhhuf/C3qkrJ
	JciOixuOAmGeF9vYSSbDdnnAHYt5tDlr3O7kP+SpxBQeevIqFNB8sF
X-Google-Smtp-Source: AGHT+IHv7g9k/MI4TfuXMCEZW93m6zGf7qxNLrOVEx9WLQYfZAR+01N633qUWhbfiDUgojUqOvYRPg==
X-Received: by 2002:a05:600c:46cb:b0:47a:810f:1d06 with SMTP id 5b1f17b1804b1-47d84b26da4mr67559795e9.4.1767870312264;
        Thu, 08 Jan 2026 03:05:12 -0800 (PST)
Received: from localhost (a109-48-201-233.cpe.netcabo.pt. [109.48.201.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8636cb0dsm41520205e9.0.2026.01.08.03.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 03:05:12 -0800 (PST)
From: Rui Miguel Silva <rui.silva@linaro.org>
X-Google-Original-From: "Rui Miguel Silva" <rui.silva@linaro.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 08 Jan 2026 11:05:09 +0000
Message-Id: <DFJ5Q0E4QQ0F.1A6G2J04HJNH1@linaro.com>
To: "Chaitanya Mishra" <chaitanyamishra.ai@gmail.com>, <rmfrfs@gmail.com>,
 <johan@kernel.org>, <elder@kernel.org>, <gregkh@linuxfoundation.org>
Cc: <greybus-dev@lists.linaro.org>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] staging: greybus: lights: avoid NULL deref
References: <20260108103700.15384-1-chaitanyamishra.ai@gmail.com>
 <20260108104947.23767-1-chaitanyamishra.ai@gmail.com>
In-Reply-To: <20260108104947.23767-1-chaitanyamishra.ai@gmail.com>

Hey Chaitanya,
Thanks for the patch.

On Thu Jan 8, 2026 at 10:49 AM WET, Chaitanya Mishra wrote:

> gb_lights_light_config() stores channel_count before allocating the
> channels array. If kcalloc() fails, gb_lights_release() iterates the
> non-zero count and dereferences light->channels, which is NULL.
>
> Allocate channels first and only then publish channels_count so the
> cleanup path can't walk a NULL pointer.

Good catch, going through the error path, does looks this fix the issue.

But you need to add the changes between versions bellow --  and maybe a
link to the first version.

Reviewed-by: Rui Miguel Silva <rui.silva@linaro.org>

Cheers,
    Rui
>
> Fixes: 2870b52bae4c ("greybus: lights: add lights implementation")
> Signed-off-by: Chaitanya Mishra <chaitanyamishra.ai@gmail.com>
> ---
>  drivers/staging/greybus/light.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/li=
ght.c
> index e509fdc715db..38c233a706c4 100644
> --- a/drivers/staging/greybus/light.c
> +++ b/drivers/staging/greybus/light.c
> @@ -1008,14 +1008,18 @@ static int gb_lights_light_config(struct gb_light=
s *glights, u8 id)
>  	if (!strlen(conf.name))
>  		return -EINVAL;
> =20
> -	light->channels_count =3D conf.channel_count;
>  	light->name =3D kstrndup(conf.name, NAMES_MAX, GFP_KERNEL);
>  	if (!light->name)
>  		return -ENOMEM;
> -	light->channels =3D kcalloc(light->channels_count,
> +	light->channels =3D kcalloc(conf.channel_count,
>  				  sizeof(struct gb_channel), GFP_KERNEL);
>  	if (!light->channels)
>  		return -ENOMEM;
> +	/*
> +	 * Publish channels_count only after channels allocation so cleanup
> +	 * doesn't walk a NULL channels pointer on allocation failure.
> +	 */
> +	light->channels_count =3D conf.channel_count;
> =20
>  	/* First we collect all the configurations for all channels */
>  	for (i =3D 0; i < light->channels_count; i++) {
> --=20
> 2.50.1 (Apple Git-155)



