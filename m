Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FA02C81
	for <linux-staging@lists.linux.dev>; Thu, 25 Nov 2021 13:23:45 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id y5so12243985ual.7
        for <linux-staging@lists.linux.dev>; Thu, 25 Nov 2021 05:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pD+qJk3r29qPwzJLYfks/oabSI7Y6YhNSM12M9kudsA=;
        b=J8uByjrN3pIMyLs+oh8F1h51AEiVYGcn/jk6MaCawLgGb4CapJzoFhR0hQKkiQWrEh
         xKIta24WH4WpCzvI7EIBkg+W6diz1AMrs5Nh5DWnQ17/D1qf7KcJlWZydHbexMjaU0FZ
         6cO8NeT+7ZFSfHD3SUwtJ2YpxDY9gtwdnbcM+LqO2cSdDvD0pxxXL7jQHFJFJtFlpW78
         EXpF6w7NvojJcmLBeousUkR+ZeJtQR0X35kMvVAuQ/xzdDhW73D7FpwNWjgCLvULsJY1
         sEM8l0tNEuPJIsEtq7GxesgoWAZ1LHRcd6g6qsstxazhIP3WaJQ6ie4vvUpt4+Cqu0ic
         sGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pD+qJk3r29qPwzJLYfks/oabSI7Y6YhNSM12M9kudsA=;
        b=RrHg+Xt0qdx7zRFAAanJtOgPcTXGPDxUYEDn5juyPau/+d5/7Wch1BeVcyhVj48Lh7
         h1Yypidi2YNlPBJXlI7reVL9Ycvn/X+YKkiFmgi8W6rZBle9+1LTI+uw1TGlVNc1NAQe
         +NOxtWzpemKiyffXN6fLdP/wSrJLJsYkH2zx/FDwK4vkA8pRD5llUMzSd8yRniaoSLlE
         LUG9eAphxEdLMdOalvF/hiu2zPIq2473FK0zZebIAQ0gKwEZ4YsMTLzgNKQ29gMOSwLZ
         L8y/hJAaaGQXcFnACfOQY0lzkykGiYMw54f94fRIoRZ/w4wUrIHTW+2g3baY2lMFBMPF
         c85Q==
X-Gm-Message-State: AOAM531tLmYINxE5m3lHDnB8xTlKwd7rRAQrwiMvM24ee4wvsE6d362k
	infTnJAojMveZq5KFzvbb5i/iQ==
X-Google-Smtp-Source: ABdhPJzRdO7QoZ3b2O8Hj0UdN3JVKR91c4TnqnGBSgCpEcjeZkf5dyufcKOuzsSpQNPw3BaQ4UsNCQ==
X-Received: by 2002:a67:2fd0:: with SMTP id v199mr8700734vsv.35.1637846618499;
        Thu, 25 Nov 2021 05:23:38 -0800 (PST)
Received: from eze-laptop (host208.201-253-22.telecom.net.ar. [201.253.22.208])
        by smtp.gmail.com with ESMTPSA id q9sm1674052vkn.44.2021.11.25.05.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 05:23:37 -0800 (PST)
Date: Thu, 25 Nov 2021 10:23:32 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: hantro: Hook up RK3399 JPEG encoder output
Message-ID: <YZ+OVEKrvsbbQrjn@eze-laptop>
References: <20211119074654.470729-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211119074654.470729-1-wenst@chromium.org>

Hi Chen-Yu,

