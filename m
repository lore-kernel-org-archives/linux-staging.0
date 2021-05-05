Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9DC72
	for <linux-staging@lists.linux.dev>; Wed,  5 May 2021 13:27:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: ezequiel)
	with ESMTPSA id 5EAF21F42BB0
Message-ID: <11c24f97ef71b16c2e7b3ba40ca66a28c12df692.camel@collabora.com>
Subject: Re: [PATCH 09/25] media: hantro: do a PM resume earlier
From: Ezequiel Garcia <ezequiel@collabora.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linuxarm@huawei.com, mauro.chehab@huawei.com, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-staging@lists.linux.dev
Date: Wed, 05 May 2021 10:22:03 -0300
In-Reply-To: <82114a4bd9c7bc1188c6a7167a6e74bb3360961d.1620207353.git.mchehab+huawei@kernel.org>
References: <cover.1620207353.git.mchehab+huawei@kernel.org>
	 <82114a4bd9c7bc1188c6a7167a6e74bb3360961d.1620207353.git.mchehab+huawei@kernel.org>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Mauro,

Thanks for working on this.

On Wed, 2021-05-05 at 11:41 +0200, Mauro Carvalho Chehab wrote:
> The device_run() first enables the clock and then
> tries to resume PM runtime, checking for errors.
> 
> Well, if for some reason the pm_runtime can not resume,
> it would be better to detect it beforehand.
> 
> So, change the order inside device_run().
> 
> Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
> Fixes: 775fec69008d ("media: add Rockchip VPU JPEG encoder driver")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

It seems this is wrong now, as this series doesn't have

https://lore.kernel.org/linux-media/803c39fafdd62efc6f9e4d99a372af2c6955143b.1619621413.git.mchehab+huawei@kernel.org/

I don't fully understand why all the back and forth
happening on this series, but the former Hantro patches
looked good (despite perhaps unclear commit messages).

Any issues just squashing these two commits from "[PATCH v4 00/79] Address some issues with PM runtime at media subsystem":

  media: hantro: use pm_runtime_resume_and_get()
  media: hantro: do a PM resume earlier

?

Thanks,
Ezequiel

>  drivers/staging/media/hantro/hantro_drv.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> index 595e82a82728..4387edaa1d0d 100644
> --- a/drivers/staging/media/hantro/hantro_drv.c
> +++ b/drivers/staging/media/hantro/hantro_drv.c
> @@ -152,13 +152,14 @@ static void device_run(void *priv)
>         src = hantro_get_src_buf(ctx);
>         dst = hantro_get_dst_buf(ctx);
>  
> -       ret = clk_bulk_enable(ctx->dev->variant->num_clocks, ctx->dev->clocks);
> -       if (ret)
> -               goto err_cancel_job;
>         ret = pm_runtime_get_sync(ctx->dev->dev);
>         if (ret < 0)
>                 goto err_cancel_job;
>  
> +       ret = clk_bulk_enable(ctx->dev->variant->num_clocks, ctx->dev->clocks);
> +       if (ret)
> +               goto err_cancel_job;
> +
>         v4l2_m2m_buf_copy_metadata(src, dst, true);
>  
>         ctx->codec_ops->run(ctx);


