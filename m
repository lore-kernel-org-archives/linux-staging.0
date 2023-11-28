Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066CD101D1
	for <linux-staging@lists.linux.dev>; Tue, 28 Nov 2023 09:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PzSTkOcL"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a00b056ca38so697248466b.2
        for <linux-staging@lists.linux.dev>; Tue, 28 Nov 2023 01:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701164637; x=1701769437; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gn4UB1lK5iWfBPlsVj0cmidPsZvNY1ecgwO2dUiuTUo=;
        b=PzSTkOcLMFP8AkUmIyoTfFDaFNveBQC8KC+a5iCmHK2tJk3TxG7S/1MjXL9le2sj5C
         K9wBYsfOEijMAXg/JVtgRaT6IJmIqwpsrL20v8CYTEei2oTJ+75ebzhgtnLXNLFfD2Sk
         LI9lizm797J8e4ldHYcMoBoWHoezevSAXxEfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701164637; x=1701769437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gn4UB1lK5iWfBPlsVj0cmidPsZvNY1ecgwO2dUiuTUo=;
        b=TXYC8nG4dS5lFaj7Jpk09/w9B87SlOQwDtsaM0YJgtn08SzaD/VzbjhNUoNBHT+FxS
         F4EjBiaSSClrOH7suP2TXmeKVevLiRQ3OTAdmWlkNVDKWzkJBRqWoIRBr9vYBCYdNHWL
         hNCZLD54tjIvOjPuJOHtY+Mr+CmZ2rnT6c/JyMHr0GB3BcCY4Ei6osDpZFkgjlXIDX7C
         M2X0UvE6iLHjNGCD6mcVaUf2SsBpQ0SJcLIEZ0h3+isxdrFDGSUQj/yMGm+pMRdjiADt
         4yrIsCeD3M9cm+eeXu3RwBwYMAnhuKZgROxPJ+ZrOCuwHMzbiSR5/pJEMHCoyKQWqayn
         dyTA==
X-Gm-Message-State: AOJu0Ywfy162SpNYFQzxUxYB7onwMjitddY2LyAbvQfIQG2V2GuSPNdJ
	JVO3Y+BeFKylFPmoQbg0+G6zi4dEQreVu0Kuj+w3dfS+
X-Google-Smtp-Source: AGHT+IEwusvaTRO3kZXNEhUHcIRZQHIFLUgG0K+JHPUrEDZOaNy+X4d/XxIoQay1o7C3sE5TD/C2TQ==
X-Received: by 2002:a17:906:74c6:b0:a16:8c9e:f3fc with SMTP id z6-20020a17090674c600b00a168c9ef3fcmr145831ejl.61.1701164637060;
        Tue, 28 Nov 2023 01:43:57 -0800 (PST)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id rv4-20020a17090710c400b00a047ef6f2c6sm6628635ejb.135.2023.11.28.01.43.56
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 01:43:56 -0800 (PST)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-32fd7fc9f19so3279942f8f.2
        for <linux-staging@lists.linux.dev>; Tue, 28 Nov 2023 01:43:56 -0800 (PST)
X-Received: by 2002:adf:fcc8:0:b0:32d:a495:a9b7 with SMTP id
 f8-20020adffcc8000000b0032da495a9b7mr9105847wrs.61.1701164171112; Tue, 28 Nov
 2023 01:36:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231127165454.166373-1-benjamin.gaignard@collabora.com>
 <20231127165454.166373-8-benjamin.gaignard@collabora.com> <20231127170700.GC31314@pendragon.ideasonboard.com>
 <6fa1ec09-3e30-475e-9718-29d23586753e@collabora.com>
In-Reply-To: <6fa1ec09-3e30-475e-9718-29d23586753e@collabora.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 28 Nov 2023 18:35:51 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DCVTLpPoKSp_OA6fe_Hqt-oV7=AsCZWSmkJORvLSgUiw@mail.gmail.com>
Message-ID: <CAAFQd5DCVTLpPoKSp_OA6fe_Hqt-oV7=AsCZWSmkJORvLSgUiw@mail.gmail.com>
Subject: Re: [PATCH 07/55] media: imx8-isi: Stop abusing of min_buffers_needed field
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, hverkuil@xs4all.nl, 
	mchehab@kernel.org, m.szyprowski@samsung.com, matt.ranostay@konsulko.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, kernel@collabora.com, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 6:31=E2=80=AFPM Benjamin Gaignard
<benjamin.gaignard@collabora.com> wrote:
>
>
> Le 27/11/2023 =C3=A0 18:07, Laurent Pinchart a =C3=A9crit :
> > Hi Benjamin,
> >
> > Thank you for the patch.
> >
> > On Mon, Nov 27, 2023 at 05:54:06PM +0100, Benjamin Gaignard wrote:
> >> 'min_buffers_needed' is suppose to be used to indicate the number
> >> of buffers needed by DMA engine to start streaming.
> >> imx8-isi driver doesn't use DMA engine and just want to specify
> > What do you mean, "doesn't use DMA engine" ? The ISI surely has DMA
> > engines :-)
>
> I have done assumption on drivers given if they use or dma_* functions.

I suspect the use of vb2_dma_sg_plane_desc() and
vb2_dma_contig_plane_dma_addr() may be more correlated to whether
there is a DMA involved or not. Usually V4L2 drivers don't really have
to deal with the DMA API explicitly, because the vb2 framework handles
most of the work.

Best regards,
Tomasz

> I have considers that all PCI drivers are using DMA engine and
> I don't know the design for each drivers so I hope to get this informatio=
n
> from maintainers and fix that in v2.
> If imx8-isi driver needs a minimum number of buffers before start streami=
ng
> I will do a v2 and use min_dma_buffers_needed instead.
>
> Regards,
> Benjamin
>
> >
> >> the minimum number of buffers to allocate when calling VIDIOC_REQBUFS.
> >> That 'min_reqbufs_allocation' field purpose so use it.
> >>
> >> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> >> CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >> CC: Mauro Carvalho Chehab <mchehab@kernel.org>
> >> CC: Shawn Guo <shawnguo@kernel.org>
> >> CC: Sascha Hauer <s.hauer@pengutronix.de>
> >> CC: Pengutronix Kernel Team <kernel@pengutronix.de>
> >> CC: Fabio Estevam <festevam@gmail.com>
> >> CC: NXP Linux Team <linux-imx@nxp.com>
> >> ---
> >>   drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/dr=
ivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> >> index 49bca2b01cc6..81673ff9084b 100644
> >> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> >> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> >> @@ -1453,7 +1453,7 @@ int mxc_isi_video_register(struct mxc_isi_pipe *=
pipe,
> >>      q->mem_ops =3D &vb2_dma_contig_memops;
> >>      q->buf_struct_size =3D sizeof(struct mxc_isi_buffer);
> >>      q->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> >> -    q->min_buffers_needed =3D 2;
> >> +    q->min_reqbufs_allocation =3D 2;
> >>      q->lock =3D &video->lock;
> >>      q->dev =3D pipe->isi->dev;
> >>
