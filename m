Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4772436C592
	for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 13:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781614951; cv=none; b=teG48jYbcwrUVcdfQ5V0NI5LpyJunAgDQoiJax4ul76zeRSQQyRihey7ydboGD+k0T/8sM0RncKAPoWfRvrWH2Ctwz91AJFSQZvfLUhX4QT9zd/EMJXlTKyKq5an6X7W0e6ThjjgM9E6F3wPScQZe8nYbb2kEvo8ERDYawwOwVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781614951; c=relaxed/simple;
	bh=G9IYxVbhS90PbppHtqR9ZPMvaec9dZlnjA9KDhHrQlU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oM5lkK/BI2AJdXFTZ1zkwqMA4uw2ubxCM0w7acpq6BNTuWCkz/faMeQ6AHY0ghFXSPc1l1YSP7MDB3SuZpjYMYNx4OdaizyW9GKicm5hfy4duira8vVDteon/TVrgK/bz6kNOFjj6AUqD2kbSMTfFe8iLsAGiVCA6iKbr6ZPOMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mu3m59mC; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mu3m59mC"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-660ea43107fso4590366d50.0
        for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 06:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781614949; x=1782219749; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gVYs2KiHNm83KW8rmWg85Qa2n9FB+VB3eFAyuTTAhHs=;
        b=Mu3m59mCz+FwnfjUiRghUTV4URQGx+QzxBWxjCcxCWVnldc0CUhLiEkdhY/hJXQSdj
         dqaUC+8OsvvJp7FqzB8GNq+MCjvmjDRPI8Ypf6LKaYmDbwuvsLBcTrwNM+yCymj+gAKV
         Y+TfnInWj3XpiiQ8eZDl9kIkxDXqXNS4KxopOwlDuiI7B9m+GW+VyZ9w1hn7AlbuVClx
         KvSPA5JZPMvXHS18XPCncennQmYkU/tDpCWJwPAwdalqxHJlt9El2Zj+Z16Cw3KLMV8+
         ZCdA9xCecZpAldsdDgSeMyWTtUOCvsCSXrt7vOsQVWY/G3ms16GiAzy4J6J8gNAKkmLJ
         VizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781614949; x=1782219749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gVYs2KiHNm83KW8rmWg85Qa2n9FB+VB3eFAyuTTAhHs=;
        b=W+AnlYzUk62HyJgvebrIpaerLGbUADz4b3hKJ1CCYqHjtuBcVRpDsFekpNXyjDPL3U
         qOxCcH4fzwSQftrrIUtUW0NFJ/OJG9+7KQRd0k7qrUKcDvO0ga9k7MZB8sYODmrAg8Ls
         kgOzbzeBQQrUeLLie4M5wMR5NgGPPJAlIXLUVlhm3AialbOSuvqL8vFi68kxcyD/mJ3h
         7pPEA9iJWyj1wMP58geZUsAwwR7Q6/KdQtsWK4xmAKSmf209tEyeVPT0f23mYQDlnCtm
         ARZ4RDY+j+tCqjyTFgSjR1v0Q5Xpkzm0xxLNkxw/DoTcXNlpXSwS1dQi8L5wupXRuEVm
         JxAQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Y7Q6FLTHCwKNNBbojMpBd8+QMapUViuCtKY3D7jad78uuiqLmpSRGPgI7fwa/JnCF69cP0Sbi2OPFBmMt@lists.linux.dev
X-Gm-Message-State: AOJu0YyZg0JTrb+CP0IIRHX6Te1UZ0mJyAKOpRqblw68ZSGLJXYEdNEa
	i0bVGOhbNYDAI0uASuNRAByVgJ1zKAPYX0z1WrwnhBd2oCf3wauhYh5M
X-Gm-Gg: AfdE7ckC7LArKVgS914qofwS15tBtPvcmmIWGzrn5vuwt+vSVjMrKrgTrW/8NGdf+Ln
	c58yfYo34bqOHp/OpUpoKNKJZlNNUgvLuNpJh5WxBWF6AwYT7bJFNQ3ZCzuixoivvRLGNhB9z6y
	PDDRTBlCX/wlrFb9d5V5ScEpiLCBluXhjY1blsXmTwC3Suo0zk6t1km2oCr0qV0ySHHG02u8c1F
	UBUDXia1EiLLbZNPmipARaRP/YjYi295P0SKB6M+SUSl4SX3VOUa43m3X6w/QH1UQbgG0fdqxAU
	W4Gb4bSx07z58jMSvxeclAuTOrEhm0L0i1RrT6qypWG6BI5KVI88Kb8nqFJrVvYRiYCBTAQYdxk
	FcEzuy5xDfeRDs+59T7+afgS85kzdLltqDfiTX4HDmhlejTR+TAgNeuQCOMIgO35J27oTLKxcyb
	60GZTmY5utsJvx0So9
X-Received: by 2002:a05:690e:d44:b0:65c:1011:8a8 with SMTP id 956f58d0204a3-662b6138ccamr2493409d50.34.1781614948972;
        Tue, 16 Jun 2026 06:02:28 -0700 (PDT)
Received: from localhost ([43.225.189.75])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-662bc1b0d9dsm927500d50.7.2026.06.16.06.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 06:02:25 -0700 (PDT)
Date: Tue, 16 Jun 2026 16:02:18 +0300
From: Dan Carpenter <error27@gmail.com>
To: Devansh Soni <devanshsoni874@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, dan.carpenter@linaro.org
Subject: Re: [PATCH v3] staging: rtl8723bs: use PTR_ALIGN() for rsp_buf
Message-ID: <ajFJWhuEDnPgQjcs@stanley.mountain>
References: <20260616123528.44278-1-devanshsoni874@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616123528.44278-1-devanshsoni874@gmail.com>

On Tue, Jun 16, 2026 at 06:05:28PM +0530, Devansh Soni wrote:
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> index c1185c25e..38ce3156c 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> @@ -184,7 +184,7 @@ int rtw_init_cmd_priv(struct	cmd_priv *pcmdpriv)
>  		return -ENOMEM;
>  	}
>  
> -	pcmdpriv->rsp_buf = pcmdpriv->rsp_allocated_buf + 4 - ((SIZE_PTR)(pcmdpriv->rsp_allocated_buf) & 3);
> +	pcmdpriv->rsp_buf = PTR_ALIGN(pcmdpriv->rsp_allocated_buf, 4);

You're working against an old version of the kernel.  You should be
working against linux-next or devel-next.

The commit message mentions 8-byte aligned memory, but the code is still
doing PTR_ALIGN().  The kmalloc() alignment is determined by
ARCH_KMALLOC_MINALIGN and it's always at least 8 but it can be higher.
Here the code is trying to ensure that it is 4 byte aligned, and 8 is
already a multiple of 4.  You could just delete the PTR_ALIGN() along
with the related code.

1. It allocates 4 extra bytes.  "MAX_RSPSZ + 4" bytes.  It could instead
   just allocate MAX_RSPSZ bytes.
2. This pcmdpriv->rsp_buf = PTR_ALIGN() can be removed.
3. The pcmdpriv->rsp_allocated_buf pointer only exists to store the
   unaligned pointer.  Just get rid of it.

The early part of function which does CMDBUFF_ALIGN_SZ is more complicated
because that is 512 bytes.  It's trying to ensure that the pointers are
aligned enough for DMA.  The proper alignment in that case is probably
ARCH_DMA_MINALIGN but I'm less familiar with how that works.

regards,
dan carpenter

