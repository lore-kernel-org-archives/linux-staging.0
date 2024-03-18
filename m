Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0AE2374C
	for <linux-staging@lists.linux.dev>; Mon, 18 Mar 2024 07:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710748272; cv=none; b=bqRnQvl4Bglti2ERQ+wcw3HXT0R7GQL4jVIOImCjC4wf/fc3iTCqXPTsilnKmPAoTYfH7kofNfv+5jjWGiDrCfcxwWORs4v/5G6giEK9DCJZ0ryxo6ORmxX1pBe9Pswj6GRheZmFTjhJZMydbC08arQb+DNjLjnSC3YKAnhy8TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710748272; c=relaxed/simple;
	bh=1hjlx7mByRkB+RyNSp9fPJzaTV+aHeoo2cmJHjptDeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VGCHtIAUn2Pj9KCVvteTmgGD0HeAR905BKtTwhAIm3TSC7fncRFfolBoRu/L5sCabiY7RI86+8eEd86j3fmBg+ei6ucj35IWdDVwqwXdzc25MHjRpanNf7vq7vWes4ZdnqK7GfxUvbMMSHcasRwUvHJ8aWwT4XijMmGSu54Sxk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gXMcCJwZ; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gXMcCJwZ"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-563c403719cso4916589a12.2
        for <linux-staging@lists.linux.dev>; Mon, 18 Mar 2024 00:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710748270; x=1711353070; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zcvM2U1RtWo67CL6QsElDR20ViRM+DDPM1wjn1TEfQQ=;
        b=gXMcCJwZN27ye4dIdnQZ4RvThIBR0Pk5iZ7Klj65JTd9yQkyA7cJ2ii1kZmKS2M9U+
         pvqXjBhjI1cnMExrfYw0Tyhu8ra3xhVFEw6+mWFKwgEbNsjbbNTEr5ra/8lbzWxypDr2
         OcV751bIsV1VJU/A/p41dIYIYcZYu0cSWBYBQnGYZDeSA6ONa8B2ehEsprq+3ooTYuVn
         oAoScd9F29IH1kn0A9Uek6VwwfgJRyQndvjyt8iheyDrnTWR+pn+4tihgVCm3DBwVwxz
         e5pTvWUeKH0xEci1vWfDan5PP5j5oDk4Bv7kY6kPJEdUPY5v+u/BTEFoj71I159KkfsH
         4eZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710748270; x=1711353070;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zcvM2U1RtWo67CL6QsElDR20ViRM+DDPM1wjn1TEfQQ=;
        b=C8mMdNL3tmgQkTzM+vjxk+mEf4p6srjBRwj3KHxcaoeS16A7ZUOPLcKw6kN7IInF1p
         Vx2CUWUAlj0y2Lx1N3PQWEon4cUwcG9hHgsokD/LmhnRQ7kWco2aiXwJcFGvm7h2Xu2f
         W6w7O8VPphf6zDTN4xqPfi/YpkGSXq9mUqipBiG7wJd2OT1RjxDWDpiVErxBJt9ZiD84
         wFJ8zLREWG6Moe0Waauta5tMHF80ujigXJR1CxNCEq1bGRwpObkJWwF53Uha913mLe20
         AhYY3dTBQA6//yXoCkfsJg0H8CaZ9RIuCScHIce0OZ4Br3J4dWro09ZbKzJMdTt1JIkZ
         iDFg==
X-Forwarded-Encrypted: i=1; AJvYcCXBH5GVgXylvvRi1s/+ffx8D6fa5VXuBGnpgIbswhC2O8QrqKh6M7W850HNJPVlvYD1BzaH2BP3Sm2EEfsvCFtlDi8oIC6H2Pk7iiqWQg==
X-Gm-Message-State: AOJu0YwFXp5r4Xj523bnq78bBLpepmCLZNZXp6Z8jFZ4/gnFFERAaaZm
	ZSKAC2NZTY/2MypJL5xFNs9GM5MoQ4gYd+uprleHvFnlKUhsZfNom8FvecE1bYo=
X-Google-Smtp-Source: AGHT+IEvB22Xpy2Nc5E3LJxhstpPLCNC/esbvBM8MshhZNyxJrIkm791fYra/ATnXNOue/LBc3o8iA==
X-Received: by 2002:a05:6402:458a:b0:568:b851:f718 with SMTP id ig10-20020a056402458a00b00568b851f718mr4637155edb.40.1710748269582;
        Mon, 18 Mar 2024 00:51:09 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id cf13-20020a0564020b8d00b00569731a1eb2sm932904edb.46.2024.03.18.00.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 00:51:09 -0700 (PDT)
Date: Mon, 18 Mar 2024 10:51:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ayush Tiwari <ayushtiw0110@gmail.com>
Cc: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8712: Fix line length exceeding 100 columns
Message-ID: <f004287a-d248-476c-9a3d-d24eab6a891f@moroto.mountain>
References: <ZfdIpVyUTIEGTp7j@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZfdIpVyUTIEGTp7j@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>

On Mon, Mar 18, 2024 at 01:16:45AM +0530, Ayush Tiwari wrote:
> Split the argument list of the kthread_run function call across two
> lines to address the checkpatch warning "line length exceeds 100
> columns".
> 
> Signed-off-by: Ayush Tiwari <ayushtiw0110@gmail.com>
> ---
>  drivers/staging/rtl8712/os_intfs.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8712/os_intfs.c b/drivers/staging/rtl8712/os_intfs.c
> index 7554613fe7e1..e77fcfc465ba 100644
> --- a/drivers/staging/rtl8712/os_intfs.c
> +++ b/drivers/staging/rtl8712/os_intfs.c
> @@ -221,7 +221,8 @@ struct net_device *r8712_init_netdev(void)
>  
>  static u32 start_drv_threads(struct _adapter *padapter)
>  {
> -	padapter->cmd_thread = kthread_run(r8712_cmd_thread, padapter, "%s", padapter->pnetdev->name);
> +	padapter->cmd_thread = kthread_run(r8712_cmd_thread, padapter, "%s",
> +			padapter->pnetdev->name);

Please run checkpatch.pl on your patches.

regards,
dan carpenter

