Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E83E211C;
	Fri, 25 Apr 2025 04:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745555143; cv=none; b=Ik4LzQ1nKLQxLM8BJCThBj3vevCdYhUuMXXOx9GL4N+5B4NAx3XcEC7pOQVgELhizPM8mP2b07+FsogrVhNCyQDNKWLB2/1IeQzuoOE3Zw/MUSBS3ZiuWiG1PBHgsGtUH+RMIZxj7cy9sMx4zctuQt75zRiFWQjg7W3R9j5lyZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745555143; c=relaxed/simple;
	bh=Jy97R1wx5sVqOZMfPz4MOBXl5MZAKekgvv5SfHf0JuU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lSTsY30O8NyFwYuQ7E1blCkzCZ80AGHciXJx4L5B6MIFByXV76shuizYB7frKrby/5M+Km+JIxBBmEtkBWa+kTbR1R6EfH4u7txM9VpWtF8dMt84iHUpqZmnY1PcoS7yOnK8qfE7MyJUCJXjjBJYekgKjLJhetZ5nmA69a3w+R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KoJHyKqj; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KoJHyKqj"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-acae7e7587dso282525666b.2;
        Thu, 24 Apr 2025 21:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745555140; x=1746159940; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GqVVwg78KecTQrbOcLDXNtfkUV3HjJdry3VPAdxnn0I=;
        b=KoJHyKqj8CbZgkzOtSoghepl//pyL7Xhf+mVaD4Mx27tIS6C40C3IG7m2gBo9Doe7U
         jFZ0wgqoL12ZLxLC7MRRsnLx9W6xXeMPhcEMH7xEO4O2WtWM8y6IT9ibG1zQL+/+vwkv
         eP4diM8QBBRg7CAE9UkTYIfCh63j4AzdS7i3wsU1CBowZql4N18evxSxQyqzE7eh1Ngv
         S027TyoQP6AoWMmwHweCnAKh0CxnRIzPO+3r1TYYLvrUUFzEBRbpE1N3l0u6he5OaI4U
         qsYM9GCsfeQWh6a8sDLaQrIlIUdC57rcMtM2nGhZARMH+Es2efa23McYHL42vNt1lgtA
         /PKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745555140; x=1746159940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GqVVwg78KecTQrbOcLDXNtfkUV3HjJdry3VPAdxnn0I=;
        b=REWpVnYfwV28pRXpQdjCQhmWcRqWYlylkuQLhMmtynX9ksOd0CoL9V1AdHNm53BCLQ
         9Ndo4JNphitO+heExr+mrnwKAO4IBEvZDcws16xiy7Xxn6NYCHLT50WSRp3ICZ4D9cQ0
         /YaT+CnkcpQaLpgOfGruzBO0zgTloh0vXdrg6+M08zd+Jy8DalCg2WsF+nEGlIxZgE/z
         Dkhz6j9vq/+S+QZCbdsXs9oUBuVqlArcCCNavuOCwisSrYTv9/Y5CNbtgZOO/qiFDRH4
         twb0I4t5alfl57ZjaK1hP92Ci/TunA6oqwaM6Za4Bs5OwootRkIIe7lDXQd38zdrlooT
         3lAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJiNb8hi+yLfM+ksD21lvl968sFPTCEZyyfFDfXRLABEWk6vA0zBppChOxAzXqIDb62LwIYbttYfcACTgf4A==@lists.linux.dev, AJvYcCXS3Eqpw6GdHmKjuPLNDt7qEQ8exUmFnsz3BJ1dqQ625Dd8nM0yB4DeQcKXYhPc0yjmDedsFR8dlrpRqUvGDhX7sNEtZg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwsCt5tWsZ3uymwFcupJCqOZpA9rstdLz4U0QhL6cRRhUrgEgSR
	ltwLYYvWLAKAzc+bYdvnrsnUL4KqCGkPh2laOlNR+cMvaBIJwlgnC9lDexoYOFq/FQA8cAVJp7s
	s7aaIObbnMx/h9uGmbyWBf0DKtd8=
