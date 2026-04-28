Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D1843CED6
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 13:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777384707; cv=none; b=paGKomDzifyxmBpwPSLmqTRiNj2Zk2OLREd8lp1fTOfsJ+j4YvSiuAZXc3tqtGMNEiTvKK1ZL1GXvL4bVmxfqrieN/80qdeJonkgnFDzOqEiS4VNOpjLusw7iDb3WKCbe2vypN2b4X2X0dNksjbOjrUtVuCBz1pCUoI6v1jz6kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777384707; c=relaxed/simple;
	bh=YUuWQHUFJHFX0a/heeDHaCC6p018XOr4Etgk+Jrwurg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iwX/vfVTo/f1onTVBUqyHUUjf1MUW/y5+FnafVOSTwwRWTq/AkFdfaJKybk/+vuptIZgTgQcy6r2jlkRpDIFEgSdAuKWYuK5qOoC+UyvTls5fuA25ArQo/PsVVMi8R5oZWMpXq5wOEPuGAiPji8fKWWqv4hQPm8sHSFvzFR0DA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SIjuUEYz; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SIjuUEYz"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ba6b39871a3so1454190766b.0
        for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 06:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777384702; x=1777989502; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Zuh0L2ou97F5J1Q89+nkH3GU/qVTw9rZ5VYJg149j5M=;
        b=SIjuUEYzTQ2A16mC5pQc0KtGgXK+zkAiC9pMC9AVGZjr7m9NoEy3Ty8ZCV8IAm/9jL
         u0PPGfIlxLmJ0PgmnPHG1rGPPmCE2B/a/Rac3cEtfYvX+vsYBgUuxQ+NrCgRlNs0ex56
         hiLV9Wvc9+PX1eph5FL/rHKNht4/TQlZUUzdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777384702; x=1777989502;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zuh0L2ou97F5J1Q89+nkH3GU/qVTw9rZ5VYJg149j5M=;
        b=WPAiZ3SSOKAX+zaswPibcb/n0/kyJW83M6jX/CRdBS6nbJo0hfcKQiztJUf7VTTv4H
         KMrEMOdYuIfjDe3UxV4BKXNqUKOgNOuPDn3cEnwRePMm+iivX5Ez9qwFRmffw6WmiFP+
         EM682WLyA1E4YrMadSLWzU6vT4rpxn9Qz1JeJ/2q/yZHjrkIfYf2bKaItM9F6gCRBl2y
         L3ZAQ6lkShBt81hr8pkOdf1E+LXXslwDphbrt8wSMduYJZPQwUEs3/pkxCnLTUjkfGxX
         j+8VsePM0cZNI7z+YHqtgRbNQCjiXm1dmWMTbP1tNHpU+w/xtGXCBVgYGV4UvBw83xzn
         8PUg==
X-Forwarded-Encrypted: i=1; AFNElJ+LVXKDCULmiw9ScBDcT7dXfV0mAaT4a6X4TvhOaBfzFqgf3MERfnLM4UPQH+jYyWfz0dRr7ibmf8+x0Vm3@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9RmgE17hAE8qj6ChkSAjguq3xxXHUvTt1yAnvyLAc6rKgKgv/
	Qy8FGYcFbzSkQerAQ8TbzU0SfAyQE1ciMNhIJXuqt5eM6XswX4Net1cThTQWV6rezvFqWhwZncT
	mQxDezb1R
X-Gm-Gg: AeBDieu9wYHcErnX6h4knY9oPqWdIBrzieq1aKtvnWTQzFHoKdfRI2I5TyfMD96qDNO
	ViGWWE/FdsgWgZUjgAFP4c3f5osGWi8UgUc6Zni1pFvdPzyIpEI31f3vbIdfYNs9R9VVYif+yy9
	D3gM4/FAHRIBdgQR2v/tYQXVSABhwXVdFI8p3rrn94eMuSISBFt8Zd5gdSec5gCRGjBGN+PPmle
	f6OIuM/1jJGjPEOa8We+K+0I6RIdWXGZgmAWlO4D3mjd8FgfDoJgebpZMQazcDmueSEu+1m/qiE
	3Hp336vNqpXyTalw1STUu00QH/np9moSqtNpcr3a5tq5ngKIMFH1kp6wfjyJ4q2+96J6BIXAnB3
	G7FEH2mJXi7RGE5H5WfoS/7qyo07g7AEhLiEYt7pP2nzdcnto3oGqqk2ey0gc3+qmF09Xcu7MSh
	rxqTMFC+Yf20nLcBFDyDBWUNeAh3XbhJfKyeONHDZjvIeIYrPnw7Xjqll6mTVRe+rQhcVmheI=
