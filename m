Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACDC35AC1E
	for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 07:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777447409; cv=none; b=S33qjUztvhme21sCDRfHuaJ9eVD98SL62PeU74xouGX9hZ1aXwK1IUbi+Me5hfK6N1CMQLffFnfibXB+wB8oNXwfho/Kv8GXzmWMI8FxH2RjA9KJWwKztBW/scTI1QPtEYFtd6EXSdWsfSjTE2HtM8bmtxCNUvStCTafN7ngXhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777447409; c=relaxed/simple;
	bh=myC8ZrIcO/JLr5kCTzobIlrn8vLb6kcE8jmiXVTHJ0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mW+evPuueYYtd2TjkLQVmkBkyCzrneUXzAQzFAgSYi5B/P2eW66BH+yDKnQrZk3kc5JD98ML1qeIP4X/jUAu6pIRUY3dSA4V0YYYf1CdypcFDndquYd5/xMHXi+Z6TIUU4yyw9DRaUgV91d8DqXWsnmAcxYgy+pkdHv5oK6KUb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WVx1kddy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WVx1kddy"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DC8EB104C;
	Wed, 29 Apr 2026 09:21:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777447302;
	bh=myC8ZrIcO/JLr5kCTzobIlrn8vLb6kcE8jmiXVTHJ0E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WVx1kddyGbN/HF/VbQ2B6s9csJ8rnsElSouvX0vKoAybdZCFwN0K0P/yp6jvEEKZf
	 QOuykdPEaH9cgfEs5aZ63F/q5uThWvnLPJJXRcAlwpimzkjpythMNyd/42VsNPI01T
	 uZ+sXlMBNEgUiQTqg4g62aQBbAGqHPnycyh5diuk=
Date: Wed, 29 Apr 2026 10:23:23 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Dan Carpenter <error27@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Keke Li <keke.li@amlogic.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 0/6] media: Fix new smatch warnings
Message-ID: <20260429072323.GA8407@killaraus.ideasonboard.com>
References: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org>
 <afC7qXCCkTTOS7jr@stanley.mountain>
 <CANiDSCvn3EbrPUiGYzE1zDHp=kKPJLAgHx17OJvv7gWLZM9tBw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCvn3EbrPUiGYzE1zDHp=kKPJLAgHx17OJvv7gWLZM9tBw@mail.gmail.com>

On Tue, Apr 28, 2026 at 03:58:08PM +0200, Ricardo Ribalda wrote:
> On Tue, 28 Apr 2026 at 15:52, Dan Carpenter wrote:
> > On Tue, Apr 28, 2026 at 12:41:06PM +0000, Ricardo Ribalda wrote:
> > > Current version of smatch triggers some warnings for the media tree.
> > > Most of them are inoffensive, but we would like to have zero smatch
> > > warnings.
> > >
> > > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
> > > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
> > > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
> > > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
> > > drivers/media/v4l2-core/v4l2-dev.c:1036 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
> > > drivers/media/v4l2-core/v4l2-dev.c:1043 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
> > > drivers/media/v4l2-core/v4l2-dev.c:1101 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
> > > drivers/media/platform/chips-media/wave5/wave5-vpuapi.c:588 wave5_vpu_dec_get_output_info() error: buffer overflow 'inst->frame_buf' 64 <= 127
> > > drivers/staging/media/ipu3/ipu3-css-params.c:1792 imgu_css_cfg_acc_stripe() warn: 'acc->stripe.bds_out_stripes[0]->width - 2 * f' 4294967168 can't fit into 65535 'acc->stripe.bds_out_stripes[1]->offset'
> > > drivers/media/i2c/adv7604.c:3672 adv76xx_probe() error: buffer overflow 'state->pads' 7 <= 4294967294
> > > drivers/media/i2c/adv7604.c:3673 adv76xx_probe() error: buffer overflow 'state->pads' 7 <= u32max
> > > drivers/media/i2c/mt9p031.c:799 mt9p031_s_ctrl() warn: assigning (-1952) to unsigned variable 'data'
> > >
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >
> > I'm re-writing a bunch of core stuff right now...  Feel free to
> > complain about false positives.  I'm going to re-write the buffer
> > overflow warning in the next couple weeks.
> 
> The only one that deserves a complain is this one:
> https://lore.kernel.org/linux-media/CANiDSCtm4Nh4Ub4rbEBvpjV8GXT9VQ5eFXZTHn=Wy=0RpR=3JA@mail.gmail.com/T/#m650723c33ec0318d8f32f1a6cc74c74a952ae11a
> 
> There are other false positives like this one:
> https://lore.kernel.org/linux-media/CANiDSCtm4Nh4Ub4rbEBvpjV8GXT9VQ5eFXZTHn=Wy=0RpR=3JA@mail.gmail.com/T/#md58851baa54c511f57b05a4dcf3aecf0ffb1b1fa
> But I think the extra check makes the code more robust.

I think there's also a more general question. How can we tell smatch
(and other static analysis tools) that a value has been checked
elsewhere and is guaranteed to be within certain bounds, without
performing runtime bounds checking at the site where the value is used ?

> Thanks for your tool :)

-- 
Regards,

Laurent Pinchart
