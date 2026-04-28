Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72493FFAC0
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 13:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777384208; cv=none; b=gKmXsN39oF1pdQSzCQAaanUF9S3TadiD3ZZIFwCQu6l7AaUGAZEODoVjOXQg9C8FvPsYsHBIbQxqB63NRxwE29LiQrUAkPkJe46c12gETNAt4wKJAOLTJKPwYOTBBPtzzOzMQnoOVnFHwiNubMTeInxhEzCyeylz/kqJnqoMYgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777384208; c=relaxed/simple;
	bh=SKUmRosHf8cXsO4qmgxOkffPaH52PyMXK7TMPW4tXYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=amW9gyBwdTpbtFUXdakCynwDealB0e78IHLzMQcCvABfzjpKikPdAAKu2YWWrXQEkpRA36i0DchQ4Muez3KY1+g3ufT8j5hicU3nG99SrXJ24ThI5HOlLO4Z1dhrjqaLYAVCOtaJm9wQDmg/Hbtef/NRxf4q3m4DaDxNCSiYcOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AIZofI81; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AIZofI81"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6788838d543so10110043a12.1
        for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 06:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777384205; x=1777989005; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PC/PQI2pFt/lgK3OA060nn1/otX3Vo5UtapngrIT2LQ=;
        b=AIZofI813iQh/z9HV7XQFkRZevajPUbV2SlO3/llLyqvn3IPk1/ip3HeFSz7XS3Txo
         O/YxSaNAX7Hs7rZX+lrUef3t3b3Ifm54fadTqwqlTQxgrw6K9/69z2r+2ogJQSrSNfDH
         4Ymd606nfIkmIpTFICKvRCoqcpQF/Uc0/nToE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777384205; x=1777989005;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PC/PQI2pFt/lgK3OA060nn1/otX3Vo5UtapngrIT2LQ=;
        b=jsTroTqcJ+Hss4fGWMz32yRcVpsPbS33nBbUxXciuLHDhsLwJfaPMxLi5v4HeBg3dB
         Dz9xIczUs3CfFAFuWtkuqR6yKJZ2AfQ8i77cLXFVTiNXPRK2luYgIJsxQvaGUEZz+oD9
         feIipcjFfE1AYP0lvae1FjlC4Itl4G5bgCLstn1iHelc/3uKxCzdnMQVcO5UFy74ARFG
         7RZOLtbPnQqdYqMWzpEnWda/aNj194vkqR7jOX0vHzpWU+Soh9V6tmE4fnkjzXTuYw0s
         D9smbITpNlQdaIQSft/L1m6SkffSlAWxHBxL9E3kNrd43u3YwlzVSuGvVGfyMdjdeTE3
         hs7w==
X-Forwarded-Encrypted: i=1; AFNElJ/PlYBL3JR6VTeCDJv+UzjAERVpXHQLrIuLH5N5ScEeHmU1Jo+BK0v9GbTLkfCH7T5qG7wQcrswAR1IgxHe@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7/oOX/8xoZLPwCinWdlSg27BWs9aRp/k2PKxUZljNPNCAKQbt
	Y40dBV/opQig7szvh4ekZTRNhm9ulsIEG7GG0MqtcoXJSzqKwZEjPr58KWwOvt6kF53WGY/mtMV
	fEi+wwFpu
X-Gm-Gg: AeBDieucGfQ3B3BTkbtvTxNG6U96e6jgAWK35uZPOOkRDb4gJHwR+5ToAD4qxA+FggU
	Qw75h8Gf98sVn51hiWG8151PBdJKt67TrRyNVSTatBqZnqLH8dU4QLQb4Q/kG6aap/5sZswwb1g
	geHQtSyWjkfZiq3AlrusUSgOffqknY6VmhUiEYG679H7Af9X+8chSP9gn8qRBZFiXjYHmF4Gh/i
	5QtsWpB5QuBXI8jTTiHFpvFBz1Pj38QWyzjkI0amwGiCEDCSJAvZUYGDTi7DgIpQU2f2TUqDw6w
	FO7nc03zrPlfs4zke1InLIfcJnplBg/XE8sI7q1M+Giujy7fWN+V06wespS5Ix7awSZsD3mbjkG
	dZuAw+ej5Dc0ZsQvJ6oBRehvw1ieJpNUBq0FP1J6VcO2cf1kUzjtAIReDDR8PLXPDpZs+ea1MnZ
	3D+qx1eKfYwWASG/vRkGyCiV6XEILAKL4+1wHYNj9EIPO6DEXKZ3zcXRfrbtmpcVjQzstOcDw=
X-Received: by 2002:a17:907:3e9c:b0:ba7:636d:e285 with SMTP id a640c23a62f3a-bb8022c14ebmr193744666b.7.1777384204576;
        Tue, 28 Apr 2026 06:50:04 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80b2adef5sm107845466b.40.2026.04.28.06.50.03
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 06:50:03 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-676d8582a13so13373242a12.0
        for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 06:50:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9yJl8MRtE0XL6NQ4IKGxYeWNcd92FTEwAB+hQg5g/cXrc8vXMQ3LqyuQA5Fg4jXpTB8LRj+GSZgXC88S0e@lists.linux.dev
