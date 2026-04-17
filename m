Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B383B19B2
	for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 08:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776416351; cv=none; b=tSWlMJgOR/YvtyBATJUKB/CZCpfEahOGMcdZR+tDhDw+YeaGCE09Zfm9Mv0vHRswZcKM0DZTmnzNW+rp8lWKyRY/s7iDK7l+PxvCTTZ2v//PKXCZy27mKLv30QQlp7V9MHZa7p7bNIiexgAdNAvhs2V+2dCQMzHu3q/j7Qt5sZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776416351; c=relaxed/simple;
	bh=m1E3OPJdbPotAXTP7PMTI4xgVnL72n7MnjVVwFpoLb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Za46XUmEgrfrBzcztRlHWuThYZs/ynG2TbnFw22j7YBz6siynV57JXSwjkIFf0hLzcnkXEketwb5tkV71rH6cQ/7BarM4bAxUaSGbwfEA0bo+KCjoifI4jxEgxoqbzC4Ps1kCpqWAQACdQcsW6fB1/19d9f6mL9HvWMGPXJRN2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b5CsEsyr; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b5CsEsyr"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43cfd96354aso262291f8f.1
        for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 01:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776416346; x=1777021146; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7dukGfBvDpAabuQBzEcR2UgSSr/EW6iSoTCsDqEM0lo=;
        b=b5CsEsyr++yNyHy2K7pt8qWsHqgT1+/6t9/dTodYdDT9kmE21XlSeTrGiEQXqn2M23
         zhYY28xMHvoTqUXPlfpbOzrzj1PoNVh+IPkqXYFDAinlMkpHj1UmLOdshLhTXLWY+O97
         TRMnDB3tQ/npFwQjSKfEIBazSA5CGgC/WzJhXL+XdflZ58SRjo0DN6W7MIOShbg2YGID
         Se98U/WnVqrAGp9PL62fI39ow+4KfyoHXLlePcpFybeYVICpEHfjaGbMv2fOKD8mYhMK
         TJ6VFsIxKxxQ7/AoA2N6fGlnFepbXSC62s4s443r2aWayyk134PGFSj+Othsn8w5pT6J
         eY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776416346; x=1777021146;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7dukGfBvDpAabuQBzEcR2UgSSr/EW6iSoTCsDqEM0lo=;
        b=hb5VHSYQxf877c9SKDHQAFh6h7X3kSc5RISxpvB+UXtajVOKVPeCgkyjc310IFEp6/
         G9fp8GciMmyGt6Mzd8v2kZz9VpMdB2+ZmPlikZzT8dzTpBPOkZj1wouhuym2SoYv95I4
         dzyQyZTeRt9HJavtFzbTnZ2GmhDtH1pL5c91K2yHIiPw8oO6S31JkyB7sIpA8rJFzJbo
         qgGJ7vPhgneBnE13ufERWTn9AHU7gAOCgf3+nkrxFwAVdsNwDPrOIs88pDgj87NSLrd0
         vnr2sgUhh7NdoBkJoydVp7A1M+I/qo3QnEE3KGrTCYuvcByYUc3/5wY7Xs44fnulaqiv
         rgRA==
X-Forwarded-Encrypted: i=1; AFNElJ8eh0uiDOQCjSCV6pMhllWaKEnmkryMUXtpYELWmAFV2hAWCC+gI82NfwHuqMAdWCWq2C1m5qhX6fKgJD9Q@lists.linux.dev
X-Gm-Message-State: AOJu0YxjhHWvvj2+PfOnsxjXZpuUpktVP1ER6lejIDtqGRwbCFAT10BQ
	Pfeu/acB+mnAMhnAwGt7FdXuzd5iDShOlrI3mw2st/t5S8+/Q3qENX8K
X-Gm-Gg: AeBDieswDd/FcG4UDvtgjd6B5hmxwuS8XpNYI4/+xtg+FyQYywD2NBqJAfKmxxgotlx
	uj9audjICWoCWZMGXqxsORHvvy7OmcrjahN3+4UxpAAzOFDrAu8qiyisVdSKfaWLHh228e78Yd4
	NjNFx7uKCfmunoo5pNAaLS5bHPqoUtc9JB3+GZ9/BAy3sRKdCrR7YmBkcoi+F78IfxHcg9Q3i4L
	Qo/JI0G/m6DW1b3/67WuSlKOZKPvlwPoYH8Yn19N2fVPU21YUXw42WGyQrJVwNbx9kuqUNwBOAk
	7fJOOSLaoT352jfjyQId2k8MKwrxryLlsqh+bb5TKO8j8fomOz79nYYHzFMkFL0ZO33TKOE6Z0v
	UgR3BkQQ8ZNEnuM+hRbMpGLXpL9Lkj1FG6tlVrFLKn0P7WYGH9htAwxbLXPMlC+byYps+yH2Nhb
	8x348EF8+yq2c5IwW6zBYJB9tP5CXrpQ==
X-Received: by 2002:a5d:5889:0:b0:43c:f8b4:e58 with SMTP id ffacd0b85a97d-43fe3e0c7ebmr2930843f8f.41.1776416346074;
        Fri, 17 Apr 2026 01:59:06 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb11b4sm3075735f8f.2.2026.04.17.01.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 01:59:05 -0700 (PDT)
Date: Fri, 17 Apr 2026 11:59:02 +0300
From: Dan Carpenter <error27@gmail.com>
To: Huihui Huang <hhhuang@smu.edu.sg>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: ipu7: fix MMU resource leak in
 ipu7_psys_init()
Message-ID: <aeH2VjOV4_Ql_zeY@stanley.mountain>
References: <20260417075807.2691958-1-hhhuang@smu.edu.sg>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417075807.2691958-1-hhhuang@smu.edu.sg>

On Fri, Apr 17, 2026 at 03:58:07PM +0800, Huihui Huang wrote:
> There is a memory leak in drivers/staging/media/ipu7/ipu7.c.
> 
> In ipu7_psys_init(), psys_adev->mmu is allocated by ipu7_mmu_init().
> When ipu7_bus_add_device() fails, the function returns without
> cleaning up the MMU resources.
> 
> Add the missing ipu7_mmu_cleanup() call on the error path to free
> the MMU resources.
> 
> Signed-off-by: Huihui Huang <hhhuang@smu.edu.sg>
> ---
>  drivers/staging/media/ipu7/ipu7.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/media/ipu7/ipu7.c b/drivers/staging/media/ipu7/ipu7.c
> index c771e763f8c5..4039e548dc8f 100644
> --- a/drivers/staging/media/ipu7/ipu7.c
> +++ b/drivers/staging/media/ipu7/ipu7.c
> @@ -2228,6 +2228,7 @@ ipu7_psys_init(struct pci_dev *pdev, struct device *parent,
>  
>  	ret = ipu7_bus_add_device(psys_adev);
>  	if (ret) {
> +		ipu7_mmu_cleanup(psys_adev->mmu);

Same thing.  We call ipu7_mmu_cleanup() in the caller, and it looks like
that will trigger a NULL dereference.

>  		kfree(pdata);

This kfree() is also wrong.  We're supposed to do:

	put_device(&psys_adev->auxdev.dev);

which calls ipu7_bus_release() and that frees "pdata" along with
psys_adev.  In this function the first two error paths are correct
but the next two are buggy.

KTODO: Fix error handling in ipu7_psys_init()

regards,
dan carpenter


