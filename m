Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B3B19453
	for <linux-staging@lists.linux.dev>; Wed, 18 Oct 2023 10:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18A5CC433C7;
	Wed, 18 Oct 2023 10:31:00 +0000 (UTC)
Message-ID: <7e3a9531-f48d-4ba6-b1ba-5c44c8e9bd98@xs4all.nl>
Date: Wed, 18 Oct 2023 12:31:00 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 36/56] media: nuvoton: Stop direct calls to queue
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
 Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>
References: <20231017144756.34719-1-benjamin.gaignard@collabora.com>
 <20231017144756.34719-37-benjamin.gaignard@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20231017144756.34719-37-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/10/2023 16:47, Benjamin Gaignard wrote:
> Use vb2_get_num_buffers() to avoid using queue num_buffers field directly.
> This allows us to change how the number of buffers is computed in the
> futur.

futur -> future

This is probably spelled wrong in other places, please check!

Regards,

	Hans

> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> CC: Joseph Liu <kwliu@nuvoton.com>
> CC: Marvin Lin <kflin@nuvoton.com>
> ---
>  drivers/media/platform/nuvoton/npcm-video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
> index b9e6782f59b4..f9b4e36a5175 100644
> --- a/drivers/media/platform/nuvoton/npcm-video.c
> +++ b/drivers/media/platform/nuvoton/npcm-video.c
> @@ -393,7 +393,7 @@ static void npcm_video_free_diff_table(struct npcm_video *video)
>  	struct rect_list *tmp;
>  	unsigned int i;
>  
> -	for (i = 0; i < video->queue.num_buffers; i++) {
> +	for (i = 0; i < vb2_get_num_buffers(&video->queue); i++) {
>  		head = &video->list[i];
>  		list_for_each_safe(pos, nx, head) {
>  			tmp = list_entry(pos, struct rect_list, list);

