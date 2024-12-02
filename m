Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11D51DAC97
	for <linux-staging@lists.linux.dev>; Mon,  2 Dec 2024 17:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733160804; cv=none; b=Y3UHGuz6T+gGwx9tHj8BDNJWUs/JyC0qoJJ6sx4KJdnuTIBUoUGC/z1W3H7dpRSnowpVRArFIUTWOqaZVdjVg5/U2gYGsI0j6fQvnVuWyUP1mZx3t4OavnDUKcwncHj6tJYTlaqbnLLfRrO1/rJaV9K4ESYsuHNpMw7BKuRpDx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733160804; c=relaxed/simple;
	bh=ae8KEDqDkL/cV/eSqqI5LQ5Sz4A4iJSDek5yer/4mas=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c3O2PWzPFLLIqKZTB4UweH24iWKfbUmF2HF3VP5ld1rVDsZi6Uw8EdMBQFCOQ47UIKyT8TnOMFz3JZz7MojZIiJjyCJrY9Wzg/f4ag6CgZR5fl6cJ2acQ7c8ipk85awVkGN81GG+VbR3v+tbFuGWz1tPaVX8L7Cru4zxFg4/nlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JrqA4e9h; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JrqA4e9h"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-72577d3b026so738594b3a.3
        for <linux-staging@lists.linux.dev>; Mon, 02 Dec 2024 09:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733160802; x=1733765602; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hQBhvBNYSI1fNvIhGqfRe5QD/yRE1BVFAKx554DMguU=;
        b=JrqA4e9hhhIVgP3i92d0YJXHj3yi0UsodZvRhck2oan8vIDbHkJ4axz3Ab6J/4gCf8
         ABqApQeLSRpSbeUnUOVfh6Ye4MQY0tFDzPXnlp8LMk1M5gVQbuo8ezaa3NANlcDJX0KY
         EY15klQvT2FjzQbYGOjNhDj6cHFP/Z60oRqYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733160802; x=1733765602;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hQBhvBNYSI1fNvIhGqfRe5QD/yRE1BVFAKx554DMguU=;
        b=a/WSZ3ATMcBxFehh9L9zfvnk66Gv2FAW7mOq6owAlJgu3lC6jBOYW0UcIqW7cI3tKL
         KAzlQPyxcGegX0X0BtUGlXuR5q5vHB8CAMyj7SLrOhHnql+s7mRmR1I1zHMh+RlrzmI4
         MGv79G3AAxzOlVEM3gcfK4tm8MVpu+47UZPCYwroyNDaMLImjTm+akhr5L9s5dWYuvjj
         FgKuUv2U6B3nwT+CrZr1Txra+jNIVykHuM/G0+mjEdRMEC1TDHqG6WNib8R/9RXYlsM+
         DGncig4e3Let3NLonQe70v6QZ6opsuaBO0JDPKrrrUf5MGI0kYiFLR+9Rwq49MZh+LNz
         lPeA==
X-Forwarded-Encrypted: i=1; AJvYcCXyGFjbXbNEb/udRCJbHulMWwp3VboRG4jL4+QUtCXkr47/+w8yi7MM3iiSM22B79/nlYO6mNJIOhpIJ8Sp@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1BcaEtLBYI/CjzcuolXShwbVDgBb3QCGGteY1hTSFeuaz6245
	Dy0xMyfVAJZWDX+vtSM4AU0oYegvwJmS1g9x5H5l+d9W3WtnbHpKxTSYNrVMzA2DPmV8vN7SyvA
	=
X-Gm-Gg: ASbGncsP1e+hFzL01GHsUyDfZaC/3LuDVDF8Uhv2fLLSN5NQoNQJwny4k9UPFaKkYKJ
	7fKma3NoTn+iIWeodK29R++EUOIciUcjBK1lqs6ms5nbwO1X3kYv8l89v8Vb5QfDEz+Xhtw9tYD
	vB2Xkuadme4m7OyIKNv2KCdt6bKJoIIjaLSE1Arj0/PObmNndA5dn6k3rwj1uIf6HMoPufaHMKK
	6Twwy0rqtLg2k8AkmLd9AUiH6K7yPjnv1m4P8kC4orHgdkUjgoQ5yKAgB8uOlZ/KVjmyfyKyjWZ
	4rSzeWVru6uy77T2
