Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D63477F12
	for <linux-staging@lists.linux.dev>; Fri, 16 Feb 2024 11:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708084403; cv=none; b=D44TfNnVYa86xPPSLj/wk5X1LcX0oSA17cnWyAZVarRBMBVDYdCnGm7rPAT+AjM4Vi2Yj6ajCw9RdwWSprAl2jKc6DjR6YeXzOxrriaiYpa5vqqNhty0qYLRnR1fxRBp/5zfJymNOmTAb60NLPuO1+O9ZdyVTIGLkWWQDjYFkpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708084403; c=relaxed/simple;
	bh=rprh8FmcfW3UGidBPWanTNOuKUyGfL0148rKwu9AYlI=;
	h=Content-Type:Mime-Version:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=cBx0t46h05Aa8aab1kKZXWk7RWKFFRDb6bkeF8OphVhHb+1yc6aKjclFB+jyHj86vkY+OmvageWhVG77CyfGw6ObGMiJM705JZzmUXZyrlwsjNC+bLcZUAv7FlUkp+l7wtMnlqQOCCgaM/hj0rHWWwN9oLD8IvHzUTzLi26gc1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mTCFZkwm; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mTCFZkwm"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a2f22bfb4e6so248641566b.0
        for <linux-staging@lists.linux.dev>; Fri, 16 Feb 2024 03:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708084399; x=1708689199; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FONUejouVKRdUMu9T/GH3sU6Bm1U62wIrGpiqv/zAl8=;
        b=mTCFZkwmyLeltwJDJJfSGLo3FYgNtVXUnBnkSlxCgdQVrTekSc4KTaV0Rxbc8/FygK
         rPA61eJyaDbtASjRBmYQ0y44Qf2kB70XwlPIKz076aDqFP2F/f6dfiNia1BL1U2rANxf
         8lP9K9LzgGXASfb+0W/i9mMCOEDHwbjDMldoKsFH13KQkNsuqxDAJd6WZ/uxfDKN+RfQ
         UzozdhKTzv73e3iAwMUQiUdYiUIp+qNQtnuL9+FTzeuvlvakPyeTVIJR4gmOuogx2gZO
         gXVwfbtwVTBDlifZJPKcqzF0nqBnPXdn2t4Sm5rJiHwj60zox2kxy+IGAB8xXZBP4Zje
         GIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708084399; x=1708689199;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FONUejouVKRdUMu9T/GH3sU6Bm1U62wIrGpiqv/zAl8=;
        b=OxAGDwGeSG3jpYUNg8uVN7GzGdwPtoK8mPEiJSrnh69LEfNw4AcXdbIAgtRw9dK16E
         yD7B3Oq40OUnabdt7AYuP0nbbNIKfIpNGWahdCqgQ/p0vrTBF8ryRkHPUKEycVVtFmnz
         hMYgwpi0ZQXad4KoTYW/GKh+4XF86wcozsoKqNRmgkOtltQzdyLHC1qDk6xCy6UN9Xac
         t5LYDY8iYDTW3fs9Gqcs9ri8ngcxAq5LfSknZViVyrvjBagCK1LwpFTRwUi72xsruB5f
         i7bWSRXLsfanNKZiXxG0p4AOs8wuK0l03Q28ahDiSSDIIY2p7dl6gWy810j/imBE6LhH
         g5qA==
X-Forwarded-Encrypted: i=1; AJvYcCWxjkVNfVTC8LNuIWfzj3KdJc0VQqisKteY3cQ3TkGCoXh9dPMO44+RM5LiPvvOYVhqZGViTcVEnKKwmRRn6r9PW42+tbI3i4boUiMH+A==
X-Gm-Message-State: AOJu0YwsCNFPHPutP5B/p1ts8KK+nd+h9CiYd6XiM2lLa+00bvF1g8UE
	1APOSe5ZYclJQaHs4LkVt+eimqA33PCLgHNiZIHD8rqHtoph1d2f
X-Google-Smtp-Source: AGHT+IETKBqVDm9ABkmTptZnMQ26UxMCndCjuDTSarB5s9mLn3o//7N3rMAR3bUK8JqRgEzNJtXBDw==
X-Received: by 2002:a17:906:4a17:b0:a38:107a:94f6 with SMTP id w23-20020a1709064a1700b00a38107a94f6mr3046427eju.71.1708084399406;
        Fri, 16 Feb 2024 03:53:19 -0800 (PST)
