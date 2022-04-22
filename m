Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF35123D3
	for <linux-staging@lists.linux.dev>; Fri, 22 Apr 2022 07:43:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FCEDC385A4;
	Fri, 22 Apr 2022 07:43:28 +0000 (UTC)
Message-ID: <8f6c8a5c-200d-fbbd-0b8a-966d94467aad@xs4all.nl>
Date: Fri, 22 Apr 2022 09:43:27 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 17/24] media: rkvdec: h264: Fix reference frame_num
 wrap for second field
Content-Language: en-US
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, Ezequiel Garcia <ezequiel@collabora.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev
References: <20220405204426.259074-1-nicolas.dufresne@collabora.com>
 <20220405204426.259074-18-nicolas.dufresne@collabora.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20220405204426.259074-18-nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/04/2022 22:44, Nicolas Dufresne wrote:
> From: Jonas Karlman <jonas@kwiboo.se>
> 
> When decoding the second field in a complementary field pair the second
> field is sharing the same frame_num with the first field.
> 
> Currently the frame_num for the first field is wrapped when it matches the
> field being decoded, this cause issues to decode the second field in a

cause issues to decode -> caused issues decoding

> complementary field pair.
> 
> Fix this by using inclusive comparison, less than or equal.

I would change this last sentence to:

	Fix this by using inclusive comparison: 'less than or equal'.

It makes it a bit easier to parse.

> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
> Reviewed-by: Sebastian Fricke <sebastian.fricke@collabora.com>
> ---
>  drivers/staging/media/rkvdec/rkvdec-h264.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
> index f081b476340f..60eaf06b6e25 100644
> --- a/drivers/staging/media/rkvdec/rkvdec-h264.c
> +++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
> @@ -781,7 +781,7 @@ static void assemble_hw_rps(struct rkvdec_ctx *ctx,
>  			continue;
>  
>  		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM ||
> -		    dpb[i].frame_num < dec_params->frame_num) {
> +		    dpb[i].frame_num <= dec_params->frame_num) {

I wonder if a comment should be added here, explaining the reason for '<='.

It doesn't seem obvious to me. Up to you, though.

>  			p[i] = dpb[i].frame_num;
>  			continue;
>  		}

Regards,

	Hans
