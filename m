Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2BE3EC2EF
	for <linux-staging@lists.linux.dev>; Tue, 14 Jul 2026 07:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784013634; cv=none; b=O9fPe3b0M45S5Pj3pGlnfwqZF8wWqAClU/qU7jpZ4CNohOUUQRFjohWZtZyXM+Q2qiAoYMHjdly4Vxb2BTa49wbsYcu3C/yxt6umOw2dxblRQUt0Tk7am/GB60FfVI66qHVW83PWxMn/DQ8FVbCOH9RID1cgD+f3XKjYBnh7AkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784013634; c=relaxed/simple;
	bh=0fAdOWv/wZxG/+FHQr4Br7W7JkKnKTmywTnQ8Ia2Eoo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z93PIIWxrmoBbZjsgDjeYWil+YvJtua2yejikYoWJAkBWbBkZNYL27DVKYrBvvKBVsI/cCQDUztahNkIPF+PQiofXjbxyRmP4o9Nvj8oWlalvv6+hcQMGoOLq1AYmnUljUTvQ+oqygiQObeWlylTkRpIbUTND3uKnaOGkL7CKgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ngByqi8i; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ngByqi8i"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7e9ecb1e13bso1582873a34.2
        for <linux-staging@lists.linux.dev>; Tue, 14 Jul 2026 00:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784013632; x=1784618432; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Byci8e0G2bo3uIP1pnZZvRGU8unL40JtAxaPq207uTQ=;
        b=ngByqi8ifKuQeP9sTm6YS6kZFth52DyQaLiYSDRcQETzlsEoZ59KzRirgvFz49GcLe
         u7CqqTaBU34hQbOR1fbum6J3+vrhcIBW1cBnczj299Skuq6T1hoQu5mh6vv5YO0+v9AG
         zUvP0rkRJnvXf5BJrACr7CFC+MhWfXX8bAa5z2pRX89+DLKvJq/qB6PrVn5WnO0MBGXq
         LRSvB9QNTckDCbOtpCwrykiAjU61T7LkUmNG9DTUaLTZ7c2ur+BcTMR0Cvygbfjj0g6S
         vIYjttjxzmF/RM05e6P4udjZdmsS70CKnQu5PzfMlrn1JT0OtopqQxA6LHgF7UfPmhHs
         Mspg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013632; x=1784618432;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Byci8e0G2bo3uIP1pnZZvRGU8unL40JtAxaPq207uTQ=;
        b=oA0caU/ohsovacB6MJFkVbytIjcvglCIHmrzCjsSu5KOWhv5ll8uV1VjIzZOeGXKsQ
         kSdAPCenc7NwSIJKitFIO0w264IlYh/gv9VlNDODqNTNx6Ojf6qOLTWs2gEAqTgXq1r6
         reOcJIfFGJ9vNgMu3s5ah24bGSdz3+H4qEFwI27jqAfjyilRZnCHYlPGz18NwViAzDn2
         oLYnIZAMFi/io+EJjzNQ5xhYuAzUjKep69Sdq9JLjtYgIlrhTrm1Ob5ixMhsChXIfwcL
         wL8oLw6o6kEZPWFseSus+dvxMODqLSPEsMVCUaeW71xkguNTKUtMUw8OBp5dzjQdUYxg
         p8Yw==
X-Forwarded-Encrypted: i=1; AFNElJ9o1qUeh4SFLJY85etEJ3kwv8vN8w8u6WjCaB/unewqVRCimcQcHijBS8zAp68r18ZdkHKMlpIlLrtVhOpn@lists.linux.dev
X-Gm-Message-State: AOJu0YxcLEsxGJGXmNWY4rwQGjcxdgP0Onf9ZIOzAg+qSkJAEOzoKQ2j
	NWXzW+pCzFBesTK06XQA5btS0dCIDQxd8XzP3X04uy9G/R2cIJHOJqn7
X-Gm-Gg: AfdE7ckGx8CyPFe3xR34+ZOBupL625D5FH6azluD/bZIn21wylChqRpNjiy/TbIHo9y
	FIoz4MCYyljqqSkDNftkS0rtCJAJ/gV1N/a36LqPNgvu05eSyGpcg879UNkjRTZjyrmScvhr/Lr
	bSV2UiOMew14gj3ST+2qL0sc3ftSyjMbFgBKw/WA9d7hjI2flZ2rydnYd7+miudyFXkr5NDfdwc
	474FxV+Kao+4XFsD+SUIxuCa4ITnWi1HpS7IT0KXiZCdtAjffbYtqgYyFyWs9FFCtmYI4/lU+4u
	PF/N5AOOledhJGcoCsn3oCA3WSd2CfjCcq6nWAIuAZKxPVhZv2/M7eGLM8LRmP/qtKxSYQYS24+
	fNHMd4lobJZPlu0PQJ3EPHRV5vxJ7ghyIlqTpaZuzUPRWPU0Bwi8Lp+EsEA97FNlkOBnuAyw4j1
	aML9KO
X-Received: by 2002:a05:6830:310b:b0:7e9:e1ec:c818 with SMTP id 46e09a7af769-7ec09802247mr6902810a34.25.1784013632157;
        Tue, 14 Jul 2026 00:20:32 -0700 (PDT)
Received: from localhost ([74.80.182.78])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcae1dce3sm14604988a34.3.2026.07.14.00.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 00:20:31 -0700 (PDT)
Date: Tue, 14 Jul 2026 10:20:25 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ivy Lopez <skunkolee@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: use kfree_sensitive() for key
 material
Message-ID: <alXjOb8c53MddWeH@stanley.mountain>
References: <20260713233401.48262-1-skunkolee@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713233401.48262-1-skunkolee@gmail.com>

On Mon, Jul 13, 2026 at 05:34:01PM -0600, Ivy Lopez wrote:
> The set_stakey_parm struct contains a 16-byte encryption key.
> Use kfree_sensitive() instead of kfree() to ensure the key
> material is zeroed before the memory is freed, preventing
> potential information leaks.
> 
> Signed-off-by: Ivy Lopez <skunkolee@gmail.com>
> ---
>  drivers/net/ethernet/faraday/ftmac100.c  | 47 +++++-------------------
>  drivers/staging/rtl8723bs/core/rtw_cmd.c |  8 ++--
>  2 files changed, 13 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/net/ethernet/faraday/ftmac100.c b/drivers/net/ethernet/faraday/ftmac100.c
> index 5803a382f0ba..adb318925f44 100644
> --- a/drivers/net/ethernet/faraday/ftmac100.c
> +++ b/drivers/net/ethernet/faraday/ftmac100.c
> @@ -49,7 +49,6 @@ struct ftmac100_descs {
>  };
>  
>  struct ftmac100 {
> -	struct resource *res;
>  	void __iomem *base;
>  	int irq;
>  
> @@ -1137,11 +1136,9 @@ static int ftmac100_probe(struct platform_device *pdev)
>  		return irq;
>  
>  	/* setup net_device */
> -	netdev = alloc_etherdev(sizeof(*priv));
> -	if (!netdev) {
> -		err = -ENOMEM;
> -		goto err_alloc_etherdev;
> -	}
> +	netdev = devm_alloc_etherdev(&pdev->dev, sizeof(*priv));
> +	if (!netdev)
> +		return -ENOMEM;

This is unrelated...

regards,
dan carpenter

