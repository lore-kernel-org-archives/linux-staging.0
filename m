Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0542C83;
	Thu, 25 Nov 2021 19:21:45 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id e3so29544845edu.4;
        Thu, 25 Nov 2021 11:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/Vc3FfetVxIdpRbBGRnWlkdOorbqQWmi/1JlvobARac=;
        b=kSCD7fAFOjTdgiLnjLYynUIfaux94u8yqksuzZVUebj/D10Hp3wTDktIjqQV59Di+5
         m7hmzvMRWj2bM7ffFwopd6cIf81D7oXFRj7Uhf1H6USYExNgAvQixhwCe2a2U5CfLl5Z
         vNXswG2lgBlRCX6sBrDx0MbUPDf2+0LwcuuHpMPrES9MuqCL1yv/5OWDm1tUrJIeaa/T
         GXijeTf3n119pGg45yxgz0nHDtZWaP7xvnBfeoeJ/Ul5edKBpIN+6CDc6K+66o87/2FO
         xhi2xwo8qnDYWn4GCbTMujIrOumUOBcrSD6481anYBkTnyhzhZS17dymUiznzOTHGAeD
         JtkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/Vc3FfetVxIdpRbBGRnWlkdOorbqQWmi/1JlvobARac=;
        b=yLDUl3ipkehtSu0gj+3geHcMPgUu0LXHk+nAo5kRv95Z52OQW8eeHZpMxkLafpYnNR
         wlBA+qAdncbczfug95lr4qODbXMeNyHlwb07L+yebd/jWfeR09pkFIcncFY7ht8xXIZa
         Fke4DKF/IKGx0/4/Fr1P2Qn2jCAGaznFMzWaXnENbn1Zcv9kEL71XZnbrma48vewq2B0
         30t+wTU3ydaWDCz5rSMYqXDv4Qfoko+I7aA4LkPUld9VXfIpIzMT0szPiAjYSqaXFeUU
         UQA2yUZK59uC4naAp1Z8EAKwpEgMh4NmpM3AavBJi7m6OIe0Jd5w4S+2/SgmxYQcukO6
         EhqA==
X-Gm-Message-State: AOAM5322a5IM5dWeNrXAmx3UQASaWydUYfQoIFqv3BBrwkuS8c/9GN1Y
	97LL2QRR9HTrnLFi0UeHmO8=
X-Google-Smtp-Source: ABdhPJxsCCabBHBJ2oAC81Nu1JW2uYRVapJ0pqZTRte9s2XejGZRR2ce+rzmuo3a2NTAx3XP5MAtdw==
X-Received: by 2002:a17:907:7e8e:: with SMTP id qb14mr33225652ejc.562.1637868103865;
        Thu, 25 Nov 2021 11:21:43 -0800 (PST)
Received: from jernej-laptop.localnet (89-212-178-211.dynamic.t-2.net. [89.212.178.211])
        by smtp.gmail.com with ESMTPSA id i8sm2983304edc.12.2021.11.25.11.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 11:21:43 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: linux-media@vger.kernel.org, nicolas.dufresne@collabora.com, mchehab@kernel.org, robh+dt@kernel.org, mripard@kernel.org, wens@csie.org, p.zabel@pengutronix.de, andrzej.p@collabora.com, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 4/7] media: hantro: move postproc enablement for old cores
Date: Thu, 25 Nov 2021 20:21:41 +0100
Message-ID: <4693726.31r3eYUQgx@jernej-laptop>
In-Reply-To: <YZ962CvUbKoiIGyZ@eze-laptop>
References: <20211122184702.768341-1-jernej.skrabec@gmail.com> <20211122184702.768341-5-jernej.skrabec@gmail.com> <YZ962CvUbKoiIGyZ@eze-laptop>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Hi Ezequiel,

Dne =C4=8Detrtek, 25. november 2021 ob 13:00:24 CET je Ezequiel Garcia napi=
sal(a):
> Hi Jernej,
>=20
> On Mon, Nov 22, 2021 at 07:46:59PM +0100, Jernej Skrabec wrote:
> > Older G2 cores, like that in Allwinner H6, seem to have issue with
> > latching postproc register values if this is first thing done in job.
> > Moving that to the end solves the issue.
>=20
> Any idea what exact register should be written before the post-processor
> is enabled, for H6 to work? Also, which of the PP registers need
> to be written "at the end"?

No, there is too much registers to determine this exactly. Vendor library=20
actually stores register values in buffer and write them all at once in=20
increasing order. This is probably the reason why HDL engineers missed this=
=20
issue...

>=20
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
> >=20
> >  drivers/staging/media/hantro/hantro_drv.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/staging/media/hantro/hantro_drv.c
> > b/drivers/staging/media/hantro/hantro_drv.c index
> > 8c3de31f51b3..530994ab3024 100644
> > --- a/drivers/staging/media/hantro/hantro_drv.c
> > +++ b/drivers/staging/media/hantro/hantro_drv.c
> > @@ -130,7 +130,7 @@ void hantro_start_prepare_run(struct hantro_ctx *ct=
x)
> >=20
> >  	v4l2_ctrl_request_setup(src_buf->vb2_buf.req_obj.req,
> >  =09
> >  				&ctx->ctrl_handler);
> >=20
> > -	if (!ctx->is_encoder) {
> > +	if (!ctx->is_encoder && !ctx->dev->variant->legacy_regs) {
>=20
> To make this less fragile, do you think it would make sense to
> have a dedicated quirk flag, something like "legacy_post_proc",
> instead of overloading the meaning of legacy_regs.

Sure, it can be done :) But then I suggest "late_post_proc" - it better=20
describes what it does.

Best regards,
Jernej

>=20
> What do you think?
>=20
> Thanks,
> Ezequiel
>=20
> >  		if (hantro_needs_postproc(ctx, ctx->vpu_dst_fmt))
> >  	=09
> >  			hantro_postproc_enable(ctx);
> >  	=09
> >  		else
> >=20
> > @@ -142,6 +142,13 @@ void hantro_end_prepare_run(struct hantro_ctx *ctx)
> >=20
> >  {
> > =20
> >  	struct vb2_v4l2_buffer *src_buf;
> >=20
> > +	if (ctx->dev->variant->legacy_regs && !ctx->is_encoder) {
> > +		if (hantro_needs_postproc(ctx, ctx->vpu_dst_fmt))
> > +			hantro_postproc_enable(ctx);
> > +		else
> > +			hantro_postproc_disable(ctx);
> > +	}
> > +
> >=20
> >  	src_buf =3D hantro_get_src_buf(ctx);
> >  	v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
> >  =09
> >  				   &ctx->ctrl_handler);




