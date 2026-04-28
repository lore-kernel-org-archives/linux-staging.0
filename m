Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2058E4657FA
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 13:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777382079; cv=none; b=AeHy2O3usB3p7HNFxDw3b5md07BMmgGnnSbkmBKpPuy9R0dKL7y/HhhzhmYykmC+Nj6J3prQkOmaovEyNSFPQmcYAy7G74k5715NnGyg7j/FB0zjT45/3fzYs1oYt6b498VRw69rqaLQZ80BPMTTIO8VrAQ2H4/CJObT1KN4QlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777382079; c=relaxed/simple;
	bh=DARNp76SP4VuPcL8MoUOAYG40IhuB3WdIRau0JvBD6U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PCh43POcnNFKJfM0T8iN9XCggJYBPvvhXfsicjNgCsacVem07wCcKaXoArbTJf7mCtnkL+/dg6ugJqM79P6LlwAHKUiuYK2/MEnsdyWG6spiXGQwd7Pm1M0gMERpbydtj4DtGmKh5tqtqzTITI0jYxzIo+r0BhGDaocsYri3Bhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bfzTSEyz; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bfzTSEyz"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ba7a1cc0380so1900473666b.2
        for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 06:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777382076; x=1777986876; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F+G3TLEROPGFED8nEpk/bFYKEpd/tD5vfNBgNLoHd+A=;
        b=bfzTSEyzFBiDiwzGIhfGU8cazVXmnboePMpEeM3cdahsUoqyCevQYfpRs918NQ+ls4
         H7aXeL554HPILEuF6WgcH2BRKOjDm27MYUUCIzk7fVlrOFIlY+HOsypTmFZz6l20n359
         nnjkWYUiCp4NAnhiZlobhIeGfZphSGz9YRCss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777382076; x=1777986876;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+G3TLEROPGFED8nEpk/bFYKEpd/tD5vfNBgNLoHd+A=;
        b=Z7b5cdy4aoJSdAOgGlMXt4eTJCV642xgH816yH2vcjYrb295QkytMgZ2GSS6FkYd1V
         gjE5IEunITPdYlU4zc+sUWYXCUf5Q5GIUiQt2t24T4q9vsIK1mDF62aazIy6iFBaT8oE
         AHJ7h6eZPB+U6LtRYYGDjA1/8nnwDrwNJ2qOwYCFeuLg2NfFQE0vMUabX14UCwyNT9uL
         blDltTbeScGQNV1C3IakBOnfvLULyVGROpx8TzDPWYRSkj11atDu5XtFs0TMkEuiLZ0s
         ARG5O/Gpy7yE3MHYyuOdLgjWu6HhrALFkDA1mbcxRGNGTMDelEFn4pFKT7+o6WWSU5+w
         uf5g==
X-Forwarded-Encrypted: i=1; AFNElJ+cz3zEt51u++6oytA2Jlvl5pVCBgaKIFrEBkaUeJy9kWLC6CfWCL//gyMgPiNybqpQJYb6QdY9vLmlEJq/@lists.linux.dev
X-Gm-Message-State: AOJu0YwpLhyjFtp7uzqXYFjxhNafmTFVR7gFBcOwvMTVWELVcm2Hm3hJ
	fN/1/x49I015bW7XXyDuUGnYo/K4f47pi929F4980y+VOfzXQ5RsQ0i/IlEZEEb2QAN+Ky9fccc
	uyJAH7mYJ
X-Gm-Gg: AeBDietFGmfXUri4CvytKxz47LmTFsR8464bZHXOZZ7rGhH3qmYufKNZycPok0FO0ee
	FqZeb430sdlwA9cB4nhTo+sXiGvT4ycqUHUAy+gnJTaJkjXivcNghjz2L7NqzdbgufoBwVi9JJM
	2sqOSVf8I0CjrK1aESj7Jq2a4Ei/07cSG0MaF98Et99F/pHgtfC7VpoMJrKwJJkCiI2570QFkf/
	u6nzvREHRFm1DlwEY+E4GkxxLMcC1RzhuDSU5Rxs60KNARq53Lh2shDCA395si7nIEpJd8/vKFa
	oeO7m6pgiOrAIRv5eN7JGMYQFDJ/8L85vGhhPzxQdH9zutscf5iE0UeYkBhbWoGMPdbBXgvissd
	Vkk1mdhQsItWUgAhoAi5o8tyeGvLNIFm1Z3gjIUOWorJ+3FqV3JUt1hXcU1D2o9t0I0bvF2rPnw
	EssNjog57nBNS4rDgdShUinGzkSXS4bzFtvvC9CtKTtj1Q7fvy2e5VPwLVzbDnIeDMkU8Rvq8=
