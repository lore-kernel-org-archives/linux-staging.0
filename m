Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96A06D12
	for <linux-staging@lists.linux.dev>; Thu,  8 Apr 2021 16:26:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: ezequiel)
	with ESMTPSA id B82A11F45CF6
Message-ID: <d4000598fddcf45e578462aa04b556c0ca057091.camel@collabora.com>
Subject: Re: [PATCH 1/2 v2] staging: media: hantro: Align line break to the
 open parenthesis in file hantro_hw.h
From: Ezequiel Garcia <ezequiel@collabora.com>
To: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>, Philipp Zabel
	 <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg
	Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Date: Thu, 08 Apr 2021 13:20:49 -0300
In-Reply-To: <1e6d73432d60dfb8bb3f7f2bd6bf3084091a2a39.1617890467.git.alinesantanacordeiro@gmail.com>
References: <cover.1617890467.git.alinesantanacordeiro@gmail.com>
	 <1e6d73432d60dfb8bb3f7f2bd6bf3084091a2a39.1617890467.git.alinesantanacordeiro@gmail.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ola Aline,

Welcome to the kernel community. Hope you enjoy some of this
Outreachy adventures.

Normally, when you submit a v2, we want to know what changed
between the first submission and v2.

If you are subscribed to linux-media, you can read some
of the series with a vN+1 and look how it's done. Examples:

https://www.spinics.net/lists/linux-media/msg190043.html

https://www.spinics.net/lists/linux-media/msg189923.html

I'm sure your Outreachy mentors can tell you more.

On Thu, 2021-04-08 at 11:07 -0300, Aline Santana Cordeiro wrote:
> Aligns line break with the remaining function arguments
> to the open parenthesis. Issue found by checkpatch.
> 
> Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
> ---
>  drivers/staging/media/hantro/hantro_hw.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
> index 34c9e46..a650b9c 100644
> --- a/drivers/staging/media/hantro/hantro_hw.h
> +++ b/drivers/staging/media/hantro/hantro_hw.h
> @@ -207,7 +207,7 @@ hantro_h264_mv_size(unsigned int width, unsigned int height)
>  void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx);
>  void rk3399_vpu_mpeg2_dec_run(struct hantro_ctx *ctx);
>  void hantro_mpeg2_dec_copy_qtable(u8 *qtable,
> -       const struct v4l2_ctrl_mpeg2_quantization *ctrl);
> +                                 const struct v4l2_ctrl_mpeg2_quantization *ctrl);
>  int hantro_mpeg2_dec_init(struct hantro_ctx *ctx);
>  void hantro_mpeg2_dec_exit(struct hantro_ctx *ctx);
>  


