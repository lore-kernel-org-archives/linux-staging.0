Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0376768
	for <linux-staging@lists.linux.dev>; Wed, 17 Nov 2021 11:01:37 +0000 (UTC)
Received: by mail-ua1-f52.google.com with SMTP id o1so4987597uap.4
        for <linux-staging@lists.linux.dev>; Wed, 17 Nov 2021 03:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=czk1gMWNKXWl8chfFRRwl73Bh8CMWwWD2CpmdeQ3Jb4=;
        b=4ocR6khZ7SMJBnmoPmytAiz4Pbd+lZ8NL6T/RvZSPS0K2vzKwCGWLWjhWVEemeD25R
         A0eBsX2Ibnb0SIECwwiCRtEp9Oe72SC7a12h/B5PhV96vZwIHj2Wk8v6cDi7BsCN5eyP
         j2TmaBb/HML3Nu1CvDX2Sbhl2viHSVNVo36mAxztD8M9ecDs/tLtFCN6HyTX1d+/DwrR
         LH3ILZyLRiiwO58/qPEI7owfmQyb5sBtSU6Wk8xVB2gnsThBRBPn7QB1Lzm8MckDgW1P
         5sWNO0/3iZYMCyatS6QxiM4gVHGoSg/Nci8CaUAFu1fekATNHdb+jpSHvBCkSFitJAjw
         wtog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=czk1gMWNKXWl8chfFRRwl73Bh8CMWwWD2CpmdeQ3Jb4=;
        b=2YrK9zXNssJN8uVLNVKwGgTJtKW2wAbtIjdMpsUxKaiixan+S2QQgMgPCh2V3j5ZH6
         8uOQtvVPFIcK4lOS3cO6GSOD0MxAt+YgfrxGd/FmUHa0Sdr5ExorwJES3xGcczkryMHy
         KLfl6kdyD22gIOqVEXJ/wUPrFVSa01vNZRWLWACis/Mu8ChOFB1GBsQnYsCNrVPKZGN6
         S/c9iTXXVDe8i2KlZpKDdjMtLAVKtQeGoFp5od5em0nU7bZFSr4fVskj46ZNttw/pB0S
         xcFQ1D911L7gG+nkHk58MxMHJX9vRNrCy8iPHtJ36NrDHqqv4erAztoV3VBoGkBG2Qm3
         7/Zw==
X-Gm-Message-State: AOAM5337NfDd7YQ1315MU0VRzUBSBGmNW0JyIHPoVGU9TuS9Vf0erpLc
	zLsxch1rWJKAm4D1qS73XOuvuw==
X-Google-Smtp-Source: ABdhPJwPYB21ayTea+GyZOeZYIv+kUpZQDhZWKYMm0kaZ2x1ybUNAdz8Pgc+NVlaA8KYMpC0o8jccw==
X-Received: by 2002:a67:fa0f:: with SMTP id i15mr65495172vsq.16.1637146896937;
        Wed, 17 Nov 2021 03:01:36 -0800 (PST)
Received: from eze-laptop ([186.122.18.126])
        by smtp.gmail.com with ESMTPSA id y22sm11422513vkn.42.2021.11.17.03.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 03:01:35 -0800 (PST)
Date: Wed, 17 Nov 2021 08:01:28 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Fabio Estevam <festevam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Heiko Stuebner <heiko@sntech.de>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, kernel@collabora.com
Subject: Re: [PATCH v8 11/12] media: hantro: Staticize a struct in
 postprocessor code
Message-ID: <YZThCK6+/jA+P/v8@eze-laptop>
References: <20211116143842.75896-1-andrzej.p@collabora.com>
 <20211116143842.75896-12-andrzej.p@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211116143842.75896-12-andrzej.p@collabora.com>

On Tue, Nov 16, 2021 at 03:38:41PM +0100, Andrzej Pietrasiewicz wrote:
> The struct is not used outside this file, so it can be static.
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

> ---
>  drivers/staging/media/hantro/hantro_postproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_postproc.c b/drivers/staging/media/hantro/hantro_postproc.c
> index 4549aec08feb..89de43021779 100644
> --- a/drivers/staging/media/hantro/hantro_postproc.c
> +++ b/drivers/staging/media/hantro/hantro_postproc.c
> @@ -33,7 +33,7 @@
>  #define VPU_PP_OUT_RGB			0x0
>  #define VPU_PP_OUT_YUYV			0x3
>  
> -const struct hantro_postproc_regs hantro_g1_postproc_regs = {
> +static const struct hantro_postproc_regs hantro_g1_postproc_regs = {
>  	.pipeline_en = {G1_REG_PP_INTERRUPT, 1, 0x1},
>  	.max_burst = {G1_REG_PP_DEV_CONFIG, 0, 0x1f},
>  	.clk_gate = {G1_REG_PP_DEV_CONFIG, 1, 0x1},
> -- 
> 2.25.1
> 
