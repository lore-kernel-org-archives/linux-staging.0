Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA4936B19
	for <linux-staging@lists.linux.dev>; Tue, 19 Sep 2023 13:43:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F513C433C7;
	Tue, 19 Sep 2023 13:42:57 +0000 (UTC)
Message-ID: <08551a93-a4b6-40c1-88c0-2c419987cc3e@xs4all.nl>
Date: Tue, 19 Sep 2023 15:42:57 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 23/49] media: pci: cx18: Stop direct calls to queue
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
 <20230914133323.198857-24-benjamin.gaignard@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230914133323.198857-24-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/09/2023 15:32, Benjamin Gaignard wrote:
> Use vb2_get_num_buffers() to avoid using queue num_buffer field directly.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  drivers/media/pci/cx18/cx18-streams.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/pci/cx18/cx18-streams.c b/drivers/media/pci/cx18/cx18-streams.c
> index 597472754c4c..a7a7e006b3be 100644
> --- a/drivers/media/pci/cx18/cx18-streams.c
> +++ b/drivers/media/pci/cx18/cx18-streams.c
> @@ -105,6 +105,7 @@ static int cx18_queue_setup(struct vb2_queue *vq,
>  			    unsigned int sizes[], struct device *alloc_devs[])
>  {
>  	struct cx18_stream *s = vb2_get_drv_priv(vq);
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>  	struct cx18 *cx = s->cx;
>  	unsigned int szimage;
>  
> @@ -121,8 +122,8 @@ static int cx18_queue_setup(struct vb2_queue *vq,
>  	 * Let's request at least three buffers: two for the
>  	 * DMA engine and one for userspace.
>  	 */
> -	if (vq->num_buffers + *nbuffers < 3)
> -		*nbuffers = 3 - vq->num_buffers;
> +	if (q_num_bufs + *nbuffers < 3)
> +		*nbuffers = 3 - q_num_bufs;

From what I can see, this driver already sets min_buffers_needed to 3,
so this check can just be dropped.

	Hans

>  
>  	if (*nplanes) {
>  		if (*nplanes != 1 || sizes[0] < szimage)

