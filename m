Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD52035AC1E
	for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 07:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777446977; cv=none; b=OUG2yShjQVR13RC5JLjbdw7+1tVE8CQoKlaoOC3quzXxMgdx6B84P5Vxbaiax49TNURCvuYu3fS64ceHTfMDwEX2d9WgQFo6+uQ/StwfnaFSIzpJINHbzj1skh1A+Pnu3gdR+ZT7bU9+w1BJ5inYJwOn1exo4gmE0y6JKRPlvk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777446977; c=relaxed/simple;
	bh=xB2ti4ZBr1oXFjM8YFkh0Dg/OOaBcI02P4dFnj/2cbs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hvwzr9I2QpEwlrm4YqzPZC6JOqgTollCrM0cyEUNb3b+NeKLJH4e6Sc1AhXKgsj0B48Igzxg07LHELwU8TPB2yMnaQngzxb0MwtD1M7TG20AE3+0HwYL1FRjJzlPFd0I16/GmBwufCA0bV/mfIwpFTi+lamSpfSOYopawXenKo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hvqMvptR; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hvqMvptR"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b9358dd7f79so940115266b.1
        for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 00:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777446974; x=1778051774; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zH4LOP+SlYMykRy8/Pf04NdQ0dQW87QZTuybjlYT/Nw=;
        b=hvqMvptRSkyy/I8+KvBiAgUcK23FgEIbbFYM/i+eqam/GaRT+C0Ep1ipUvv7tmZFvh
         mLxhI+IKwnTx8Mp3idRCGnLQI/Q1/NHtZAemOX1E8bZO9DpGMarVGDc/j7aDfRCuceLv
         Jq/LU/7tYVYVLQ0ohv8O29t7uVEHdwSahRZOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777446974; x=1778051774;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zH4LOP+SlYMykRy8/Pf04NdQ0dQW87QZTuybjlYT/Nw=;
        b=Rfp+x/EqKQXwSQ+9jW5CL7QoDMXdOpmU8VLF3U2EYZp2s5TR4bKKMKz9M7K3M39ywV
         27LWmKbvbSGbHyYR1ZoGPyepp5kmpp6QfJm/2aw1bN4/50syUCNHqgYeCsAy/U3GdGwK
         Lx82fdfVXd24B/xPc9NKeNxNs1uHkEpvJs8Hcfz8Dm7OmIW6Tx52gFiggAdsRm/zy9/C
         1YM/NQxBDpdHg7zVTZVFD3MEQiWMXEoQfTFFHP8dxugogXnfp/DiLDjLdWFYBJq1WJeR
         GtUowjyORS/9v4Ero4o0ywWEpdrpvGRYJTNn2ThBoBVhSiRFWVRUTAqsKkcYkAhebFnV
         2xSA==
X-Forwarded-Encrypted: i=1; AFNElJ8Ka+wh3StmBbPErHOQANryKmSmbEpeF3tCc23Ded/WT+i44um4g9eEzgibK+G43VhsdNFC8s5APwvp3O7u@lists.linux.dev
X-Gm-Message-State: AOJu0YyM8vI2BY5WKHbDwlKdaFZDhzDMfNdfQM4aaAHlVpf4uQG8cPJq
	wyCfCuLHzg+f888dQeIIsDZKm6SwhrZTuMOB2s97NBYweEckh09psuPlztjOvhMiTs0nXxmns/8
	LC+zT3ASz
X-Gm-Gg: AeBDiespCzmKbgOXIeOy5tNVyw5NrZUrO4fG4x33sTMyPutvHxCShBFmyekH6Mjo+DQ
	rs/pH5tCsHCa7TNq/mxRuaR/8BFbUT21R7JlcA/aAwYumbSjWQ6xbWCPwenMyxJwg7xCTJPmnGF
	PLIRNqFowOpm6r5bkKF9PVczPE+nvr6kTpUWVVkpWysU6xO5MOxKK8MNXFJ/8iVMWsCLwO1Ps18
	hrwKay1HveJMDx9RLIumEir5b0ExMnELRGYQ7sd/DLREDJYt0S96AgxewrH2TZ0a/Z0FZOVn1vY
	2NHu/UYrs20E5aFFaK6LcSKRdc7ud0Yez0bXrdRuk5D09x+SnNqm0KJFeCKH9psSdwvC8tMjM9U
	B70IY6CcEHEaIHvBjZVGFEkn7WeBak8orW5dkAUxElOmWJxhZHcMmCnpwc8xIIU3PL4DlWGi6rQ
	3ERbrtpDU88AiNUTjjsdDMg5bwwl0BBUhuMY4nxCuwAeb+2b/vnV3XTF1UTceqzC/BSEQFdR4=
