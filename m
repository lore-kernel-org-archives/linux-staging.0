Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4404D15E8B
	for <linux-staging@lists.linux.dev>; Wed, 18 Oct 2023 10:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C089EC433C8;
	Wed, 18 Oct 2023 10:19:17 +0000 (UTC)
Message-ID: <0fb31f73-2743-44c0-af1b-ac30c582e45a@xs4all.nl>
Date: Wed, 18 Oct 2023 12:19:16 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 22/56] media: pci: tw686x: Set min_buffers_needed to 3
Content-Language: en-US, nl
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 tfiga@chromium.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
 ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com
References: <20231017144756.34719-1-benjamin.gaignard@collabora.com>
 <20231017144756.34719-23-benjamin.gaignard@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20231017144756.34719-23-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/10/2023 16:47, Benjamin Gaignard wrote:
> vb2 queue_setup checks for a minimum number of buffers so set
> min_buffers_needed to 3 and remove the useless check in
> tw686x_queue_setup().
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> CC: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> ---
>  drivers/media/pci/tw686x/tw686x-video.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/pci/tw686x/tw686x-video.c b/drivers/media/pci/tw686x/tw686x-video.c
> index 3ebf7a2c95f0..74cd864365aa 100644
> --- a/drivers/media/pci/tw686x/tw686x-video.c
> +++ b/drivers/media/pci/tw686x/tw686x-video.c
> @@ -426,13 +426,6 @@ static int tw686x_queue_setup(struct vb2_queue *vq,
>  	unsigned int szimage =
>  		(vc->width * vc->height * vc->format->depth) >> 3;
>  
> -	/*
> -	 * Let's request at least three buffers: two for the
> -	 * DMA engine and one for userspace.
> -	 */
> -	if (vq->num_buffers + *nbuffers < 3)
> -		*nbuffers = 3 - vq->num_buffers;
> -
>  	if (*nplanes) {
>  		if (*nplanes != 1 || sizes[0] < szimage)
>  			return -EINVAL;
> @@ -1221,7 +1214,11 @@ int tw686x_video_init(struct tw686x_dev *dev)
>  		vc->vidq.ops = &tw686x_video_qops;
>  		vc->vidq.mem_ops = dev->dma_ops->mem_ops;
>  		vc->vidq.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> -		vc->vidq.min_buffers_needed = 2;
> +		/*
> +		 * Let's request at least three buffers: two for the
> +		 * DMA engine and one for userspace.
> +		 */
> +		vc->vidq.min_buffers_needed = 3;

Don't touch min_buffers_needed, just keep the current check in queue_setup.

Regards,

	Hans

>  		vc->vidq.lock = &vc->vb_mutex;
>  		vc->vidq.gfp_flags = dev->dma_mode != TW686X_DMA_MODE_MEMCPY ?
>  				     GFP_DMA32 : 0;

