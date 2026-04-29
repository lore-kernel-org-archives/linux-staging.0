Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FF239BFE5
	for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 06:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777445711; cv=none; b=k17SH6nAvy6QptvQ5Z4I1MkO/JDMMaiSbRPiO7ptB3rmzsuZyNP5CCJmmhzsNMc48FlYk31V4Ulo5wyyNJ5evxdiwly8s1vSVApd0gfBznejt0mV0Dxjp8JcklB4Ps3S0uB+CmaG58ws7YMFaKRuA8A0Sm93vyze0n5J93d2AJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777445711; c=relaxed/simple;
	bh=cgpfcnNZ9AfOkq39Rj0OPvXmWarMkbcWiSuEL6ZWLNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hSpnUkO6Bq5vwQW2GFVxaCwLmYIEQ0axA23U6wS0AaiGeY0CazeksC6UvikJdjUi5LZdvXuXymmuZkebkmvkJv8+FTkzYtHSkhPnpogGKHdgAi809j9xxOK0+YQ7lIBWgkLnrbnZnBtVIpAX2Q5v7f2mKDdlZ83bt4ZaeyUJA8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=a6ZiDFzK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="a6ZiDFzK"
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1A2429A0;
	Wed, 29 Apr 2026 08:53:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777445604;
	bh=cgpfcnNZ9AfOkq39Rj0OPvXmWarMkbcWiSuEL6ZWLNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a6ZiDFzKIGTWtM0hvPZvIoaNMGz0YqpePU/0rfAGYlNXSglU98QoAoVpRxwbX7AoO
	 PYe3UZlb0BAvMNy0YN4I/6ih9WfmpIE8OdrkmN7tW1J9rGUXeqfuBaZlS3svBuxLPD
	 AbTfmNXTNzLRl/wRvxRsd6s+NcqVOMvuI8dBoG/s=
Date: Wed, 29 Apr 2026 08:55:04 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@kernel.org>, 
	Nas Chung <nas.chung@chipsnmedia.com>, Jackson Lee <jackson.lee@chipsnmedia.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Keke Li <keke.li@amlogic.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 6/6] media: amlogic-c3: Add validations for ae and awb
 config
Message-ID: <afGqxcABkv2D3DWG@zed>
References: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org>
 <20260428-smatch-7-1-v1-6-46890dffb611@chromium.org>
 <20260428131038.GA120836@killaraus.ideasonboard.com>
 <CANiDSCvaS-Jz9m5H2OHo2akD-o-sffsZyEw6_CrfUhD1BN+m2g@mail.gmail.com>
 <20260428132649.GD120836@killaraus.ideasonboard.com>
 <CANiDSCv=sHfJAZNcmXkubAvjkMy4cL5Ez=zq9MRxTTRXRPECyQ@mail.gmail.com>
 <afGgKdauTs8GFoWg@zed>
 <CANiDSCtr6RiuupmPjHphcxtCrU5iKzFyp+BF9JLyOpb2hc2-cw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCtr6RiuupmPjHphcxtCrU5iKzFyp+BF9JLyOpb2hc2-cw@mail.gmail.com>

Hi Ricardo

