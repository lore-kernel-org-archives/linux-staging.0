Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CBD3019D6
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 07:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775113789; cv=pass; b=bIX5ZNgvTMiAtZZm2SEw/E7UmzXrOg7il3FXWmjvIm+niZarBtPTp2pMX3erItBVQc2McQMOEFoAMUYMsJZG/y0vXvRsARe1K+ME4hnJtUIUEzrayDbzQfpzbAJufYeB7GjxpltRgRCb4oxMESdkefUdhI/XXWl7s0ZNtVWXLHg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775113789; c=relaxed/simple;
	bh=J43KEG1NohSKLeB3nKWYueVylNt7djx6O9alyEbMwpo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dWWUxJ++O6WzG7Tqt9mDPT2Y5FP/RQOhEP7FJxB1L4KZW/uPZhhSTNeQsX2Z0w7Ea2z1WDl6fhdEEsJH2Cazrha3E8YvuDsttcr+QKoLZH0WTlouoga6sj+wGMZ+Cq0Sjk6sfbpGrlxTTWa0/KsIt2LbYMicZYtWteD8wVEwatQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Igj+lOws; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Igj+lOws"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-66bf15430ecso1031825a12.3
        for <linux-staging@lists.linux.dev>; Thu, 02 Apr 2026 00:09:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775113785; cv=none;
        d=google.com; s=arc-20240605;
        b=OhFc8oR1K4EdL9rij5RdKskWVZiFKhnvJ6iAlssw4xbn0DzPUPR2eYjwYo4ocT7zpi
         qu5JGnsb9JY6716wxdxK6dUiFZEgTcp8Kh2IXT0SB6gFcase+67QF5DqRK47BJjrZYMh
         Jz1T2xh0PoaQUIQ0mSPzGCos9seZGgdV6dwc94MWBXYxYMTM0SijZkUfgXT4kQVnKSBY
         82eatE0L9QfW/31EsHNmKfRA8skDQTHisggEI5JU18bS7syiW6pMRNVIIObth4uAQDJk
         UEC1ELr22G1EbNhFhj2M7P4nbLUV/KNiD4CLOZfqW5kQGXQNSIItqYlnR/laOmqNiDHM
         e2CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z7cv7nvg22/KMSI6+V1bJybQD379iGRASjiHwY9Rbk8=;
        fh=zl0YkUfH3rgGWqkBF1G9jwdhEQkc3/TsRLkjNNC81DM=;
        b=ZkF4NaWKkddnOLwEaBerJIuoN79W4T47NZbvkb9RCqkq3DYwpdHC3Q7576bgo1tUce
         gGOMwoMe5kpbu4RUgt/iMQpY2S229hgrhKC5r8t9yONZwWAHlBma+dalercGVl/IsjVo
         TqD1zpMZuM7gZfEj1WjiaIQavaKziO/+VjFX95zAtI74upvuzowLaNqd5S0oFA9d/iar
         LRvM91Dn3rjeYKpoWUiqXVZZ9nhSUkqXhYcfZcRYkpSbiPO+OVw8rDQ2RYzEtGZ8E+QP
         AwkojjZZ29cPhP/r/vZ7mmiuWECTm47vA9Nf+8g7xXXC7aBVwIFxLFLTAAHObQcU5G9k
         uYng==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775113785; x=1775718585; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z7cv7nvg22/KMSI6+V1bJybQD379iGRASjiHwY9Rbk8=;
        b=Igj+lOwsTbxhWyuvdiXsVKMbIbDnXVBzGGs2NT36vjfuNn4hUk6yaSmNJ+uBWLO+Zz
         Ub4vQS/lW2hx1JKge/cl0r0g4/z/5uNQNOz9XMeiIN6EFm6AO3q0BtnbtLnGjE20abzg
         iTb4AGfzd3LpJHBZ+/YRPjdeNo67hWjxHcd/JxtfUkr8jaDKUgLXJFyTFz95fX0CHJST
         NeYfhaGbYEk2HRAMYqbZ1pGp7ASxvKjme9+MFq4XGSlHP+poPTZn3HoPWb42FKzDclHG
         yXsL3g9Ei1UVYYNA5M8PnGIqhcGCHRBB3AaRGGwiUR+vQfUKEUwGaG7tg41beTn1652C
         93OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775113785; x=1775718585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z7cv7nvg22/KMSI6+V1bJybQD379iGRASjiHwY9Rbk8=;
        b=bRtsiYj0xyEeQ1UKJKmdU1bqbe0DLFC7utY7wsFi+K9FWUalJ2X89Bsdi8OvyU6vcD
         WlwGVk9vUa6piFX4M/GBxntDHRNvNc6qOByBhIx3d5V9zgAGqS/s8wI2G56lFGMP5W7Q
         o5DeKqCTiP+j766ovurHKeBSKhkR0ND2WJ66fF2TrdtE18mQ84soA/KD5tm5ieAmrbzT
         dyRc2FfbR8zxNoSDPX3fTo7MivoM9N8Y6XbTKDSaai8sPUS+DwazHZn4B/r8ZTMq8Dnx
         QjhFmrvt9+T6Ou+sj49CiPHON78bzdmMXXBdY9Kj3Ch72zQy21kaCVAv/eBbEfCSQeW9
         XqrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDEJFNIoptAJiOw9cBJ/vKi8HbmYDt7ICRSEmuBBjLaunDCmt8TUWYkPDS53g5uWbk+P2OD5+3n2wUIbg2@lists.linux.dev
