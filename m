Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2771C39A051
	for <linux-staging@lists.linux.dev>; Mon, 18 May 2026 05:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779081696; cv=none; b=unnQVJaaIWHklG2wwMBIH5JLCJecPwrGT6mRZrusSYmOmjvjI1Fb5hqclqSqUxCHQTeyzHCNqcOC8S8wzUC5brA03ALhlItuACWk4ebGDUszd7EnkogqZIGoFYBAC+elm7VMz/NN2qAQVyuAYhBSZuPZkIDm/3oPkadw5AmPDGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779081696; c=relaxed/simple;
	bh=7a10vgNqiEEJQnO5OwPIrltQfJOdBJF3/4hlmQZdvtk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QvHs1Zx4QH5Kxyqw2RUjqkbDii6VlhIeEt1xeDViCYhCMc91d+pDhr2k3+ru7jx6x43UD7tdUPu9hTg2T1dYgIeZMCYz76pLVlL6y0GDLpqcuQI4w8BUtVpxa2H/TBiLXrXPM5OUO+gYx7JlLBOKRzC31dQHl/fgzLKlubushhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BffjSerp; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BffjSerp"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso13287365e9.2
        for <linux-staging@lists.linux.dev>; Sun, 17 May 2026 22:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779081675; x=1779686475; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VCCjvwryD9VPAkOv1op3rNrfZPwIKpZrxwEA329jq+Y=;
        b=BffjSerpTKRW/KvAPuFEZGiVfDO/WsZm1+L7LZVwNMF0AqcYH1EPw5NhdCq2iOpdBu
         Rh8zqwSav3NcBpY66GNXwxKbta076viF8UkLqBH3FjwFvIhn4ORl9nuD+Sb1X3iSyfzs
         zMJcbnjGKF7PWWg/qIW+wH+UTKJ4Lb3onbiTM3wiGTUBOEV+h9Cd7vyZri3MEci7pBU+
         8Ab1WO+jZ0DWH/6IZj8WdIML4ldvUCBBQ2sSIzKOnKlbF+adT94w+e/6O5/i0IZTn2lt
         l3F8fDCPqWc/tOBZclyNpu8B5FZ0HAp1GOBF+UKcFhMglKcrwfVth1HEbmFVRHe1TDGf
         qiUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779081675; x=1779686475;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VCCjvwryD9VPAkOv1op3rNrfZPwIKpZrxwEA329jq+Y=;
        b=Wult40Zy7HW4tuPJJeIGEYXzPUwoDtTj5zp+AfBAyYpPVLCmjMe0WIbUmGDBlZIPDu
         f1P84b8iEsh0VB+1lAqFlzzxNaa+mF/u+3Z354/e9jCRCGF6t9QP4u8RlV5pKHUhNSeT
         lrePUPcrRMQRv5a64l2H1p4jpfvi1HLg6kJjxwrLkZziEnLP/tns4hR9YTgFMHMOuVy0
         tox8fy3unevEgHEvx5umxBP7bWLWhNwvtvo7czfeV8Ah5EkTLu33Mqjm1E0e9i+dh4Wp
         T5JbfZs914TW4LCZzhT8WRsJeesPn5e7ucJKnzCbTo7Bw8FYccSxbDqBLg7yalvbbtIs
         SQSA==
X-Forwarded-Encrypted: i=1; AFNElJ+T/tpnZ4UXS3pFvDs1Z8Zxo0cCpj8y0xwJ1bB4tM6AGrSVgrQGGxiIo936KhfslC0wNroKTyCADK5VpYun@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1mWl+lIfEVDvxZyk3L3Ygtg1JEsBbbTK8eFBlxcPVebyF6MSS
	8LcY8xDHK10WcI194sMCQ8gOEsEpT/m/a4VLwCarRmgwpR+98aBlZ6bs
X-Gm-Gg: Acq92OFUvw+1FB/JkEa5LywHXNV0EhLiW+5922ATnZD3iQ2qsoHHi7Ve2zlW3mRxath
	WjFiCzv4SEfeep0lXbO3l42NamCDSmenKMGH5DcaE8k3FfiwqSsabKxG6JRzTMvKESAK/5FpPvo
	sI/j7YaCRlP01xvdAWNtKVUPzNQjBN92R5eBf7m0BSVkij5+iRCMgiKcOVhRKNvnQuPZMFPa9HK
	9BVvGKOHHH+vK9LE2+OwJgnI4xvlQZ1L4Ugqq781A/T4/AvXJTVQJveDcmM/3uDwHx+NZpfvG0m
	J+U9bZr/Etnm0/zHsCwTeXpUsNuFamm1U/4eKQ6wrySZUo+Y+qIGJOOWDcUjuwTJbNYDBWjXmlF
	vZssq+f+CR118gj0u8+hduCpEImrvrrXIh4wTVN+fZyfLQX1ODeGy/16Qov+3WYbc1qazM4C3E8
	1P6NeqsfQlcqzXDZLBz/A=
X-Received: by 2002:a05:600c:4fd4:b0:48a:581c:ead with SMTP id 5b1f17b1804b1-48fe60ed7b7mr178573245e9.10.1779081675332;
        Sun, 17 May 2026 22:21:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9adc2209sm31849923f8f.0.2026.05.17.22.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 22:21:14 -0700 (PDT)
Date: Mon, 18 May 2026 08:21:11 +0300
From: Dan Carpenter <error27@gmail.com>
To: Sajal Gupta <sajal2005gupta@gmail.com>
Cc: gregkh@linuxfoundation.org, dennylin0707@gmail.com,
	khushalchitturi@gmail.com, nikolayof23@gmail.com,
	khomenkov@mailbox.org, s9430939@naver.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: split multiple assignments in
 rtw_xmit.c
Message-ID: <agqhx2yQdbRe3zZp@stanley.mountain>
References: <20260517092141.9518-1-sajal2005gupta@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517092141.9518-1-sajal2005gupta@gmail.com>

On Sun, May 17, 2026 at 02:51:20PM +0530, Sajal Gupta wrote:
> Split multiple assignments into separate statements to comply
> with kernel coding style. Fixes the checkpatch warnings:
> "multiple assignments should be avoided"
> 
> Signed-off-by: Sajal Gupta <sajal2005gupta@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_xmit.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> index 458e471535ad..e30c99eeee89 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> @@ -185,7 +185,8 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
>  		pxmitbuf->phead = pxmitbuf->pbuf;
>  		pxmitbuf->pend = pxmitbuf->pbuf + MAX_XMITBUF_SZ;
>  		pxmitbuf->len = 0;
> -		pxmitbuf->pdata = pxmitbuf->ptail = pxmitbuf->phead;
> +		pxmitbuf->ptail = pxmitbuf->phead;
> +		pxmitbuf->pdata = pxmitbuf->ptail;

I find this harder to read.

To be honest, I don't really have a problem with the original code.
Another option might be to say:

	pxmitbuf->ptail = pxmitbuf->phead;
	pxmitbuf->pdata = pxmitbuf->phead;

But honestly, I'm not sure it's a very big improvement.  We'd probably
allow it to just stop people from sending more patches and having
another discussion about this.

regards,
dan carpenter