X-Received: by 2002:a17:906:ef04:b0:b9d:3f8b:1dec with SMTP id
 a640c23a62f3a-bb8042457f4mr203399466b.28.1777384201977; Tue, 28 Apr 2026
 06:50:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org>
 <20260428-smatch-7-1-v1-6-46890dffb611@chromium.org> <20260428131038.GA120836@killaraus.ideasonboard.com>
 <CANiDSCvaS-Jz9m5H2OHo2akD-o-sffsZyEw6_CrfUhD1BN+m2g@mail.gmail.com> <20260428132649.GD120836@killaraus.ideasonboard.com>
In-Reply-To: <20260428132649.GD120836@killaraus.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 28 Apr 2026 15:49:49 +0200
X-Gmail-Original-Message-ID: <CANiDSCv=sHfJAZNcmXkubAvjkMy4cL5Ez=zq9MRxTTRXRPECyQ@mail.gmail.com>
X-Gm-Features: AVHnY4L0RRCRK9m_wQVkfe94sTYFyPwo5lxWCFL-9QFE8Q4JKGGSP1NdZwWEX2g
Message-ID: <CANiDSCv=sHfJAZNcmXkubAvjkMy4cL5Ez=zq9MRxTTRXRPECyQ@mail.gmail.com>
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

On Tue, 28 Apr 2026 at 15:26, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Apr 28, 2026 at 03:14:21PM +0200, Ricardo Ribalda wrote:
> > On Tue, 28 Apr 2026 at 15:10, Laurent Pinchart wrote:
> > > On Tue, Apr 28, 2026 at 12:41:12PM +0000, Ricardo Ribalda wrote:
> > > > Avoid invalid memory access if the zones_num is bigger than
> > > > zone_weight.
> > > >
> > > > This patch fixes the following smatch errors:
> > > > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
> > > > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
> > > > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
> > > > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
> > > >
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > ---
> > > >  drivers/media/platform/amlogic/c3/isp/c3-isp-params.c | 4 ++++
> > > >  1 file changed, 4 insertions(+)
> > > >
> > > > diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> > > > index 6f9ca7a7dd88..42d780f684d1 100644
> > > > --- a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> > > > +++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> > > > @@ -104,6 +104,8 @@ static void c3_isp_params_awb_wt(struct c3_isp_device *isp,
> > > >       c3_isp_write(isp, ISP_AWB_BLK_WT_ADDR, 0);
> > > >
> > > >       zones_num = cfg->horiz_zones_num * cfg->vert_zones_num;
> > > > +     if (WARN_ON(zones_num > C3_ISP_AWB_MAX_ZONES))
> > >
> > > This is triggerable by userspace, it shouldn't result in a WARN_ON().
> > > Ideally the horiz_zones_num and vert_zones_num should be validated at
> > > buf prepare time, and an error should be returned to userspace. That
> > > will likely not fix your smatch issue though, I don't think it will be
> > > able to understand that the values have been validated.
> >
> > Based on the warnings from the other drivers I also suspect that if
> > you have validated the data somewhere else smatch will understand it.
> >
> > Even if you add a validate function I would suggest to keep the
> > WARN_ON(), ideally it should never trigger, and if it triggers it will
> > get a lot more attention to get it fixed.
>
> We could keep the WARN_ON() if we first validate the data, but the
> driver doesn't currently :-/ I expect there could be more similar
> issues.

Yep, I got that. I will let you or Jacopo figure out the best way to
implement the validation in buf_prepare. If you do not have time to
implement it now I will just remove the WARN_ON in the interim... but
from my experience we only fix stuff if we get an oops.

Regards!

>
> > > Jacopo, do we need to add a validate function pointer to
> > > v4l2_isp_params_block_type_info ?
> > >
> > > > +             zones_num = C3_ISP_AWB_MAX_ZONES;
> > > >
> > > >       /* Need to write 8 weights at once */
> > > >       for (i = 0; i < zones_num / 8; i++) {
> > > > @@ -220,6 +222,8 @@ static void c3_isp_params_ae_wt(struct c3_isp_device *isp,
> > > >       c3_isp_write(isp, ISP_AE_BLK_WT_ADDR, 0);
> > > >
> > > >       zones_num = cfg->horiz_zones_num * cfg->vert_zones_num;
> > > > +     if (WARN_ON(zones_num > C3_ISP_AE_MAX_ZONES))
> > > > +             zones_num = C3_ISP_AE_MAX_ZONES;
> > > >
> > > >       /* Need to write 8 weights at once */
> > > >       for (i = 0; i < zones_num / 8; i++) {
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