X-Received: by 2002:a17:907:928d:b0:ba7:f5fd:eded with SMTP id a640c23a62f3a-bb80377e281mr416454966b.29.1777446973508;
        Wed, 29 Apr 2026 00:16:13 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb985e1d589sm48965566b.52.2026.04.29.00.16.12
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 00:16:12 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-66ba9dfe83bso15258931a12.3
        for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 00:16:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8TdFDMUAuXrMSED5TxlC4C2nZJjlWSwINOnLN/BdUrYTD5l4DRdt9wpUfJ/Tr2ntkovXQP366y9wVIzYsd@lists.linux.dev
X-Received: by 2002:a17:906:ef0c:b0:ba7:62f:9fa6 with SMTP id
 a640c23a62f3a-bb8018de3eemr353915866b.2.1777446971661; Wed, 29 Apr 2026
 00:16:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org>
 <20260428-smatch-7-1-v1-6-46890dffb611@chromium.org> <20260428131038.GA120836@killaraus.ideasonboard.com>
 <CANiDSCvaS-Jz9m5H2OHo2akD-o-sffsZyEw6_CrfUhD1BN+m2g@mail.gmail.com>
 <20260428132649.GD120836@killaraus.ideasonboard.com> <CANiDSCv=sHfJAZNcmXkubAvjkMy4cL5Ez=zq9MRxTTRXRPECyQ@mail.gmail.com>
 <afGgKdauTs8GFoWg@zed> <CANiDSCtr6RiuupmPjHphcxtCrU5iKzFyp+BF9JLyOpb2hc2-cw@mail.gmail.com>
 <afGqxcABkv2D3DWG@zed>
In-Reply-To: <afGqxcABkv2D3DWG@zed>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 29 Apr 2026 09:15:59 +0200
X-Gmail-Original-Message-ID: <CANiDSCsj6yPX1s5WTKbbhT3QA+hhrJHNwjKb5ntaC4v2qo13KQ@mail.gmail.com>
X-Gm-Features: AVHnY4Jqv-PVWRQnGBllidZi6sXJbggmK90XBD2px7fsJee02wPtsN-yZmn7sk4
Message-ID: <CANiDSCsj6yPX1s5WTKbbhT3QA+hhrJHNwjKb5ntaC4v2qo13KQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] media: amlogic-c3: Add validations for ae and awb config
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>, 
	Jackson Lee <jackson.lee@chipsnmedia.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	Tianshu Qiu <tian.shu.qiu@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Keke Li <keke.li@amlogic.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Jacopo

