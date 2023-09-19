Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E0E1FAA
	for <linux-staging@lists.linux.dev>; Tue, 19 Sep 2023 14:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEF78C433C7;
	Tue, 19 Sep 2023 14:20:10 +0000 (UTC)
Message-ID: <e534208c-78ca-48f1-8250-d1a2790e080e@xs4all.nl>
Date: Tue, 19 Sep 2023 16:20:10 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 39/49] media: usb: hackrf: Stop direct calls to queue
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
 <20230914133323.198857-40-benjamin.gaignard@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230914133323.198857-40-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/09/2023 15:33, Benjamin Gaignard wrote:
> Use vb2_get_num_buffers() to avoid using queue num_buffer field directly.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  drivers/media/usb/hackrf/hackrf.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/hackrf/hackrf.c b/drivers/media/usb/hackrf/hackrf.c
> index 3e535be2c520..9c0ecd5f056c 100644
> --- a/drivers/media/usb/hackrf/hackrf.c
> +++ b/drivers/media/usb/hackrf/hackrf.c
> @@ -753,12 +753,13 @@ static int hackrf_queue_setup(struct vb2_queue *vq,
>  		unsigned int *nplanes, unsigned int sizes[], struct device *alloc_devs[])
>  {
>  	struct hackrf_dev *dev = vb2_get_drv_priv(vq);
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>  
>  	dev_dbg(dev->dev, "nbuffers=%d\n", *nbuffers);
>  
>  	/* Need at least 8 buffers */
> -	if (vq->num_buffers + *nbuffers < 8)
> -		*nbuffers = 8 - vq->num_buffers;
> +	if (q_num_bufs + *nbuffers < 8)
> +		*nbuffers = 8 - q_num_bufs;

Drop check, set min_buffers_needed to 8.

Regards,

	Hans

>  	*nplanes = 1;
>  	sizes[0] = PAGE_ALIGN(dev->buffersize);
>  

