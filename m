Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DA134F247
	for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 06:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777445072; cv=none; b=gsd5M1JM0Kqv4mLnbjM9YVmpeNEPFuJDmzkXJLi4Ba8vDWGbDbyQE1FDekVyN5VI+/Jd09hCFUyiBTUym0nd7HEWUpTs3ZQ+nex4SpzbfSqFIy/uh/LmYRQkg2/RasuMzEP1W254vgbXHpbpbwiLBEIywXVxD3T6OYvQiGU383A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777445072; c=relaxed/simple;
	bh=8fvlPkqP93Ti+X20K6dIf2EVkYS6oyiwCe5f1yqLkm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X8WtMfN9F8e3f9i9AdOazT/9WwSTllVlniKcpL11ECFHT/XudbZUxJzI1eSyVvfnm/o/Z2I+qXJrH7ACHYN12fyHTvXiyU3REts6JQXH0wzrEhTMw1pUNg5VSkAevBazdLo/wf5zHEUHz+yiEA9j9l2wpFdudxUYJgldogORYc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=C5pUPNF+; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="C5pUPNF+"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-67b32c695efso5936a12.1
        for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 23:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777445066; x=1778049866; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DIYGnSzvjJ2ehoTLlG5N+Rw+U3EET8fJuAJ3tSeXDEM=;
        b=C5pUPNF+oeS+7Cepdz6/ajVeOH1cU5it92eyoHEncLoFwLBpfMWMb9itBhTgUNtvah
         GFu74pPNOKcNPBz3wR+CJVbzDUcN9TmToYg/TL3CD4fsG6A8RN9Fix7AZ+UMTWRFQ3E9
         iHxWYRqFMmGa8Kq2rbZypTZEBJQAXcYAKRaEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777445066; x=1778049866;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DIYGnSzvjJ2ehoTLlG5N+Rw+U3EET8fJuAJ3tSeXDEM=;
        b=HBv8KtvYJzC5KuoQ2bp6B31WmKkkJbec+6YrC910IuCD+GWTzRQ8kg0k6jJuNi35Dz
         02mnRPu3Um2aK89rWQPK10gIpwRo385WAV5cXMQzYGQwBCzP2FKtVYRgAq/cHFevtITY
         bUY1sRlzXYa1uispb9jsFE3+SOkic7+RWtUwePO3IXthtxo6CXr1DqW2+7gLD4RShT6m
         zQUBcqEve15O0bneFGorfOWlVlGddthbIoOn40UCbLjGc07pawYObGkoIEajPPv/uZ80
         XGVwmR/S/onfJCJLreQxS68FgsU4QEFQtQrTLxwJuVtFINO1wkiodhqJ8yljMRas2tQO
         rHJA==
X-Forwarded-Encrypted: i=1; AFNElJ/AQC1lyK3hRxD/h/twKSzfG5BYAl6JIYeZKIx6dcn76VjpY6X/P2C/Nyo9xYCb3vMqlpUrcLYoVmqPw0JH@lists.linux.dev
X-Gm-Message-State: AOJu0Yzm6Ir5Y2OkVuwFA/1QEoUCmCngftfeHyYA4rtVQOaOsQ+gskhV
	628k84ve39wMj8qRBCvWZW8vGtVhZdeV3GYxcQeE9QZFFtUSJPNdTHXGFwo2CC4vSXJldfOajuB
	6xnrHY1Dp
X-Gm-Gg: AeBDievr0Akfe1Rwt2Oz5YvhAGuOuI52ctuq7bPWTRuvLGYacdQqr/HhmspTM7R4+i0
	bbOn12/KZ3ZyX6OMOQGG1laaulWSVC3tJFkOihfvgu573V/KjYZvHIJ5OYmkVplmu2vQkOHhx8k
	VB/KGHLdhht+nq686eBW3gYiq6zBwYOW+mKOgeLiskTlEPDPoqSVY94Tzi1VSv15ZnO9Tr7PtG/
	C+qQ1BR3JVgovaTFw9efGzS0PzO2AH29Ua/4ksR0yaGObB6OIlO8lM6j1Y2YYngg96im7cUoa3+
	dP/IcPj55eN75c7LiZNFi6mebBYcx3Y68mfX99FajKgzZ2DRXqhU4rdlxbAZsvvSb5O/pEYdW66
	LtJPM/tHRnuDey9bj8IqD/m1FICkhfgB0kE5JMo1/PuDa6U5VqSuzYHAAnZsUcICX6rMDFkppmp
	TZUeVbKbtGTjatXEEy+PVEIDROKcc+W1woUWUIrYGGiulvFQ7hx3AStLDvIen1qBuGx/wmWvQ=
X-Received: by 2002:a17:907:7202:b0:bb2:713a:e474 with SMTP id a640c23a62f3a-bb9576e322amr86676166b.3.1777445066396;
        Tue, 28 Apr 2026 23:44:26 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb980f6b31csm47009166b.14.2026.04.28.23.44.24
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 23:44:24 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6763cc8775cso961160a12.0
        for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 23:44:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+VwFmCrObuLOczeaQRiOMW5gA5tbxiw0uj4xrx5da4wFusdDnag+ipg9q+1KPxBdsLb8VUxwWhuG7qV27P@lists.linux.dev
X-Received: by 2002:a17:907:1c13:b0:ba6:8b00:95cc with SMTP id
 a640c23a62f3a-bb9575ee381mr101529966b.5.1777445063536; Tue, 28 Apr 2026
 23:44:23 -0700 (PDT)
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
 <afGgKdauTs8GFoWg@zed>
