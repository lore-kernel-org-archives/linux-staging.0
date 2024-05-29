Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CF21802C9
	for <linux-staging@lists.linux.dev>; Wed, 29 May 2024 11:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716981904; cv=none; b=TCDfz/RdAaNDuEjtGPpMj3ffq+g5kxMD0rZVOS4rKTez0D8EVM73wSmVbcMiom7hRBGBMFNOiaevpqX7xkFAEkT7xvH5FeSewEx11Pmj2C6p07AboUNmbn0+RxeAzS3NcohBQosfUBGqvCpnLGy6rLlTTntiNtSqwN99951tgIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716981904; c=relaxed/simple;
	bh=TzZQrzj+WOG1xkO/GYUZ4HiFLMiivXVoPSh1a4x0Q04=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Cl3+hyZPg2YTyW3G9IAoyrvNv49oIW3a/Nrg2liSL51PstGemF5lr97tdXm88+Luvg4E7Z6RRrHsPvzIHzYw9Xkh9lUztEjV/LKdKxQfsSQw5dEzAXO18RgLGeyacVTiJqEHxF5itHDkVbRMwH79grEEt3QGzJ0BL2QzdZhNLnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J+TjlvKO; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J+TjlvKO"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2e9819a630fso786521fa.1
        for <linux-staging@lists.linux.dev>; Wed, 29 May 2024 04:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716981901; x=1717586701; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=n5uEzMRdxtO7RULJZB7deduoIw+Y3iKQ4EZq8+uKKOA=;
        b=J+TjlvKOWJcGaEU5dKTlPmdhqmCuTHSuPUnnMfH0IB/lh/5k3jyXt0ISP5kvW/naWu
         uQ6ACIeJwXAe1gTdfrFBBANUxkIw/38GT2Mv6Slh8h7rhhBX3LwEQd2imbDd/Qa+GY/n
         Y44mQflVonygvajYYq5X+xsMtP39UyW2b0fc79ResXOf+2JIp82vRg0YS1coUEcEkUxD
         7v1p+9Z+BTSzTt6A47Zof3022lzphMUzzROKEB2FYyxCY1FbLMzq/4V5zPCFJEUc0Mcb
         irtjRBtGhahqLaINT6gzHZ22d9NPCP7m2dBt3ZO96/lmShU212rP9g/nyNT6GkWQPV9D
         Sm0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716981901; x=1717586701;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n5uEzMRdxtO7RULJZB7deduoIw+Y3iKQ4EZq8+uKKOA=;
        b=gtM/RRAgpBl0xju/eSkZ3upK0xpniH/vwj1dpMEchPy7PNuy4hCfgy3QSVkCUuOhKA
         AOjlMO0tPXU+3c95RkzCoWTe/4Q1QRAfTmy7TxhNonjcLn6xJr3VYUYrmLvhH1UrvfyP
         KbQre1n7W13hpF2oa5fOwBxXB13Vus9O19dCA6P15AzAXy0ezMfXlWCD2yDFMTAcF5oR
         5JWa6SyECyW5Cwb931lsPq7MwCE5xQpknEPTuEix+jvXV8w2ZmWuScO8HESQnExG2IOn
         +GbMB4Kh+41qK0GN9K6qeXenvTJs3HNk/uvbMO+aoRXQOP4s9RMDRvEFD5ywQfH8+Nwk
         nQQQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1xBsbVN5+QjR8zqFZiIOjEzuWjWT15tKQ+xbESInD8QoR4XqkIEUhOq5NSshZvv1lplRfNWHlz2xUeHKrwf8K5WftXrYCBTm+DsGQ/Q==
X-Gm-Message-State: AOJu0YyUZUGFGJfz3KTLWTQnja7wmj9d0N9PRoqPxrV+oD62YehQMLzr
	WMcxk8KXzmgEpf6UV2DtW4+QFSy6hBmJ2DmW/lqLzDkpXWm2pP7+
X-Google-Smtp-Source: AGHT+IFrPvh7qeKnY8XKng8faeG4RHzsfNVpq2beLpTDGHDt1ahg4B1fMWblmIksy9gHtLUqFTZeQQ==
X-Received: by 2002:a2e:9810:0:b0:2ea:7d9f:8f62 with SMTP id 38308e7fff4ca-2ea7d9f917bmr10742401fa.10.1716981900672;
        Wed, 29 May 2024 04:25:00 -0700 (PDT)
Received: from nsa.fritz.box ([2001:a61:35f9:9001:40df:88bb:5090:7ab6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cc8c287sm710848966b.162.2024.05.29.04.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 04:25:00 -0700 (PDT)
Message-ID: <23d5359dca83dd803655b0990479f6fb0eadc61c.camel@gmail.com>
Subject: Re: [PATCH] staging: iio: adt7316: remove unused struct
 'adt7316_limit_regs'
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: linux@treblig.org, lars@metafoo.de, Michael.Hennerich@analog.com, 
	jic23@kernel.org
Cc: linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Wed, 29 May 2024 13:24:59 +0200
In-Reply-To: <20240528233008.191403-1-linux@treblig.org>
References: <20240528233008.191403-1-linux@treblig.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2024-05-29 at 00:30 +0100, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>=20
> 'adt7316_limit_regs' has never been used since the original
> commit 35f6b6b86ede ("staging: iio: new ADT7316/7/8 and ADT7516/7/9
> driver").
>=20
> The comment above it is a copy-and-paste from a different struct.
>=20
> Remove both the struct and the comment.
>=20
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---

Reviewed-by: Nuno Sa <nuno.sa@analog.com>

> =C2=A0drivers/staging/iio/addac/adt7316.c | 8 --------
> =C2=A01 file changed, 8 deletions(-)
>=20
> diff --git a/drivers/staging/iio/addac/adt7316.c
> b/drivers/staging/iio/addac/adt7316.c
> index 79467f056a05..23d036d2802c 100644
> --- a/drivers/staging/iio/addac/adt7316.c
> +++ b/drivers/staging/iio/addac/adt7316.c
> @@ -209,14 +209,6 @@ struct adt7316_chip_info {
> =C2=A0#define ADT7316_TEMP_AIN_INT_MASK	\
> =C2=A0	(ADT7316_TEMP_INT_MASK)
> =C2=A0
> -/*
> - * struct adt7316_chip_info - chip specific information
> - */
> -
> -struct adt7316_limit_regs {
> -	u16	data_high;
> -	u16	data_low;
> -};
> =C2=A0
> =C2=A0static ssize_t adt7316_show_enabled(struct device *dev,
> =C2=A0				=C2=A0=C2=A0=C2=A0 struct device_attribute *attr,