X-Received: by 2002:a17:907:80c:b0:bae:a225:104c with SMTP id a640c23a62f3a-bb808b316b2mr147499066b.32.1777384701792;
        Tue, 28 Apr 2026 06:58:21 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80853b479sm109008966b.6.2026.04.28.06.58.21
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 06:58:21 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ba6b39871a3so1454184566b.0
        for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 06:58:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8bLVd42Zf1femx3B83K7AnwlawWglqyg7w36wxdarRV63+Iql6gi9alzz+pprTpHBl4NUuP8QTuUAsdha6@lists.linux.dev
X-Received: by 2002:a17:906:6a28:b0:bac:6585:b02b with SMTP id
 a640c23a62f3a-bb846d629b8mr154647166b.9.1777384700081; Tue, 28 Apr 2026
 06:58:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org> <afC7qXCCkTTOS7jr@stanley.mountain>
In-Reply-To: <afC7qXCCkTTOS7jr@stanley.mountain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 28 Apr 2026 15:58:08 +0200
X-Gmail-Original-Message-ID: <CANiDSCvn3EbrPUiGYzE1zDHp=kKPJLAgHx17OJvv7gWLZM9tBw@mail.gmail.com>
X-Gm-Features: AVHnY4KSxj-3Id50OdGKMMLxc9W5Lx_IbFbVckx8UjhHCc5VdI8JIttSLEpvHFA
Message-ID: <CANiDSCvn3EbrPUiGYzE1zDHp=kKPJLAgHx17OJvv7gWLZM9tBw@mail.gmail.com>
Subject: Re: [PATCH 0/6] media: Fix new smatch warnings
To: Dan Carpenter <error27@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@kernel.org>, 
	Nas Chung <nas.chung@chipsnmedia.com>, Jackson Lee <jackson.lee@chipsnmedia.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Keke Li <keke.li@amlogic.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Dan

On Tue, 28 Apr 2026 at 15:52, Dan Carpenter <error27@gmail.com> wrote:
>
> On Tue, Apr 28, 2026 at 12:41:06PM +0000, Ricardo Ribalda wrote:
> > Current version of smatch triggers some warnings for the media tree.
> > Most of them are inoffensive, but we would like to have zero smatch
> > warnings.
> >
> > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
> > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
> > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
> > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
> > drivers/media/v4l2-core/v4l2-dev.c:1036 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
> > drivers/media/v4l2-core/v4l2-dev.c:1043 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
> > drivers/media/v4l2-core/v4l2-dev.c:1101 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
> > drivers/media/platform/chips-media/wave5/wave5-vpuapi.c:588 wave5_vpu_dec_get_output_info() error: buffer overflow 'inst->frame_buf' 64 <= 127
> > drivers/staging/media/ipu3/ipu3-css-params.c:1792 imgu_css_cfg_acc_stripe() warn: 'acc->stripe.bds_out_stripes[0]->width - 2 * f' 4294967168 can't fit into 65535 'acc->stripe.bds_out_stripes[1]->offset'
> > drivers/media/i2c/adv7604.c:3672 adv76xx_probe() error: buffer overflow 'state->pads' 7 <= 4294967294
> > drivers/media/i2c/adv7604.c:3673 adv76xx_probe() error: buffer overflow 'state->pads' 7 <= u32max
> > drivers/media/i2c/mt9p031.c:799 mt9p031_s_ctrl() warn: assigning (-1952) to unsigned variable 'data'
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> I'm re-writing a bunch of core stuff right now...  Feel free to
> complain about false positives.  I'm going to re-write the buffer
> overflow warning in the next couple weeks.

The only one that deserves a complain is this one:
https://lore.kernel.org/linux-media/CANiDSCtm4Nh4Ub4rbEBvpjV8GXT9VQ5eFXZTHn=Wy=0RpR=3JA@mail.gmail.com/T/#m650723c33ec0318d8f32f1a6cc74c74a952ae11a

There are other false positives like this one:
https://lore.kernel.org/linux-media/CANiDSCtm4Nh4Ub4rbEBvpjV8GXT9VQ5eFXZTHn=Wy=0RpR=3JA@mail.gmail.com/T/#md58851baa54c511f57b05a4dcf3aecf0ffb1b1fa
But I think the extra check makes the code more robust.

Thanks for your tool :)

>
> regards,
> dan carpenter



-- 
Ricardo Ribalda
