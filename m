Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC186A8DE
	for <linux-staging@lists.linux.dev>; Sun, 28 Apr 2024 13:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714312797; cv=none; b=c9Zauy6LBA2RJDjLPModc8AaHvFxHqY9AkBmsPPbDXp1iTUyqYBztP7xRLkveWvHmaoATOi3gCvF82R2byxRBdEJG9mST0L+yLjyzJ8/iWr4sPvhEHxJkIDHJ76eI5O/bm/1opHKRg0OvCPgwqIwMZCejPsjC/1D1RDlgggKQyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714312797; c=relaxed/simple;
	bh=ifpvloXdEiAtjgG4eP4E91YicSxPPCb+dKd9T99W3/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X/PcdYaMRFvs8kIBL5AOZgArAOJDMp/Am3G7vV7Y5Hv0LP2/VeCrAjNcovd8i2WZWUsw6CGx64KAjaHTMk5XKS/1+JzZO7ojli4W34RUW1rXarrSl73jLN3RghPEffcm5fA/cmiCbTNoo1x4zSHjD5gc2Q/UAE0+pSxe8tvQb/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NhDEqaoa; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NhDEqaoa"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-34cc606b1b1so751918f8f.3
        for <linux-staging@lists.linux.dev>; Sun, 28 Apr 2024 06:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714312793; x=1714917593; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZugnSPb4SAW1kpa7qzNAd6wZf57ZPRMniC6Lpv5AqXA=;
        b=NhDEqaoabBUWlZfJAgXcwafhy3Y6mTxgQWihsXsQ81C13t5crhx5bJjbvm3yttyOb4
         mtnvDJ9/QKK927+HkoclwKToRLqwdhStYop6zqiKjfraf7ErvyUr6b2w9lNdqBv+z522
         6XwZbnbNfQs/krZDySxBVJltYATQ/4icGOzo9AyrnUb3c0AT7ZqYPTR9iOej77I/0g/n
         AKdhm6MJ+GBjnO5qoaXteOmrlyTa2FbHWlhh8DePhY2sM36R/0DKlTVpOllDaKRVj/mq
         9YPZNRNYTsu4yTZ549D5jvsmSWs+aBb1LGCUG0dWdTvq4VCwILZSuTffqt2FSzud2K3o
         1p+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714312793; x=1714917593;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZugnSPb4SAW1kpa7qzNAd6wZf57ZPRMniC6Lpv5AqXA=;
        b=lMA/EeC5pUadIJmm2Itij5l2aek81H6x//XpkYu2jjYEYYbZU6W5rJtbWsUyVILfGl
         T2I2AC0JWlhIsAhtrzwkjuZ6N0pOZKtGu+/M1RDwYjiLZFkLMJjUT5nJsuivZOjj7BwF
         rSEAO8xoagRlbY5+9JdAwFyiKFr1j8kHoL1DeGhJ8Xjjh4sDe04dluWLObcmRlUCuRCZ
         usKYZsC4KfWh9iExNMLEVg2o2qFFJ7y1YXGuMN34/TTWlkahosmBvPNxL8pwfpbQ8FSR
         CPytWtYHMStHEXijrQ++GhKyqWFF9gY46gc4094mV8bx6B7u2zj596REIr6uqHsJniyi
         qrsg==
X-Gm-Message-State: AOJu0Yyc6XPxmbCRzi6EtXA/jzNRrbxRO1KKfM9PbJL7dKu13R4OLqKc
	+R9fn5lcI+z863SISFnpVI7hHl2y/MnepYT0Rh9XJhT0E+6tojpk4pSV9lqYvwA=
X-Google-Smtp-Source: AGHT+IGsE/EPW99tYDRYqKaO70aNIu/69G93grzhRIwvisgUrFWC4P5pO98zUtP9vShBN2ocCHTsBQ==
X-Received: by 2002:a5d:6306:0:b0:34c:7410:d6c8 with SMTP id i6-20020a5d6306000000b0034c7410d6c8mr5695266wru.49.1714312792901;
        Sun, 28 Apr 2024 06:59:52 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id f7-20020a170906c08700b00a51a80028e8sm12807165ejz.65.2024.04.28.06.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 06:59:52 -0700 (PDT)
Date: Sun, 28 Apr 2024 16:59:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: pipishuo <1289151713@qq.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: axis-fifo: fixes alignment should match open
 parenthesis
Message-ID: <e028e6a0-be04-4e1a-8932-c2fdcd7b7185@moroto.mountain>
References: <tencent_58C9EBCB7FA35A38EAD077080863D46A5D06@qq.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_58C9EBCB7FA35A38EAD077080863D46A5D06@qq.com>

On Sun, Apr 28, 2024 at 08:04:34PM +0800, pipishuo wrote:
> This patch fixes the checks reported by checkpatch.pl
> for alignment should match open parenthesis
> 
> Signed-off-by: pipishuo <1289151713@qq.com>

This is your legal name that you use to sign legal documents?  Just one
word, all lower case?

> ---
>  drivers/staging/axis-fifo/axis-fifo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
> index c51818c56dd2..04f0e5b45a8b 100644
> --- a/drivers/staging/axis-fifo/axis-fifo.c
> +++ b/drivers/staging/axis-fifo/axis-fifo.c
> @@ -376,7 +376,7 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
>  		 */
>  		mutex_lock(&fifo->read_lock);
>  		ret = wait_event_interruptible_timeout(fifo->read_queue,
> -			ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
> +						       ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
>  			read_timeout);

Checkpatch is just a tool.  It's supposed to make the code more
readable.  Sometimes it makes mistakes and makes the code worse.

If it tells you to do something crazy then just ignore it.

regards,
dan carpenter


