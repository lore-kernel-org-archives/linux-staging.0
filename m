Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7876F136E37
	for <linux-staging@lists.linux.dev>; Fri, 27 Sep 2024 19:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727465602; cv=none; b=sAm+SpJ0im0EadwvI81LjDe2eQfssAIBcQuxxHnvix/3aR15UiOuHTNSeqMqg3aAJAe1aT8McsaEeMM/LKGDiZ8CFS8NTV19WVenk+6i1/ioKDW976Lep3sYpahFSzS67XxXJVSalfBZKYyxlCeAtPlfg2X31SFEbMHwLldRjhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727465602; c=relaxed/simple;
	bh=9nBIWT0lzbhUH/iN+bL0j/cZv61u7ADR+T2WUGbt+hs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pN5+DU4C/c4EuZG5YoWDHuCYJkJUp5VyYAxcjHq3sjeFF+2ICCdlgwKJHFvPXbSMJIb0UG8GHT7Qfsf3wyNFm2oCOHT5dVZOq6QXCJdpEsbTN4SApKFA9KnjTdPifFDcnWvqDiSd/EO0CrrlwXI7COx2gTXj9LM0oabJGLzzs7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=Vx6h0dSI; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="Vx6h0dSI"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6c5ab2de184so16422186d6.0
        for <linux-staging@lists.linux.dev>; Fri, 27 Sep 2024 12:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1727465599; x=1728070399; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VKladj2sFJjdiWtfrOuq4uA29WlsH18GzOxyRfbvkm8=;
        b=Vx6h0dSIn6m1rNmhfiaWHkPzDV/QLWfZ/eDItT+rBSlnn36AXYa+54isTMDFCyE1mR
         QvNtJi19NS8DYDHOVpaQNNThN0JNpHgFuSWoQZUkKXSUXkqkKzmFBsFb5vWUJlEJpAyW
         8yS3tkXYpZOw9DLBzRkZD0zOqR20FPUg5fpGdfQL/SGYjWeCOehuLhgnIJvNRJ7NcuDp
         uKOrkNISaNNaIOuVr2KpJM7KHS/a3jHFpce7z7sV45ZQtutg9CxMZLcTQOjz1XCHkerQ
         26gbwnhqZDP8JC+xGIY/kJndrrogUQHjAoLPWsaNgY87Ldu37pVHMXjI1duRJzJhbuu/
         iliA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727465599; x=1728070399;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VKladj2sFJjdiWtfrOuq4uA29WlsH18GzOxyRfbvkm8=;
        b=H02SC9RMII2p/QDqt4x1DojH44zChj6tz4q2ZBl1U9YQ/NEg8NjUXxNvXW7VYSliDG
         bYU/dpzW8svsab1bga0IbhLSd9dZOulcxYfb2gIqUz6gkHlY+JbSExZTa7GKSDVS00V0
         LNecj+P4SoBsoNRJkEGLxh4ZElYQTqwnZhS16nUsULm+Q2A2HogINISNb4czdtEtO7BU
         hRRWy/vxIZBr3KKrPuOJrh7VrI1kmRuN+wzKhuRPzb+Yl+JCyDN/Mm++73eqIf1FE2kN
         f9ezqYZneVIAXZv/7Gmbyou4FvUfMWKQ99RXK+WAlN95uur7+uzFXNPtREu/+60rAx32
         IKtg==
X-Forwarded-Encrypted: i=1; AJvYcCXelEyqyCmIrreo+zDAZIx1KMzkxyCa4/pzdDAyZ27tJ3NC4VQwmpov8Zqh0xIEJi+tqEgi1m7LtNdIDwZJ@lists.linux.dev
X-Gm-Message-State: AOJu0Yyod0ABCC7Fo72ibM1eoZzfq4bjIEPaVGrlRhV8kBsCfQkrCEBs
	duU413AFGh8fI4CP33ZaQIG+uC+C1CLU+IoimuBs4FS9cZGFm7dXLAEWCC983SE=
X-Google-Smtp-Source: AGHT+IEhDe5EE9y0RFQCZTtCNmMq10z4RbPVeb2m5iqTjmA1e9FxI+tgYD6oSZc2Z9WqFDJgdWHibA==
X-Received: by 2002:a05:6214:3bc7:b0:6cb:4e39:1a93 with SMTP id 6a1803df08f44-6cb4e395f0cmr619406d6.38.1727465599241;
        Fri, 27 Sep 2024 12:33:19 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:15:862e::580])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b680045sm11835946d6.104.2024.09.27.12.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 12:33:18 -0700 (PDT)
