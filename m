Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B445AB8D
	for <linux-staging@lists.linux.dev>; Tue, 28 Nov 2023 14:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GR6nrDmQ"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-332e3ad436cso3504155f8f.3
        for <linux-staging@lists.linux.dev>; Tue, 28 Nov 2023 06:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701182299; x=1701787099; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FBxCcIpOBNw2rVRQeI3GzaJA3+Yb6g+9ZiNBDkpz2v8=;
        b=GR6nrDmQLi+niQIjFGwqxIp0FGQ1C9l5Ep0usXzyEhfPGl560yzDP4k7hKjVh19wnt
         1GcLIOHHfRYbhW7fcj1fGrBGox05ZZgGPfHy3ZVGB1ozIzsO+avROvx17nO0VLnjM88t
         xONdhTtBu8/8lIocaurgE++0MulyOG+ZMA+xCMjbp5GWekOWl+Ml6fm4UIB3NISQgvFs
         5p5IKZIhVCX/5jh37z4/73qmkeb9OpZgpfrEy5RGPwGmwXn2FzB+sz1c5WepNxOhRsre
         wNaCFTgxYNeSEKjGk1CY9vsnqHu2vWVQmuA+YpBaC7zqfKfIurL94LezPuLpF1DuToOX
         idPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701182299; x=1701787099;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FBxCcIpOBNw2rVRQeI3GzaJA3+Yb6g+9ZiNBDkpz2v8=;
        b=akUWXyrzuctOV+NJcJZAyo5klNxKdridyk5Jd97N3YYcx8Sqh+77o4EhdHP1OXUEqN
         hnisGc/5Bn269VQXb5neuaxE1F1582ND7EzB812P8+wl+/vlFES/RHxMRSFpTOhtJIWI
         MvVo3DNp9L+g0DWZd24WSlr0Q3NpT0nRRGXDVBs04DISsk7cSyZ1doBTl3AAcDjnsKb0
         V9el6U6aFqJoV6ws7tAgD9uLeWHKKJHul4TJ+n/V+VbXvpHNs5UieZkrFekJzaELDxy2
         3JGbQZe7nSBttqHGeIoHRsv6wG+6xUodtVgZlW7GcAu/2tAXE+6bDc5//HjHLug0XdUa
         z1qA==
X-Gm-Message-State: AOJu0YyMI39sEli1TVXGus4o/x90N1kq1asSCcmEL1+KtftnpTuf3M7D
	KOejz5oRsNMFDfb+O3KKZz3a5TojXbhTLs1KRR2qw3ck
X-Google-Smtp-Source: AGHT+IF9bAcLKlN7/AdST/QuvsSb3Y3zS3/xlnTBjpa/nQ2qo7yQfKSPyQPJmPB0wzINEf4MurRLtQ==
X-Received: by 2002:a5d:4b88:0:b0:32f:7f6c:72a6 with SMTP id b8-20020a5d4b88000000b0032f7f6c72a6mr10867144wrt.16.1701182299389;
        Tue, 28 Nov 2023 06:38:19 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id g10-20020a5d64ea000000b003330f9287a8sm1813034wri.51.2023.11.28.06.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 06:38:19 -0800 (PST)
Date: Tue, 28 Nov 2023 17:38:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gary Rookard <garyrookard@fastmail.org>
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] staging: rtl8192e: renamed variable nMcsRate
Message-ID: <eda46e85-7b79-4e47-8e53-82ddd52172d0@suswa.mountain>
References: <20231128142027.15617-1-garyrookard@fastmail.org>
 <20231128142027.15617-2-garyrookard@fastmail.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128142027.15617-2-garyrookard@fastmail.org>

On Tue, Nov 28, 2023 at 09:20:25AM -0500, Gary Rookard wrote:
> v2: Renamed from CamelCase to Snake case the variable nMcsRate, and
> additionally removed the Hungarian notation of (n) that [v1] did not.
> nMcsRate -> mcs_rate
> 
> Linux kernel coding style (cleanup), checkpatch Avoid CamelCase.
> Driver/module rtl8192e compiles.
> 
> Signed-off-by: Gary Rookard <garyrookard@fastmail.org>
> ---
> v2: Removes Hungarian notation.
> v1: Renames from CamelCase only, Hungarian notation unremoved.
> 
>  drivers/staging/rtl8192e/rtl819x_HTProc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> index 00273d709f3c..4ed72936eb4a 100644
> --- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
> +++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> @@ -103,7 +103,7 @@ void ht_update_default_setting(struct rtllib_device *ieee)
>  	ht_info->rx_reorder_pending_time = 30;
>  }
>  
> -static u16 ht_mcs_to_data_rate(struct rtllib_device *ieee, u8 nMcsRate)
> +static u16 ht_mcs_to_data_rate(struct rtllib_device *ieee, u8 mcs_rate)

In the caller, this variable is called mcsRate, which presumably
checkpatch also complains about.  Why not rename them both to the same
thing?

It's unclear what value adding the "mcs_" prefix has, but I guess it's
nice to have a consistent variable name to grep for.

regards,
dan carpenter

