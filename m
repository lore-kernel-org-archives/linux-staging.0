Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8159A31B830
	for <linux-staging@lists.linux.dev>; Fri,  1 May 2026 20:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777666753; cv=none; b=i2HGFpk+xrDAJT4uVpy4Ul7rE/MG+eSa1/gk69uQrjLjpWxP5OJeDqQEWnHLSdpBisdjF9SmTMNddVn70W6VAi2GAoOW8KtXOJD2jOXtuwgEHU3+Hlwm01bvBcBkwNfJAQ65qd5FaVsifhBLRCXI2jFLSknizGlRh230kB1QQa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777666753; c=relaxed/simple;
	bh=nTjZPSq8DBGTmtRgO55BiuONxSkZofggTHq8jvdoUmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T4atfZUzhgVi5FJ3Kk+AWvVM6k/FUYNUNHp+2CK89CTxCOZqNk0jTC+xilX6Wn0apmQkWLbpP0dZBkvikEtYji5PJWuFxoyUgsXbDHNoaG0uqayK5Zv8eRqwCZ4XPSgBu71q6qygGhig34jUHPn3bDBumOsyYY703YoMDUNQX/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QhnIgNjQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QhnIgNjQ"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0662E379;
	Fri,  1 May 2026 22:17:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777666643;
	bh=nTjZPSq8DBGTmtRgO55BiuONxSkZofggTHq8jvdoUmg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QhnIgNjQgi5FyiBaC6epUhdaXRIqM9ZC9nLt/3+8mph0qLiV+/O3kIQOm/RMXjhV4
	 n5KebhU+BX0DpXMRDYuFcUX2TpvHTCMsWyESXxJVcYDVjbkOJ0rCSPqkklox0mZK4P
	 yGzPqF+y/T670DoHjt09RGakaujlNp4zG7HaIlPc=
Date: Fri, 1 May 2026 23:19:06 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Keke Li <keke.li@amlogic.com>, Yong Zhi <yong.zhi@intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: [PATCH v2 2/6] media: i2c: mt9p031: Rewrite a bitwise mask
Message-ID: <20260501201906.GA488660@killaraus.ideasonboard.com>
References: <20260501-smatch-7-1-v2-0-a2fcfb2531ac@chromium.org>
 <20260501-smatch-7-1-v2-2-a2fcfb2531ac@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260501-smatch-7-1-v2-2-a2fcfb2531ac@chromium.org>

On Fri, May 01, 2026 at 11:32:47AM +0000, Ricardo Ribalda wrote:
> The current code makes smatch a bit uncomfortable:
> drivers/media/i2c/mt9p031.c:799 mt9p031_s_ctrl() warn: assigning (-1952) to unsigned variable 'data'
> 
> Probably because smatch is not clever enough (yet). Do a simple rewrite
> to make sure that smatch understands what we are doing here.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/i2c/mt9p031.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
> index ea5d43d925ff..5c9dff030b4d 100644
> --- a/drivers/media/i2c/mt9p031.c
> +++ b/drivers/media/i2c/mt9p031.c
> @@ -795,7 +795,7 @@ static int mt9p031_s_ctrl(struct v4l2_ctrl *ctrl)
>  			ctrl->val &= ~1;
>  			data = (1 << 6) | (ctrl->val >> 1);
>  		} else {
> -			ctrl->val &= ~7;
> +			ctrl->val -= ctrl->val % 8;
>  			data = ((ctrl->val - 64) << 5) | (1 << 6) | 32;

I'd still like to keep the ~7 (and, while at it, making the register
computation easier to read). I previously proposed

			ctrl->val &= ~7;
			data = (ctrl->val - 64) >> 3;
			data = (data << 8) | (1 << 6) | 32;

which didn't quite appease smatch. We could use an explicit mask:

			ctrl->val &= ~7;
			data = ((ctrl->val - 64) >> 3) & 0xff;
			data = (data << 8) | (1 << 6) | 32;

>  		}
>  
> 

-- 
Regards,

Laurent Pinchart
