Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE3D36B19
	for <linux-staging@lists.linux.dev>; Tue, 19 Sep 2023 13:42:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE1FFC433C7;
	Tue, 19 Sep 2023 13:42:00 +0000 (UTC)
Message-ID: <ebdb6cb9-f620-422f-9e69-ac6792b19237@xs4all.nl>
Date: Tue, 19 Sep 2023 15:42:00 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 22/49] media: i2c: Stop direct calls to queue
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
 <20230914133323.198857-23-benjamin.gaignard@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230914133323.198857-23-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/09/2023 15:32, Benjamin Gaignard wrote:
> Use vb2_get_num_buffers() to avoid using queue num_buffer field directly.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  drivers/media/i2c/video-i2c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
> index 537ebd9fa8d7..60d3e2f35afe 100644
> --- a/drivers/media/i2c/video-i2c.c
> +++ b/drivers/media/i2c/video-i2c.c
> @@ -406,7 +406,7 @@ static int queue_setup(struct vb2_queue *vq,
>  	struct video_i2c_data *data = vb2_get_drv_priv(vq);
>  	unsigned int size = data->chip->buffer_size;
>  
> -	if (vq->num_buffers + *nbuffers < 2)
> +	if (vb2_get_num_buffers(vq) + *nbuffers < 2)
>  		*nbuffers = 2;
>  
>  	if (*nplanes)

This driver sets min_buffers_needed to 1, then checks for 2 here.

Drop the check and instead set min_buffers_needed to 2.

Update the commit log accordingly.

Regards,

	Hans