In-Reply-To: <afGgKdauTs8GFoWg@zed>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 29 Apr 2026 08:44:11 +0200
X-Gmail-Original-Message-ID: <CANiDSCtr6RiuupmPjHphcxtCrU5iKzFyp+BF9JLyOpb2hc2-cw@mail.gmail.com>
X-Gm-Features: AVHnY4JdW9iyKy9Fhy6GfXUCBi5n1bu-tNNlPxUXW8bgp0JI82GKd2-Pm8P9Fws
Message-ID: <CANiDSCtr6RiuupmPjHphcxtCrU5iKzFyp+BF9JLyOpb2hc2-cw@mail.gmail.com>
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

On Wed, 29 Apr 2026 at 08:15, Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> Hello
>
>    thank you Ricardo for the fix
>
> On Tue, Apr 28, 2026 at 03:49:49PM +0200, Ricardo Ribalda wrote:
> > On Tue, 28 Apr 2026 at 15:26, Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > >
> > > On Tue, Apr 28, 2026 at 03:14:21PM +0200, Ricardo Ribalda wrote:
> > > > On Tue, 28 Apr 2026 at 15:10, Laurent Pinchart wrote:
> > > > > On Tue, Apr 28, 2026 at 12:41:12PM +0000, Ricardo Ribalda wrote:
> > > > > > Avoid invalid memory access if the zones_num is bigger than
> > > > > > zone_weight.
> > > > > >
> > > > > > This patch fixes the following smatch errors:
> > > > > > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
> > > > > > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
> > > > > > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
> > > > > > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
> > > > > >
> > > > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > > > ---
> > > > > >  drivers/media/platform/amlogic/c3/isp/c3-isp-params.c | 4 ++++
> > > > > >  1 file changed, 4 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> > > > > > index 6f9ca7a7dd88..42d780f684d1 100644
> > > > > > --- a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> > > > > > +++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> > > > > > @@ -104,6 +104,8 @@ static void c3_isp_params_awb_wt(struct c3_isp_device *isp,
> > > > > >       c3_isp_write(isp, ISP_AWB_BLK_WT_ADDR, 0);
> > > > > >
> > > > > >       zones_num = cfg->horiz_zones_num * cfg->vert_zones_num;
> > > > > > +     if (WARN_ON(zones_num > C3_ISP_AWB_MAX_ZONES))
> > > > >
> > > > > This is triggerable by userspace, it shouldn't result in a WARN_ON().
> > > > > Ideally the horiz_zones_num and vert_zones_num should be validated at
> > > > > buf prepare time, and an error should be returned to userspace. That
> > > > > will likely not fix your smatch issue though, I don't think it will be
> > > > > able to understand that the values have been validated.
> > > >
> > > > Based on the warnings from the other drivers I also suspect that if
> > > > you have validated the data somewhere else smatch will understand it.
> > > >
> > > > Even if you add a validate function I would suggest to keep the
> > > > WARN_ON(), ideally it should never trigger, and if it triggers it will
> > > > get a lot more attention to get it fixed.
> > >
> > > We could keep the WARN_ON() if we first validate the data, but the
> > > driver doesn't currently :-/ I expect there could be more similar
> > > issues.
> >
> > Yep, I got that. I will let you or Jacopo figure out the best way to
> > implement the validation in buf_prepare. If you do not have time to
> > implement it now I will just remove the WARN_ON in the interim... but
> > from my experience we only fix stuff if we get an oops.
> >
> > Regards!
> >
> > >
> > > > > Jacopo, do we need to add a validate function pointer to
> > > > > v4l2_isp_params_block_type_info ?
>
> To allow drivers to provide an additional per-block validation
> function ? I think it could be nice indeed.
>
> Ricardo, could you spare this patch for the moment ? I think we can
> WARN_ON() to please smatch but we should pre-validate the buffer (without
> spamming the system log in case of errors) to make sure we actually
> never hit the WARN_ON() :)
>
> I have some patches in the pipe for v4l2-isp to add support for
> extensible stats, I could pile up a few more to give drivers a space
> where to implement additional per-block validations

Do you have any idea of the timeline for this?

I would really like to land this in this cycle. If it is going to take
long maybe i can just

if (zones_num > C3_ISP_AE_MAX_ZONES)

and then when you add your checks you can promote it to:

if (WARN_ON(zones_num > C3_ISP_AE_MAX_ZONES))

?

Also it would be much easier to backport this change than a change in v4l2-isp.

Regards!

>
> > > > >
> > > > > > +             zones_num = C3_ISP_AWB_MAX_ZONES;
> > > > > >
> > > > > >       /* Need to write 8 weights at once */
> > > > > >       for (i = 0; i < zones_num / 8; i++) {
> > > > > > @@ -220,6 +222,8 @@ static void c3_isp_params_ae_wt(struct c3_isp_device *isp,
> > > > > >       c3_isp_write(isp, ISP_AE_BLK_WT_ADDR, 0);
> > > > > >
> > > > > >       zones_num = cfg->horiz_zones_num * cfg->vert_zones_num;
> > > > > > +     if (WARN_ON(zones_num > C3_ISP_AE_MAX_ZONES))
> > > > > > +             zones_num = C3_ISP_AE_MAX_ZONES;
> > > > > >
> > > > > >       /* Need to write 8 weights at once */
> > > > > >       for (i = 0; i < zones_num / 8; i++) {
> > >
> > > --
> > > Regards,
> > >
> > > Laurent Pinchart
> >
> >
> >
> > --
> > Ricardo Ribalda



-- 
Ricardo Ribalda
