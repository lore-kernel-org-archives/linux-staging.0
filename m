Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E60134AA
	for <linux-staging@lists.linux.dev>; Thu,  9 Nov 2023 09:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Iw1tg6EV"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-9de7a43bd1aso102170566b.3
        for <linux-staging@lists.linux.dev>; Thu, 09 Nov 2023 01:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699523314; x=1700128114; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DilLKYDfiJHifO/My66ufTYoZBnb4NT+vvrqkX7FBNE=;
        b=Iw1tg6EVDC5uPBPVKKcYOMvtpA8uJwcBnMZiBstyyeR8kMSfyZ2qaNGijQBH/S1/R9
         tlShsCIcUthaQU2L/qg3fzrv09pIUURkVvDmJsgR5DxWIOXC3coNAfxihB2+XQiqCEZr
         DcULhBYM94hiQZSTXmljlSK2LolO5B/mcHM/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699523314; x=1700128114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DilLKYDfiJHifO/My66ufTYoZBnb4NT+vvrqkX7FBNE=;
        b=SEvFlmj6F4RpdEEovNo9aPjO4Cnqp5qbzK/eBI9kqAcbPJ+3ZNPzlkMWLcHigxthdj
         PrAiOd3P57ZOYocQOtskEnJbJI4/2ug6XyUvX4bXO3J3YXllzKO25MGoh+JleGhvDsSt
         AlVp4cLj3a+GvrzFLG/xajc9I7bQZBdnkyibP44s9Us4R+/9UoDLlz1h2vfpupZH9Dn3
         S6FkV2tI5oEns7UuHqmli9JnTLmg/0L1ziRRfFOgd5mAQkQg59PLiISsqCByQ76FdoEh
         obPMmfAmuKpkaLzgorD/W5vvai/SW6eleLf6J8rIIh2ylkitC1AYpDTRSqoJeqPN/RHQ
         Dwfw==
X-Gm-Message-State: AOJu0Ywyc/3ubOxwZICfmSKqEhYLUGofuIGwCsh+DgggCFRcC0Hi7d83
	ZZiZibzTpxAwmmhzeUzodCGVZJ6sDGQ0xHtZkoom/MU/
X-Google-Smtp-Source: AGHT+IFQzOKBH3KdiDEyOh8zjW6Udf98UDU8qXl5LG5kcPwdyXcZcyon70wPrjQmirTWdG9zCVqdrQ==
X-Received: by 2002:a17:907:72c2:b0:9b2:6d09:847c with SMTP id du2-20020a17090772c200b009b26d09847cmr3584102ejc.10.1699523313968;
        Thu, 09 Nov 2023 01:48:33 -0800 (PST)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id t12-20020a17090605cc00b0099bd7b26639sm2326112ejt.6.2023.11.09.01.48.33
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 01:48:33 -0800 (PST)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40842752c6eso4465815e9.1
        for <linux-staging@lists.linux.dev>; Thu, 09 Nov 2023 01:48:33 -0800 (PST)
X-Received: by 2002:a5d:64a9:0:b0:32f:7f09:160f with SMTP id
 m9-20020a5d64a9000000b0032f7f09160fmr4230407wrp.12.1699523312965; Thu, 09 Nov
 2023 01:48:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-57-benjamin.gaignard@collabora.com>
 <20231109094311.yzmmn4vvskmrk4tk@chromium.org> <2f5ad14b-528d-4656-84d8-f85467c5b475@collabora.com>
In-Reply-To: <2f5ad14b-528d-4656-84d8-f85467c5b475@collabora.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 9 Nov 2023 18:48:15 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CH=NoDUJArp=6_28WSgkQ3jTMR3SOyx1iYro-7e4c2hA@mail.gmail.com>
Message-ID: <CAAFQd5CH=NoDUJArp=6_28WSgkQ3jTMR3SOyx1iYro-7e4c2hA@mail.gmail.com>
Subject: Re: [PATCH v14 56/56] media: test-drivers: Use helper for DELETE_BUFS ioctl
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: mchehab@kernel.org, m.szyprowski@samsung.com, ming.qian@nxp.com, 
	ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de, 
	gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl, 
	nicolas.dufresne@collabora.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 9, 2023 at 6:46=E2=80=AFPM Benjamin Gaignard
<benjamin.gaignard@collabora.com> wrote:
>
>
> Le 09/11/2023 =C3=A0 10:43, Tomasz Figa a =C3=A9crit :
> > On Tue, Oct 31, 2023 at 05:31:04PM +0100, Benjamin Gaignard wrote:
> >> Allow test drivers to use DELETE_BUFS by adding vb2_ioctl_delete_bufs(=
) helper.
> >>
> >> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> >> ---
> >>   drivers/media/test-drivers/vicodec/vicodec-core.c |  2 ++
> >>   drivers/media/test-drivers/vimc/vimc-capture.c    |  2 ++
> >>   drivers/media/test-drivers/visl/visl-video.c      |  2 ++
> >>   drivers/media/test-drivers/vivid/vivid-core.c     | 13 ++++++++++---
> >>   4 files changed, 16 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drive=
rs/media/test-drivers/vicodec/vicodec-core.c
> >> index 69cbe2c094e1..f14a8fd506d0 100644
> >> --- a/drivers/media/test-drivers/vicodec/vicodec-core.c
> >> +++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
> >> @@ -1339,6 +1339,7 @@ static const struct v4l2_ioctl_ops vicodec_ioctl=
_ops =3D {
> >>      .vidioc_prepare_buf     =3D v4l2_m2m_ioctl_prepare_buf,
> >>      .vidioc_create_bufs     =3D v4l2_m2m_ioctl_create_bufs,
> >>      .vidioc_expbuf          =3D v4l2_m2m_ioctl_expbuf,
> >> +    .vidioc_delete_bufs     =3D v4l2_m2m_ioctl_delete_bufs,
> >>
> >>      .vidioc_streamon        =3D v4l2_m2m_ioctl_streamon,
> >>      .vidioc_streamoff       =3D v4l2_m2m_ioctl_streamoff,
> >> @@ -1725,6 +1726,7 @@ static int queue_init(void *priv, struct vb2_que=
ue *src_vq,
> >>      dst_vq->mem_ops =3D &vb2_vmalloc_memops;
> >>      dst_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> >>      dst_vq->lock =3D src_vq->lock;
> >> +    dst_vq->supports_delete_bufs =3D true;
> > Since we have to explicitly provide the vidioc_delete_bufs callback any=
way,
> > is there any value in having a separate supports_delete_bufs flag? Or w=
e
> > envision that some drivers would support deleting buffers only for some
> > queues?
>
> That exactly the case for Hantro driver, it can support deleting buffers =
on
> capture queue but not on output queue.

Fair enough.

Best regards,
Tomasz
