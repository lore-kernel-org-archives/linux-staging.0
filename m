Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88C03454F
	for <linux-staging@lists.linux.dev>; Mon, 27 Nov 2023 17:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eoBqBtbP"
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 48070276;
	Mon, 27 Nov 2023 18:06:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701104779;
	bh=8JQxveM7AqrID1mnHERVbGhkvvjfoD9aqWGG1HUbsJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eoBqBtbPt6mEzMuIjmu5aJv3YoBKQ+WueFgiIB82NG0aItHgq3GAUSyeTfwai8TIJ
	 jhu3g02VqBiIBmoAIS7+jJ6qUbqewXmgHPzM4TvXkOCwnzAQxPdKd02jEhN0bSi/Jh
	 IQ8cGXxZw+BWkzxSTu9SmcYSGAhfFD6/F0iM8Yao=
Date: Mon, 27 Nov 2023 19:07:00 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: hverkuil@xs4all.nl, mchehab@kernel.org, tfiga@chromium.org,
	m.szyprowski@samsung.com, matt.ranostay@konsulko.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, kernel@collabora.com,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>
Subject: Re: [PATCH 07/55] media: imx8-isi: Stop abusing of
 min_buffers_needed field
Message-ID: <20231127170700.GC31314@pendragon.ideasonboard.com>
References: <20231127165454.166373-1-benjamin.gaignard@collabora.com>
 <20231127165454.166373-8-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231127165454.166373-8-benjamin.gaignard@collabora.com>

Hi Benjamin,

Thank you for the patch.

On Mon, Nov 27, 2023 at 05:54:06PM +0100, Benjamin Gaignard wrote:
> 'min_buffers_needed' is suppose to be used to indicate the number
> of buffers needed by DMA engine to start streaming.
> imx8-isi driver doesn't use DMA engine and just want to specify

What do you mean, "doesn't use DMA engine" ? The ISI surely has DMA
engines :-)

> the minimum number of buffers to allocate when calling VIDIOC_REQBUFS.
> That 'min_reqbufs_allocation' field purpose so use it.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> CC: Mauro Carvalho Chehab <mchehab@kernel.org>
> CC: Shawn Guo <shawnguo@kernel.org>
> CC: Sascha Hauer <s.hauer@pengutronix.de>
> CC: Pengutronix Kernel Team <kernel@pengutronix.de>
> CC: Fabio Estevam <festevam@gmail.com>
> CC: NXP Linux Team <linux-imx@nxp.com>
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> index 49bca2b01cc6..81673ff9084b 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> @@ -1453,7 +1453,7 @@ int mxc_isi_video_register(struct mxc_isi_pipe *pipe,
>  	q->mem_ops = &vb2_dma_contig_memops;
>  	q->buf_struct_size = sizeof(struct mxc_isi_buffer);
>  	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> -	q->min_buffers_needed = 2;
> +	q->min_reqbufs_allocation = 2;
>  	q->lock = &video->lock;
>  	q->dev = pipe->isi->dev;
>  

-- 
Regards,

Laurent Pinchart
