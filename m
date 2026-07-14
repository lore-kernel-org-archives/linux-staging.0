Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0744B3EDE5C
	for <linux-staging@lists.linux.dev>; Tue, 14 Jul 2026 07:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784013146; cv=none; b=LSRfEfUtIxLAQa2+L0b4q5eihMk4Sn7LO1M++H57hBSH7IY3qrhL+2LcaMNh8h2jOk6PC0YtnU7rLwjoiQtZZMqvpjhazfdu5CzYLYU1pcRIoSUGhb1wBT5W8dRc+3HQ39S/eMpKUbqyBUGZnYqK4LR0shMcTrcIvHVTldtEb4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784013146; c=relaxed/simple;
	bh=So77X3sMp+X8X/Uf6jYIL4nu6vIlJI8yrVJBIzmhyUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H116e/lOuwiPNWPk2XfpXR2Z7dcLhJUFYDSyBhqieM7VAbqnMW/eLzsaftvI9kcX2do53f51mhrLEHnzW8ZBehlsnqJOKCimY3/G/xAhN4LVcqSB3/w8PERB0pka/56WpfFSv2CdMwxV+Ka7ASsANLJGKsQS/Q6hi/tzIFcQCT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bh589rne; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bh589rne"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-451fd21113cso648818fac.1
        for <linux-staging@lists.linux.dev>; Tue, 14 Jul 2026 00:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784013130; x=1784617930; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i7/u5DtJLPl6AAyXQzJGGOWXfylHC+3RbrSgc8B6ED0=;
        b=bh589rneYXRj1PIyFa6zf5eJGSxV3FvozOKATX2+AidN9/7Yb7RIgxqF9FEJFTvRLr
         TXSpHBqFCyshaty30Jzms0FzsLi5BXSFbRn6AhmiAJ5t//wXu76ijCXnjO1m5ariF9FI
         NdcVk1Ujc52t5fNjNX90Ow+Ca0nbxzF4e0rNiSbgeq5Kz2VcGg0tYeENFeoa5EAFLxGE
         EPOWPIxNCCIJc5cLtAunXpHk5yOUxFD6RLvVcjQdr1hVeq3lrcoE1j36A63UBW0bWZZt
         cPtXKI0/8ZhGp9P/MSgrcjSFNnMHc5cWK3PaR8+Coo1VRgk3ZhHvZ7EKmA3m0cHRWOi2
         2Grg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013130; x=1784617930;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i7/u5DtJLPl6AAyXQzJGGOWXfylHC+3RbrSgc8B6ED0=;
        b=VDffryXPMFqbrAeZJt4r9jzg6eGyoABr4CiejYfeKYHLkyTvsTU/5yo7ILJLU8iFaO
         N6svgy4wNDXcfS2cugKUbByF21zxCM3imaDo1rHHnJVs2q2OStQqG1e+9yih5YDFdYHk
         0WEi1CYh1yVU2m5j/xhdQTr20F8fRenVdfvzav+GpQZqacOT0WtZVOu4WscyDQ8eLD+7
         wnxo8YyFIoVB84Hmu1vI/T1IRtP+8nBf2ooMyJ1hLsp3wXK0y8vT/nKe5dbZ7xMr3+lI
         +n2glxAVn42l7ZWXhvxrK4m3MF5rZFnxnMScLcbnvu5tYxy9IMrGp6sGk1Qsj+N3z0a/
         YPPw==
X-Forwarded-Encrypted: i=1; AHgh+RqVCq1SRbNAsN2crvDwz5eXHkX3w/0uiUd5Q+JL0fyunlma6wPs/1FJf46ALiujQOnEu5QQKnM6jzQNqBkR@lists.linux.dev
X-Gm-Message-State: AOJu0YwJzmano8fTNA9RrIAtbM97SAt1inRTdASi4MuB7GpSy7/5k/8s
	WnoiqUwCDv6DB7HXxetUIjocrqwYt/Rtr1eXO8GWq1xaaBGL7BfpD1nu
