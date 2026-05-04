Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6432D7393
	for <linux-staging@lists.linux.dev>; Mon,  4 May 2026 07:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777879185; cv=none; b=D+lHcF8sp5kDUAzbM5luUhgMNaS1ThzQUH1s8x7fTNudDe127g0+IlWaSydmD9dIkJ30LdvNRTlWxzF5yfm2ORYVfMWqiH24jpVDucTnm9lHqfy91enk82/H6Qwiow7adeNexuO3BUgEmS4BvAj6a6FlhjGzgEiMNWYlBI7Wqy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777879185; c=relaxed/simple;
	bh=ZwpEgD9dfY1lLa0/0tzE+yUzAUsDEEdYjAkgPNwa27o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qB5069p4aFRlVOD8o8yg5gv9FOClZaEvlXBWc+uTU4fawgSSoceo+jtZSVFEmnvM7l5A/N/IlhJUIT4VDvdAU527cC3R3TFeopFxAQGo3HTV3xdk74GFf7quSLkTV60CbmoVpvzDxthCrQGoX6cr28DNiytRhJdUxd3sMv/tXrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bTqfMcXn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bTqfMcXn"
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E18F08F;
	Mon,  4 May 2026 09:19:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777879172;
	bh=ZwpEgD9dfY1lLa0/0tzE+yUzAUsDEEdYjAkgPNwa27o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bTqfMcXndrnhLd74eNJZVShOfpKjZXblDYGHxTC4M3yh3VPjZKQ4WDraxoXBusIyp
	 Hp4qPP888Kqc5vAk9B7Rip3VFT31cqWzOrQO6k2r8/qSwZPeFkTgWeTcARmuZ+7MUW
	 A3NOYIu+DMETVzblFReNES1pQD33ZYT6dMxRJezg=
Date: Mon, 4 May 2026 09:19:30 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>, 
	Jackson Lee <jackson.lee@chipsnmedia.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	Tianshu Qiu <tian.shu.qiu@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Keke Li <keke.li@amlogic.com>, Yong Zhi <yong.zhi@intel.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
	stable@vger.kernel.org
Subject: Re: [PATCH v3 6/6] media: amlogic-c3: Add validations for ae and awb
 config
Message-ID: <afhH8Fq_7bIy3Lv3@zed>
References: <20260504-smatch-7-1-v3-0-fda125c30058@chromium.org>
 <20260504-smatch-7-1-v3-6-fda125c30058@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260504-smatch-7-1-v3-6-fda125c30058@chromium.org>

Hi Ricardo

On Mon, May 04, 2026 at 06:54:09AM +0000, Ricardo Ribalda wrote:
> Avoid invalid memory access if the zones_num is bigger than
> zone_weight.
>
> This patch fixes the following smatch errors:
> drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
> drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
> drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
> drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
>
> Cc: stable@vger.kernel.org
> Fixes: fb2e135208f3 ("media: platform: Add C3 ISP driver")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/platform/amlogic/c3/isp/c3-isp-params.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> index 6f9ca7a7dd88..aec3eed0e443 100644
> --- a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> +++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> @@ -104,6 +104,8 @@ static void c3_isp_params_awb_wt(struct c3_isp_device *isp,
>  	c3_isp_write(isp, ISP_AWB_BLK_WT_ADDR, 0);
>
>  	zones_num = cfg->horiz_zones_num * cfg->vert_zones_num;
> +	if (zones_num > C3_ISP_AWB_MAX_ZONES)
> +		zones_num = C3_ISP_AWB_MAX_ZONES;

Or
        zones_num = min(cfg->horiz_zones_num * cfg->vert_zones_num,
                        C3_ISP_AWB_MAX_ZONES);

Whatever you prefer:
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

>
>  	/* Need to write 8 weights at once */
>  	for (i = 0; i < zones_num / 8; i++) {
> @@ -220,6 +222,8 @@ static void c3_isp_params_ae_wt(struct c3_isp_device *isp,
>  	c3_isp_write(isp, ISP_AE_BLK_WT_ADDR, 0);
>
>  	zones_num = cfg->horiz_zones_num * cfg->vert_zones_num;
> +	if (zones_num > C3_ISP_AE_MAX_ZONES)
> +		zones_num = C3_ISP_AE_MAX_ZONES;
>
>  	/* Need to write 8 weights at once */
>  	for (i = 0; i < zones_num / 8; i++) {
>
> --
> 2.54.0.545.g6539524ca2-goog
>