X-Gm-Gg: ASbGncvYBgynpfqDPy+kOx95QelTOMEvmB1sMeSobQ1xJLjTX2sPn4kHR0Y3MV9Yciw
	8FsPjc/A52A4iZPI1LElufy/dQLJ0N2aUY38Y9MPEyRbOzWEPf7O+LZiiytk+FZCz5YzyJkZAQ3
	qcFLBG+pvCibBM2wpHfqrIVQ==
X-Google-Smtp-Source: AGHT+IGOPLy72Qv/dSaf9ns50zld51W6EJ9IwKuaHOcIQgrajno/4DsITdv3MS/cQZ9vZ+E1rFBMvrjgJQxlvIFCfds=
X-Received: by 2002:a17:907:86a7:b0:abf:733f:5c42 with SMTP id
 a640c23a62f3a-ace71048709mr71258066b.8.1745555139755; Thu, 24 Apr 2025
 21:25:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250424223210.91317-1-gshahrouzi@gmail.com> <20250424223210.91317-3-gshahrouzi@gmail.com>
In-Reply-To: <20250424223210.91317-3-gshahrouzi@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 25 Apr 2025 07:25:03 +0300
X-Gm-Features: ATxdqUG-YZDqpAiQ7DWeVoXYapBbpZFIX7bs0mTobnkUl-qrm5OxRtRUZ77AiZI
Message-ID: <CAHp75VfnAkgP7sPs2E5i2hjcNib96mjyXz-w=jgFzF7F839yTw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] staging: iio: frequency: ad9832: Refactor
 powerdown control
To: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Cc: andy@kernel.org, dlechner@baylibre.com, gregkh@linuxfoundation.org, 
	jic23@kernel.org, lars@metafoo.de, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	Michael.Hennerich@analog.com, nuno.sa@analog.com, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 1:34=E2=80=AFAM Gabriel Shahrouzi <gshahrouzi@gmail=
.com> wrote:
>
> Replace custom implementation with out_altvoltage_powerdown ABI. The
> attribute's logic is inverted (1 now enables powerdown) to match the
> standard.


> +static ssize_t ad9832_write_powerdown(struct iio_dev *indio_dev, uintptr=
_t private,
> +                                     const struct iio_chan_spec *chan,
> +                                     const char *buf, size_t len)
> +{
> +       struct ad9832_state *st =3D iio_priv(indio_dev);
> +       int ret;
> +       bool val;
> +
> +       ret =3D kstrtobool(buf, &val);
> +       if (ret)
> +               return ret;
> +
> +       guard(mutex)(&st->lock);

> +       if (val)
> +               st->ctrl_src |=3D AD9832_SLEEP;
> +       else
> +               st->ctrl_src &=3D ~(AD9832_RESET | AD9832_SLEEP |
> +                                AD9832_CLR);

Why out of a sudden this went backwards in style and format (no
FIELD_PREP(), two lines, ...)?

> +
> +       st->data =3D cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_SL=
EEPRESCLR) |
> +                                         st->ctrl_src);
> +       ret =3D spi_sync(st->spi, &st->msg);
> +
> +       return ret ? ret : len;
> +}

Use Elvis?

...

> -       mutex_lock(&st->lock);
> +       guard(mutex)(&st->lock);

This should be done in a separate patch for all locking.

...

> -                       st->ctrl_src |=3D FIELD_PREP(AD9832_SLEEP, 1);

Btw, I do not see this in v6.15-tcX, is this part of Linux Next?

...


>         &iio_dev_attr_out_altvoltage0_pincontrol_en.dev_attr.attr,
>         &iio_dev_attr_out_altvoltage0_frequencysymbol.dev_attr.attr,
>         &iio_dev_attr_out_altvoltage0_phasesymbol.dev_attr.attr,
> -       &iio_dev_attr_out_altvoltage0_out_enable.dev_attr.attr,

>         NULL,

Also drop the trailing comma at some point.

...

> +static const struct iio_chan_spec_ext_info ad9832_ext_info[] =3D {
> +       {
> +               .name =3D "powerdown",
> +               .shared =3D IIO_SEPARATE,
> +               .write =3D ad9832_write_powerdown,
> +       },

> +       { },

Ditto.

> +};

--=20
With Best Regards,
Andy Shevchenko