Message-ID: <386f4e12fd835b18c3f618f2c94cbd426bd6cf28.camel@ndufresne.ca>
Subject: Re: [PATCH v2 2/2] media: imx: vdic: Introduce mem2mem VDI
 deinterlacer driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Marek Vasut <marex@denx.de>, linux-media@vger.kernel.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Fabio
 Estevam <festevam@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Sascha
 Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Steve
 Longerbeam <slongerbeam@gmail.com>, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org,  linux-staging@lists.linux.dev
Date: Fri, 27 Sep 2024 15:33:17 -0400
In-Reply-To: <6b45e30c-b215-4f7a-91a4-fde05d78f737@denx.de>
References: <20240724002044.112544-1-marex@denx.de>
	 <20240724002044.112544-2-marex@denx.de>
	 <85a5a42667e5867bc45da31baf045d4c9557f5f1.camel@ndufresne.ca>
	 <6b45e30c-b215-4f7a-91a4-fde05d78f737@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Le mercredi 25 septembre 2024 =C3=A0 22:45 +0200, Marek Vasut a =C3=A9crit=
=C2=A0:
> On 9/25/24 7:58 PM, Nicolas Dufresne wrote:
>=20
>=20

[...]

>=20
> > > +static irqreturn_t ipu_mem2mem_vdic_nfb4eof_interrupt(int irq, void =
*dev_id)
> > > +{
> > > +	struct ipu_mem2mem_vdic_priv *priv =3D dev_id;
> > > +
> > > +	/* That is about all we can do about it, report it. */
> > > +	dev_warn_ratelimited(priv->dev, "NFB4EOF error interrupt occurred\n=
");
> >=20
> > Not sure this is right. If that means ipu_mem2mem_vdic_eof_interrupt wo=
n't fire,
> > then it means streamoff/close after that will hang forever, leaving a z=
ombie
> > process behind.
> >=20
> > Perhaps mark the buffers as ERROR, and finish the job.
>=20
> The NFB4EOF interrupt is generated when the VDIC didn't write (all of)=
=20
> output frame . I think it stands for "New Frame Before EOF" or some=20
> such. Basically the currently written frame will be corrupted and the=20
> next frame(s) are likely going to be OK again.

So the other IRQ will be triggered ? After this one ? Is so, perhaps take a
moment to mark the frames as ERROR (which means corrupted).

[...]

> >=20
> > The driver is not taking ownership of prev_buf, only curr_buf is guaran=
teed to
> > exist until v4l2_m2m_job_finish() is called. Usespace could streamoff, =
allocate
> > new buffers, and then an old freed buffer may endup being used.
>=20
> So, what should I do about this ? Is there some way to ref the buffer to=
=20
> keep it around ?
>=20
> > Its also unclear to me how userspace can avoid this ugly warning, how c=
an you
> > have curr_buf set the first time ? (I might be missing something you th=
is one
> > though).
>=20
> The warning happens when streaming starts and there is only one input=20
> frame available for the VDIC, which needs three fields to work=20
> correctly. So, if there in only one input frame, VDI uses the input=20
> frame bottom field as PREV field for the prediction, and input frame top=
=20
> and bottom fields as CURR and NEXT fields for the prediction, the result=
=20
> may be one sub-optimal deinterlaced output frame (the first one). Once=
=20
> another input frame gets enqueued, the VDIC uses the previous frame=20
> bottom field as PREV and the newly enqueued frame top and bottom fields=
=20
> as CURR and NEXT and the prediction works correctly from that point on.

Warnings by default are not acceptable.

>=20
> > Perhaps what you want is a custom job_ready() callback, that ensure you=
 have 2
> > buffers in the OUTPUT queue ? You also need to ajust the CID
> > MIN_BUFFERS_FOR_OUTPUT accordingly.
>=20
> I had that before, but gstreamer didn't enqueue the two frames for me,=
=20
> so I got back to this variant for maximum compatibility.

Its well known that GStreamer v4l2convert element have no support for
detinterlacing and need to be improved to support any deinterlace drivers o=
ut
there.

Other drivers will simply holds on output buffers until it has enough to pr=
oduce
the first valid picture. Holding meaning not marking them done, which keeps=
 then
in the ACTIVE state, which is being tracked by the core for your.

[...]

> > > +
> > > +	if (ipu_mem2mem_vdic_format_is_yuv420(f->fmt.pix.pixelformat))
> > > +		f->fmt.pix.bytesperline =3D f->fmt.pix.width * 3 / 2;
> > > +	else if (ipu_mem2mem_vdic_format_is_yuv422(f->fmt.pix.pixelformat))
> > > +		f->fmt.pix.bytesperline =3D f->fmt.pix.width * 2;
> > > +	else if (ipu_mem2mem_vdic_format_is_rgb16(f->fmt.pix.pixelformat))
> > > +		f->fmt.pix.bytesperline =3D f->fmt.pix.width * 2;
> > > +	else if (ipu_mem2mem_vdic_format_is_rgb24(f->fmt.pix.pixelformat))
> > > +		f->fmt.pix.bytesperline =3D f->fmt.pix.width * 3;
> > > +	else if (ipu_mem2mem_vdic_format_is_rgb32(f->fmt.pix.pixelformat))
> > > +		f->fmt.pix.bytesperline =3D f->fmt.pix.width * 4;
> > > +	else
> > > +		f->fmt.pix.bytesperline =3D f->fmt.pix.width;
> > > +
> > > +	f->fmt.pix.sizeimage =3D f->fmt.pix.height * f->fmt.pix.bytesperlin=
e;
> >=20
> > And use v4l2-common ?
>=20
> I don't really understand, there is nothing in v4l2-common.c that would=
=20
> be really useful replacement for this ?

Not sure I get your response, v4l2-common is used in many drivers already, =
and
we intent to keep improving it so that all driver uses it in the long term.=
 It
been created because folks believed they can calculate bytesperline and
sizeimage, but as the number of format grows, it always endup wrong, causin=
g the
HW to overflow and break the system at a larger scale.

>=20
> > > +	return 0;
> > > +}
> > > +
> > > +static int ipu_mem2mem_vdic_s_fmt(struct file *file, void *fh, struc=
t v4l2_format *f)
> > > +{
> > > +	struct ipu_mem2mem_vdic_ctx *ctx =3D fh_to_ctx(fh);
> > > +	struct ipu_mem2mem_vdic_priv *priv =3D ctx->priv;
> > > +	struct v4l2_pix_format *fmt, *infmt, *outfmt;
> > > +	struct vb2_queue *vq;
> > > +	int ret;
> > > +
> > > +	vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> > > +	if (vb2_is_busy(vq)) {
> > > +		dev_err(priv->dev, "%s queue busy\n",  __func__);
> > > +		return -EBUSY;
> > > +	}
> > > +
> > > +	ret =3D ipu_mem2mem_vdic_try_fmt(file, fh, f);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	fmt =3D ipu_mem2mem_vdic_get_format(priv, f->type);
> > > +	*fmt =3D f->fmt.pix;
> > > +
> > > +	/* Propagate colorimetry to the capture queue */
> > > +	infmt =3D ipu_mem2mem_vdic_get_format(priv, V4L2_BUF_TYPE_VIDEO_OUT=
PUT);
> > > +	outfmt =3D ipu_mem2mem_vdic_get_format(priv, V4L2_BUF_TYPE_VIDEO_CA=
PTURE);
> > > +	outfmt->colorspace =3D infmt->colorspace;
> > > +	outfmt->ycbcr_enc =3D infmt->ycbcr_enc;
> > > +	outfmt->xfer_func =3D infmt->xfer_func;
> > > +	outfmt->quantization =3D infmt->quantization;
> >=20
> > So you can do CSC conversion but not colorimetry ? We have
> > V4L2_PIX_FMT_FLAG_SET_CSC if you can do colorimetry transforms too. I h=
ave
> > patches that I'll send for the csc-scaler driver.
>=20
> See ipu_ic_calc_csc() , that's what does the colorspace conversion in=20
> this driver (on output from VDI).

int ipu_ic_calc_csc(struct ipu_ic_csc *csc,
                    enum v4l2_ycbcr_encoding in_enc,
                    enum v4l2_quantization in_quant,
                    enum ipu_color_space in_cs,
                    enum v4l2_ycbcr_encoding out_enc,
                    enum v4l2_quantization out_quant,
                    enum ipu_color_space out_cs)

So instead of simply overriding CSC like you do, let userspace set differen=
t CSC
in and out, so that IPU can handle the conversion properly with correct col=
ors.
That requires to flag these in the fmt_desc structure during enum format, a=
nd to
only read acknowledge the CSC if userspace have set V4L2_PIX_FMT_FLAG_SET_C=
SC,
in other condition, the information must be ignored (which you don't).

Nicolas