X-Received: by 2002:a17:907:e146:b0:bac:6d85:255c with SMTP id a640c23a62f3a-bb801bce7d6mr120471566b.21.1777382075763;
        Tue, 28 Apr 2026 06:14:35 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80853c8a1sm101356766b.5.2026.04.28.06.14.34
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 06:14:35 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b9c3a9fe80fso1683487166b.3
        for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 06:14:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8OHx8vG5D37T5Y5njVJ8jFh1742QQQG8+dOXGqhiL1o/pVNQBnxxQDFusezM6jcmDT65M307LMYWsA3+3j@lists.linux.dev
X-Received: by 2002:a17:907:e84b:b0:ba5:dfa6:1e8e with SMTP id
 a640c23a62f3a-bb80100e719mr185594266b.5.1777382073735; Tue, 28 Apr 2026
 06:14:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org>
 <20260428-smatch-7-1-v1-6-46890dffb611@chromium.org> <20260428131038.GA120836@killaraus.ideasonboard.com>
In-Reply-To: <20260428131038.GA120836@killaraus.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 28 Apr 2026 15:14:21 +0200
X-Gmail-Original-Message-ID: <CANiDSCvaS-Jz9m5H2OHo2akD-o-sffsZyEw6_CrfUhD1BN+m2g@mail.gmail.com>
X-Gm-Features: AVHnY4LFHGfHhfWwxoG7ukOxUIkuuRj7xqs5l6SQcLw4hcHZ-Knfdsk_-QkY82U
Message-ID: <CANiDSCvaS-Jz9m5H2OHo2akD-o-sffsZyEw6_CrfUhD1BN+m2g@mail.gmail.com>
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

Hi Laurent

On Tue, 28 Apr 2026 at 15:10, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> CC'ing Jacopo.
>
> On Tue, Apr 28, 2026 at 12:41:12PM +0000, Ricardo Ribalda wrote:
> > Avoid invalid memory access if the zones_num is bigger than
> > zone_weight.
> >
> > This patch fixes the following smatch errors:
> > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
> > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
> > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
> > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/platform/amlogic/c3/isp/c3-isp-params.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> > index 6f9ca7a7dd88..42d780f684d1 100644
> > --- a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> > +++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> > @@ -104,6 +104,8 @@ static void c3_isp_params_awb_wt(struct c3_isp_device *isp,
> >       c3_isp_write(isp, ISP_AWB_BLK_WT_ADDR, 0);
> >
> >       zones_num = cfg->horiz_zones_num * cfg->vert_zones_num;
> > +     if (WARN_ON(zones_num > C3_ISP_AWB_MAX_ZONES))
>
> This is triggerable by userspace, it shouldn't result in a WARN_ON().
> Ideally the horiz_zones_num and vert_zones_num should be validated at
> buf prepare time, and an error should be returned to userspace. That
> will likely not fix your smatch issue though, I don't think it will be
> able to understand that the values have been validated.

Based on the warnings from the other drivers I also suspect that if
you have validated the data somewhere else smatch will understand it.

Even if you add a validate function I would suggest to keep the
WARN_ON(), ideally it should never trigger, and if it triggers it will
get a lot more attention to get it fixed.

>
> Jacopo, do we need to add a validate function pointer to
> v4l2_isp_params_block_type_info ?
>
> > +             zones_num = C3_ISP_AWB_MAX_ZONES;
> >
> >       /* Need to write 8 weights at once */
> >       for (i = 0; i < zones_num / 8; i++) {
> > @@ -220,6 +222,8 @@ static void c3_isp_params_ae_wt(struct c3_isp_device *isp,
> >       c3_isp_write(isp, ISP_AE_BLK_WT_ADDR, 0);
> >
> >       zones_num = cfg->horiz_zones_num * cfg->vert_zones_num;
> > +     if (WARN_ON(zones_num > C3_ISP_AE_MAX_ZONES))
> > +             zones_num = C3_ISP_AE_MAX_ZONES;
> >
> >       /* Need to write 8 weights at once */
> >       for (i = 0; i < zones_num / 8; i++) {
> >
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