On Wed, 29 Apr 2026 at 08:55, Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> Hi Ricardo
>
> On Wed, Apr 29, 2026 at 08:44:11AM +0200, Ricardo Ribalda wrote:
> > Hi Jacopo
> >
> > On Wed, 29 Apr 2026 at 08:15, Jacopo Mondi
> > <jacopo.mondi@ideasonboard.com> wrote:
> > >
> > > Hello
> > >
> > >    thank you Ricardo for the fix
> > >
> > > On Tue, Apr 28, 2026 at 03:49:49PM +0200, Ricardo Ribalda wrote:
> > > > On Tue, 28 Apr 2026 at 15:26, Laurent Pinchart
> > > > <laurent.pinchart@ideasonboard.com> wrote:
> > > > >
> > > > > On Tue, Apr 28, 2026 at 03:14:21PM +0200, Ricardo Ribalda wrote:
> > > > > > On Tue, 28 Apr 2026 at 15:10, Laurent Pinchart wrote:
> > > > > > > On Tue, Apr 28, 2026 at 12:41:12PM +0000, Ricardo Ribalda wrote:
> > > > > > > > Avoid invalid memory access if the zones_num is bigger than
> > > > > > > > zone_weight.
> > > > > > > >
> > > > > > > > This patch fixes the following smatch errors:
> > > > > > > > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
> > > > > > > > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
> > > > > > > > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
> > > > > > > > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
> > > > > > > >
> > > > > > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > > > > > ---
> > > > > > > >  drivers/media/platform/amlogic/c3/isp/c3-isp-params.c | 4 ++++
> > > > > > > >  1 file changed, 4 insertions(+)
> > > > > > > >
> > > > > > > > diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> > > > > > > > index 6f9ca7a7dd88..42d780f684d1 100644
> > > > > > > > --- a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> > > > > > > > +++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> > > > > > > > @@ -104,6 +104,8 @@ static void c3_isp_params_awb_wt(struct c3_isp_device *isp,
> > > > > > > >       c3_isp_write(isp, ISP_AWB_BLK_WT_ADDR, 0);
> > > > > > > >
> > > > > > > >       zones_num = cfg->horiz_zones_num * cfg->vert_zones_num;
> > > > > > > > +     if (WARN_ON(zones_num > C3_ISP_AWB_MAX_ZONES))
> > > > > > >
> > > > > > > This is triggerable by userspace, it shouldn't result in a WARN_ON().
> > > > > > > Ideally the horiz_zones_num and vert_zones_num should be validated at
> > > > > > > buf prepare time, and an error should be returned to userspace. That
> > > > > > > will likely not fix your smatch issue though, I don't think it will be
> > > > > > > able to understand that the values have been validated.
> > > > > >
> > > > > > Based on the warnings from the other drivers I also suspect that if
> > > > > > you have validated the data somewhere else smatch will understand it.
> > > > > >
> > > > > > Even if you add a validate function I would suggest to keep the
> > > > > > WARN_ON(), ideally it should never trigger, and if it triggers it will
> > > > > > get a lot more attention to get it fixed.
> > > > >
> > > > > We could keep the WARN_ON() if we first validate the data, but the
> > > > > driver doesn't currently :-/ I expect there could be more similar
> > > > > issues.
> > > >
> > > > Yep, I got that. I will let you or Jacopo figure out the best way to
> > > > implement the validation in buf_prepare. If you do not have time to
> > > > implement it now I will just remove the WARN_ON in the interim... but
> > > > from my experience we only fix stuff if we get an oops.
> > > >
> > > > Regards!
> > > >
> > > > >
> > > > > > > Jacopo, do we need to add a validate function pointer to
> > > > > > > v4l2_isp_params_block_type_info ?
> > >
> > > To allow drivers to provide an additional per-block validation
> > > function ? I think it could be nice indeed.
> > >
> > > Ricardo, could you spare this patch for the moment ? I think we can
> > > WARN_ON() to please smatch but we should pre-validate the buffer (without
> > > spamming the system log in case of errors) to make sure we actually
> > > never hit the WARN_ON() :)
> > >
> > > I have some patches in the pipe for v4l2-isp to add support for
> > > extensible stats, I could pile up a few more to give drivers a space
> > > where to implement additional per-block validations
> >
> > Do you have any idea of the timeline for this?
> >
>
> Give the change will likely come on top of extensible stats it might
> slip this cycle
>
> > I would really like to land this in this cycle. If it is going to take
> > long maybe i can just
> >
> > if (zones_num > C3_ISP_AE_MAX_ZONES)
>
> Fine by me
>
> >
> > and then when you add your checks you can promote it to:
> >
> > if (WARN_ON(zones_num > C3_ISP_AE_MAX_ZONES))
>
> To be honest, if we pre-validate and silence the smatch warning with
> the above
>
>         if (zones_num > C3_ISP_AE_MAX_ZONES)
>
> then there shouldn't be any need to WARN_ON() ?

I like WARN_ON in "sanity checks" because when they fail they give you
a pretty verbose warning that will lead to resolution.
But if you do not need/like it, it is also fine by me.


>
> >
> > ?
> >
> > Also it would be much easier to backport this change than a change in v4l2-isp.
> >
> > Regards!
> >
> > >
> > > > > > >
> > > > > > > > +             zones_num = C3_ISP_AWB_MAX_ZONES;
> > > > > > > >
> > > > > > > >       /* Need to write 8 weights at once */
> > > > > > > >       for (i = 0; i < zones_num / 8; i++) {
> > > > > > > > @@ -220,6 +222,8 @@ static void c3_isp_params_ae_wt(struct c3_isp_device *isp,
> > > > > > > >       c3_isp_write(isp, ISP_AE_BLK_WT_ADDR, 0);
> > > > > > > >
> > > > > > > >       zones_num = cfg->horiz_zones_num * cfg->vert_zones_num;
> > > > > > > > +     if (WARN_ON(zones_num > C3_ISP_AE_MAX_ZONES))
> > > > > > > > +             zones_num = C3_ISP_AE_MAX_ZONES;
> > > > > > > >
> > > > > > > >       /* Need to write 8 weights at once */
> > > > > > > >       for (i = 0; i < zones_num / 8; i++) {
> > > > >
> > > > > --
> > > > > Regards,
> > > > >
> > > > > Laurent Pinchart
> > > >
> > > >
> > > >
> > > > --
> > > > Ricardo Ribalda
> >
> >
> >
> > --
> > Ricardo Ribalda



-- 
Ricardo Ribalda
