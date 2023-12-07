Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C169D4EB3F
	for <linux-staging@lists.linux.dev>; Thu,  7 Dec 2023 18:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="KHjrLynk"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-425959f36b0so3449991cf.3
        for <linux-staging@lists.linux.dev>; Thu, 07 Dec 2023 10:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1701974020; x=1702578820; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GZWhK495VLeN7TNOf6swobaME2YnrmvMGk89MvaYBHI=;
        b=KHjrLynkW/NuWwnwuPvuNmiVAPVskMkk/HchTrZ0Rk48WheGG5QMAgn3NXS/FUXw6h
         DXGZrSxKiP4CP+VlGzon8HVse058l/SFENldCnmhAzL4wHxrm/xaOoSCXadtKCtI/DZu
         MgEBsquGFhL91RVsN5bMDaYe3GVVQXnlCP62zWxDS8jLIjYSjOsmVqw/+Wws3D3D/im+
         ViV0ouMudXt+/SBjgcjzXHVhpmMVxBJIX+bczghj7ExvNltMGPIAN0akT11Ya3WLmAVo
         mPxVnZr2tnxSzP/mW7TRzOekE6t5LPLkC7pK2bljacnSFkzpmdSyUNbTr/pUDdnlv0kG
         q+kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701974020; x=1702578820;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GZWhK495VLeN7TNOf6swobaME2YnrmvMGk89MvaYBHI=;
        b=mf6p+QbvU0U7iFKDbttXvQwYIqqjETYLYbw6DWXx7qMURHRokkfJwnjD+Urqd4JWUk
         sM/r7oAUgSFe/jl57+pm1Hp2ugMY8ar7ixCeNoH+4QjTNFeQvUK3mKEuV5oJyrSr+r6Q
         +/izlFJIY70yxyuYHsiAz/5YeHhj4jccJpXWMopHy6JWZcOurDplE4IdrI3ob6WKAaaJ
         zQTAVRiAbNjXuTYYbEYwSt72Arwodt33Xy0tLenjstyc0NktgK4ZV+4c69Yt8HO/HYk9
         qGhssS+6Jg1OF0lsdGncYQ7Zz2ZKILCKWFesBc0y4L9NUNJAYApCjcsW7U/ijc/NrHAh
         EHIA==
X-Gm-Message-State: AOJu0YymkYv/kY95SFdWIAjzsga+uZ2Y/c0+5171epKo6xWwbXs/NMRp
	q/hMCxgY7ssph14x3hqbBt6rpQ==
X-Google-Smtp-Source: AGHT+IF44G4vo91Pehf9E6Xdpq+8M9mRAYJujL+Kh9cNIlF92TI6vHzDWOvzVRMCx1+2PXWbmtxP1Q==
X-Received: by 2002:ac8:570b:0:b0:425:4043:41c7 with SMTP id 11-20020ac8570b000000b00425404341c7mr3133948qtw.115.1701974020565;
        Thu, 07 Dec 2023 10:33:40 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:17:b5c::7a9])
        by smtp.gmail.com with ESMTPSA id j15-20020ac8664f000000b004255e0e5962sm131926qtp.50.2023.12.07.10.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 10:33:40 -0800 (PST)
Message-ID: <3ab3f9ea25d222c0b27e1b76f80c1abe76d27def.camel@ndufresne.ca>
Subject: Re: [PATCH 07/55] media: imx8-isi: Stop abusing of
 min_buffers_needed field
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Tomasz Figa
	 <tfiga@chromium.org>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, hverkuil@xs4all.nl,
  mchehab@kernel.org, m.szyprowski@samsung.com, matt.ranostay@konsulko.com, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-staging@lists.linux.dev, kernel@collabora.com, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>
Date: Thu, 07 Dec 2023 13:33:38 -0500
In-Reply-To: <20231128103117.GF31314@pendragon.ideasonboard.com>
References: <20231127165454.166373-1-benjamin.gaignard@collabora.com>
	 <20231127165454.166373-8-benjamin.gaignard@collabora.com>
	 <20231127170700.GC31314@pendragon.ideasonboard.com>
	 <6fa1ec09-3e30-475e-9718-29d23586753e@collabora.com>
	 <CAAFQd5DCVTLpPoKSp_OA6fe_Hqt-oV7=AsCZWSmkJORvLSgUiw@mail.gmail.com>
	 <20231128103117.GF31314@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Le mardi 28 novembre 2023 =C3=A0 12:31 +0200, Laurent Pinchart a =C3=A9crit=
