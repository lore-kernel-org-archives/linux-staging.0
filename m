Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAE070
	for <linux-staging@lists.linux.dev>; Fri,  6 Aug 2021 15:39:50 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id i6so13637990edu.1
        for <linux-staging@lists.linux.dev>; Fri, 06 Aug 2021 08:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eTk4yr0eN3hm7lLtT7TJ+GcZ/BI3UsKqBaJTxX9s20I=;
        b=pe/zubRk3mozz1yIUrLLk1qW9TXvaqf1wg8raPZZYwlgaDMsBtQ5EDWfwopd9beKl4
         USnByrcmC0Cw74780PIXSlzgIoQkiso5bHCfa/BdkLff7QVTcYcsZe3no4MRwTd3aipr
         7Y+h8H2Ni2e6qkmhORuMQUvJCW8VZW2dfwrXQZeCrW9IwUlX4HvWMdfxBkmTHkOV54A/
         Lb0VsTz+XP6P/gNmMQsaGMlQQ4B32Rf2qlFeryKtYndgmXoej2XSU0XWlQBbiQsHi9j/
         kDoCZYS/MMIepYDppzIGPTiUFkj8816MtmjKrXnw+3bkVqM2BaOg8BXDzH9n3O9o3dx5
         Txgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eTk4yr0eN3hm7lLtT7TJ+GcZ/BI3UsKqBaJTxX9s20I=;
        b=U8qQxQiNdpu3DYY2od5LSaFtU3rTpiItjyVY8kqd3U8E5OvEudFpzTGZyOwGQv4HcI
         ldL5LzTuuGu+TMvpmKKyJTScDvS3vE0CHZyA6kM28djmHVTIY27UB1qH8ipeRDNA8ssi
         /+LhgXB9AMzOa3tAWqIpEp1+WGd3GtY+ehCtu0uEPWMOGxAUYOsH2JNkfOv2WdR3P0Rk
         hoCpAoidM08MiYt4jXR7TrcAiOPh99gm1Rfif9aTl53IQvrHnQg1N9fTl3m80hTMqRY6
         XCjKe6a4dSLQ9qRUYjBcVMh0DikHKe9k6BhOe3dYVsrKctQPXE424zZTpPlcRvb2jJf0
         EsLg==
X-Gm-Message-State: AOAM533CKcMuDat3jhDkf37bWFz2rLYdm6tXIe4Iyj3yl/6fMqYkXjIO
	fGqPIVcw/NbNcjHEXfveZNU=
X-Google-Smtp-Source: ABdhPJwf+uCRRQJXeuBWe+3Hl730847C6jJePnZrXtrwCgIpfunEruQsEVRxOsUqaRz/YFxnW+J1LA==
X-Received: by 2002:a05:6402:1ad9:: with SMTP id ba25mr13595781edb.255.1628264389312;
        Fri, 06 Aug 2021 08:39:49 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-178-211.dynamic.t-2.net. [89.212.178.211])
        by smtp.gmail.com with ESMTPSA id bm1sm2997309ejb.38.2021.08.06.08.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Aug 2021 08:39:48 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: p.zabel@pengutronix.de, Ezequiel Garcia <ezequiel@collabora.com>
Cc: mchehab@kernel.org, gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl, emil.velikov@collabora.com, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: hantro: Fix check for single irq
Date: Fri, 06 Aug 2021 17:39:47 +0200
Message-ID: <1909651.VgzLf9ffF6@jernej-laptop>
In-Reply-To: <79673df0562db410753c90f9957125f202c5a1b2.camel@collabora.com>
References: <20210805190416.332563-1-jernej.skrabec@gmail.com> <8101406.vZ8PxZ7URt@jernej-laptop> <79673df0562db410753c90f9957125f202c5a1b2.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne petek, 06. avgust 2021 ob 16:13:46 CEST je Ezequiel Garcia napisal(a):
> On Fri, 2021-08-06 at 06:44 +0200, Jernej =C5=A0krabec wrote:
> > Dne petek, 06. avgust 2021 ob 00:03:36 CEST je Ezequiel Garcia napisal(=
a):
> > > Hi Jernej,
> > >=20
> > > On Thu, 2021-08-05 at 21:04 +0200, Jernej Skrabec wrote:
> > > > Some cores use only one interrupt and in such case interrupt name in
> > > > DT
> > > > is not needed. Driver supposedly accounted that, but due to the wro=
ng
> > > > field check it never worked. Fix that.
> > > >=20
> > > > Fixes: 18d6c8b7b4c9 ("media: hantro: add fallback handling for sing=
le
> > > > irq/clk") Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > > ---
> > > >  drivers/staging/media/hantro/hantro_drv.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/drivers/staging/media/hantro/hantro_drv.c
> > > > b/drivers/staging/media/hantro/hantro_drv.c index
> > > > 8a2edd67f2c6..20e508158871 100644
> > > > --- a/drivers/staging/media/hantro/hantro_drv.c
> > > > +++ b/drivers/staging/media/hantro/hantro_drv.c
> > > > @@ -919,7 +919,7 @@ static int hantro_probe(struct platform_device
> > > > *pdev)
> > > >                 if (!vpu->variant->irqs[i].handler)
> > > >                         continue;
> > > > =20
> > > > -               if (vpu->variant->num_clocks > 1) {
> > > > +               if (vpu->variant->num_irqs > 1) {
> > >=20
> > > Oops, thanks for spotting this.
> > >=20
> > > How about this instead?
> >=20
> > No, original solution is more robust. With solution below, you're assum=
ing
> > that irq order in driver array is same as in DT. That doesn't matter if
> > there is only one name or if names match. However, if there is a typo,
> > either in DT node or in driver, driver will still happily assign clock
> > based on index and that might not be correct one. Even if it works out,
> > you can easily miss that you have a typo. Driver doesn't tell you which
> > irq is used, if it is successfully acquired.
>=20
> I find it odd to iterate up to num_irqs but then
> have a case for num_irqs =3D=3D 1, and call
> platform_get_irq(vpu->pdev, 0).

True, it was also strange for me at first, but then it's robust and simple.=
=20
Because of that, I just fixed obvious issue.

>=20
> But OTOH, your fix is correct and it's a oneliner.
>=20
> Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
>=20

Thanks!

Best regards,
Jernej

> Thanks,
> Ezequiel




