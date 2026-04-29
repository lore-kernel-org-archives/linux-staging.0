Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808F73E3151
	for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 10:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777458673; cv=none; b=lR71s+zhSTJ4lTtDCtcuXygSn/jaErdM3mIY4rx+yd+7Ne8AzNE2xrXmeblTDauPJVQmFwcpD7WE+z2ny/PEk+5QEPvY59LfVPGG1/qV8PPzfxuXC+1IxdQC9MVtYR1vrAG98rV+tpi9YR2jYO74sSp9XL4nzH8UqiotANxDXSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777458673; c=relaxed/simple;
	bh=IsPYo5A1NKgvPCB5OTEUwXERR7zAmjTkNZR4+UsSSBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IHEXvEPeHLHA0ZrCUO/0tB15Z2jVLwZ0WuYkdvq6kveCmykFNvUYUkLiVjbDAxkp3mEb3seuk/ppC1av6nO5fbqSuQ3bjG31hXT2GU3Qs/cYbP8RBCuGpN94lyGdocHD75ka8VD79D/pct4EcXlg/rCE5YtsH3d2/GExYN1c0mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fgx++S5l; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fgx++S5l"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso108374965e9.2
        for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 03:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777458669; x=1778063469; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2n5GHFY1IUCVIi1ZttxoD6PyKrxGhAIV1l0a9WHxBdg=;
        b=fgx++S5lkBv2WymZlZJRpwf4NM9hrN/lXPAwlGN30M0PBUHhgDflPHQ6NOJD/FCVv6
         RA7GZy4FSOxx9jI0t7rhFjzq39KjIFA3MjGKZUHlHgQjhWZJ9AzVItsO/IahtC7719wo
         TTHjIQOwggZxbm5adjly9b3gPIhiLJZYzMFtWFEzRvJRZuYFWq51wLnZ2/4a/SE6Vc1R
         tlRldB1cgIvW76tzA4zDEoa83c3OjfU1sEfJgwQEhAYAvzPysTl/yx+Ofmk9EOSf9nTn
         9U8BYyt4dZbIC54+yuWi7SwO3Q7e2jwASdbfrEm9ILv0wCrMBpeXIoTvsFodLrVkNVRi
         hB7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777458669; x=1778063469;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2n5GHFY1IUCVIi1ZttxoD6PyKrxGhAIV1l0a9WHxBdg=;
        b=HOAwQZfGl/IB70unrEH/R/HLQjqzEvFcxVVEPMVqYOzxqDmRuCHFF8uRSZrpTk+qs9
         fLOPTIXQ13VjiP1/x4DTZJBerl7UiJ+AdQD7B9ZPEwgfdZzsrS3tmvZRPQ9LiyHLicLt
         eg2cP0PZS3b9a3qnhC4kPhp8hV01Pg0l2JQb9g+Dlp6xOV0nWyGXHQ4o5XaIf1Tgc8xH
         Zqk0Mmuf5NipCYD8FqtG5zn8tAN+t3aywBADnbqysUWnTzupmfKy87/KmbTwthct0seW
         EgLjD7LfjpDL9XBUxYjSdcTSz48b/X43VCcbZy7/Y+RxzQtPpgAnRWGeYnTN2e2oyvBC
         Om/w==
X-Forwarded-Encrypted: i=1; AFNElJ8aNr7lxhI+DhM2ATlpjcABZ65CAGL9pHwKq+Fx0MWSAoCQB4wRr1JQhuhqjVW6fn9YhEvviatbu1Ztjeph@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1LAp2ZzTc+E7gS8Jt97KeyYubFOClB4IMfW/Nh0ekqtXjctjC
	dce5BaxbBEJskEbOvMnPyma7E+gE74qXI0xW7g1t7DlS6R8Z9vrfLh8S