X-Gm-Message-State: AOJu0YydLZXNHqwPmIcvLvdl4yKRFkjYea7R/EBDq/jncfPplSaj2hpg
	AhmUt9BJTMtt497XApMQRD30pzh3QKFgjXuRvJG0x4MOMmTWP0nD6Y+a0bkuO9JkdginEgtn1JG
	CghgrwLtcNlaGZg53IV7B3m6MewnvcUQ=
X-Gm-Gg: ATEYQzxYitsUbYp3xSXFCyeTEuLHz7wQWsIp42JOgDuDUgoFj0Tdzf+miIliPCdv/KO
	LwjLkVk+AaCkMK1W7gHr3lQ9PvQ5GgOMsTeYmJCfp4tYLuM9f4+aFMC3kMOhfDWZQj5uLifb6Io
	V7614EPD9BgcCi7Hwz+CpOMmABiYtqP+YnSmfTakBodBfUdVSefDzyqmP5hCg/k1vLomEC5H1I1
	PuQbU5oTXqHXzValO8eKKbsBioNJKSTzMYayh/hSOvs3Olhu4+O9KKVyjDaMXIeo1pDhVx7nClj
	T2K+c1pJWTCAGvXxqXOKoQRO8sl6r5ejwi3v+pMiApzbk4aQkitniX1ql9Sad4QR0OagJBOETyH
	grLjjkWQ=
X-Received: by 2002:a17:907:a781:b0:b9c:36a1:d32a with SMTP id
 a640c23a62f3a-b9c36a1d469mr204745166b.48.1775113784789; Thu, 02 Apr 2026
 00:09:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260401163050.34830-1-yqc5929@psu.edu>
In-Reply-To: <20260401163050.34830-1-yqc5929@psu.edu>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 2 Apr 2026 10:09:06 +0300
X-Gm-Features: AQROBzB55BFCbxyn0Ua4nIl5tuRztRZFAGFWy3DrS3XZWoA89MeeRl6K3__ldvM
Message-ID: <CAHp75Vd7cygN7XcpMgNB0Usv844rDpzFJQ5mC+H-spdCUyeJBg@mail.gmail.com>
Subject: Re: [PATCH v3] media: atomisp: gc2235: fix UAF and memory leak
To: Yuho Choi <dbgh9129@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Kees Cook <kees@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Thomas Andreatta <thomas.andreatta2000@gmail.com>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Yuho Choi <yqc5929@psu.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 7:30=E2=80=AFPM Yuho Choi <dbgh9129@gmail.com> wrote=
:
>
> gc2235_probe() handles its error paths incorrectly.
>
> If media_entity_pads_init() fails, gc2235_remove() is called, which
> tears down the subdev and frees dev, but then still falls through to
> atomisp_register_i2c_module(). This results in use-after-free.
>
> If atomisp_register_i2c_module() fails, the media entity and control
> handler are left initialized and dev is leaked.
>
> gc2235_remove() is the full teardown path for a successfully probed
> device; it unconditionally assumes a fully-initialized device.
> gc2235_probe() must unwind only the resources that were actually
> initialized at the point of failure.
>
> Handle each failure path with explicit unwind labels that free only
> what has been initialized. Return success only after the full probe
> sequence completes.

> Fixes: ad85094b293e ("media: atomisp: gc2235: Remove driver")

How does this fix the commit that states it removed the driver?
Actually the description is wrong. How on earth did you get above? My
simple Git command shows this:
ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")

And even though it's wrong to have as Fixes tag. The driver was way
before that commit in the tree.

> Fixes: e838b8c69e45 ("media: atomisp: Drop intel_v4l2_subdev_type")

> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> @@ -818,18 +818,16 @@ static int gc2235_probe(struct i2c_client *client)
>         ret =3D
>             v4l2_ctrl_handler_init(&dev->ctrl_handler,
>                                    ARRAY_SIZE(gc2235_controls));
> -       if (ret) {
> -               gc2235_remove(client);
> -               return ret;
> -       }
> +       if (ret)
> +        goto out_free;
>
>         for (i =3D 0; i < ARRAY_SIZE(gc2235_controls); i++)
>                 v4l2_ctrl_new_custom(&dev->ctrl_handler, &gc2235_controls=
[i],
>                                      NULL);
>
>         if (dev->ctrl_handler.error) {
> -               gc2235_remove(client);
> -               return dev->ctrl_handler.error;
> +        ret =3D dev->ctrl_handler.error;
> +        goto err_free_ctrl;
>         }
>
>         /* Use same lock for controls as for everything else. */
> @@ -837,13 +835,24 @@ static int gc2235_probe(struct i2c_client *client)
>         dev->sd.ctrl_handler =3D &dev->ctrl_handler;
>
>         ret =3D media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);
> -       if (ret)
> -               gc2235_remove(client);
> +       if (ret) {
> +               dev_err(&client->dev, "media_entity_pads_init failed\n");
> +               goto err_free_ctrl;
> +       }
>
> -       return atomisp_register_i2c_module(&dev->sd, gcpdev);
> +       ret =3D atomisp_register_i2c_module(&dev->sd, gcpdev);
> +       if (ret) {
> +               dev_err(&client->dev, "atomisp_register_i2c_module failed=
\n");
> +               goto err_entity_cleanup;
> +       }
> +
> +       return 0;
>
> +err_entity_cleanup:
> +       media_entity_cleanup(&dev->sd.entity);
> +err_free_ctrl:
> +       v4l2_ctrl_handler_free(&dev->ctrl_handler);
>  out_free:
> -       v4l2_device_unregister_subdev(&dev->sd);
>         kfree(dev);
>
>         return ret;
> --
> 2.50.1 (Apple Git-155)
>


--=20
With Best Regards,
Andy Shevchenko
