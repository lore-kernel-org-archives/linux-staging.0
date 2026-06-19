Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9CA283C93
	for <linux-staging@lists.linux.dev>; Fri, 19 Jun 2026 07:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781855975; cv=none; b=fsWnaNhjLzqR2G4lYWpIEfwt7wjyjDyscLRTxpI0SKNHelsWD1icyej6BVa5dcebC3zSibpLNpMz55xmhSC7pIX2pTMyNo4E1GkSSfpgvF0bjJBvCi1f4lwdPV2Sw79tHtEHJtUTRtCvPAjag6mXvvWzPjUBS5sn5pF6HFFOtys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781855975; c=relaxed/simple;
	bh=2HpKLG8noAKXGYeBYRi64Ma0cuNJWXGfbo0xvO2xN34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ch2wx1o0xt5Bh2sHQmjkbUr0nqlWgHxCClV9eWNnQV6e9LXdF/tQZKJpbo+2JcjxniuTQmkxVsACaUr9TC3tF2ie1VC3Rvl5Zx0+ZwHVGUwSBP8uth1Hve5yM/d0WNbrjMRBvWmYNTC1SbWrRhjSsH+2JLvATeu/G4Do0/BeMx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ksoGfnTl; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ksoGfnTl"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7e6e2d54d3dso1112685a34.2
        for <linux-staging@lists.linux.dev>; Fri, 19 Jun 2026 00:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781855973; x=1782460773; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t3s1QVgPY0FFH/YpRcYqVVrgnd1ALR2zKFtSBHKMnnc=;
        b=ksoGfnTlH6HOcTZuF68q4IKK4ln0egsD9mUWHvM7Y7ZqCBbACNhnA/d1en8euXvGYE
         JKWgPdjyFJi4KF1WFWGmPzcJMKEQ6wvS7BkwQa9VwYE/7xLzgjof5iLjc2XKfUuoLTIf
         sK2YNxBRJSOBPOyKmfDa0TsvnlpTSd/ZHYfAn8UBbFUq4MQ8lZqKpbL8ScGygmyAI4Lq
         H6g8nusXI2eMmyLhJF0hj2J9HNihtg0XNfQL7z+sUapx3djAsnvtO3UMARDtJzqlgzbu
         hUUWQd6XOGPggEf3BrEgEkm52N1b/3R1JSVIrY/p0Zlq0+cLSPUtBZoR3Ne7WX8Bzzaj
         bHUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781855973; x=1782460773;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t3s1QVgPY0FFH/YpRcYqVVrgnd1ALR2zKFtSBHKMnnc=;
        b=idgRb1exFHdOLxo7/DswKq5fTQhfwNPsE91r4emc26XhJTsmJ4EP2nFuuYwA2Y6y+F
         fnWJa9Lyrek0Fachn5LryDU4BROvkbuQH9Ct8d07LpvdkZkJWLmiVrNoL6GtEQV5bB9q
         lb7/fhwevh7uOHNm4VhjlP9v4xPpnOsLXKM4B2OSUTdTMW0LALd04CY9z1k5RIgQmHQ2
         BqxYhDx3jqQAfPE/snLJWm7SlUNKXeVUVxz0gjKGSw8LXX5MQR3VJmpC7azjsfgPtjOT
         DGbLpGZ0w+c+57jlukNJVzzW4nioAQ4wYBrxhUxOY5Jec5VYuBeXFG0Fihd+WWAx2wVk
         wDCA==
X-Forwarded-Encrypted: i=1; AFNElJ+eqr/4uunoTHW49Yw2VvYpOz2sIFFjLcfsaMA8mcqnWzSivXBnmpt++e+p2PV2tdx6SxV/7vim2sDi1WEz@lists.linux.dev
X-Gm-Message-State: AOJu0YxBWa0whA83aHXBOr2p8h2JeHQjwclUrwGZGGZRHjB8yokl4MFh
	6eRDR/+ixUdC1yMnUb1ua9FTTllGgTvyNaqxg862ygTWcuNYw/KiFUeb
X-Gm-Gg: AfdE7cmYtb/KQmflPCDHrDsTrZ8ZPX8/xlTHJRt3xZ6hp9KnvqBCn5oRevFD51Dgr9p
	ajm3xNSJNf2Gj4zJkJ+8Qy3addL8JxoEGwyXtDvEIjVJ8vRc573CmMPphJzg4SnG2usxiq0JbFs
	E24XxAg0XCwwY4OGh7VlBdFvoRbUhsS5TczTy+yxB8+9xI3/Znp3aZip8hPnboSVjKTYsUXem49
	z3JPP7BfN1xVhgSkxfSZI1bTg+bhgEr+GSAaX+zBjwv8iVO3oMB0/hWVFxCWq+KXpPWZ5uDOZQq
	nFOPm2FR95FEsXbPonZMBj6+kBMA6IX+kL9mP/hfE+aUI9VkuPOBALsULncBSeS9DiOUgDpqD3I
	d9ktTUDoFcBhQLOmlFpXVBZIO2LwnDjqoXQH3qFoOS+4DLaY8+0O8Kq1sbEIfb98PcCFfOVzOzz
	iekNbXSgo=
X-Received: by 2002:a05:6830:82d6:b0:7e9:419:acd with SMTP id 46e09a7af769-7e92d9a7ba9mr1957500a34.17.1781855973220;
        Fri, 19 Jun 2026 00:59:33 -0700 (PDT)
Received: from localhost ([45.136.154.250])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e92e4f3424sm1292104a34.11.2026.06.19.00.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 00:59:32 -0700 (PDT)
Date: Fri, 19 Jun 2026 10:59:25 +0300
From: Dan Carpenter <error27@gmail.com>
To: Andrezinrc <andrem.33333@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove redundant kfree check in
 rtw_xmit.c
Message-ID: <ajT23QSZDVNdD8M_@stanley.mountain>
References: <20260619022938.15691-1-andrem.33333@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260619022938.15691-1-andrem.33333@gmail.com>

On Thu, Jun 18, 2026 at 11:29:38PM -0300, Andrezinrc wrote:
> Remove the redundant null check before calling kfree. ccheckpatch
> reminds us that kfree(NULL) is safe and this check is not required.
> 
> Signed-off-by: Andrezinrc <andrem.33333@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_xmit.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> index 7bce0343d..92e818705 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> @@ -1736,10 +1736,9 @@ s32 rtw_free_xmitframe(struct xmit_priv *pxmitpriv, struct xmit_frame *pxmitfram
>  		pxmitframe->pkt = NULL;
>  	}
>  
> -	if (pxmitframe->alloc_addr) {
> -		kfree(pxmitframe->alloc_addr);
> +	kfree(pxmitframe->alloc_addr);
> +	if (pxmitframe->alloc_addr)
>  		goto check_pkt_complete;
> -	}

The code was more readable before.

regards,
dan carpenter