X-Gm-Gg: AeBDievObPg3MuEbrBsqnQRkQAoJEyz2w1KMjLqS+DdIoHvNvBIOmKfLU23+V5yQ4TD
	VqtrF+Ida6Cq0tcexrEMbGI+Kdqzs9laIpi8FC7wjqzyt2/GlIcqYFklc7rIliYk5BGt1bKTCiA
	985JaMKbm02OuVAMvDFShEluxuSPVImW/6zDwrXFNBg6+UAxGMDIHihJnd8FPSq6F2PU4186nNT
	LoOpv1Tcq1og1zGt6tJjmdHrkaWA47JrhENUdzgH0e1K2Amc8NgQyd9dbFfgSIPEhWHggjDa3SN
	+5BWEbTR30kmUKGwFAItleCiVldpRJ+WfZl6c26hL3Vgj0OToLcJU3XJ2eUg84cZTZmmNKYExQR
	ZTjbaATgGp+jgtC28yMGJYWgSlrDjVxMIFCV1aOdWDBo4wtyrXQONuGTJfB3mt5T/VqkcHNtNeC
	GRj01E9UQLBOLYS5BBKYo8hFUi1dl0HA==
X-Received: by 2002:a05:600c:3b13:b0:488:c40b:c8a4 with SMTP id 5b1f17b1804b1-48a77add9cemr108962985e9.1.1777458669022;
        Wed, 29 Apr 2026 03:31:09 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c2ddc65sm23523735e9.4.2026.04.29.03.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 03:31:08 -0700 (PDT)
Date: Wed, 29 Apr 2026 13:31:04 +0300
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
Message-ID: <afHd6LT7rCPlqDQE@stanley.mountain>
References: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org>
 <afC7qXCCkTTOS7jr@stanley.mountain>
 <CANiDSCvn3EbrPUiGYzE1zDHp=kKPJLAgHx17OJvv7gWLZM9tBw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="PCA+ff0wVcep1+Lo"
Content-Disposition: inline
In-Reply-To: <CANiDSCvn3EbrPUiGYzE1zDHp=kKPJLAgHx17OJvv7gWLZM9tBw@mail.gmail.com>


--PCA+ff0wVcep1+Lo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 28, 2026 at 03:58:08PM +0200, Ricardo Ribalda wrote:
> 
> The only one that deserves a complain is this one:
> https://lore.kernel.org/linux-media/CANiDSCtm4Nh4Ub4rbEBvpjV8GXT9VQ5eFXZTHn=Wy=0RpR=3JA@mail.gmail.com/T/#m650723c33ec0318d8f32f1a6cc74c74a952ae11a

Thanks.  I've written a fix for this.  Let me test it tonight
and I'll push later.

I've attached the validation/ test so you can look at the new
ouput. ./smatch sm_mask1.c

regards,
dan carpenter

--PCA+ff0wVcep1+Lo
Content-Type: text/x-csrc; charset=us-ascii
Content-Disposition: attachment; filename="sm_mask1.c"

#include "check_debug.h"

void func(int a, int b, int c, int d, int e)
{
	if (a < 65)
		return;
	if (b < 0 || b > 7)
		return;
	if (c < 7 || c > 17)
		return;
	if (d < 0)
		return;

	e &= 0xf0;

	__smatch_implied(a);
	__smatch_implied(a & ~7);
	__smatch_implied(~7 & a);
	__smatch_implied(b & ~7);
	__smatch_implied(c & ~7);
	__smatch_implied(d & 0xff);
	__smatch_implied(d & 0xf0);
	__smatch_implied(d & e);
	__smatch_implied(d & (unsigned char)a);
	__smatch_implied(b & (unsigned char)a);
	__smatch_implied(c & (unsigned char)a);
}

/*
 * check-name: smatch: mask #1
 * check-command: ./smatch -I.. sm_mask1.c
 *
 * check-output-start
sm_mask1.c:16 func() implied: a = '65-s32max'
sm_mask1.c:17 func() implied: a & ~7 = '64-s32max'
sm_mask1.c:18 func() implied: ~7 & a = '64-s32max'
sm_mask1.c:19 func() implied: b & ~7 = '0'
sm_mask1.c:20 func() implied: c & ~7 = '0,8-16'
sm_mask1.c:21 func() implied: d & 255 = '0-255'
sm_mask1.c:22 func() implied: d & 240 = '0,16-240'
sm_mask1.c:23 func() implied: d & e = '0,16-240'
sm_mask1.c:24 func() implied: d & a = '0-255'
sm_mask1.c:25 func() implied: b & a = '0-7'
sm_mask1.c:26 func() implied: c & a = '0-17'
 * check-output-end
 */

--PCA+ff0wVcep1+Lo--
