Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D831B2FAF
	for <linux-staging@lists.linux.dev>; Thu, 19 Aug 2021 01:38:44 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id b10so9113307eju.9
        for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 18:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Uxvhx5qQEKKi3Un1EErfZdduybbw8VIvWqfruEYV5Xg=;
        b=lZv7tQlPuYTvi3z3D1uNsFp5PKBGrL1wbF8bwvQBYXsREHAFSa5M0R8f9EZo1AyYcC
         hvf4bCYipsBQs6l56TzQI2YepEgsNlRDvuctWk9k9K3RvfxM0KUVpb2Iahpj26e2C7T8
         vlq5SNzSkoH/B4ChIOwCVD9blQtxrZ9cI2fxWb9hWeY9pFH3qVbjastJU1CBwZGSFgFL
         0/+IuTksjGbiJMAmFOkbPDK+WAlmybO1WFVR97Hll6TOTzbfqaqL8BRJyfPa0fohmnDz
         +NRYHBSAu/m8LfjkUyY88VAHtDbbkMJ5H2f5nbRrvse5hjKa8V3tCR5I8OLjZ8OQDx4x
         e/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Uxvhx5qQEKKi3Un1EErfZdduybbw8VIvWqfruEYV5Xg=;
        b=m2WUZF8/8BHBVfVrvY3qSJhkFGNa83+YHUwceuqLmDFjn8a9ZoVbiYfrRVjTUG0Eqf
         wpb0qZB21rDO9ElpiV+6HIBW4DghZmiljXFVurx1VHbVv93UvIMTKRCDI7LxcnPMtRxL
         9NK3h+7ytdIvmWx8f/00ekmNjX2QMUlkNpTio4edMyxfj74P952fZMySIXqyE8ldWRWx
         nUlvqQTMsqg1fNdQ1QETyVy97xkxP+s3BiVdH4TRIMOThGwBwGlVEpplDkIDzGflcINU
         Isdzwr0bJOYwWPYsK59fT1hVCk7t/OaW9yIcHt8iNPfPLl5j7QOoYXe1L2pyQsATYfIv
         HhBQ==
X-Gm-Message-State: AOAM53080Zc7me/T5hRTnBM4AM5ScAKa/pK9rg5uV+7gHH3r3E0UBg74
	8XeXhRkFAmwft+faiihJ+w4=
X-Google-Smtp-Source: ABdhPJzvZCWdzjpF0V3e2EgViiP0yS/G0OeBvs4n4H+vbbbB6xbaThxpmrOspDmDvwIiP5+PweR4Uw==
X-Received: by 2002:a17:906:410c:: with SMTP id j12mr12857231ejk.553.1629337123290;
        Wed, 18 Aug 2021 18:38:43 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-109-211.retail.telecomitalia.it. [79.22.109.211])
        by smtp.gmail.com with ESMTPSA id w11sm898729edc.5.2021.08.18.18.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 18:38:42 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: gregkh@linuxfoundation.org, Phillip Potter <phil@philpotter.co.uk>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, martin@kaiser.cx, straube.linux@gmail.com, Larry.Finger@lwfinger.net
Subject: Re: [PATCH 2/6] staging: r8188eu: remove unused function dump_txrpt_ccx_88e
Date: Thu, 19 Aug 2021 03:38:41 +0200
Message-ID: <3469308.GW2Jk8YpuN@localhost.localdomain>
In-Reply-To: <20210818234253.208271-3-phil@philpotter.co.uk>
References: <20210818234253.208271-1-phil@philpotter.co.uk> <20210818234253.208271-3-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, August 19, 2021 1:42:49 AM CEST Phillip Potter wrote:
> Remove unused function dump_txrpt_ccx_88e from hal/rtl8188e_xmit.c and
> remove its declaration in include/rtl8188e_xmit.h, as this function is
> not called from anywhere, and is thus dead code.
> 
> Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
> ---
>  drivers/staging/r8188eu/hal/rtl8188e_xmit.c   | 22 -------------------
>  .../staging/r8188eu/include/rtl8188e_xmit.h   |  1 -
>  2 files changed, 23 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/hal/rtl8188e_xmit.c b/drivers/staging/r8188eu/hal/rtl8188e_xmit.c
> index d2b55d581f95..46b871f3f631 100644
> --- a/drivers/staging/r8188eu/hal/rtl8188e_xmit.c
> +++ b/drivers/staging/r8188eu/hal/rtl8188e_xmit.c
> @@ -7,28 +7,6 @@
>  #include "../include/drv_types.h"
>  #include "../include/rtl8188e_hal.h"
>  
> -void dump_txrpt_ccx_88e(void *buf)
> -{
> -	struct txrpt_ccx_88e *txrpt_ccx = (struct txrpt_ccx_88e *)buf;
> -
> -	DBG_88E("%s:\n"
> -		"tag1:%u, pkt_num:%u, txdma_underflow:%u, int_bt:%u, int_tri:%u, int_ccx:%u\n"
> -		"mac_id:%u, pkt_ok:%u, bmc:%u\n"
> -		"retry_cnt:%u, lifetime_over:%u, retry_over:%u\n"
> -		"ccx_qtime:%u\n"
> -		"final_data_rate:0x%02x\n"
> -		"qsel:%u, sw:0x%03x\n",
> -		__func__, txrpt_ccx->tag1, txrpt_ccx->pkt_num,
> -		txrpt_ccx->txdma_underflow, txrpt_ccx->int_bt,
> -		txrpt_ccx->int_tri, txrpt_ccx->int_ccx,
> -		txrpt_ccx->mac_id, txrpt_ccx->pkt_ok, txrpt_ccx->bmc,
> -		txrpt_ccx->retry_cnt, txrpt_ccx->lifetime_over,
> -		txrpt_ccx->retry_over, txrpt_ccx_qtime_88e(txrpt_ccx),
> -		txrpt_ccx->final_data_rate, txrpt_ccx->qsel,
> -		txrpt_ccx_sw_88e(txrpt_ccx)
> -	);
> -}
> -
>  void handle_txrpt_ccx_88e(struct adapter *adapter, u8 *buf)
>  {
>  	struct txrpt_ccx_88e *txrpt_ccx = (struct txrpt_ccx_88e *)buf;
> diff --git a/drivers/staging/r8188eu/include/rtl8188e_xmit.h b/drivers/staging/r8188eu/include/rtl8188e_xmit.h
> index d2099da1a41a..20b55e3850ba 100644
> --- a/drivers/staging/r8188eu/include/rtl8188e_xmit.h
> +++ b/drivers/staging/r8188eu/include/rtl8188e_xmit.h
> @@ -150,7 +150,6 @@ s32 rtl8188eu_xmitframe_complete(struct adapter *padapter,
>  				 struct xmit_priv *pxmitpriv,
>  				 struct xmit_buf *pxmitbuf);
>  
> -void dump_txrpt_ccx_88e(void *buf);
>  void handle_txrpt_ccx_88e(struct adapter *adapter, u8 *buf);
>  
>  #endif /* __RTL8188E_XMIT_H__ */
> -- 
> 2.31.1
> 
At a quick look it looks good. 

Built with "make C=2 -j8 drivers/staging/r8188eu/ W=1"
on x86-64, it does not introduce any errors or warnings, so...

Acked-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>

Thanks,

Fabio



