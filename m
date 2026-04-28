Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BB6286430
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 13:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777382121; cv=none; b=ZQVcm2+7TNm1yHvLqg8Uz7Lwph0pVuomhel1FkGyzYZYUARtj1HyiKg7KaYPy1cxaqIl0Z4jpDya2MYYHTffQEq6BlxYvon8AeCmDR9Lgz7l+dsXFqRdEWrsEVL8itJLco4b6+A1gpZQ9ba6APtoM83YpLSopI6EHSzrxkykAo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777382121; c=relaxed/simple;
	bh=7rCBvFe5ZW/XJkf03IpksDTSf8oKsP5JtlotqMrX6Ps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qt+2TIqzM1UWosUeaxd/GlQTV6ffqXf4S0PwkVC29UpfRvGJXOkBmalaQicZ+efLfJh1O3sii5vobskn4w8CcSzddzhJP1CMokE0+22g634a5cmfyzS1Ofi9ot3GQ6ymhtf2cJHK+C+QQ4xUmS/369BTYWJdYyqQh1ltdFJTpAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WSf2gOt6; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WSf2gOt6"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-bad54961385so860630766b.2
        for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 06:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777382118; x=1777986918; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D2C6/0LvJt0bQD4KBxtPX5+eWPSK6gQEy0L1ksMasWs=;
        b=WSf2gOt681umGPP0TbQzfuxtK25dE4LuMoTvf3sGf1eRWkqkTiGH/apStTE5dw7xvw
         6PicVi9xL4JWZ5zUsw9QaRsya8YhWyVtcTYEnBq92/HKMZ45l3GVV8AYTMRVjSW+FVeT
         rgGkgz9qAeP9zMWfjFw2IOH965HngjKXfSAAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777382118; x=1777986918;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D2C6/0LvJt0bQD4KBxtPX5+eWPSK6gQEy0L1ksMasWs=;
        b=IdCpjI/PK5QuHMKI9hWGP6ZyqBrwYBZj6VTYX3fk5Z/eogosmSQIxIIUAEhdZjWB7e
         zI4Av5s4EGmLdkpYfOenGvf9p+iZArUpasjw1VWsdz2m5cokMA8Gtv623BeH+D4hLnok
         pDHYlmSNz40CgKrlO/pwlYsZ/mDPkIcQmp813mCyKRZDdxFf9gMJuRr5hQvjxlIti4NN
         qenvAMYUU3goMJXVlrhUAKeHnBlwIephSkuZvq+u8v6y76HpdoOk7llHTwIUl1V9FMOT
         mLKoBE24kHCU31IFrq9Q5Lq60UVLMrIKx8PVeThOUDFDqdximSNyGkHmJQIX5RTw+q2T
         D5gg==
X-Forwarded-Encrypted: i=1; AFNElJ+ojo62gZUOGC82Rx7MTL0Z9fSXTpGtyVshvuWAifyzt0QqA8tZpJE32h3C9XRaG3oc456eRsZm1fOxPWH3@lists.linux.dev
X-Gm-Message-State: AOJu0Yxi5JJJpxMcF6MC9grvL8bB6FH5npHFERMhJW2pOY4diF2H695+
	NN08a+NvAG8iZR7+VsRDj0PGsv+bfMRxlTb5XbpctL7iMF34zeS1+ayJQKRYxshQ4dMbRO0ORtS
	NO/7T8FUY
X-Gm-Gg: AeBDiesfX5n4pCMZjtjIZMjQsRvfdg30aTWtNNM1otYOpdooMUFqcp7PgBZV2KOLMZl
	QONOE42aAbbYWVwX+KHKs2qchk5PMry6r9BzfqdqtV+JLKraFkM3GaNb0KGSyKLNIB6tcb3s5xU
	zoiY8HSDM/JOWpU4xWf1v97NELpYdBIKJzO0z7RyNsaSlqVHmAi/TTgHGdn0MKxR436O7iGy1/E
	Y0ec1/hQ+wVEJrYpqrvpJekzdmm4c3J2RdHOSnF58Zh3EPO0LXboby+5jttKjom9RqJxOB19C0p
	dYq5BvLbGHnJdG2pmLgZ/ctI+JNzqEqkNJ4r9Sb4EsqsbZhgSWAMhT4znlM/cjVKBnpGiwqly42
	nQrPwgffbzVtpXxX19tszWKZJcPcEA7mr7gHLMunEggggnAhnk3H63cvAdAhtEw1Cg8eII2YNSC
	GX5lDhqZjjmuLvMKgCBr4hU4eYP8Z+MndJSCJPzNLF54sOb6NBKN+BFoJ+9cIo3ZzX0bHGFJs=
