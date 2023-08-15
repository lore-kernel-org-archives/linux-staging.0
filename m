Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445603C00
	for <linux-staging@lists.linux.dev>; Tue, 15 Aug 2023 05:36:03 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-523476e868dso6544675a12.3
        for <linux-staging@lists.linux.dev>; Mon, 14 Aug 2023 22:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692077761; x=1692682561;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bIk/OqrRoEJjSTmzxoUEBu2a2Sc3kU0E+CExCTOuyHE=;
        b=CG+YeVRvcwfSJmOckrdC21CEF0oQ+gNUvj41XFDEK8uLJKzEz++eaZjTG7Ns/k0cVk
         LWttB8k3vyVBFL5ZFpDiyrjiKo6eRBhq7/fAIXhOarOA/t0S5IOBZBg566OqZT7ZNFTw
         BoOkLsaJeGOQX+BnYA661Lq/eLbLS2HFWfprUcyVUNaio7ZNsaWtU/Jph27EeWJs3Pzf
         3oB5wa2hNQ/R9LaviQV0oBpuf5we02cJlhz3/MjD4p3yacteiajzmzRGZgeGGouVAfAA
         sTdTMrffIyyt+SuUjJ9DOAvcXp3IjijzBFrgP08d+pdrYWxFBur5nirjGjSRo/cVEPit
         Zykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692077761; x=1692682561;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bIk/OqrRoEJjSTmzxoUEBu2a2Sc3kU0E+CExCTOuyHE=;
        b=N1TCISX+lSef03fT6CBCF/1TLCA5ULgAvlSCr9J/Ykx4AhoZkWdoBMP41AAJoPlQtb
         wPS8B5t6onuDKuY+qYEr4D+WrJFv/HIuDh0Bd64CJ1pwpTjBOX7YAS4V8BXSBs3dUN7Q
         UH68sOOA6778dTzfz3xNtmh/QrEjV82xy40srX9962rWpZ5c6///lfAMMyhaltjpvuWx
         jtq4fEHnHkbotAWtEA4egUze7RMs4xyCw6Rp6m/1xqn8HArZ1XDRYgsYuRQrOQHwaS4e
         Ny1Id5aGAVBA7AgbQREBL28aMOzytVHSFOg0402rQRCOPDX3cFiNsE4sPVCkp56Ycuyv
         oiWw==
X-Gm-Message-State: AOJu0Yw3mbnpOLjrTX07Iof/rGmq4WbeicKwHKtf1g1ZuXNuBEP1Df6A
	MYvdu6HNBCXBzyv7pVBUjdM=
X-Google-Smtp-Source: AGHT+IFpLPB6bcWraXia54uKaz4BAJCTyZFd7fSE26sxCsBffFUTbk0czBecUfcy0Dz8JukUC97nYw==
X-Received: by 2002:a05:6402:124d:b0:525:4420:c425 with SMTP id l13-20020a056402124d00b005254420c425mr6430763edw.12.1692077760995;
        Mon, 14 Aug 2023 22:36:00 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-58.ip.prioritytelecom.net. [217.105.46.58])
        by smtp.gmail.com with ESMTPSA id q9-20020a056402040900b0051dd19d6d6esm6449284edv.73.2023.08.14.22.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 22:36:00 -0700 (PDT)
Date: Tue, 15 Aug 2023 07:35:59 +0200
From: Nam Cao <namcaov@gmail.com>
To: Abdel Alkuor <alkuor@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: fix sii164InitChip function name
Message-ID: <ZNsOv7F1B9AnlUVG@nam-dell>
References: <20230815043759.404423-1-alkuor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230815043759.404423-1-alkuor@gmail.com>

On Tue, Aug 15, 2023 at 12:37:59AM -0400, Abdel Alkuor wrote:
> Adhere to Linux Kernel coding style. Found by checkpatch.
> 
> Signed-off-by: Abdel Alkuor <alkuor@gmail.com>
> ---
>  drivers/staging/sm750fb/ddk750_dvi.c    | 2 +-
>  drivers/staging/sm750fb/ddk750_sii164.c | 4 ++--
>  drivers/staging/sm750fb/ddk750_sii164.h | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
> index e0c7ff3352bf..8b81e8642f9e 100644
> --- a/drivers/staging/sm750fb/ddk750_dvi.c
> +++ b/drivers/staging/sm750fb/ddk750_dvi.c
> @@ -14,7 +14,7 @@
>  static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
>  #ifdef DVI_CTRL_SII164
>  	{
> -		.init = sii164InitChip,
> +		.init = sii164_init_chip,
>  		.get_vendor_id = sii164_get_vendor_id,
>  		.get_device_id = sii164GetDeviceID,
>  #ifdef SII164_FULL_FUNCTIONS
> diff --git a/drivers/staging/sm750fb/ddk750_sii164.c b/drivers/staging/sm750fb/ddk750_sii164.c
> index 3da1796cd7aa..d162e1a16584 100644
> --- a/drivers/staging/sm750fb/ddk750_sii164.c
> +++ b/drivers/staging/sm750fb/ddk750_sii164.c
> @@ -72,7 +72,7 @@ unsigned short sii164GetDeviceID(void)
>   */
>  
>  /*
> - *  sii164InitChip
> + *  sii164_init_chip
>   *      This function initialize and detect the DVI controller chip.
>   *
>   *  Input:
> @@ -118,7 +118,7 @@ unsigned short sii164GetDeviceID(void)
>   *      0   - Success
>   *     -1   - Fail.
>   */
> -long sii164InitChip(unsigned char edge_select,
> +long sii164_init_chip(unsigned char edge_select,
>  		    unsigned char bus_select,
>  		    unsigned char dual_edge_clk_select,
>  		    unsigned char hsync_enable,

I think you introduce new checkpatch warnings here.

> diff --git a/drivers/staging/sm750fb/ddk750_sii164.h b/drivers/staging/sm750fb/ddk750_sii164.h
> index ca330f6a43e2..13420bcc282c 100644
> --- a/drivers/staging/sm750fb/ddk750_sii164.h
> +++ b/drivers/staging/sm750fb/ddk750_sii164.h
> @@ -16,7 +16,7 @@ enum sii164_hot_plug_mode {
>  };
>  
>  /* Silicon Image SiI164 chip prototype */
> -long sii164InitChip(unsigned char edgeSelect,
> +long sii164_init_chip(unsigned char edgeSelect,
>  		    unsigned char busSelect,
>  		    unsigned char dualEdgeClkSelect,
>  		    unsigned char hsyncEnable,

Also here.

Best regards,
Nam
> 
