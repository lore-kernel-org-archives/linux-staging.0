Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A64A41
	for <linux-staging@lists.linux.dev>; Wed, 11 Oct 2023 17:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZW/D+T/o"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4054496bde3so1454615e9.1
        for <linux-staging@lists.linux.dev>; Wed, 11 Oct 2023 10:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697045424; x=1697650224; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=me7Hf3Bi0S2OqFfc7MfvwerAXxLHdIkSHVDAhrcUZMQ=;
        b=ZW/D+T/oYtDMIDK3Jt8TyAOJYG3obAMyxJwUaA48qvOzzJ/npLcruESbkLRVgMYdxP
         bWjp+HojlaW6GduAFPXfkYxExWa9W8/2V//X5P77yjwNR48/ibQC1u6VTF7oshVQ9IEg
         VO6m1HiJxcWvTd8CMCHktLeTF4N6fatyDvk8QOfiHdjAjUnP2ieQEz3Z4195XB8SLja5
         4jr8rLsH0o8fuL0DX+o1NtWbDCuE6P3CXVngt2pGCyYGWePB+AzRKB9WMwIS3Kbzu9TH
         ewB2IKDQOPWSkgdvexWUBO7NTC6Y6f+QYc/0a9wPkhb4pqVs0aCNURa6ILQ8rDiT41dj
         jO9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697045424; x=1697650224;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=me7Hf3Bi0S2OqFfc7MfvwerAXxLHdIkSHVDAhrcUZMQ=;
        b=e3cqws4i9xgEcgHNMm4TtfKZ86HI8W93m65l5ZjGaJEAy0AX+T4ewx1e1my4LMrZu2
         W5BeGzmGY6TKUsMOrFRtZG5TkFJF1M21sG9cx8WyQW940ueh2oLUZCxkMo8bH0YB7pS2
         0Gn09TA7LlranxwyeFu8hxyKhYBPdk0AFpOJkPPvKGyVkLiimiC7kIfFnqx7uB/PGVRY
         zhqiJBWZMtJ6WCzYDtUQmajEXY0TfB24lCiIKsKWftxRJHMNUOmjYJyFrendYoUuz4l+
         ZDXYFMcYd1l0PsIqnjEBMAcKt3t0IZXP2LLjppRWzw4SRsrMmyXjKvNTzryxRohiYQLw
         0yhw==
X-Gm-Message-State: AOJu0YzM3Pp4Ox+sj6cwQvAmHw4T/Mh3ZgtHE5V6Fr7YKUrztBnAwZM1
	8N8OU1bUkpK+gcWhL+ePLIRkvA==
X-Google-Smtp-Source: AGHT+IH25Gk9gu7bi2ki+3ZgFXad+L/iUZXUkkYb4XCbhICFDVqbOpLWWS83+XQeZrlIDcbGWx0KYg==
X-Received: by 2002:a7b:c40a:0:b0:401:23fc:1f92 with SMTP id k10-20020a7bc40a000000b0040123fc1f92mr19865951wmi.25.1697045424518;
        Wed, 11 Oct 2023 10:30:24 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n22-20020a7bcbd6000000b004060f0a0fdbsm19775974wmi.41.2023.10.11.10.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 10:30:24 -0700 (PDT)
Date: Wed, 11 Oct 2023 20:30:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: drosdeck <edson.drosdeck@gmail.com>
Cc: gregkh@linuxfoundation.org, hdegoede@redhat.com,
	Larry.Finger@lwfinger.net, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs:Fix coding style errors and warning
Message-ID: <03446a07-ef54-49c3-a7a2-644715603891@kadam.mountain>
References: <20231011164232.28866-1-edson.drosdeck@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231011164232.28866-1-edson.drosdeck@gmail.com>

You need to fix your From: header.

On Wed, Oct 11, 2023 at 01:42:32PM -0300, drosdeck wrote:
> Warning found by checkpatch.pl script. Fixes warning replacing printk to
> pr_crit and fixes conding style.
> 
> Signed-off-by: Edson Juliano Drosdeck <edson.drosdeck@gmail.com>
> ---
>  drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 21 +++++++++-----------
>  1 file changed, 9 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> index 490431484524..e178a6881e0c 100644
> --- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> +++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> @@ -48,7 +48,6 @@ static void sd_sync_int_hdl(struct sdio_func *func)
>  {
>  	struct dvobj_priv *psdpriv;
>  
> -
>  	psdpriv = sdio_get_drvdata(func);
>  
>  	if (!psdpriv->if1)
> @@ -73,7 +72,7 @@ static int sdio_alloc_irq(struct dvobj_priv *dvobj)
>  	err = sdio_claim_irq(func, &sd_sync_int_hdl);
>  	if (err) {
>  		dvobj->drv_dbg.dbg_sdio_alloc_irq_error_cnt++;
> -		printk(KERN_CRIT "%s: sdio_claim_irq FAIL(%d)!\n", __func__, err);
> +		pr_crit("%s: sdio_claim_irq FAIL(%d)!\n", __func__, err);

Use dev_crit() instead.

Otherwise the rest of the changes are fine, but you'll need to break
the patch up into multiple patches.

regards,
dan carpenter

