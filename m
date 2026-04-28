Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4E543D510
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 13:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777382729; cv=none; b=q9H6ZMly/Sqm9m+oAjWw71Sg43gd257bNl9gQB3SnQENBx/UeKygx+zt4vXi1HYIA7TPySU6N8j/SBqqPfVnT0VfTUlVLTZR56I36rsXT9u61ZuP7V5K3Dfxng5l4g/jK4EQ+nEpNYSEN187vA42qtscYVfP5Flg8hM245uOS80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777382729; c=relaxed/simple;
	bh=4//q+TQB27M8M5A4ul7hqiXW0NNLlG0jYooYZoxpG4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C6RGDBmALAYoTnFR1iEoVNKOGVERVEpHY3c2VT28GgM1WETOZ/Lv1e09x8nVHjqJbvGX9V/Dc7E0KDREfueh+BDc6OQJt1QkVifdN6xsNKH8K3usdNNFjNqfWvfsCcCdE/PNLTfzXF9OtokOCXdlv04/iutdJwJJ9hnHz/R7b+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=n0x4tnkU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="n0x4tnkU"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6764CE91;
	Tue, 28 Apr 2026 15:23:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777382623;
	bh=4//q+TQB27M8M5A4ul7hqiXW0NNLlG0jYooYZoxpG4A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n0x4tnkUmIi2GiWsmbS5zrQ2AcclyUm7CG1sTSxlPrMqAP7cpIC9cdDUx9teOb0vr
	 EDXshRtRvD76pRof+zP0VkRdypUs2lmBxQNLCa2v1lt6HNsZouny5uSgAJlgaVb8lo
	 l0pyzGekhnwQAERLONENL2D9aXwxl0xw448KBh/0=
Date: Tue, 28 Apr 2026 16:25:24 +0300
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
	Keke Li <keke.li@amlogic.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 2/6] media: i2c: mt9p031: Rewrite a bitwise mask
Message-ID: <20260428132524.GC120836@killaraus.ideasonboard.com>
References: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org>
 <20260428-smatch-7-1-v1-2-46890dffb611@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260428-smatch-7-1-v1-2-46890dffb611@chromium.org>

On Tue, Apr 28, 2026 at 12:41:08PM +0000, Ricardo Ribalda wrote:
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

This is less readable than it was :-/ Is there a way to avoid the
warning while keeping the ~7 ? Maybe by assigning

			data = (ctrl->val - 64) >> 3;
 			data = (data << 8) | (1 << 6) | 32;

>  			data = ((ctrl->val - 64) << 5) | (1 << 6) | 32;
>  		}
>  

-- 
Regards,

Laurent Pinchart
