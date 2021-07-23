Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048A7168
	for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 15:15:03 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id y8so2702322wrt.10
        for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 08:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=39pOG7KH6dy0ZRVssZhlN1lqixZxz0mn8swGZJcTMR4=;
        b=b1JF8Cu+eJjrR8JqdA4y+VDpmQpSgPEenMFTQyd2RvhhVOLkywVgGcs+PuzwrbMfCK
         /jGZbX49fD/B/Kqs6e//92fKyEr21MGzSlvjlxM2RMvlJjfZ13ne9qANhIzBSOJUeSPy
         tjYlJE5xkj/dAnYovPcKURZTuiMDdnp/JM/dl/ERFIjiqxoldmsw331orf1kRMeMgr71
         18sjRxSOcAk1gkAEZik6SaTjZKeY5snQNOL1JMIyljsol82vsX3qh4HsJ38Y9P7UCxYF
         PvtXmQXaDw/Y/TrNBQ36axg6p8dJmXhoWw8JEbACG81nWcS5dXVMpVea9XkTh+XPNzbZ
         AK/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=39pOG7KH6dy0ZRVssZhlN1lqixZxz0mn8swGZJcTMR4=;
        b=oIiALLV+M4juHOkY4FlQ4YsaiWcWVXh72NFhh3f9Fs10X0CgxBVHMDmuy8zrirI67K
         gtcwPmv0hhtR1Ll3n8gLBg1s1A30KT4EfndZ7wTpZisXt628DqX+DrygYev2bIT7yAkX
         5GTUWNaCLOcEtz5p7fSSxLG6G2+NHBp6D02Dh0r2xuD/hohyLA+YrbGSvyrsLi/dN2cf
         eceqdV1HJoHHmw6oRXGvG3c1VzKBzmxqp7CjzDeKmgLEDpDLntrHY7bIpX7WzQcIvDrZ
         ZNAlfN+D/AFCwSu0ldxEwtJ2LfHpnoHTmey7gby38M38Sse4u7cChS4Yimf9e0hzHFnr
         7VOQ==
X-Gm-Message-State: AOAM530meH341xrPuw+pFMg81CRvGurNWhK/1fXIo+ItsJlCOBU+AlpA
	+KciaXA5OAmymRF8KvImv3c40g==
X-Google-Smtp-Source: ABdhPJwna2imf+4K+p4Ok2c6DvThFIDmdtRPfZhsLhiFfOWXxQ6a0iVwK6x2uAyzsF6xkyPUyndz6A==
X-Received: by 2002:a5d:67cc:: with SMTP id n12mr5986256wrw.131.1627053302394;
        Fri, 23 Jul 2021 08:15:02 -0700 (PDT)
Received: from google.com ([31.124.24.141])
        by smtp.gmail.com with ESMTPSA id p2sm27285395wmg.6.2021.07.23.08.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 08:15:01 -0700 (PDT)
Date: Fri, 23 Jul 2021 16:15:00 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Lucas Henneman <lucas.henneman@linaro.org>
Cc: greg@kroah.com, forest@alittletooquiet.net,
	linux-staging@lists.linux.dev, trivial@kernel.org
Subject: Re: [PATCH 13/15] staging: vt6655: kernel style cleanup of mac.c
Message-ID: <YPrc9LbZYFkjhbHd@google.com>
References: <20210723144340.15787-1-lucas.henneman@linaro.org>
 <20210723144340.15787-13-lucas.henneman@linaro.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210723144340.15787-13-lucas.henneman@linaro.org>

On Fri, 23 Jul 2021, Lucas Henneman wrote:

> This patch removes from mac.c the file name and an ftrace-like pr_debug
> per checkpatch's two warnings.

Please add the warning verbatim.

> Signed-off-by: Lucas Henneman <lucas.henneman@linaro.org>
> ---
>  drivers/staging/vt6655/mac.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/staging/vt6655/mac.c b/drivers/staging/vt6655/mac.c
> index f5ae7f1f5689..9721c2234bf2 100644
> --- a/drivers/staging/vt6655/mac.c
> +++ b/drivers/staging/vt6655/mac.c
> @@ -3,8 +3,6 @@
>   * Copyright (c) 1996, 2003 VIA Networking Technologies, Inc.
>   * All rights reserved.
>   *
> - * File: mac.c
> - *
>   * Purpose:  MAC routines
>   *
>   * Author: Tevin Chen
> @@ -775,7 +773,6 @@ void MACvSetKeyEntry(struct vnt_private *priv, unsigned short wKeyCtl,
>  	if (byLocalID <= 1)
>  		return;
>  
> -	pr_debug("%s\n", __func__);
>  	offset = MISCFIFO_KEYETRY0;
>  	offset += (uEntryIdx * MISCFIFO_KEYENTRYSIZE);
>  

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
