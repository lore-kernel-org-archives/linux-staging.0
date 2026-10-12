Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA845471253
	for <linux-staging@lists.linux.dev>; Mon, 12 Oct 2026 09:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791796919; cv=pass; b=aka0Ms24Hu882fsFJ1cAnFXMAaR3ZUssyW4Sws0bsioyiGt+7A06x2TnTLZFjH9uTyIq0k6wqfpc7tm8/P2hCQykC+Wyv/NrpfCON3mOFtX3ZKuiYmHLQtQbD0Z4alx7tzc1nkbnnig43CVh+ApzOn++jrUnCLAzMhgO9OIynbs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791796919; c=relaxed/simple;
	bh=HMgUswHA9/JW7E20urE69ecFRmmPCiIt6XwvKa2U4aU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hbvb4t1QZc3KWQhWfz4eMo6t5guaKnXdzAXwExhAuJNHHri/BbdNsnn1P29+QsCVhy6BnFhB14liZZPyFBRQsjH0yrdeewVkqIH7h3qsKZkuUMNZ3zYu1LS9T5quukNHr6IFdyEp3h/L6Bk7THaap6OKdU8dgCbDXFOr4k4cx+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JZCDh5Bd; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JZCDh5Bd"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b1aa2848d2so1470757a12.3
        for <linux-staging@lists.linux.dev>; Mon, 12 Oct 2026 02:21:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791796916; cv=none;
        d=google.com; s=arc-20260327;
        b=T4NFPNxG8T/HjbF3owh4ZRLkD5gabh43vrjYe8RUTS2yCEQgd09EyCBeyE9u2Z4t30
         eLLt9pfWfYJTfxRn5KYgMPtE4l01T8ww7wpzxiOm48trb0mexj8v7wpa6XZqwjC2p+fO
         TtV4pIl1RbVwqpVz7iE2fIsbgu/nwhz6zrzJwZYtXy3HPQyDujAosiFbUB/57DFf0NLZ
         dF5TeA0N2O8HhNn/LDezndZbsIdLltLSFgyMg8u9uPffkQaRn9q8TY4FBa1OAhU+leZq
         mejmuobW0ML8leG2F9CaaSfY5PNuYQmYrxfJMtMex7gNnR0SJw+0Y6C+pPLFgtNkMyD1
         e8XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d00/PGVzqnOO3exQ/y/1tCNwmAX0u9uxnCPXmaeqvTE=;
        fh=G5QTiK/eSTQUoZRSoxq5yGu0G7cKD5ENysOSvt3Q28U=;
        b=J+6YGRSSB6JaopvAwiCorC7sIHNEm0q7r0vKg0bvYMsB7rSYtUfHRhD8WFKa0tm47w
         v//a9UHb1d+wodUm+EMenEKiYKRtYCC3NSbRp6AiTTg4Miob1B9Ya6R9e1WZXSeuIX3r
         YtwjY+mhrZIOpjFSA/A0Eu/nv/Jlxl/iTHj/FtVJhWTVASHQskyr8hS+39DawkzoEc8l
         kJtoX96Y9BdjpOU6nJ099tYAv7c40wbhGVrJzdKp5fA1P8eGfuW8VnM3RJTMqV/9x5c2
         vBx5NXpFwtAJzs7QYr3hTz0jaEFt+OKrZlukW5XdiY4q8deIzAnactGHWt4ekhU9C80s
         d0og==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791796916; x=1792401716; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d00/PGVzqnOO3exQ/y/1tCNwmAX0u9uxnCPXmaeqvTE=;
        b=JZCDh5BdmcwqO/gIOyu8HB+RulFcTIUQ7UYRJ65dGDGAh1oMNSW54V1KbznKLKg7aa
         ZU2JYnuSMmzt2xKgWhqzyaAIvZreLSSfavGy7hASaVkDn4dhz63iqXuiA2uIhARC1O8w
         FOFMAetHIur58t3MApN1ycQIFqcpljRRsIcE284BLlT4TBUpPSGpShS8brqgQY6R+DFX
         RGVjv+/cnMC+Jurgi1JvPc3D4+CN6mXIVgFO9C5ew1xPcz2VWgglWt1IxY3TQroz7gzK
         67SmOpFhjr441bsT/q6dBWmtvwVHf+sNIRwVwYR3Xwv5Q61ESMzWPEf66kL43RFwavNd
         PpPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791796916; x=1792401716;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d00/PGVzqnOO3exQ/y/1tCNwmAX0u9uxnCPXmaeqvTE=;
        b=wh5ni0HLze9rzI4NM9pf6Zlq4ZhzWw4OBntkGDSayctofP8/eh2oTYBsDgKSii9yXJ
         +7iF8EEmPdRw5VWxgYuJovUYHPTEe5qspgYFpuM1E6+h2vnyBzkVV1F3j4ytiwvA7W9K
         P3Cxy+9cUND1Q7l5PowXaaWMZTGcm630Z+grRL9/7llTYcGqTzC4Unkt9EE1Fc0aRrim
         0lk3HrSBaC8kYT74wcmAxmH8lVQ9TfgrI3zP8M805o6QvAgQwu+8Oboe7HpkViWmWn4N
         YcR032R3LwEiRc4LeM2OR6EjlFzUisHWe3AsGWYl8eitEC8HRCD/8uMy9qGWZilpgEgo
         uPyA==
