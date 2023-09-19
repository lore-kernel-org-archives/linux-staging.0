Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5FB882E
	for <linux-staging@lists.linux.dev>; Tue, 19 Sep 2023 11:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 544B8C433C8;
	Tue, 19 Sep 2023 11:16:05 +0000 (UTC)
Message-ID: <cbfef598-8faa-40e6-8dc2-a1efd03f9560@xs4all.nl>
Date: Tue, 19 Sep 2023 13:16:03 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 16/49] media: verisilicon: postproc: Fix down scale
 test
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
 <20230914133323.198857-17-benjamin.gaignard@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230914133323.198857-17-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/09/2023 15:32, Benjamin Gaignard wrote:
> Do not allow down scaling if the source buffer resolution is
> smaller  than destination one.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Fixes: fbb6c848dd89 ("media: destage Hantro VPU driver")

Is this really a fix? I gather that this relies on "VP9 resolution change without
doing stream off/on" support, and support for that is added by these patches.

Adding the Fixes tag would cause stable maintainers to queue this patch up for
older kernels, but I don't think that is needed here at all.

And related I also think that this really does not belong to this patch series.

As I understand it, patch 13/49 extends the verisilicon driver to support more
than 32 buffers, so that one makes sense in the context of this series.

But the other verisilicon patches appear to be unrelated and instead add a new
feature, and I don't believe it relates to this series at all.

If I am right, then please post this as a separate series, possibly mentioning
that it sits on top of this series.

Regards,

	Hans

> ---
>  drivers/media/platform/verisilicon/hantro_postproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/verisilicon/hantro_postproc.c b/drivers/media/platform/verisilicon/hantro_postproc.c
> index e624cd98f41b..77d8ecfbe12f 100644
> --- a/drivers/media/platform/verisilicon/hantro_postproc.c
> +++ b/drivers/media/platform/verisilicon/hantro_postproc.c
> @@ -107,7 +107,7 @@ static void hantro_postproc_g1_enable(struct hantro_ctx *ctx)
>  
>  static int down_scale_factor(struct hantro_ctx *ctx)
>  {
> -	if (ctx->src_fmt.width == ctx->dst_fmt.width)
> +	if (ctx->src_fmt.width <= ctx->dst_fmt.width)
>  		return 0;
>  
>  	return DIV_ROUND_CLOSEST(ctx->src_fmt.width, ctx->dst_fmt.width);

