Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982B73715B
	for <linux-staging@lists.linux.dev>; Tue, 19 Sep 2023 14:19:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B42FCC433C7;
	Tue, 19 Sep 2023 14:19:29 +0000 (UTC)
Message-ID: <d52bff95-7cee-4e75-9f77-488384e92998@xs4all.nl>
Date: Tue, 19 Sep 2023 16:19:27 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 38/49] media: usb: cx231xx: Stop direct calls to queue
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
 <20230914133323.198857-39-benjamin.gaignard@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230914133323.198857-39-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/09/2023 15:33, Benjamin Gaignard wrote:
> Use vb2_get_num_buffers() to avoid using queue num_buffer field directly.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  drivers/media/usb/cx231xx/cx231xx-417.c   | 5 +++--
>  drivers/media/usb/cx231xx/cx231xx-video.c | 5 +++--
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/usb/cx231xx/cx231xx-417.c b/drivers/media/usb/cx231xx/cx231xx-417.c
> index c5e21785fafe..9ec0b7e355e2 100644
> --- a/drivers/media/usb/cx231xx/cx231xx-417.c
> +++ b/drivers/media/usb/cx231xx/cx231xx-417.c
> @@ -1218,13 +1218,14 @@ static int queue_setup(struct vb2_queue *vq,
>  		       unsigned int sizes[], struct device *alloc_devs[])
>  {
>  	struct cx231xx *dev = vb2_get_drv_priv(vq);
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>  	unsigned int size = mpeglinesize * mpeglines;
>  
>  	dev->ts1.ts_packet_size  = mpeglinesize;
>  	dev->ts1.ts_packet_count = mpeglines;
>  
> -	if (vq->num_buffers + *nbuffers < CX231XX_MIN_BUF)
> -		*nbuffers = CX231XX_MIN_BUF - vq->num_buffers;
> +	if (q_num_bufs + *nbuffers < CX231XX_MIN_BUF)
> +		*nbuffers = CX231XX_MIN_BUF - q_num_bufs;

Drop the check, update min_buffers_needed from 1 to CX231XX_MIN_BUF.

>  
>  	if (*nplanes)
>  		return sizes[0] < size ? -EINVAL : 0;
> diff --git a/drivers/media/usb/cx231xx/cx231xx-video.c b/drivers/media/usb/cx231xx/cx231xx-video.c
> index e23b8ccd79d4..c8eb4222319d 100644
> --- a/drivers/media/usb/cx231xx/cx231xx-video.c
> +++ b/drivers/media/usb/cx231xx/cx231xx-video.c
> @@ -714,11 +714,12 @@ static int queue_setup(struct vb2_queue *vq,
>  		       unsigned int sizes[], struct device *alloc_devs[])
>  {
>  	struct cx231xx *dev = vb2_get_drv_priv(vq);
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>  
>  	dev->size = (dev->width * dev->height * dev->format->depth + 7) >> 3;
>  
> -	if (vq->num_buffers + *nbuffers < CX231XX_MIN_BUF)
> -		*nbuffers = CX231XX_MIN_BUF - vq->num_buffers;
> +	if (q_num_bufs + *nbuffers < CX231XX_MIN_BUF)
> +		*nbuffers = CX231XX_MIN_BUF - q_num_bufs;

Ditto.

>  
>  	if (*nplanes)
>  		return sizes[0] < dev->size ? -EINVAL : 0;

Regards,

	Hans