On Fri, Nov 19, 2021 at 03:46:54PM +0800, Chen-Yu Tsai wrote:
> The JPEG encoder found in the Hantro H1 encoder block only produces a
> raw entropy-encoded scan. The driver is responsible for building a JPEG
> compliant bitstream and placing the entropy-encoded scan in it. Right
> now the driver uses a bounce buffer for the hardware to output the raw
> scan to.
> 
> In commit e765dba11ec2 ("hantro: Move hantro_enc_buf_finish to JPEG
> codec_ops.done"), the code that copies the raw scan from the bounce
> buffer to the capture buffer was moved, but was only hooked up for the
> Hantro H1 (then RK3288) variant. The RK3399 variant was broken,
> producing a JPEG bitstream without the scan, and the capture buffer's
> .bytesused field unset.
> 
> Fix this by duplicating the code that is executed when the JPEG encoder
> finishes encoding a frame. As the encoded length is read back from
> hardware, and the variants having different register layouts, the
> code is duplicated rather than shared.
> 
> Fixes: e765dba11ec2 ("hantro: Move hantro_enc_buf_finish to JPEG codec_ops.done")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Thanks a lot for fixing this.

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

> ---
> This was developed on the downstream ChromeOS 5.10 kernel (with a hack
> for .data_offset) and tested with ChromeOS's jpeg_encode_accelerator_unittest
> patched to accept non-JFIF JPEG streams (https://crrev.com/c/3291480).
> 
> This was then forward-ported to mainline (name and filename changes) and
> compile tested only.
> 
> ---
>  .../staging/media/hantro/hantro_h1_jpeg_enc.c   |  2 +-
>  drivers/staging/media/hantro/hantro_hw.h        |  3 ++-
>  .../media/hantro/rockchip_vpu2_hw_jpeg_enc.c    | 17 +++++++++++++++++
>  drivers/staging/media/hantro/rockchip_vpu_hw.c  |  5 +++--
>  4 files changed, 23 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c b/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c
> index 56cf261a8e95..9cd713c02a45 100644
> --- a/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c
> +++ b/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c
> @@ -140,7 +140,7 @@ int hantro_h1_jpeg_enc_run(struct hantro_ctx *ctx)
>  	return 0;
>  }
>  
> -void hantro_jpeg_enc_done(struct hantro_ctx *ctx)
> +void hantro_h1_jpeg_enc_done(struct hantro_ctx *ctx)
>  {
>  	struct hantro_dev *vpu = ctx->dev;
>  	u32 bytesused = vepu_read(vpu, H1_REG_STR_BUF_LIMIT) / 8;
> diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
> index 267a6d33a47b..60d4602d33ed 100644
> --- a/drivers/staging/media/hantro/hantro_hw.h
> +++ b/drivers/staging/media/hantro/hantro_hw.h
> @@ -239,7 +239,8 @@ int hantro_h1_jpeg_enc_run(struct hantro_ctx *ctx);
>  int rockchip_vpu2_jpeg_enc_run(struct hantro_ctx *ctx);
>  int hantro_jpeg_enc_init(struct hantro_ctx *ctx);
>  void hantro_jpeg_enc_exit(struct hantro_ctx *ctx);
> -void hantro_jpeg_enc_done(struct hantro_ctx *ctx);
> +void hantro_h1_jpeg_enc_done(struct hantro_ctx *ctx);
> +void rockchip_vpu2_jpeg_enc_done(struct hantro_ctx *ctx);
>  
>  dma_addr_t hantro_h264_get_ref_buf(struct hantro_ctx *ctx,
>  				   unsigned int dpb_idx);
> diff --git a/drivers/staging/media/hantro/rockchip_vpu2_hw_jpeg_enc.c b/drivers/staging/media/hantro/rockchip_vpu2_hw_jpeg_enc.c
> index 991213ce1610..5d9ff420f0b5 100644
> --- a/drivers/staging/media/hantro/rockchip_vpu2_hw_jpeg_enc.c
> +++ b/drivers/staging/media/hantro/rockchip_vpu2_hw_jpeg_enc.c
> @@ -171,3 +171,20 @@ int rockchip_vpu2_jpeg_enc_run(struct hantro_ctx *ctx)
>  
>  	return 0;
>  }
> +
> +void rockchip_vpu2_jpeg_enc_done(struct hantro_ctx *ctx)
> +{
> +	struct hantro_dev *vpu = ctx->dev;
> +	u32 bytesused = vepu_read(vpu, VEPU_REG_STR_BUF_LIMIT) / 8;
> +	struct vb2_v4l2_buffer *dst_buf = hantro_get_dst_buf(ctx);
> +
> +	/*
> +	 * TODO: Rework the JPEG encoder to eliminate the need
> +	 * for a bounce buffer.
> +	 */
> +	memcpy(vb2_plane_vaddr(&dst_buf->vb2_buf, 0) +
> +	       ctx->vpu_dst_fmt->header_size,
> +	       ctx->jpeg_enc.bounce_buffer.cpu, bytesused);
> +	vb2_set_plane_payload(&dst_buf->vb2_buf, 0,
> +			      ctx->vpu_dst_fmt->header_size + bytesused);
> +}
> diff --git a/drivers/staging/media/hantro/rockchip_vpu_hw.c b/drivers/staging/media/hantro/rockchip_vpu_hw.c
> index d4f52957cc53..0c22039162a0 100644
> --- a/drivers/staging/media/hantro/rockchip_vpu_hw.c
> +++ b/drivers/staging/media/hantro/rockchip_vpu_hw.c
> @@ -343,7 +343,7 @@ static const struct hantro_codec_ops rk3066_vpu_codec_ops[] = {
>  		.run = hantro_h1_jpeg_enc_run,
>  		.reset = rockchip_vpu1_enc_reset,
>  		.init = hantro_jpeg_enc_init,
> -		.done = hantro_jpeg_enc_done,
> +		.done = hantro_h1_jpeg_enc_done,
>  		.exit = hantro_jpeg_enc_exit,
>  	},
>  	[HANTRO_MODE_H264_DEC] = {
> @@ -371,7 +371,7 @@ static const struct hantro_codec_ops rk3288_vpu_codec_ops[] = {
>  		.run = hantro_h1_jpeg_enc_run,
>  		.reset = rockchip_vpu1_enc_reset,
>  		.init = hantro_jpeg_enc_init,
> -		.done = hantro_jpeg_enc_done,
> +		.done = hantro_h1_jpeg_enc_done,
>  		.exit = hantro_jpeg_enc_exit,
>  	},
>  	[HANTRO_MODE_H264_DEC] = {
> @@ -399,6 +399,7 @@ static const struct hantro_codec_ops rk3399_vpu_codec_ops[] = {
>  		.run = rockchip_vpu2_jpeg_enc_run,
>  		.reset = rockchip_vpu2_enc_reset,
>  		.init = hantro_jpeg_enc_init,
> +		.done = rockchip_vpu2_jpeg_enc_done,
>  		.exit = hantro_jpeg_enc_exit,
>  	},
>  	[HANTRO_MODE_H264_DEC] = {
> -- 
> 2.34.0.rc2.393.gf8c9666880-goog
> 
