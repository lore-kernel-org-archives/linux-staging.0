Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A3619444
	for <linux-staging@lists.linux.dev>; Wed, 18 Oct 2023 10:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52F7EC433C7;
	Wed, 18 Oct 2023 10:30:24 +0000 (UTC)
Message-ID: <f677c49a-15e0-4d80-9359-57ea50f19d01@xs4all.nl>
Date: Wed, 18 Oct 2023 12:30:23 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 35/56] media: cedrus: Stop direct calls to queue
 num_buffers field
Content-Language: en-US, nl
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 tfiga@chromium.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
 ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Maxime Ripard <mripard@kernel.org>
References: <20231017144756.34719-1-benjamin.gaignard@collabora.com>
 <20231017144756.34719-36-benjamin.gaignard@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20231017144756.34719-36-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/10/2023 16:47, Benjamin Gaignard wrote:
> Use vb2_get_num_buffers() and queue max_num_buffers field

Reference to max_num_buffers which doesn't exist yet.

> to avoid using queue num_buffer field directly.

num_buffer -> num_buffers

> This allows us to change how the number of buffers is computed in the
> futur.

futur -> future

Regards,

	Hans

> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Acked-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> CC: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 9 +++++++--
>  drivers/staging/media/sunxi/cedrus/cedrus_h265.c | 9 +++++++--
>  2 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> index dfb401df138a..3e2843ef6cce 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> @@ -653,8 +653,13 @@ static void cedrus_h264_stop(struct cedrus_ctx *ctx)
>  
>  	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
>  
> -	for (i = 0; i < vq->num_buffers; i++) {
> -		buf = vb2_to_cedrus_buffer(vb2_get_buffer(vq, i));
> +	for (i = 0; i < vb2_get_num_buffers(vq); i++) {
> +		struct vb2_buffer *vb = vb2_get_buffer(vq, i);
> +
> +		if (!vb)
> +			continue;
> +
> +		buf = vb2_to_cedrus_buffer(vb);
>  
>  		if (buf->codec.h264.mv_col_buf_size > 0) {
>  			dma_free_attrs(dev->dev,
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> index fc9297232456..52e94c8f2f01 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> @@ -869,8 +869,13 @@ static void cedrus_h265_stop(struct cedrus_ctx *ctx)
>  
>  	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
>  
> -	for (i = 0; i < vq->num_buffers; i++) {
> -		buf = vb2_to_cedrus_buffer(vb2_get_buffer(vq, i));
> +	for (i = 0; i < vb2_get_num_buffers(vq); i++) {
> +		struct vb2_buffer *vb = vb2_get_buffer(vq, i);
> +
> +		if (!vb)
> +			continue;
> +
> +		buf = vb2_to_cedrus_buffer(vb);
>  
>  		if (buf->codec.h265.mv_col_buf_size > 0) {
>  			dma_free_attrs(dev->dev,

