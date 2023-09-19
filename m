Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F9631A65
	for <linux-staging@lists.linux.dev>; Tue, 19 Sep 2023 13:56:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00FC1C433C7;
	Tue, 19 Sep 2023 13:56:39 +0000 (UTC)
Message-ID: <14def513-1900-44e8-9b1d-154feccedf62@xs4all.nl>
Date: Tue, 19 Sep 2023 15:56:38 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 26/49] media: pci: tw68: Stop direct calls to queue
 num_buffers field
Content-Language: en-US, nl
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 tfiga@chromium.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
 ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com
References: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
 <20230914133323.198857-27-benjamin.gaignard@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230914133323.198857-27-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/09/2023 15:33, Benjamin Gaignard wrote:
> Use vb2_get_num_buffers() to avoid using queue num_buffer field directly.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  drivers/media/pci/tw68/tw68-video.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/pci/tw68/tw68-video.c b/drivers/media/pci/tw68/tw68-video.c
> index 773a18702d36..35296c226019 100644
> --- a/drivers/media/pci/tw68/tw68-video.c
> +++ b/drivers/media/pci/tw68/tw68-video.c
> @@ -360,13 +360,13 @@ static int tw68_queue_setup(struct vb2_queue *q,
>  			   unsigned int sizes[], struct device *alloc_devs[])
>  {
>  	struct tw68_dev *dev = vb2_get_drv_priv(q);
> -	unsigned tot_bufs = q->num_buffers + *num_buffers;
> +	unsigned tot_bufs = vb2_get_num_buffers(q) + *num_buffers;
>  	unsigned size = (dev->fmt->depth * dev->width * dev->height) >> 3;
>  
>  	if (tot_bufs < 2)
>  		tot_bufs = 2;

This check can be dropped since vidq.min_buffers_needed is already set to 2.

>  	tot_bufs = tw68_buffer_count(size, tot_bufs);
> -	*num_buffers = tot_bufs - q->num_buffers;
> +	*num_buffers = tot_bufs - vb2_get_num_buffers(q);
>  	/*
>  	 * We allow create_bufs, but only if the sizeimage is >= as the
>  	 * current sizeimage. The tw68_buffer_count calculation becomes quite

Otherwise this is fine.

Regards,

	Hans
