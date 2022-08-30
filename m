Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2FE46B9
	for <linux-staging@lists.linux.dev>; Tue, 30 Aug 2022 18:17:24 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-11e7e0a63e2so17845889fac.4
        for <linux-staging@lists.linux.dev>; Tue, 30 Aug 2022 11:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=/oobhOGqi42449FzVMt/oGmisZwCvSy7BW4jgCCfch0=;
        b=VpcBG8Kr9vdsWOXvnH/lxth7STxi7dPMe1S74WAQ0tsnMozC2LRIB+dqX1liq81G2Y
         yyPmtCE49iIH9Fhy/cwlPemm2EGu9uniW2KsQuiF7MX+MYVFMBaMOjvwx46TrqqqRbGl
         8XBzxZUSiHCaXKTvBxmFYuUo6Zwb1pFbLMRXsm4k7H9NogSa0vxs+LhF5EvK3e7gR2//
         bZeUNISUliBPshw1v7PEqeHOzBzk/dUbVf5KyKBqPjWgrajFewGmNDFNb7w+KbjxQWhZ
         UeDcBrELMkpX3E1DzJ9aovTWQ9WWdwofMXXyXTNFaT6J86/MkQfqpmI/54EVY9g1Ia6R
         3SwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=/oobhOGqi42449FzVMt/oGmisZwCvSy7BW4jgCCfch0=;
        b=aUsLCoMfwKBz04MfuN2ytPPQsaoA03lqaBGIJHuh+XEB2cDjD3+kE2K2T57suqIcJQ
         G1/75gqi3BhnaSCCIra4dIWDcxP0lVEHJis/HTjds6BDxzw2VLC+L8v+4k5amAvjB2WW
         eV8ThRkDWR6ETwh+x129/u30btXlYczYhSb0AbiIrlh52urA/i6Q2mP4YYRRCNlrwEzL
         GQAOvA9H3Zj+ycCYwIV1K9cp7Ov4YhJOIi1unmHOPaP1Rft4iY5+NwvBmVMFRUwBO+9c
         Jc6W659IelvR5fmcs3cQDCC8rytTrsXeBDwmousUAQ13wKP7Cg9rWtQKDRd4mXTE9QlD
         GMkw==
X-Gm-Message-State: ACgBeo1E6eSUqaqsxOeObEY0r+RY7fHveRPIEb9F8IWQNgUnVs+CH9Gz
	xVI3Esv7H4N6eJpT2beE1Y4WZQ==
X-Google-Smtp-Source: AA6agR4PjkWk+Bc8nvP17VYGP14YkKDkOOcw6aw7cjJ213TLpMFs5PvxMnyRL7Ny9EsqHgqfqYsRJg==
X-Received: by 2002:a05:6870:328d:b0:10d:ce86:ceee with SMTP id q13-20020a056870328d00b0010dce86ceeemr10941976oac.80.1661883443167;
        Tue, 30 Aug 2022 11:17:23 -0700 (PDT)
Received: from eze-laptop ([190.190.187.68])
        by smtp.gmail.com with ESMTPSA id p7-20020a056830130700b006396521c804sm7532039otq.55.2022.08.30.11.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 11:17:22 -0700 (PDT)
Date: Tue, 30 Aug 2022 15:17:16 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org, mripard@kernel.org,
	paul.kocialkowski@bootlin.com, wens@csie.org,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	nicolas.dufresne@collabora.com, andrzej.p@collabora.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	kernel@collabora.com
Subject: Re: [PATCH v3 1/7] media: hantro: Store HEVC bit depth in context
Message-ID: <Yw5ULOEDLWaHQav7@eze-laptop>
References: <20220829162159.881588-1-benjamin.gaignard@collabora.com>
 <20220829162159.881588-2-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220829162159.881588-2-benjamin.gaignard@collabora.com>

Hi Benjamin,

On Mon, Aug 29, 2022 at 06:21:53PM +0200, Benjamin Gaignard wrote:
> Store HEVC bit depth in context.
> Bit depth is equal to hevc sps bit_depth_luma_minus8 + 8.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Looks good!

I have limited access to the hardware at the moment.

Can you make sure things look good not only for HEVC
but also for the other codecs?

Thanks!
Ezequiel

> ---
> version 3:
> - Based on top of Ezequiel's patch "media: destage Hantro VPU driver"
>  drivers/media/platform/verisilicon/hantro_drv.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
> index 2036f72eeb4a..1dd8312d824c 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -251,6 +251,11 @@ queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
>  
>  static int hantro_try_ctrl(struct v4l2_ctrl *ctrl)
>  {
> +	struct hantro_ctx *ctx;
> +
> +	ctx = container_of(ctrl->handler,
> +			   struct hantro_ctx, ctrl_handler);
> +
>  	if (ctrl->id == V4L2_CID_STATELESS_H264_SPS) {
>  		const struct v4l2_ctrl_h264_sps *sps = ctrl->p_new.p_h264_sps;
>  
> @@ -272,6 +277,8 @@ static int hantro_try_ctrl(struct v4l2_ctrl *ctrl)
>  		if (sps->bit_depth_luma_minus8 != 0)
>  			/* Only 8-bit is supported */
>  			return -EINVAL;
> +
> +		ctx->bit_depth = sps->bit_depth_luma_minus8 + 8;
>  	} else if (ctrl->id == V4L2_CID_STATELESS_VP9_FRAME) {
>  		const struct v4l2_ctrl_vp9_frame *dec_params = ctrl->p_new.p_vp9_frame;
>  
> -- 
> 2.32.0
> 