X-Received: by 2002:a17:907:9453:b0:ba5:bef2:2ab0 with SMTP id a640c23a62f3a-bb8023bd37emr201661266b.20.1777382118010;
        Tue, 28 Apr 2026 06:15:18 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80b2aded9sm102740566b.41.2026.04.28.06.15.17
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 06:15:17 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-bad54961385so860622866b.2
        for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 06:15:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ96iigen+seSvhve1lMrL7ekuxkquLBQA1Muod+Gptgxmn3sZDSQ12F9Zs3rNh4XB4B+s9ry2hthLUfPehK@lists.linux.dev
X-Received: by 2002:a17:907:6e86:b0:ba8:e7b5:39ad with SMTP id
 a640c23a62f3a-bb7fea77794mr174614466b.0.1777382116061; Tue, 28 Apr 2026
 06:15:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org>
 <20260428-smatch-7-1-v1-6-46890dffb611@chromium.org> <20260428131038.GA120836@killaraus.ideasonboard.com>
 <CANiDSCvaS-Jz9m5H2OHo2akD-o-sffsZyEw6_CrfUhD1BN+m2g@mail.gmail.com>
In-Reply-To: <CANiDSCvaS-Jz9m5H2OHo2akD-o-sffsZyEw6_CrfUhD1BN+m2g@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 28 Apr 2026 15:15:03 +0200
X-Gmail-Original-Message-ID: <CANiDSCv1BWEL0poGaW0mBVRfPt9575GC07zea8U0eVaZzjSr0w@mail.gmail.com>
X-Gm-Features: AVHnY4JPkz8xt7BKytXFwEOdFJ1vkSGeuN-TQA2PjEQJga7epuURPun_hcwqZ64
Message-ID: <CANiDSCv1BWEL0poGaW0mBVRfPt9575GC07zea8U0eVaZzjSr0w@mail.gmail.com>
Subject: Re: [PATCH 6/6] media: amlogic-c3: Add validations for ae and awb config
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>, 
	Jackson Lee <jackson.lee@chipsnmedia.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	Tianshu Qiu <tian.shu.qiu@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Keke Li <keke.li@amlogic.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 28 Apr 2026 at 15:14, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Hi Laurent
>
> On Tue, 28 Apr 2026 at 15:10, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > Hi Ricardo,
> >
> > Thank you for the patch.
> >
> > CC'ing Jacopo.
> >
> > On Tue, Apr 28, 2026 at 12:41:12PM +0000, Ricardo Ribalda wrote:
> > > Avoid invalid memory access if the zones_num is bigger than
> > > zone_weight.
> > >
> > > This patch fixes the following smatch errors:
> > > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
> > > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
> > > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
> > > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
> > >
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/platform/amlogic/c3/isp/c3-isp-params.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> > > index 6f9ca7a7dd88..42d780f684d1 100644
> > > --- a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> > > +++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> > > @@ -104,6 +104,8 @@ static void c3_isp_params_awb_wt(struct c3_isp_device *isp,
> > >       c3_isp_write(isp, ISP_AWB_BLK_WT_ADDR, 0);
> > >
> > >       zones_num = cfg->horiz_zones_num * cfg->vert_zones_num;
> > > +     if (WARN_ON(zones_num > C3_ISP_AWB_MAX_ZONES))
> >
> > This is triggerable by userspace, it shouldn't result in a WARN_ON().
> > Ideally the horiz_zones_num and vert_zones_num should be validated at
> > buf prepare time, and an error should be returned to userspace. That
> > will likely not fix your smatch issue though, I don't think it will be
> > able to understand that the values have been validated.
>
> Based on the warnings from the other drivers I also suspect that if
> you have validated the data somewhere else smatch will understand it.
I mean that

will *NOT* understand it.

Sorry

>
> Even if you add a validate function I would suggest to keep the
> WARN_ON(), ideally it should never trigger, and if it triggers it will
> get a lot more attention to get it fixed.
>
> >
> > Jacopo, do we need to add a validate function pointer to
> > v4l2_isp_params_block_type_info ?
> >
> > > +             zones_num = C3_ISP_AWB_MAX_ZONES;
> > >
> > >       /* Need to write 8 weights at once */
> > >       for (i = 0; i < zones_num / 8; i++) {
> > > @@ -220,6 +222,8 @@ static void c3_isp_params_ae_wt(struct c3_isp_device *isp,
> > >       c3_isp_write(isp, ISP_AE_BLK_WT_ADDR, 0);
> > >
> > >       zones_num = cfg->horiz_zones_num * cfg->vert_zones_num;
> > > +     if (WARN_ON(zones_num > C3_ISP_AE_MAX_ZONES))
> > > +             zones_num = C3_ISP_AE_MAX_ZONES;
> > >
> > >       /* Need to write 8 weights at once */
> > >       for (i = 0; i < zones_num / 8; i++) {
> > >
> >
> > --
> > Regards,
> >
> > Laurent Pinchart
>
>
>
> --
> Ricardo Ribalda



-- 
Ricardo Ribalda
