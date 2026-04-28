Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2431A3FFAC0
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 13:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777384368; cv=none; b=eiza/ye5wmakpNXCSPYUukJcYRmKfraNT+K2MxvaVDNdZ1Jr4oKSnMTbEY8nCWluF1pYiNtprpNLb2dpvWta+ztEujbaUpechTlOzTlOAbX5FDj2OCt0nuEWk6ly7QIFxKDLShTegPAwvh70pCZZSZhIOdjldiTxnrdCvLI3qCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777384368; c=relaxed/simple;
	bh=4Z6Hmsviejwbkx6SPgDRDj4FO2D2h8bGMTAA7pPjwAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nCYB83DiHNsLqExdLY5W0zGNHGEGoYfagi/6c33ldhIJNMxUfJ+qWotM0JTNeQxcq05YeCLeI9UMK8U179+vZw/RqMZIvpEGb9dKlIn4kxCz1eNC+OAnedSqyfAgnGMlg/H66UdFYYL07J5q2vySq6oqDuHVFv4URmuxjAe/ES0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eiKv8cF1; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eiKv8cF1"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so139113785e9.0
        for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 06:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777384365; x=1777989165; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TvN+aQrEQG1INNwJXWKA667EIqAzFBBNzUYu75gRDbM=;
        b=eiKv8cF1SqtcOq6ak/oBNtJLQQZqN4cGR/kRdYJqj7S6IyXiOWM+kw6N9Zy+sYZX0v
         c3a0yTMQEhW9zP8OEafHiAKRmwRQFmiBMeWaxnm69jGNZUCxxOJL5pSjS9B59MG+emBV
         zrS/ANZIFA+OLDm7nKeDXaCgl5p9QKPYar594r+z9zMywMYqjfk3CrU9fJyvNqwICppG
         A+2JCNRh4xLEY6xjmKTmEyLV8NFUtz5aGYKJNj0mmfHS0TUVLhk1NFVCU3+6CszokhPh
         RPsCxHQryte1QuaiRoh5MohSM8AOI2NjUwgvj7m+Bv/UTnWyisWwh8cGcUxQUwN+1Msp
         87GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777384365; x=1777989165;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TvN+aQrEQG1INNwJXWKA667EIqAzFBBNzUYu75gRDbM=;
        b=p925bX2OYkDmB+n4xq7uq8xOE9DzcVB9dUrol3sqzDGho7DGR5oWgONcvVFd8X4dGC
         GFTsCMCKKBAUe5Cn8xKyuAeTT+zGFcjjMGIfuNVOM14hE740o7Gd2+eeM+L1c93W/47/
         NAbELXl8+M1pWHptZNAi54Z1z1XtvQuE5bQ25WZeEXdrXf51Ik+4djZowWNuywkK4urM
         ZAHbGFFUQ0PjxlJYH7S5O1of1A84+/EbkNFFlH0Yvc0k8ZG9c+hIcc+pgIHGcX+MdYAw
         t6nVYl6ScY6k5yZ4vVGSubpITkCsdpYrka6PssDnG1IKs905xN0lCnRcN2ExZ8DmEe7W
         pmsg==
X-Forwarded-Encrypted: i=1; AFNElJ8uaps7JvAq0kX25UOIwkHfaMAWFEu/OFFIhVkhayOLFa54+wpk792q6+NXIzLWIDMX48HzuOY1swXXZRnq@lists.linux.dev
X-Gm-Message-State: AOJu0YweR8rN3atV9g5vw7ycpY94cfLFpT5JyavHTH9cjTt9JZ1UbpfE
	PwUA4MY3WApXXLI6jTjt5eFrH5VYdimCOH4VdRci0Sb3TuEKJ/9R8Wky
X-Gm-Gg: AeBDieu0MjgH3Sjzd4IRdABGArMtkkkY5SnhQ6v1R/ekSzhNRqPOs6wSaPXfIJs0sOy
	BiR9b7Xa1p13wlczU5C/0ak53gpGgxZQz8uPyORy4gt7+nqNQEHhGokwyFfiv0IWvu+pArc0li5
	5BB3cXA3bl+QGp//g6IdM3UpizRqUxhJC50HtZjnEf7RisdznzCGzRZUhpff2UBY2VzcrIF7U0t
	7gyvaoJnswIR5Sg3+93lUUXSvAUu1yN460BfdhLFOFh5ryPHnTdEGD0aVohT0WdPyoHcGoNnBdT
	ggqnuDfHiGGUxsXzGu9bCALF/FLADCEyqvioZBiczvDgWftxfAkDnk6KBrCqsw6ujcayIRxRmIc
	CljKEsBUoBpMAqBbKqrb5S2qXQ+Di5Uzps4FMXjWVeu2zvRVtCdl56KFn6KfI4NGBQg7go8caL5
	/xlGRjLl2za3Cn7vk5XCxkFZsARlo8f4u569fUSNOH
X-Received: by 2002:a05:600c:1396:b0:488:8577:d9cc with SMTP id 5b1f17b1804b1-48a77b0ed61mr53199745e9.20.1777384365202;
        Tue, 28 Apr 2026 06:52:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463f4c0b0dsm7062593f8f.23.2026.04.28.06.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 06:52:44 -0700 (PDT)
Date: Tue, 28 Apr 2026 16:52:41 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
Message-ID: <afC7qXCCkTTOS7jr@stanley.mountain>
References: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org>

On Tue, Apr 28, 2026 at 12:41:06PM +0000, Ricardo Ribalda wrote:
> Current version of smatch triggers some warnings for the media tree.
> Most of them are inoffensive, but we would like to have zero smatch
> warnings.
> 
> drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
> drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
> drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
> drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
> drivers/media/v4l2-core/v4l2-dev.c:1036 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
> drivers/media/v4l2-core/v4l2-dev.c:1043 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
> drivers/media/v4l2-core/v4l2-dev.c:1101 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
> drivers/media/platform/chips-media/wave5/wave5-vpuapi.c:588 wave5_vpu_dec_get_output_info() error: buffer overflow 'inst->frame_buf' 64 <= 127
> drivers/staging/media/ipu3/ipu3-css-params.c:1792 imgu_css_cfg_acc_stripe() warn: 'acc->stripe.bds_out_stripes[0]->width - 2 * f' 4294967168 can't fit into 65535 'acc->stripe.bds_out_stripes[1]->offset'
> drivers/media/i2c/adv7604.c:3672 adv76xx_probe() error: buffer overflow 'state->pads' 7 <= 4294967294
> drivers/media/i2c/adv7604.c:3673 adv76xx_probe() error: buffer overflow 'state->pads' 7 <= u32max
> drivers/media/i2c/mt9p031.c:799 mt9p031_s_ctrl() warn: assigning (-1952) to unsigned variable 'data'
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

I'm re-writing a bunch of core stuff right now...  Feel free to
complain about false positives.  I'm going to re-write the buffer
overflow warning in the next couple weeks.

regards,
dan carpenter