On Wed, Apr 29, 2026 at 08:44:11AM +0200, Ricardo Ribalda wrote:
> Hi Jacopo
>
> On Wed, 29 Apr 2026 at 08:15, Jacopo Mondi
> <jacopo.mondi@ideasonboard.com> wrote:
> >
> > Hello
> >
> >    thank you Ricardo for the fix
> >
> > On Tue, Apr 28, 2026 at 03:49:49PM +0200, Ricardo Ribalda wrote:
> > > On Tue, 28 Apr 2026 at 15:26, Laurent Pinchart
> > > <laurent.pinchart@ideasonboard.com> wrote:
> > > >
> > > > On Tue, Apr 28, 2026 at 03:14:21PM +0200, Ricardo Ribalda wrote:
> > > > > On Tue, 28 Apr 2026 at 15:10, Laurent Pinchart wrote:
> > > > > > On Tue, Apr 28, 2026 at 12:41:12PM +0000, Ricardo Ribalda wrote:
> > > > > > > Avoid invalid memory access if the zones_num is bigger than
> > > > > > > zone_weight.
> > > > > > >
> > > > > > > This patch fixes the following smatch errors:
> > > > > > > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
> > > > > > > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
> > > > > > > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
> > > > > > > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
> > > > > > >
> > > > > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > > > > ---
> > > > > > >  drivers/media/platform/amlogic/c3/isp/c3-isp-params.c | 4 ++++
> > > > > > >  1 file changed, 4 insertions(+)
> > > > > > >
> > > > > > > diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> > > > > > > index 6f9ca7a7dd88..42d780f684d1 100644
> > > > > > > --- a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> > > > > > > +++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> > > > > > > @@ -104,6 +104,8 @@ static void c3_isp_params_awb_wt(struct c3_isp_device *isp,
> > > > > > >       c3_isp_write(isp, ISP_AWB_BLK_WT_ADDR, 0);
> > > > > > >
> > > > > > >       zones_num = cfg->horiz_zones_num * cfg->vert_zones_num;
> > > > > > > +     if (WARN_ON(zones_num > C3_ISP_AWB_MAX_ZONES))
> > > > > >
> > > > > > This is triggerable by userspace, it shouldn't result in a WARN_ON().
> > > > > > Ideally the horiz_zones_num and vert_zones_num should be validated at
> > > > > > buf prepare time, and an error should be returned to userspace. That
> > > > > > will likely not fix your smatch issue though, I don't think it will be
> > > > > > able to understand that the values have been validated.
> > > > >
> > > > > Based on the warnings from the other drivers I also suspect that if
> > > > > you have validated the data somewhere else smatch will understand it.
> > > > >
> > > > > Even if you add a validate function I would suggest to keep the
> > > > > WARN_ON(), ideally it should never trigger, and if it triggers it will
> > > > > get a lot more attention to get it fixed.
> > > >
> > > > We could keep the WARN_ON() if we first validate the data, but the
> > > > driver doesn't currently :-/ I expect there could be more similar
> > > > issues.
> > >
> > > Yep, I got that. I will let you or Jacopo figure out the best way to
> > > implement the validation in buf_prepare. If you do not have time to
> > > implement it now I will just remove the WARN_ON in the interim... but
> > > from my experience we only fix stuff if we get an oops.
> > >
> > > Regards!
> > >
> > > >
> > > > > > Jacopo, do we need to add a validate function pointer to
> > > > > > v4l2_isp_params_block_type_info ?
> >
> > To allow drivers to provide an additional per-block validation
> > function ? I think it could be nice indeed.
> >
> > Ricardo, could you spare this patch for the moment ? I think we can
> > WARN_ON() to please smatch but we should pre-validate the buffer (without
> > spamming the system log in case of errors) to make sure we actually
> > never hit the WARN_ON() :)
> >
> > I have some patches in the pipe for v4l2-isp to add support for
> > extensible stats, I could pile up a few more to give drivers a space
> > where to implement additional per-block validations
>
> Do you have any idea of the timeline for this?
>

Give the change will likely come on top of extensible stats it might
slip this cycle

> I would really like to land this in this cycle. If it is going to take
> long maybe i can just
>
> if (zones_num > C3_ISP_AE_MAX_ZONES)

Fine by me

>
> and then when you add your checks you can promote it to:
>
> if (WARN_ON(zones_num > C3_ISP_AE_MAX_ZONES))

To be honest, if we pre-validate and silence the smatch warning with
the above

        if (zones_num > C3_ISP_AE_MAX_ZONES)

then there shouldn't be any need to WARN_ON() ?

>
> ?
>
> Also it would be much easier to backport this change than a change in v4l2-isp.
>
> Regards!
>
> >
> > > > > >
> > > > > > > +             zones_num = C3_ISP_AWB_MAX_ZONES;
> > > > > > >
> > > > > > >       /* Need to write 8 weights at once */
> > > > > > >       for (i = 0; i < zones_num / 8; i++) {
> > > > > > > @@ -220,6 +222,8 @@ static void c3_isp_params_ae_wt(struct c3_isp_device *isp,
> > > > > > >       c3_isp_write(isp, ISP_AE_BLK_WT_ADDR, 0);
> > > > > > >
> > > > > > >       zones_num = cfg->horiz_zones_num * cfg->vert_zones_num;
> > > > > > > +     if (WARN_ON(zones_num > C3_ISP_AE_MAX_ZONES))
> > > > > > > +             zones_num = C3_ISP_AE_MAX_ZONES;
> > > > > > >
> > > > > > >       /* Need to write 8 weights at once */
> > > > > > >       for (i = 0; i < zones_num / 8; i++) {
> > > >
> > > > --
> > > > Regards,
> > > >
> > > > Laurent Pinchart
> > >
> > >
> > >
> > > --
> > > Ricardo Ribalda
>
>
>
> --
> Ricardo Ribalda
