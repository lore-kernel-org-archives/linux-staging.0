Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2437B
	for <linux-staging@lists.linux.dev>; Thu, 30 Jun 2022 17:33:16 +0000 (UTC)
Received: by mail-oo1-f48.google.com with SMTP id g8-20020a4ac4c8000000b00425a0f2b493so2667208ooq.0
        for <linux-staging@lists.linux.dev>; Thu, 30 Jun 2022 10:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GV7rma6+T6KQeNRvTDv+srtDNdvqlj7JPB6xqwy+fxk=;
        b=ckqrfpEM/4gKBJjhBatJ51K90/WUgBhZtqvKDzA88Flf40NTPMPJ3eZDAlYNVMscNR
         Z04iE7NbvH+6wmJDcGoO0YcWZSxZ5v4kO4QOu/HcG9Y2XfVgQCyfsYK385Gcry0OEqk8
         ZtoAWYW+qF/6z3/W+NP1hXY9zVBQOgHhNxaNxkQ2ardLLkmiymDOST7wRfi6+XiPFHAW
         Y0e3rnUyJG2xSx2ya0qjfSS71MBMskruUftE+5LWofxOYujh+WBbydgzqeOtIXXL2pxo
         B8Td0OnpEnoLQd4+stuufZP1dCAIEox1NYiPQK8Y8dsDRVwiuC60fECu6q+awcJxHQvh
         Fo0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GV7rma6+T6KQeNRvTDv+srtDNdvqlj7JPB6xqwy+fxk=;
        b=XToL+Q/HI9kOXrbm6/70s5kzeFHvWsL2aabaX9JWsYrX4ncDobRCyJJLAkXDvAJA4x
         D7v4hypI8UCCsxslKa6/8Zet4WlsefKCujw1edq8q+VGRP1/4BGSjk7mj9BUO22MNqWk
         Y59WT4zpSvz1Ru0y2QGdacPMQZgzab/2a9EfA1NPrcHGGLwGeB9KW1uSuk1bBfpeCyga
         0HL94JFocDJxmpRZY7dmfMNPJrfHuVCCAy6B4OL4HsCDIlPt/uTddcuOPqSR624vkRhK
         jGc0YiJ4rxJE8gUpCOXF+HtUgoOkw0eanFEfe+2GPkFbyP/QfEvd1KGXdByAtqHRaG+H
         67ag==
X-Gm-Message-State: AJIora+wwLqHXlO6iAbYuxBSJrcxphhZZ3b8TxrkyJeth0htIVQfxe2V
	PsdUzvBZjvXqk9reyxvR6wn/3Q==
X-Google-Smtp-Source: AGRyM1uHmEh/OuQKMNNKJwNpcvuxZiUW4pitk9X+/dijUMypH48J/IY4d7OKUiVi0cZ1jQhEP0B37w==
X-Received: by 2002:a4a:49d0:0:b0:425:708a:224 with SMTP id z199-20020a4a49d0000000b00425708a0224mr4367978ooa.18.1656610395166;
        Thu, 30 Jun 2022 10:33:15 -0700 (PDT)
Received: from eze-laptop ([190.190.187.68])
        by smtp.gmail.com with ESMTPSA id z18-20020a056808065200b0032ba1b363d2sm10323115oih.55.2022.06.30.10.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 10:33:14 -0700 (PDT)
Date: Thu, 30 Jun 2022 14:33:08 -0300
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
Subject: Re: [PATCH 2/7] media: hantro: HEVC: Fix auxilary buffer size
 calculation
Message-ID: <Yr3eVDFjPBrvi5Td@eze-laptop>
References: <20220617115802.396442-1-benjamin.gaignard@collabora.com>
 <20220617115802.396442-3-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220617115802.396442-3-benjamin.gaignard@collabora.com>

Hi Benjamin,

On Fri, Jun 17, 2022 at 01:57:57PM +0200, Benjamin Gaignard wrote:
> SAO and FILTER buffers size depend of the bit depth.
> Make sure we have enough space for 10bit bitstreams.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Thanks,
Ezequiel

> ---
>  drivers/staging/media/hantro/hantro_hevc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_hevc.c b/drivers/staging/media/hantro/hantro_hevc.c
> index dcb5c8703b6e..e06837108a09 100644
> --- a/drivers/staging/media/hantro/hantro_hevc.c
> +++ b/drivers/staging/media/hantro/hantro_hevc.c
> @@ -104,7 +104,7 @@ static int tile_buffer_reallocate(struct hantro_ctx *ctx)
>  		hevc_dec->tile_bsd.cpu = NULL;
>  	}
>  
> -	size = VERT_FILTER_RAM_SIZE * height64 * (num_tile_cols - 1);
> +	size = (VERT_FILTER_RAM_SIZE * height64 * (num_tile_cols - 1) * ctx->bit_depth) / 8;
>  	hevc_dec->tile_filter.cpu = dma_alloc_coherent(vpu->dev, size,
>  						       &hevc_dec->tile_filter.dma,
>  						       GFP_KERNEL);
> @@ -112,7 +112,7 @@ static int tile_buffer_reallocate(struct hantro_ctx *ctx)
>  		goto err_free_tile_buffers;
>  	hevc_dec->tile_filter.size = size;
>  
> -	size = VERT_SAO_RAM_SIZE * height64 * (num_tile_cols - 1);
> +	size = (VERT_SAO_RAM_SIZE * height64 * (num_tile_cols - 1) * ctx->bit_depth) / 8;
>  	hevc_dec->tile_sao.cpu = dma_alloc_coherent(vpu->dev, size,
>  						    &hevc_dec->tile_sao.dma,
>  						    GFP_KERNEL);
> -- 
> 2.32.0

> 
