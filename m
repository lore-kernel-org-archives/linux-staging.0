Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC5E3715E
	for <linux-staging@lists.linux.dev>; Tue, 19 Sep 2023 14:26:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D92BBC433CC;
	Tue, 19 Sep 2023 14:26:09 +0000 (UTC)
Message-ID: <307be618-f25b-4400-8659-11c9837dae35@xs4all.nl>
Date: Tue, 19 Sep 2023 16:26:08 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 44/49] media: cedrus: Stop direct calls to queue
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
 <20230914133323.198857-45-benjamin.gaignard@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230914133323.198857-45-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/09/2023 15:33, Benjamin Gaignard wrote:
> Use vb2_get_num_buffers() to avoid using queue num_buffer field directly.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 4 +++-
>  drivers/staging/media/sunxi/cedrus/cedrus_h265.c | 4 +++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> index dfb401df138a..bbe5802ea861 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> @@ -649,11 +649,13 @@ static void cedrus_h264_stop(struct cedrus_ctx *ctx)
>  	struct cedrus_dev *dev = ctx->dev;
>  	struct cedrus_buffer *buf;
>  	struct vb2_queue *vq;
> +	unsigned int q_num_bufs;
>  	unsigned int i;
>  
>  	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
> +	q_num_bufs = vb2_get_num_buffers(vq);
>  
> -	for (i = 0; i < vq->num_buffers; i++) {
> +	for (i = 0; i < q_num_bufs; i++) {

Shouldn't this be vq->max_allowed_buffers?

>  		buf = vb2_to_cedrus_buffer(vb2_get_buffer(vq, i));

And continue if vb2_get_buffer(vq, i) == NULL?

>  
>  		if (buf->codec.h264.mv_col_buf_size > 0) {
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> index fc9297232456..533a38316686 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> @@ -865,11 +865,13 @@ static void cedrus_h265_stop(struct cedrus_ctx *ctx)
>  	struct cedrus_dev *dev = ctx->dev;
>  	struct cedrus_buffer *buf;
>  	struct vb2_queue *vq;
> +	unsigned int q_num_bufs;
>  	unsigned int i;
>  
>  	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
> +	q_num_bufs = vb2_get_num_buffers(vq);
>  
> -	for (i = 0; i < vq->num_buffers; i++) {
> +	for (i = 0; i < q_num_bufs; i++) {

Ditto.

>  		buf = vb2_to_cedrus_buffer(vb2_get_buffer(vq, i));
>  
>  		if (buf->codec.h265.mv_col_buf_size > 0) {

If this driver starts supporting DELETE_BUF, then you can't use vb2_get_num_buffers(vq),
right?

	Hans
