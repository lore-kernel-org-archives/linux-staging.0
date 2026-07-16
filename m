Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154FE2F84F
	for <linux-staging@lists.linux.dev>; Thu, 16 Jul 2026 06:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784183508; cv=none; b=PtZ4yIOlkO/YUA4ewhsqkvf43SKgoqRXD8TlAegXEagq0yw80Uk6RcHGGoKIOclSJFb83+dv2UvhvUxNGFuevXnqH1+6233aqoZhFPxEGu2jOIzCm93Y8YzTAyl/KIlCX00bbpuNn9gR/NcmCKtmVJTPpjp5Whb9d93Z/vxmOP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784183508; c=relaxed/simple;
	bh=r57/bGA5SSeMINPpQHLlRxJkyoKb3Z0IBSwnao6DBJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jnWHKelCUweMqwqB+jus1qdl0CanQq7TJxfaUy3R52VfqG+tUmq3hY+A93kJ0wcPp01sPKjmZu2XwYA9XsYaGrptL8GMBBedM8FtddzfcLR87128zV4EqEPGSiEaXsZk4OXV5dEI3RuVGlraoYmN1mMciRJbCUEf9tY/4/7LFeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KOaErJjr; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KOaErJjr"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-495b98b4f6aso2268004b6e.2
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 23:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784183506; x=1784788306; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OiVd73y8oqqWO8DT1671vLKitLMYW0Is544oA2VqVVs=;
        b=KOaErJjrQwRcggKMrcGuCLm+TC2qFMpUeH6M6Wq7KBoOhVlGG2HfwHXYLuM1qAmD6n
         5UxBa0GZCr3prSV3QYgJX4CL971PDDWNG9i6X8K0BSoSenToCq6dM6Sk3g2VA8TDrVCP
         WQ2LoitPuun+ECUQ1Yk4p+Ue3AU+WlG+5K8X/SKuZV24UdyrSP9EO9z4t8eHuB0AnyB4
         Dw0kbxf43CsTo/fQb6uft9E4KcIKe77XLlLBF7YTIQyIpLwvT4/sGyogWRVhmhqbnFzP
         1Nua2qLYB06H4Up51ph66VDvoNwXG+AfDhrGj5SRgsgqx5WrtNQNVHVAlpDDqV0yqwq7
         DEaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784183506; x=1784788306;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OiVd73y8oqqWO8DT1671vLKitLMYW0Is544oA2VqVVs=;
        b=Na3UzSHKYPGCOGaAYppiPWmBazi553cESV8ClxeZ+JEn/3LPx/ogmqQdThIif3SpK9
         mQhCjv77pVF+lIGrfGANYUC5dnsIfrSXaHUyRhmPj9buEew6Gr3vRVhg6XiWmNRBb/L7
         WOB8C/rXcpezXy2uGVGkJnFhXri1EJX9X6yLu88RgBUBe/afZv0w4fegR/hh5JmphBsr
         PjFLUBR0coG7/hnmXcArwWPjpTC9dVnyFZolnXBc6KGd+9I5qV2ihSeeVamy+0OTpnJ1
         9aA/CYinaQ1WZL/nKISOwCsy4ludxFUdMcupODNnSBEdWdPW0toX7eqhA7O8sDa/29Gt
         O76Q==
X-Forwarded-Encrypted: i=1; AHgh+RqgGIrVy09N24V9/DI9p8zsqzS3SygQRgcCj7HxgcQH6Dfplq94+XvCh/bTh8zNilZt+mySykilI0KTfjPN@lists.linux.dev
X-Gm-Message-State: AOJu0YyGaLPhMPrQgosRlbuxNADtGACL3feeF8M+MSKb4qkX476r6nvw
	1XHPZh+meXM2Gmr0EZi2u1ZcZmKscK+ojJqHnbW3uNl/PXt8DHpdKpSZ
X-Gm-Gg: AfdE7cnshkhB1DVqA1OM7EaQYLnIZR0D8Seb0PCfPPOzuM++gUnF5jpaQQfIn+QErhp
	zvUSCYGz1LhJlaS5DJpcYM1UjeXYnH/0x8+ATnKafJCRy9NBgCHR5RpoRuZSK8b+goPttG3sZqm
	Irn+bY4x3BdAiqJwSLiziwxNcxEHAhUAZ49fsNZJHLpJcxkxHkj+X+/mbFmLremgNW3GL8uIadX
	/HHyYv6toOET/oV7tfBL/sWkILLqltU9+eMYtoOBjqGc1RwCt3yRKN79j8zG9Qd+Qsac9fB8IJq
	NQvkzAgsODPVzJLsDU7CRu0USrQ0XdDHG7evGLxILyZaftcpEGJPgznSyxQPyJgo7Pak7NgbkOV
	dNZkl/JZo+/7emRDlRV9TtfPD8ZZVghjZpU+KoaIEESmwOKKwgfVAo7TdrC76ueOL6PzVvF+t9A
	ZCwHlIz6wYArgQwSg=
X-Received: by 2002:a05:6808:4fc9:b0:4a3:2bd1:5220 with SMTP id 5614622812f47-4a47a7320b0mr6927850b6e.36.1784183505842;
        Wed, 15 Jul 2026 23:31:45 -0700 (PDT)
Received: from localhost ([74.80.182.90])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a1afbfbbaasm17501698b6e.12.2026.07.15.23.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 23:31:44 -0700 (PDT)
Date: Thu, 16 Jul 2026 09:31:37 +0300
From: Dan Carpenter <error27@gmail.com>
To: Amin Madani <aminmadani112@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Split multiple assignments in
 _rtw_open_pktfile
Message-ID: <alh6ydMadNsz5x66@stanley.mountain>
References: <20260715170003.94569-1-aminmadani112@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715170003.94569-1-aminmadani112@gmail.com>

On Wed, Jul 15, 2026 at 08:30:03PM +0330, Amin Madani wrote:
> In _rtw_open_pktfile(), multiple variables are assigned on the same
> line. According to the Linux kernel coding style, multiple assignments
> on a single line should be avoided. Split them into separate lines to
> improve readability.
> 
> Signed-off-by: Amin Madani <aminmadani112@gmail.com>
> ---
>  drivers/staging/rtl8723bs/os_dep/xmit_linux.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
> index 4260ed5f4..598d94f1c 100644
> --- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
> +++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
> @@ -15,8 +15,10 @@ uint rtw_remainder_len(struct pkt_file *pfile)
>  void _rtw_open_pktfile(struct sk_buff *pktptr, struct pkt_file *pfile)
>  {
>  	pfile->pkt = pktptr;
> -	pfile->cur_addr = pfile->buf_start = pktptr->data;
> -	pfile->pkt_len = pfile->buf_len = pktptr->len;
> +	pfile->buf_start = pktptr->data;
> +	pfile->cur_addr = pfile->buf_start;
> +	pfile->buf_len = pktptr->len;
> +	pfile->pkt_len = pfile->buf_len;

https://lore.kernel.org/all/aZ_0OratIkUBNHmy@stanley.mountain/

regards,
dan carpenter

