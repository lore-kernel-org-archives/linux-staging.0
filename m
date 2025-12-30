Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5500A248F6F
	for <linux-staging@lists.linux.dev>; Tue, 30 Dec 2025 22:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767135390; cv=none; b=uZv26prEMCgybUwvNWz9XmA4CV/0fVIBVVzUQY3hGn1oTZcVLO9HhTp/EJaZNPcCPY28OTyPwzc7+l1zTT+v33JGtQ2Sxhsz2fqeME1WVP3j6WFxcX8Tmu6xBBWbfSUyzdmDQVqvIcnl5ba1PuWeKGGgY3Uez4qoedEqSpIMlQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767135390; c=relaxed/simple;
	bh=Nv0KpP2XN+5h2LJNTfP///hIwNtcQhBLr/vQwgI2RSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gxbCP1nspO2k2Zr3tL02GIcgWnM4ESbbqwK7qDLnvjOI5pOiiG1ARifZ9OuVvhUdOwDByO4Gxw4QBVZNbyVDx7c/xStWvWVd+YYdHlpAkdDftEjIvWezoVEi3y2kHQqu+21Yd8Tc1LewikluNBPmGbXlquLzDjSzLWFeAHaHuqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RQZnSriH; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RQZnSriH"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b79ea617f55so1959530066b.3
        for <linux-staging@lists.linux.dev>; Tue, 30 Dec 2025 14:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767135387; x=1767740187; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kDIbiSFOwXrTpGtZXeahaPNt8jq7lieEYzMTkzUmpLc=;
        b=RQZnSriHA9dkJ0T0NIxkxzKXDL6qKKywEe0/wgUHPk5a3fCQx5r+UEIDGKi1g1ytG7
         ceHS0/wyXdqvHWdPp6jzseiUskO1oW0CPjbBDNtgYYSQCRVmKKPTaL9C0vNo89gddb50
         P5irIGmwLJY8l3hH7gdyBzV8LQh6m0fouiZymuRE97QQqiIUOTfoubZm4radpTiPXuDQ
         hBy3P84o64HpftJZpzy2UBk2jP5NStgIKjW3VsB1V2CfQGsPi9gW785hEci1H+8ZAZsk
         LO11RSpwbtUxx0IjENdCCgDr015i82svPq7RIWd2wowweyw0OsY8tS3i9Zt4gsY59zTg
         SHBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767135387; x=1767740187;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kDIbiSFOwXrTpGtZXeahaPNt8jq7lieEYzMTkzUmpLc=;
        b=vWnZCpydAcdJ2y0qJPBFc9Tai3TqWhvmWTrYbe389iNIGduFbihW2kHN52xMuIxQ1+
         lQc/PHR6hB+BNmwr0FCsTTnc513aBnrQJpRG2zDF4gU7RA3bSgSX26OxeyeBv2fbl3cC
         V+CP+KDn0WwavOvRjnktR1+VBiEEFARifNFsmHbzb6RThYwx65lED7ZS3314CoHKje3/
         2yLJkdUu3gQ3rIYqXJO1sbVU996iLimIOLHt3a3cRwWli9inwyqD4cmS51Hs1oVHOGP/
         tKF2D2PXOnYDHIQedTr2/j/ghVD14eiooKdSSe1o5LCqsvfW4af11Z2nRO3u9KhdZ19G
         c9cQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrs0gq+heV4Z0IRdMd1KhDqFEnQD9O830NvwtptkZJPjKTnicbjB37AXs8gcaqmYCpnNrn8iEBruDyvDYQ@lists.linux.dev
X-Gm-Message-State: AOJu0YyGv1yV/6F0Wm4/w2bkIM1MQCPATGBtWtyPInoy9XCDoeR5ES/7
	2CqQZb9YQTJhM2L6fWNLJ/ApSYCiGj73vdnCOz8KJa9RPMA0ddZ+6bEkQUo5NQnvQtjUbJcSO1Q
	8GhHatidfYw6bcIPdZhVV5Tol5cJ7VeY=