X-Gm-Gg: AfdE7cm5iBoulEX1y/frH0y3RmflVKNkUqKtSD8mY1cV1Kj21+WkoKeR4hMqdt6RV/l
	iwazgHbR6grzjEpbU1k54tSNhCFHQCXVYhYsb2slUXYME4QEaSGorrYppFwAvYeMkvbiGsynJ+5
	EhjxrmzBjfaJapNj+UX7dRKgbvEBB98wZXwDI7gpFdJkMJ3FU6oiuyOUJeqbi2lM6cOCx6rGZTu
	FP95oYreTE9eFwVFRs3hGF5dclzTNcf9MzbOxGIcNnXyRa3gJJjPZSylglu8JAjfA2Nvc64nKGp
	zAPvKpiXa+vt8CRRajfAZPypygpdM9TitWDZFOxfu4MmdtW7rIf4JPyZOvrg6emAEWjsYqYEGab
	n1D/X+8Ck1qoqBUbDadopgvUwF+8a0QExPjQLmhGGYZRRgY+jzbNY4EtDvIhoecx5boonukhlsq
	ld+YRO
X-Received: by 2002:a05:6870:e188:b0:443:1de6:beb3 with SMTP id 586e51a60fabf-451f253aa66mr6397334fac.5.1784013130404;
        Tue, 14 Jul 2026 00:12:10 -0700 (PDT)
Received: from localhost ([74.80.182.78])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-45191244618sm15385010fac.4.2026.07.14.00.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 00:12:08 -0700 (PDT)
Date: Tue, 14 Jul 2026 10:12:02 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alfie Varghese <alfievarghese22@gmail.com>
Cc: sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	bingbu.cao@intel.com, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: ipu7: add NULL checks before
 ipu7_mmu_cleanup() in remove
Message-ID: <alXhQv_8v7ndQwWx@stanley.mountain>
References: <20260713172127.615-1-alfievarghese22@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713172127.615-1-alfievarghese22@gmail.com>

On Mon, Jul 13, 2026 at 10:51:27PM +0530, Alfie Varghese wrote:
> ipu7_pci_remove() calls ipu7_mmu_cleanup() on isp->isys->mmu and
> isp->psys->mmu without checking whether isys or psys are valid
> pointers. If ipu7_pci_probe() partially failed and left isys or psys
> as NULL or an error pointer, the remove path will dereference a bad
> pointer and crash the kernel.
> 
> The probe error cleanup path already guards these calls correctly with
> IS_ERR_OR_NULL() checks. Apply the same guards in ipu7_pci_remove().
> 
> Signed-off-by: Alfie Varghese <alfievarghese22@gmail.com>
> ---
>  drivers/staging/media/ipu7/ipu7.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/ipu7/ipu7.c b/drivers/staging/media/ipu7/ipu7.c
> index 310e3f24e571..41436f22c684 100644
> --- a/drivers/staging/media/ipu7/ipu7.c
> +++ b/drivers/staging/media/ipu7/ipu7.c
> @@ -2637,8 +2637,10 @@ static void ipu7_pci_remove(struct pci_dev *pdev)
>  	if (!IS_ERR_OR_NULL(isp->fw_code_region))
>  		vfree(isp->fw_code_region);
>  
> -	ipu7_mmu_cleanup(isp->isys->mmu);
> -	ipu7_mmu_cleanup(isp->psys->mmu);
> +	if (!IS_ERR_OR_NULL(isp->isys) && !IS_ERR_OR_NULL(isp->isys->mmu))
> +		ipu7_mmu_cleanup(isp->isys->mmu);
> +	if (!IS_ERR_OR_NULL(isp->psys) && !IS_ERR_OR_NULL(isp->psys->mmu))
> +		ipu7_mmu_cleanup(isp->psys->mmu);

The original code here is fine.  It is the probe() function which is
is wrong.  See my blog on how to fix the probe() function.

https://staticthinking.wordpress.com/2022/04/28/free-the-last-thing-style/

regards,
dan carpenter

