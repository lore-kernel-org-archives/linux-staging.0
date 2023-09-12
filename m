Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963651803C
	for <linux-staging@lists.linux.dev>; Tue, 12 Sep 2023 15:51:12 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-9a9f139cd94so652618366b.2
        for <linux-staging@lists.linux.dev>; Tue, 12 Sep 2023 08:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694533871; x=1695138671; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZUdgHz1EThvHhDCfER2QcOxP464/TYWECsF6ss3Llv8=;
        b=Rw79N//gYnZauFJRpOeD+Z1sLcEDRTfYVii0GB8LnPuRNqD5YU4LxiwaqrWWhhV15P
         gF32LzcFUVHMH9npG1jljUCIUdyy4MO/gMFfhjemcxsRE2cXWq9rVFiNukm3MpkAZPsC
         SB4S4leBX9LVGC7FXW0wVKqOGHfWFc9l7hkTElf+xcVWeYB95Np8DD6nFIaZW71o7lBK
         ugTxGu7AdO6SsPey6GR/o2T3jiabMgf4uzDntwtnM3PAodK0R8/WIkKNjjt89RpiIkOi
         r7mOvxgZa67dqn/4JrrPHQL15h4q/h2UoVi4MU+bXzqIJVB5NLrUxMVOevE6btjehNto
         QGLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694533871; x=1695138671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZUdgHz1EThvHhDCfER2QcOxP464/TYWECsF6ss3Llv8=;
        b=EgmWMp1vNzC+cAvz4DHijogMDa/bJnmP8KlP/VYzLKPWHBHFx6hnGXp4IFtBX530nN
         tUyyQE/6e58ThiHHaMdgJvXIpsDI3v4yulx+uua9MwAc26Llr/+Qw0neSDaqkIbbjyXI
         zextKwvtFmmEo+CyNIUV+Z17b+Xoz2niZ5aJWDXC3qgpKmBOePUUbz6sVnnkkoxJ+VED
         pRovrB3LXIJXaLGPwt/1AgmibJb3OrI9PCwz29XSx1pErSYZailnCeen43BHRHW4wLFG
         4aoC/0eAbfOej1fZLB5dcpSvM/EmXvtz2hMzFwTP5K23R9SXURLfWhGBL9fEuJvFsSWF
         dc1g==
X-Gm-Message-State: AOJu0Yw7jQ6GLFD4o6Lgj70YvGqYgQCIZnAYYzDXKKCUP3WmUVHRszCS
	Jn2HEieQjRYp0V6eYm5rhe0=
X-Google-Smtp-Source: AGHT+IEPyTBOuD137PDb5hsrEYqnclMHOWuZ7gkQz54FV5aXlia/e1v2LPpVwhbzWGM1Q6iInFPsoA==
X-Received: by 2002:a17:906:a18b:b0:99d:e417:d6f6 with SMTP id s11-20020a170906a18b00b0099de417d6f6mr9574690ejy.32.1694533870294;
        Tue, 12 Sep 2023 08:51:10 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id op5-20020a170906bce500b009a1fef32ce6sm7143043ejb.177.2023.09.12.08.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 08:51:09 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: mchehab@kernel.org, tfiga@chromium.org, m.szyprowski@samsung.com,
 ming.qian@nxp.com, ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
 nicolas.dufresne@collabora.com,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com
Subject:
 Re: [PATCH v6 14/18] media: verisilicon: vp9: Use destination buffer height
 to compute chroma offset
Date: Tue, 12 Sep 2023 17:51:07 +0200
Message-ID: <1940906.PYKUYFuaPT@jernej-laptop>
In-Reply-To: <40329795-a57d-d0f3-adb4-0720dd20f6e2@collabora.com>
References:
 <20230901124414.48497-1-benjamin.gaignard@collabora.com>
 <3248154.aeNJFYEL58@jernej-laptop>
 <40329795-a57d-d0f3-adb4-0720dd20f6e2@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne torek, 12. september 2023 ob 10:41:10 CEST je Benjamin Gaignard=20