=C2=A0:
> On Tue, Nov 28, 2023 at 06:35:51PM +0900, Tomasz Figa wrote:
> > On Tue, Nov 28, 2023 at 6:31=E2=80=AFPM Benjamin Gaignard wrote:
> > > Le 27/11/2023 =C3=A0 18:07, Laurent Pinchart a =C3=A9crit :
> > > > Hi Benjamin,
> > > >=20
> > > > Thank you for the patch.
> > > >=20
> > > > On Mon, Nov 27, 2023 at 05:54:06PM +0100, Benjamin Gaignard wrote:
> > > > > 'min_buffers_needed' is suppose to be used to indicate the number
> > > > > of buffers needed by DMA engine to start streaming.
> > > > > imx8-isi driver doesn't use DMA engine and just want to specify
> > > > What do you mean, "doesn't use DMA engine" ? The ISI surely has DMA
> > > > engines :-)
> > >=20
> > > I have done assumption on drivers given if they use or dma_* function=
s.
> >=20
> > I suspect the use of vb2_dma_sg_plane_desc() and
> > vb2_dma_contig_plane_dma_addr() may be more correlated to whether
> > there is a DMA involved or not. Usually V4L2 drivers don't really have
> > to deal with the DMA API explicitly, because the vb2 framework handles
> > most of the work.
>=20
> And this is anyway not related to DMA at all, but to the logic each
> driver implements when it deals with buffers. There's a lower chance a
> USB driver driver will have a hard requirement for more than one buffer
> compared to an AMBA/platform/PCI device driver, but at the end of the
> day, each driver needs to be analyzed individually to check what they
> require. Benjamin, I think you'll have some more homework to do :-)

Personally, I disagree that we should blindly patch drivers and actually ch=
ange
the framework behaviour. A patch that simply take what we have, and make it=
 so a
human reader now understand what is going on should be acceptable. Maintain=
ers
or developer that have access to the hardware should be making this judgmen=
t now
that the current behaviour is visible, modify and test it.

Asking to eye review drivers and change their behaviour without any test be=
ing
conducted will certainly cause regressions. I don't believe this is the rig=
ht
approach. Refactoring the code, making an effort to not change the behaviou=
r
during refactoring does make more sense to me.

regards,
Nicolas

>=20
> > > I have considers that all PCI drivers are using DMA engine and
> > > I don't know the design for each drivers so I hope to get this inform=
ation
> > > from maintainers and fix that in v2.
> > > If imx8-isi driver needs a minimum number of buffers before start str=
eaming
> > > I will do a v2 and use min_dma_buffers_needed instead.
> > >=20
> > > > > the minimum number of buffers to allocate when calling VIDIOC_REQ=
BUFS.
> > > > > That 'min_reqbufs_allocation' field purpose so use it.
> > > > >=20
> > > > > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com=
>
> > > > > CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > CC: Mauro Carvalho Chehab <mchehab@kernel.org>
> > > > > CC: Shawn Guo <shawnguo@kernel.org>
> > > > > CC: Sascha Hauer <s.hauer@pengutronix.de>
> > > > > CC: Pengutronix Kernel Team <kernel@pengutronix.de>
> > > > > CC: Fabio Estevam <festevam@gmail.com>
> > > > > CC: NXP Linux Team <linux-imx@nxp.com>
> > > > > ---
> > > > >   drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c | 2 +-
> > > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >=20
> > > > > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c=
 b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> > > > > index 49bca2b01cc6..81673ff9084b 100644
> > > > > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> > > > > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> > > > > @@ -1453,7 +1453,7 @@ int mxc_isi_video_register(struct mxc_isi_p=
ipe *pipe,
> > > > >      q->mem_ops =3D &vb2_dma_contig_memops;
> > > > >      q->buf_struct_size =3D sizeof(struct mxc_isi_buffer);
> > > > >      q->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> > > > > -    q->min_buffers_needed =3D 2;
> > > > > +    q->min_reqbufs_allocation =3D 2;
> > > > >      q->lock =3D &video->lock;
> > > > >      q->dev =3D pipe->isi->dev;
> > > > >=20
>=20

