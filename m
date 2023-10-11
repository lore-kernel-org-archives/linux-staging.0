Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A751A700
	for <linux-staging@lists.linux.dev>; Wed, 11 Oct 2023 08:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8F39C433C8;
	Wed, 11 Oct 2023 08:54:35 +0000 (UTC)
Message-ID: <ab98f6df-206b-48a0-a8ec-4d105bae0e22@xs4all.nl>
Date: Wed, 11 Oct 2023 10:54:35 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 20/54] media: Remove duplicated index vs
 q->num_buffers check
Content-Language: en-US, nl
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 tfiga@chromium.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
 ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com
References: <20231003080704.43911-1-benjamin.gaignard@collabora.com>
 <20231003080704.43911-21-benjamin.gaignard@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20231003080704.43911-21-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Subject should start with "media: videobuf2:".

Regards,

	Hans

On 03/10/2023 10:06, Benjamin Gaignard wrote:
> vb2_get_buffer() already checks if the requested index is valid.
> Stop duplicating this kind of check everywhere.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  drivers/media/common/videobuf2/videobuf2-v4l2.c | 13 -------------
>  1 file changed, 13 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index 42da0adc052a..cf881c8d8d4d 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -378,11 +378,6 @@ static int vb2_queue_or_prepare_buf(struct vb2_queue *q, struct media_device *md
>  		return -EINVAL;
>  	}
>  
> -	if (b->index >= q->num_buffers) {
> -		dprintk(q, 1, "%s: buffer index out of range\n", opname);
> -		return -EINVAL;
> -	}
> -
>  	vb = vb2_get_buffer(q, b->index);
>  	if (!vb) {
>  		dprintk(q, 1, "%s: buffer %u is NULL\n", opname,  b->index);
> @@ -833,10 +828,6 @@ int vb2_qbuf(struct vb2_queue *q, struct media_device *mdev,
>  		return -EBUSY;
>  	}
>  
> -	if (b->index >= q->num_buffers) {
> -		dprintk(q, 1, "buffer index out of range\n");
> -		return -EINVAL;
> -	}
>  	vb = vb2_get_buffer(q, b->index);
>  	if (!vb) {
>  		dprintk(q, 1, "can't find the requested buffer %u\n", b->index);
> @@ -908,10 +899,6 @@ int vb2_expbuf(struct vb2_queue *q, struct v4l2_exportbuffer *eb)
>  {
>  	struct vb2_buffer *vb;
>  
> -	if (eb->index >= q->num_buffers) {
> -		dprintk(q, 1, "buffer index out of range\n");
> -		return -EINVAL;
> -	}
>  	vb = vb2_get_buffer(q, eb->index);
>  	if (!vb) {
>  		dprintk(q, 1, "can't find the requested buffer %u\n", eb->index);

