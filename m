Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863D772
	for <linux-staging@lists.linux.dev>; Wed,  8 Sep 2021 22:43:30 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 33B7E883;
	Thu,  9 Sep 2021 00:37:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1631140652;
	bh=1bGvqSulJnZHe9TfBwp2sU+A8oEVgTU8e0GgVdcU/ws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cef2d0qWc8/lv1lki7yGSBS6cZX5fhhyJWDWBDSt4oq6beKouAYBKJzPayLQxOM/9
	 31dAAad6plu2+pKQWCvzlYuR1nhBraJfy7JRu6F2fAajaiLYHoTaqPbXkjYu5HEMQk
	 hNf/pqe830GoTcdoHx7+bjaYR3JlEeSM0ETYTP8E=
Date: Thu, 9 Sep 2021 01:37:11 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Martin Kepplinger <martin.kepplinger@puri.sm>
Cc: slongerbeam@gmail.com, p.zabel@pengutronix.de, mchehab@kernel.org,
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: imx: set a media_device bus_info string
Message-ID: <YTk7F+UTZmpeXzHj@pendragon.ideasonboard.com>
References: <20210908084746.243359-1-martin.kepplinger@puri.sm>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210908084746.243359-1-martin.kepplinger@puri.sm>

Hi Martin,

Thank you for the patch.

On Wed, Sep 08, 2021 at 10:47:46AM +0200, Martin Kepplinger wrote:
> some tools like v4l2-compliance let users select a media device based

s/some/Some/

I'll fix then when applying the patch to my tree.

> on the bus_info string which can be quite convenient. Use a unique
> string for that.
> 
> This also fixes the following v4l2-compliance warning:
> warn: v4l2-test-media.cpp(52): empty bus_info
> 
> Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/staging/media/imx/imx-media-dev-common.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/staging/media/imx/imx-media-dev-common.c b/drivers/staging/media/imx/imx-media-dev-common.c
> index d006e961d8f4..80b69a9a752c 100644
> --- a/drivers/staging/media/imx/imx-media-dev-common.c
> +++ b/drivers/staging/media/imx/imx-media-dev-common.c
> @@ -367,6 +367,8 @@ struct imx_media_dev *imx_media_dev_init(struct device *dev,
>  	imxmd->v4l2_dev.notify = imx_media_notify;
>  	strscpy(imxmd->v4l2_dev.name, "imx-media",
>  		sizeof(imxmd->v4l2_dev.name));
> +	snprintf(imxmd->md.bus_info, sizeof(imxmd->md.bus_info),
> +		 "platform:%s", dev_name(imxmd->md.dev));
>  
>  	media_device_init(&imxmd->md);
>  

-- 
Regards,

Laurent Pinchart