X-Google-Smtp-Source: AGHT+IExmZS3Z+ybuI5NQg/n6Y4Z464V5UXlPvAU6xx1bUo6kkFTKwmnnqYF4bkaKDoQOtdm2/5A9w==
X-Received: by 2002:a05:6a00:1d89:b0:725:3bd4:9b96 with SMTP id d2e1a72fcca58-7253bd49d87mr29394577b3a.2.1733160801763;
        Mon, 02 Dec 2024 09:33:21 -0800 (PST)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com. [209.85.215.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72541762eb5sm9043396b3a.27.2024.12.02.09.33.21
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 09:33:21 -0800 (PST)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7fccc26ad01so1221470a12.2
        for <linux-staging@lists.linux.dev>; Mon, 02 Dec 2024 09:33:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUBLECBXwx3DX30u7vuxPGPIBkuvx6TyKfXP+xp2Pd3nAvgWXublye0Cs7WaK3iyFNLfktOYXlXw8GLRwxN@lists.linux.dev
X-Received: by 2002:a17:902:e5d0:b0:215:5a53:eded with SMTP id
 d9443c01a7336-2155a53eff1mr163851165ad.39.1733160379613; Mon, 02 Dec 2024
 09:26:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241202-fix-llvm9-v1-0-2a50f5acfd0b@chromium.org>
 <20241202-fix-llvm9-v1-3-2a50f5acfd0b@chromium.org> <20241202162454.GA2848026@thelio-3990X>
In-Reply-To: <20241202162454.GA2848026@thelio-3990X>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 2 Dec 2024 18:26:07 +0100
X-Gmail-Original-Message-ID: <CANiDSCu+gJb5aTywEnGDQUJYws++9x=be5QLsdSUqS=XjFZGnQ@mail.gmail.com>
Message-ID: <CANiDSCu+gJb5aTywEnGDQUJYws++9x=be5QLsdSUqS=XjFZGnQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: mediatek: vcodec: Workaround a compiler warning
To: Nathan Chancellor <nathan@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Hans de Goede <hdegoede@redhat.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi


On Mon, 2 Dec 2024 at 17:25, Nathan Chancellor <nathan@kernel.org> wrote:
>
>  Mon, Dec 02, 2024 at 03:47:17PM +0000, Ricardo Ribalda wrote:
> > llvm identifies that the SCP_IPI_VENC_H264 and IPI_VENC_H264 are from
> > the same enum type, but their are part of the same ternary operator.
> >
> > vpu_inst.id is of type int, so we can just rewrite a bit the code and
> > avoid the following llvm9 warning:
>
> LLVM 19, not LLVM 9, as the minimum version for building the kernel is
> LLVM 13.
>
> > drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c:597:29: warning: conditional expression between different enumeration types ('enum scp_ipi_id' and 'enum ipi_id') [-Wenum-compare-conditional]
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>
> FYI, Arnd basically sent the same patch October 18 but I guess it has
> not been picked up?
>
> https://lore.kernel.org/20241018152127.3958436-1-arnd@kernel.org/
>
> Hopefully the new media committers model will help patches like that get
> picked up in a more timely manner.

We can take Arnd's patch.

Yeah, this is the kind of patches that the multi committers can really
help with :)

>
> > ---
> >  drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
> > index f8145998fcaf..4786062e879a 100644
> > --- a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
> > +++ b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
> > @@ -584,7 +584,6 @@ static void h264_encode_filler(struct venc_h264_inst *inst, void *buf,
> >
> >  static int h264_enc_init(struct mtk_vcodec_enc_ctx *ctx)
> >  {
> > -     const bool is_ext = MTK_ENC_CTX_IS_EXT(ctx);
> >       int ret = 0;
> >       struct venc_h264_inst *inst;
> >
> > @@ -594,7 +593,10 @@ static int h264_enc_init(struct mtk_vcodec_enc_ctx *ctx)
> >
> >       inst->ctx = ctx;
> >       inst->vpu_inst.ctx = ctx;
> > -     inst->vpu_inst.id = is_ext ? SCP_IPI_VENC_H264 : IPI_VENC_H264;
> > +     if (MTK_ENC_CTX_IS_EXT(ctx))
> > +             inst->vpu_inst.id = SCP_IPI_VENC_H264;
> > +     else
> > +             inst->vpu_inst.id = IPI_VENC_H264;
> >       inst->hw_base = mtk_vcodec_get_reg_addr(inst->ctx->dev->reg_base, VENC_SYS);
> >
> >       ret = vpu_enc_init(&inst->vpu_inst);
> >
> > --
> > 2.47.0.338.g60cca15819-goog
> >



--
Ricardo Ribalda