napisal(a):
> Le 11/09/2023 =C3=A0 18:36, Jernej =C5=A0krabec a =C3=A9crit :
> > Dne ponedeljek, 11. september 2023 ob 10:55:02 CEST je Benjamin Gaignard
> >=20
> > napisal(a):
> >> Le 10/09/2023 =C3=A0 15:21, Jernej =C5=A0krabec a =C3=A9crit :
> >>> Hi Benjamin!
> >>>=20
> >>> Dne petek, 01. september 2023 ob 14:44:10 CEST je Benjamin Gaignard
> >>>=20
> >>> napisal(a):
> >>>> Source and destination buffer height may not be the same because
> >>>> alignment constraint are different.
> >>>> Use destination height to compute chroma offset because we target
> >>>> this buffer as hardware output.
> >>>>=20
> >>>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> >>>> Fixes: e2da465455ce ("media: hantro: Support VP9 on the G2 core")
> >>>> ---
> >>>>=20
> >>>>    drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c | 4 +---
> >>>>    1 file changed, 1 insertion(+), 3 deletions(-)
> >>>>=20
> >>>> diff --git a/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
> >>>> b/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c index
> >>>> 6db1c32fce4d..1f3f5e7ce978 100644
> >>>> --- a/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
> >>>> +++ b/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
> >>>> @@ -93,9 +93,7 @@ static int start_prepare_run(struct hantro_ctx *ct=
x,
> >>>> const struct v4l2_ctrl_vp9_ static size_t chroma_offset(const struct
> >>>> hantro_ctx *ctx,
> >>>>=20
> >>>>    			    const struct v4l2_ctrl_vp9_frame
> >>>=20
> >>> *dec_params)
> >>>=20
> >>>>    {
> >>>>=20
> >>>> -	int bytes_per_pixel =3D dec_params->bit_depth =3D=3D 8 ? 1 : 2;
> >>>> -
> >>>> -	return ctx->src_fmt.width * ctx->src_fmt.height * bytes_per_pixel;
> >>>> +	return ctx->dst_fmt.width * ctx->dst_fmt.height * ctx->bit_depth /
> >>>=20
> >>> 8;
> >>>=20
> >>> Commit message doesn't mention bit_depth change at all. While I think
> >>> there is no difference between dec_params->bit_depth and ctx->bit_dep=
th,
> >>> you shouldn't just use ordinary division. If bit_depth is 10, it will=
 be
> >>> rounded down. And if you decide to use bit_depth from context, please
> >>> remove dec_params argument.
> >>=20
> >> I will change this patch and create a helpers function for chroma and
> >> motion vectors offsets that VP9 and HEVC code will use since they are
> >> identical. I don't see issue with the division. If you have in mind a
> >> solution please write it so I could test it.
> >=20
> > Solution is same as the code that you removed:
> > int bytes_per_pixel =3D dec_params->bit_depth =3D=3D 8 ? 1 : 2;
> >=20
> > Or alternatively:
> > int bytes_per_pixel =3D DIV_ROUND_UP(dec_params->bit_depth, 8);
> >=20
> > Consider bit_depth being 10. With old code you get 2, with yours you get
> > 1.
>=20
> The old code is wrong ;-)
> If the format depth is 10 bits per pixel then chroma offset (in bytes)
> formula is width * height * 10 / 8 not width * height * 16 / 8.
>=20
> I have already confirm that with HEVC on the same hardware.

Ok, mention of bit_depth issue in commit log would be great. It talks only=
=20
about width and height.

In any case, are width and/or height always dividable by 8?

Best regards,
Jernej

>=20
> Regards,
> Benjamin
>=20
> > Best regards,
> > Jernej
> >=20
> >> Regards,
> >> Benjamin
> >>=20
> >>> Best regards,
> >>> Jernej
> >>>=20
> >>>>    }
> >>>>   =20
> >>>>    static size_t mv_offset(const struct hantro_ctx *ctx,




