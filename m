Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145C54C74;
	Thu, 25 Aug 2022 21:13:55 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id v7-20020a1cac07000000b003a6062a4f81so3382295wme.1;
        Thu, 25 Aug 2022 14:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=S+BxiqaH71h1xd9DneoBgjt53lZC5EPrruUqpKoLEFI=;
        b=CWB5jvf4hyAFyEInzBIoB1UYsnMzqSc5qpaWyatPOnBcyRIwN7C6gITXKQaqkX9J0P
         Ms8TXsLhgYSS1B/XDqLowYkoSxCz3a4aMAN+hVtXqCo4OFrf+8FxuB/eOXPDf3pNuPkJ
         ggzlRRNRkPgbpJca1KNH5fhHn7hN1Vrchog2xBbMLu+I5lhVZ5FwR8Nt81qtudalm8yR
         PO8/RkQoycF/S7lD0gtzquazXYUjBt9YCXk3J8CZUwwp6I+fbvTYq3PglDSOMJul9HEX
         Am7sJ15mMh7+s9QdjqWaqTvf5QXs2+jFuJp9pkS86oUtCW4GQKk1bidmXoaOxxiM1uBJ
         G1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=S+BxiqaH71h1xd9DneoBgjt53lZC5EPrruUqpKoLEFI=;
        b=vTvVfFX8Tm0QQkJ1/1Lppw6eludPAd+PP1wN733hHYK1S6dhAWCDoPELFM31jXd3MY
         xwm0xAn9FoEA6vrmjK8JxicE6cG8BgFpoQLafwU0X1hDYsamI73cSLcIIsPhPz+nzApl
         7tSIU1ne35BpoRrkgPKIru5LyH1GkdD9T9KhCZD0y5oeviybPJJlCJfn3bdlbY9eCm3r
         dng8sTKGIdlrDh8Ue9CT0NqMnIEaQtOB8XNgKY8nqHOwP6545/ZjRccoK49zppeA0D0p
         WDcE8u+ox6c1vZYkoxP1h8npbl77cHGexISdqCcZlyE7xjLzsOKhWgJlPFbVhpLzFnbZ
         RJ8g==
X-Gm-Message-State: ACgBeo3q5a3jV5xu5zynFl8wGu31KLl4dZjjavbjyh+Jnj6VAI53cFnd
	KeLPGzOdIDf/lBKPZmtpndI=
X-Google-Smtp-Source: AA6agR5cvtHSh1wL8y8rJWyvMV+038GQaqm1p4qSqHQF03FXsJe0+iHrax3q8syxMHof0yKeRInZPg==
X-Received: by 2002:a05:600c:190b:b0:3a5:f8a3:7a8c with SMTP id j11-20020a05600c190b00b003a5f8a37a8cmr3201245wmq.54.1661462034344;
        Thu, 25 Aug 2022 14:13:54 -0700 (PDT)
Received: from kista.localnet (82-149-1-172.dynamic.telemach.net. [82.149.1.172])
        by smtp.gmail.com with ESMTPSA id v64-20020a1cac43000000b003a5fcae64d4sm372013wme.29.2022.08.25.14.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 14:13:53 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-media@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: kernel@collabora.com, Dmitry Osipenko <dmitry.osipenko@collabora.com>, stable@vger.kernel.org, linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH v1 3/3] media: cedrus: Fix endless loop in cedrus_h265_skip_bits()
Date: Thu, 25 Aug 2022 23:13:52 +0200
Message-ID: <1733932.VLH7GnMWUR@kista>
In-Reply-To: <52bb86cf12450ce78d2f196a1b86b4137ec61a07.camel@collabora.com>
References: <20220818203308.439043-1-nicolas.dufresne@collabora.com> <5849126.lOV4Wx5bFT@jernej-laptop> <52bb86cf12450ce78d2f196a1b86b4137ec61a07.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne petek, 19. avgust 2022 ob 17:39:25 CEST je Nicolas Dufresne napisal(a):
> Le vendredi 19 ao=C3=BBt 2022 =C3=A0 06:16 +0200, Jernej =C5=A0krabec a =
=C3=A9crit :
> > Dne =C4=8Detrtek, 18. avgust 2022 ob 22:33:08 CEST je Nicolas Dufresne=
=20
napisal(a):
> > > From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> > >=20
> > > The busy status bit may never de-assert if number of programmed skip
> > > bits is incorrect, resulting in a kernel hang because the bit is poll=
ed
> > > endlessly in the code. Fix it by adding timeout for the bit-polling.
> > > This problem is reproducible by setting the data_bit_offset field of
> > > the HEVC slice params to a wrong value by userspace.
> > >=20
> > > Cc: stable@vger.kernel.org
> > > Reported-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > > Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> > > Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> >=20
> > Fixes tag would be nice.
> >=20
> > > ---
> > >=20
> > >  drivers/staging/media/sunxi/cedrus/cedrus_h265.c | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> > > b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c index
> > > f703c585d91c5..f0bc118021b0a 100644
> > > --- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> > > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> > > @@ -227,6 +227,7 @@ static void cedrus_h265_pred_weight_write(struct
> > > cedrus_dev *dev, static void cedrus_h265_skip_bits(struct cedrus_dev
> > > *dev,
> > > int num) {
> > >=20
> > >  	int count =3D 0;
> > >=20
> > > +	u32 reg;
> > >=20
> > >  	while (count < num) {
> > >  =09
> > >  		int tmp =3D min(num - count, 32);
> > >=20
> > > @@ -234,8 +235,9 @@ static void cedrus_h265_skip_bits(struct cedrus_d=
ev
> > > *dev, int num) cedrus_write(dev, VE_DEC_H265_TRIGGER,
> > >=20
> > >  			     VE_DEC_H265_TRIGGER_FLUSH_BITS |
> > >  			     VE_DEC_H265_TRIGGER_TYPE_N_BITS(tmp));
> > >=20
> > > -		while (cedrus_read(dev, VE_DEC_H265_STATUS) &
> > > VE_DEC_H265_STATUS_VLD_BUSY) -			udelay(1);
> > > +
> > > +		if (cedrus_wait_for(dev, VE_DEC_H265_STATUS,
> > > VE_DEC_H265_STATUS_VLD_BUSY)) +
> >=20
> > dev_err_ratelimited(dev->dev, "timed out
> >=20
> > > waiting to skip bits\n");
> >=20
> > Reporting issue is nice, but better would be to propagate error, since
> > there is no way to properly decode this slice if above code block fails.
> This mimic what was already there, mind if we do that later ? The
> propagation is doing to be a lot more intrusive.

Since backporting fixes before 6.0 isn't priority, viability for backpporti=
ng=20
isn't that important. You would only need to return 0 or -ETIMEDOUT and che=
ck=20
for error in only one location. That doesn't sound  very intrusive for me.

Best regards,
Jernej

>=20
> > Best regards,
> > Jernej
> >=20
> > >  		count +=3D tmp;
> > >  =09
> > >  	}