Received: from localhost (p200300e41f147f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f14:7f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id sn24-20020a170906629800b00a3d296f46besm1471739ejc.120.2024.02.16.03.53.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 03:53:19 -0800 (PST)
Content-Type: multipart/signed;
 boundary=9dee9a19cb63a77cc8f9975bef85216d69227f6fdf7a09b5460baac60383;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Date: Fri, 16 Feb 2024 12:53:18 +0100
Message-Id: <CZ6HDVZIGHOE.2SGOQNXEGENY3@gmail.com>
Cc: <marvin24@gmx.de>, <ac100@lists.launchpad.net>,
 <linux-tegra@vger.kernel.org>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Staging: nvec: nvec: fixed two usleep_range is
 preferred over udelay warnings
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Nam Cao" <namcao@linutronix.de>, "Moritz C. Weber"
 <mo.c.weber@gmail.com>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240212133645.1836-1-mo.c.weber@gmail.com>
 <20240212152110.4f8fe0e6@namcao>
In-Reply-To: <20240212152110.4f8fe0e6@namcao>

--9dee9a19cb63a77cc8f9975bef85216d69227f6fdf7a09b5460baac60383
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Feb 12, 2024 at 3:21 PM CET, Nam Cao wrote:
> On 12/Feb/2024 Moritz C. Weber wrote:
> > Fixed a code style issue raised by checkpatch.
> > ---
> >  drivers/staging/nvec/nvec.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> > index 2823cacde..18c5471d5 100644
> > --- a/drivers/staging/nvec/nvec.c
> > +++ b/drivers/staging/nvec/nvec.c
> > @@ -627,7 +627,7 @@ static irqreturn_t nvec_interrupt(int irq, void *de=
v)
> >  		break;
> >  	case 2:		/* first byte after command */
> >  		if (status =3D=3D (I2C_SL_IRQ | RNW | RCVD)) {
> > -			udelay(33);
> > +			usleep_range(32, 33);
> >  			if (nvec->rx->data[0] !=3D 0x01) {
> >  				dev_err(nvec->dev,
> >  					"Read without prior read command\n");
> > @@ -714,7 +714,7 @@ static irqreturn_t nvec_interrupt(int irq, void *de=
v)
> >  	 * We experience less incomplete messages with this delay than withou=
t
> >  	 * it, but we don't know why. Help is appreciated.
> >  	 */
> > -	udelay(100);
> > +	usleep_range(99, 100);
> > =20
> >  	return IRQ_HANDLED;
> >  }
>
> I have zero knowledge about this driver, but nvec_interrupt() seems to be
> a hard interrupt handler, and sleeping in an interrupt handler is a big n=
o
> no. So I think this change breaks the driver.
>
> Delaying like the driver is currently doing doesn't break things, but it =
is
> not very nice because this is interrupt handler and the processor cannot
> switch to other tasks, so delaying is wasting processor's cycles here. Th=
e
> better fix would be to figure out how to remove the delay entirely, or
> switch to threaded interrupt handler and then we can use usleep_range() i=
n
> there, but you need actual hardware to test such changes.

Also, pay attention to what else is being said in the timers-howto.rst
documentation. It specifically mentions that usleep_range() uses a range
in order to give the scheduler some leeway in coalescing with other
wakeups, so choosing a range of 32-33 us or 99-100 us isn't very useful.

Thierry

--9dee9a19cb63a77cc8f9975bef85216d69227f6fdf7a09b5460baac60383
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmXPTK4ACgkQ3SOs138+
s6HDBg/+P8CNOrCzq0UAXAn0mSLmDzBCDoTF2tNRfscugg1X/aUy1k62/Wrl3o8w
g/kk1Co+PKjv/pikrkRxGq6Hw1mB0uCNeLF9WOeJ8ijLlLmuAB/AUsC4JV9vjPyz
Wq88rVERC2yTV+Fltl7rCPBAGRusyiQsvin/ifMLdLnAvi5Oo0XXARCMzwTAT9e6
a511+LMNYQhKShvpBLxY+nK2QhkxqdO8RoPYUq28PxRUkgSp2ubV3WQmXRLoQzub
eJjdhHcCdphcToYj5qwoXYjXL70HdqJv4Ofm7dewaIXiNmPgcmBuqSfYmQQasPw8
0CbI2oe0BLNvpCv152JyHm132Vm4oT8w3Wdbbsgxh+TEufI95pNH0dJZ99/y+m7R
CRETAQWZMJZJMq0if6EttBWO36JrRNg0HbuBJNbvnxWb9zdV0UhEpB1b4Sm/bseG
xec05cKaqzbzc+D5+Wl34k0dOrhgMJKuvTsguorqaIH/kuamMWYLCCl+qhfxBwlZ
dOMGB83vevWj3F6C5TKyVk1Cu7VNzK51ydR7hukp780RvXm+DG6aUCtTAkBAQupc
e6HInnb8n/Dou8TNA+BLFQ2FRWeio9zeA7pVii0pZS0bFPIFRBoAbYdOv+2Bmcef
+MxAelYKEZlY6KLJR/6sX2QV4kqt6VzcBtuRlIu5QSyCuAS0aAY=
=ZEj0
-----END PGP SIGNATURE-----

--9dee9a19cb63a77cc8f9975bef85216d69227f6fdf7a09b5460baac60383--
