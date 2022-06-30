Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5287B
	for <linux-staging@lists.linux.dev>; Thu, 30 Jun 2022 17:34:21 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id i3so119848oif.13
        for <linux-staging@lists.linux.dev>; Thu, 30 Jun 2022 10:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BWbLJKNt5MQqNM+YkZAOKbF+2rTK0qxaILnlQmPjQL4=;
        b=RPsUGVKyrgf5xg0jcnzE7QB2dirFT0xK3s8TYFJ/rLTSjzy1/dXyAUJ6hsrGo0AgK3
         0CjbgD2BEaoPuX60nr6hxj0ezhnyYUT0JWa6ZFksc0onWBUOEkydiBAYyy/Tzrxq7gAI
         SkKxMDeWtegmW0N9vlbSiI3KYxzTKrTx+Kj8Z6ENoXTAViJA3vn8/djDjj8JIsXgklIU
         yeZ4shPeFr+/qpuE7zcGcRjRsXvNUQNFdRmNwA1wcFm9REPxg6dK+16MzTXQLqarCl9O
         iGFVdIyvcm3yegLnMSgzaYXgBk3I7ru2A2CE37rdIPZgPHp3MYJAkLLzQSwvfiJvlyjp
         +mQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BWbLJKNt5MQqNM+YkZAOKbF+2rTK0qxaILnlQmPjQL4=;
        b=47qiWghzx+LyAbTfYcN/KSci7lMwVXz2i9X9RCgbaQCO0rIOVBgDpCwozZY24xU5PI
         ArIrzUioSjmfCPB+FEdQIDhWNvH2mJ5wawtjeeRKqRj7/DUYNZT/zKC1kOwHTgHBVYIK
         0PnPX7UD8+ahWFB6/1urNK2kkFZOPvzWIETUfDM3Pk/Stkfv1M4RFRHSR77T3mFtjGBc
         uGcT1AKDunubhlGMn8u9peo2GGwQX/aPB6BanoUinCqJ93UlqoLXBEfJBCCCfmZ7HYZ3
         GV8AiMsB5qw7h9IPiHUSHZb3qpDdu+rgyMsP60m1KmttJa/uWY63lout0mCM687+SCbw
         F+Xw==
X-Gm-Message-State: AJIora8a59vKUhRG8ZigEQ2VUDShetuUAAU+Wr/pE6jW+ssRfD7sPeM8
	xS8mh//y2pvNpXlt9kjuSCnJWw==
X-Google-Smtp-Source: AGRyM1vEwKk6VMtJ6yfaI/N6IBF1oh91SChmbChO4mduVSAvClPkYqXQsh5Dy17rYEmcMyschR/Jkg==
X-Received: by 2002:a05:6808:94:b0:335:98f6:2471 with SMTP id s20-20020a056808009400b0033598f62471mr5801516oic.148.1656610460711;
        Thu, 30 Jun 2022 10:34:20 -0700 (PDT)
Received: from eze-laptop ([190.190.187.68])
        by smtp.gmail.com with ESMTPSA id q10-20020a05687101ca00b000fb2aa6eef2sm13182533oad.32.2022.06.30.10.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 10:34:20 -0700 (PDT)
Date: Thu, 30 Jun 2022 14:34:13 -0300
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
Subject: Re: [PATCH 3/7] media: hantro: HEVC: Fix chroma offset computation
Message-ID: <Yr3elVvJDfISzA3U@eze-laptop>
References: <20220617115802.396442-1-benjamin.gaignard@collabora.com>
 <20220617115802.396442-4-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220617115802.396442-4-benjamin.gaignard@collabora.com>

Hi Benjamin,

On Fri, Jun 17, 2022 at 01:57:58PM +0200, Benjamin Gaignard wrote:
> The chroma offset depends of the bitstream depth.
> Make sure that ctx->bit_depth is used to compute it.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Thanks,
Ezequiel

> ---
>  drivers/staging/media/hantro/hantro_g2_hevc_dec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
> index 9eac133bda68..8407ad45b7b7 100644
> --- a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
> +++ b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
> @@ -12,7 +12,7 @@
>  
>  static size_t hantro_hevc_chroma_offset(struct hantro_ctx *ctx)
>  {
> -	return ctx->dst_fmt.width * ctx->dst_fmt.height;
> +	return ctx->dst_fmt.width * ctx->dst_fmt.height * ctx->bit_depth / 8;
>  }
>  
>  static size_t hantro_hevc_motion_vectors_offset(struct hantro_ctx *ctx)
> -- 
> 2.32.0
> 