X-Gm-Gg: AY/fxX7ge5A/ZPlB+Hr+HWAK2lwolp195VoiASKeqcEqQ5Tmjs3Dj32+2F2MCV4IwNQ
	g3x1gyjVd69jmtldh8aeNDPBFn4bstZUKYY3pSUnP5rNyGYguEaMUN+CJk+PGui42GC27PdY0yD
	jvyhfzBheHawkVqI4M+KoHqAla0hHkgOfEH2FES8UqtDDc8VBhZOemil0UwqwiPF7dQAyv4m1i5
	DlVNxwnG5Qyb5aUGAWazTEcKbOzz93/BRrKqEG4GpCI0cGjQHVLFBz0TtMMWlWZM9h+Mro9X2Ky
	qdgCJklzgfXUDd8nDxMNuOXtost00/RzPFA5B4ne66CGquklCIvLhhuxe3R7gKDoj+BdgGvTEM4
	zJiH2k6E=
X-Google-Smtp-Source: AGHT+IEbMpfoSLDeshJ9t8GqOY5kwNiT0OnYtMQI0Fdnp+7OmSfR3GJ4eJV3P2PJp0sS7Ux6mE0W6B/gYBriqOxHCRo=
X-Received: by 2002:a17:907:a4b:b0:b7d:1cbb:5deb with SMTP id
 a640c23a62f3a-b8036f90f16mr4505285966b.27.1767135386311; Tue, 30 Dec 2025
 14:56:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251230203459.28935-1-tomasborquez13@gmail.com> <20251230203459.28935-6-tomasborquez13@gmail.com>
In-Reply-To: <20251230203459.28935-6-tomasborquez13@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 31 Dec 2025 00:55:50 +0200
X-Gm-Features: AQt7F2pkFW549AxW7l62eAZUeU7cH5ZkfebQCfE6utnpa0rzBmgZRmxWa36fFyQ
Message-ID: <CAHp75Vch9ud6fP=jg0tFx4WjHKYyfZjwaELBzfSubBVksQ7hSQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] staging: iio: ad9832: convert to iio channels and
 ext_info attrs
To: Tomas Borquez <tomasborquez13@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 30, 2025 at 10:35=E2=80=AFPM Tomas Borquez <tomasborquez13@gmai=
l.com> wrote:
>
> Convert ad9832 from sysfs attributes to standard channel interface
> using a single IIO_ALTCURRENT channel with ext_info attributes, as this
> device is a current source DAC with one output.

...

> -static int ad9832_write_frequency(struct ad9832_state *st,
> -                                 unsigned int addr, unsigned long fout)
> +static ssize_t ad9832_write_frequency(struct iio_dev *indio_dev,
> +                                     uintptr_t private,

Torvalds said that uintptr_t shouldn't be used in the Linux kernel,
the unsigned long suffice and enough. Why do we need it here?



> +static IIO_DEVICE_ATTR(out_altcurrent0_frequency_symbol, 0644,
> +                      ad9832_show, ad9832_store, AD9832_FREQ_SYM);
> +static IIO_DEVICE_ATTR(out_altcurrent0_phase_symbol, 0644,
> +                      ad9832_show, ad9832_store, AD9832_PHASE_SYM);
> +static IIO_DEVICE_ATTR(out_altcurrent0_enable, 0644,
> +                      ad9832_show, ad9832_store, AD9832_OUTPUT_EN);

Why not IIO_DEVICE_ATTR_RW()?

...

> +       &iio_dev_attr_out_altcurrent0_frequency_symbol.dev_attr.attr,
> +       &iio_dev_attr_out_altcurrent0_phase_symbol.dev_attr.attr,
> +       &iio_dev_attr_out_altcurrent0_enable.dev_attr.attr,
> +       &iio_dev_attr_out_altcurrent0_pincontrol_en.dev_attr.attr,
>         NULL,

At some point we may also drop the comma in the terminator entry.

--=20
With Best Regards,
Andy Shevchenko