X-Forwarded-Encrypted: i=1; AKwUvBzMeJDGvAsVoyPDsa/IvcI9MoiOGgq6BEIiXbqzTuK/erCNeAJTIEz66KbnHM0SUGgWPkgwHFDn6Q36a6YE@lists.linux.dev
X-Gm-Message-State: AFq9FYLe4I3sf+roM35cYRyRSpWaxjHy4ZgD4ggI1/kb08RSkuoNT0qY
	HPPu0+cE+ywDbAlm0RcQEJDcHH6n8RpOcFix0pqvF1r99bUqZQS/1yQ1ps28KELc4ulP0vgtCzc
	xeYVVMDNpzhAGhMIXY4dONve+rHsUMYc=
X-Gm-Gg: AYBFou0MEtqZI+iQb3FRtx8vX168uDjOV5ArHEu0CRbonixR56B2IRD1qR7CyJ+Ook1
	eYeAQQSQBXOhV1wtR+YFh9JAk7Qqs5PlsNBfO6l8uz2FR19mQITdiWH6LWqAe7PHWblvVQMRLaL
	aVNnLomv1zbu1hN4AMcdLbSJw0akWGtQc5TNOQ9qOG0VtMScKDeTzlWAduwZVSScuEFoYy8PYl6
	azWEFSwFvQiT+iNo6X8CZH/hK7PLQLD3S75MaKig68Qd6b7iTqcjyNUkGLtlA+OcOTE+xXwmmNA
	f4eEu3YeBpGNIWpH5F5dEyOOFd1fmFvTFtswTgBV2FB6DryXDTwqy3SKFT6VeSfNxqzzGGW2YbQ
	4YRygpCOaV7FLxE1os6DYPdjHkTI5eCav/FZWhLrM0ysOoe2dECXBpGIjppHjKeu/VXbGVciVHd
	2ky8PWgtkGhLFIZjieShnXLPNW0sGgg8VDRmkYHf0v
X-Received: by 2002:a17:907:3d09:b0:c31:8cfe:9a25 with SMTP id
 a640c23a62f3a-c31a9fd33dcmr927229366b.9.1791796915831; Mon, 12 Oct 2026
 02:21:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261012044724.160902-1-mhun512@gmail.com>
In-Reply-To: <20261012044724.160902-1-mhun512@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 12:21:17 +0300
X-Gm-Features: AclHuK8b6tUYO5p5GU84erIeD1vnrAS30oFKa_UyF3wbpOcD8fRDiFjk41OAN6Q
Message-ID: <CAHp75VcEZ0RiCYKde7aiw7tK=J1LEfSeA=91GOHdPK6479V=mA@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: drain assert recovery before tearing down resources
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 7:47=E2=80=AFAM Myeonghun Pak <mhun512@gmail.com> w=
rote:
>
> The threaded IRQ queues assert_recovery_work, which can stop, reset and
> restart CSS. Removal currently tears down CSS and the CPU latency QoS
> request while recovery can still be running.
>
> Disable and drain recovery before atomisp_pm_uninit(), keeping the IRQ
> available until recovery finishes. Then release the IRQ before CSS and
> firmware teardown. Apply the same ordering on probe failure, and skip
> the uninitialized recovery work in PM-only mode.
>
> This issue was found by static analysis.

Nice, have you read the code that you sent?

...

>  error_unload_firmware:
> +       disable_work_sync(&isp->assert_recovery_work);
>         atomisp_pm_uninit(isp);
> +       devm_free_irq(&pdev->dev, pdev->irq, isp);

^^^

>         ia_css_unload_firmware();
> +       goto error_unregister_entities;
>  error_free_irq:
> +       disable_work_sync(&isp->assert_recovery_work);
>         devm_free_irq(&pdev->dev, pdev->irq, isp);

^^^

>  error_unregister_entities:
>         hmm_cleanup();

--=20
With Best Regards,
Andy Shevchenko
