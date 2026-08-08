Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C561AA1D5
	for <linux-staging@lists.linux.dev>; Sat,  8 Aug 2026 07:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786174041; cv=none; b=mM7mieNkFPSiNCH5xX/SvoX4gUO4Gt47sSMJltXnrOtihERbxuvVBskX1TKHCCrb7JcSxy4QjpNLPDq/TLsAmTFq8JXEV4I3ms0EAvobTQ5woRO+xIG5uINZnPrOfYNQoB0F0wQSwVhnhNMjNGvlwDaRMCl98aiE9CJ8zWYvkLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786174041; c=relaxed/simple;
	bh=zdSK4EW5EmRd+OYxCmA77w4dpjyy5DmMDhwRHmrdTDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L/esPPr633eLt9Wr63PSbAJjxXl5lQf4tORt/4TvQQBxZB0fBSS0AQxM2UXXJJ/MQH5EBdboJADgTaQMICN2kCIBx3DXAlggXu7NlSvLhz67oJ+9H5AbPwL1P8bu1PeskvEhhetO9S3WL5P6Wr8MIMYPBvjmXhd4j3uxFheMhrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CFuNEQZl; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CFuNEQZl"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-9034b6b7674so1578486d6.0
        for <linux-staging@lists.linux.dev>; Sat, 08 Aug 2026 00:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786174038; x=1786778838; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n6rNVAqrX9u/X9NY6P7dVHJ0E+jG06YmD37/7Pmp6bA=;
        b=CFuNEQZlHm/xk2DpH3TnDnspWMEhQWFDWlNczGaiSKs9l+cQiOkDYtrDniPCG+oOfq
         LDACBXWuKkxyeg37Aa8eFAnqTufC5JGO2XM+H6c1ZrZ5+H279XhcogvhVXSKMVgkUDZ/
         OnngC5NTWkP7FU2YciwoGxCe3TNb4eLYAJTKDgW1s2mKmTMxnKbl8Epllc4dndQTNHSb
         liYQJIlHkKlFw0s3kePZQcTS5hsSxfzZ7IemoUgDLaHGYEpt/lDI1cQZb4rPJx6aomqj
         YCBpHlJS5hDgxA1N9EtTozNnnKy69mHX2fVIuzrz4E0kbLX553xdr5pY4IT9wjbrN6Jl
         4fqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786174038; x=1786778838;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n6rNVAqrX9u/X9NY6P7dVHJ0E+jG06YmD37/7Pmp6bA=;
        b=Z3IZqzd5Jat1yo5vWMln2iBJ7qrkV6LsFRGA7fuWHZTeiBodKN2Jd7vL4CiO379qMT
         uHlUZ2wr72tC4mQ52sc777G8f2S6Ibv+MOy/CbNu8G9PHdCmWJA50G71Q+KbD/8sUnId
         y+1mjMMI5m+TbBi2+phY+1T5n+rIZFBcqE2Gr4syOUK3QF06Kmd7HefRtA2PMMRrgJo4
         sU9qN2Wt7+suORuB3HkBVHqHLROO//rG23lfCuPBSSjVTIGch0oONJRFSCflWe83J50D
         aqnwggD08okZBNm9Ac6EW84zw4GwQBJoZsFPX8aBv0vN6dh1bzosVv4qNPN7/hAUXAFq
         kifA==
X-Forwarded-Encrypted: i=1; AHgh+RpP/OQwvj8xFXx4VndrKFrW99kf1+Nx2gQDyfJKDElP5BmdjJiTNFtt4O630HHMzShU4Pn36+lJBkm5gWLt@lists.linux.dev
X-Gm-Message-State: AOJu0YwsAeRFQyruoFTsKaddCgNbI1g5gUA645SGGFoIUZQTWxAv9JtL
	anWeRFi1hSxfx6Wn4x982HkjPfZnhOnpyCuCa3BDE7kpBJ3FKPI8Yzl3
X-Gm-Gg: AR+sD12rRAPpQeS5CRwyqqpbyVNDhGWhX3Zk8EG6ETsUSNg5ld6Bg9RvzbH9ks8Bzcp
	9pC71m9Rgx5e6+nBl73eMwiSI6U2rwa/E/iKRSg3HLGZj86pBvdAJdNQs/UbyK3XDHt80/ylThC
	6phfPeBk6HYRUzHKAx3KoFCg3YynSBYJ9pcCx7fYUVXB9EtHS2ac1DWWm+3RKCmPfq56Cf6bj2J
	r4AlXA7rOuuvspXUFH+aFjsH2UeQ2Lgkhp0UELii4m0Nd/JxOIaP5Bu8bn6ZETSgxCJSy6p4/wb
	YJEr4Y1LDpaUkXjMSIrhUVYryJzUjUlIVpl0A25LTqwbeU9bZB6g0HAwxif5LWQFBKgYyxtQ0R4
	PJ1pY1FyWW+rE6I1S1TzG6HY6heRkdqEV/XuBLuqieSYDKadLZ4RCssoXAddPJ+B1pKjmGbxf6C
	OariDQsAR5BgeLG2llL0kgqR6zJscY5mC3dfSvhRA6Jdtp6zmxjZHcrUHPEM0YOJtD
X-Received: by 2002:ac8:58ce:0:b0:528:162e:29d3 with SMTP id d75a77b69052e-52ce614ba88mr282876971cf.32.1786174038642;
        Sat, 08 Aug 2026 00:27:18 -0700 (PDT)
Received: from localhost ([172.216.11.43])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52d160da94dsm28281311cf.0.2026.08.08.00.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 00:27:17 -0700 (PDT)
Date: Sat, 8 Aug 2026 10:27:09 +0300
From: Dan Carpenter <error27@gmail.com>
To: Noah Techoueyres <noahtechoueyres@gmail.com>
Cc: pure.logic@nexus-software.ie, johan@kernel.org, elder@kernel.org,
	gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: greybus: loopback: Add comment for mutex
 definition
Message-ID: <anbaTWYlNVYvOU6x@stanley.mountain>
References: <20260803020609.693-1-noahtechoueyres@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803020609.693-1-noahtechoueyres@gmail.com>

On Sun, Aug 02, 2026 at 10:06:09PM -0400, Noah Techoueyres wrote:
> Add a comment to the mutex field explaining what it protects,
> as required by kernel coding style for lock definitions.
> 
> Signed-off-by: Noah Techoueyres <noahtechoueyres@gmail.com>
> ---
>  drivers/staging/greybus/loopback.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> index c33b8aa5871c..f94077a9d64b 100644
> --- a/drivers/staging/greybus/loopback.c
> +++ b/drivers/staging/greybus/loopback.c
> @@ -61,7 +61,7 @@ struct gb_loopback {
>  
>  	struct dentry *file;
>  	struct kfifo kfifo_lat;
> -	struct mutex mutex;
> +	struct mutex mutex; /* Protects sysfs attributes */

This comment is wrong.

regards,
dan carpenter

>  	struct task_struct *task;
>  	struct device *dev;
>  	wait_queue_head_t wq;
> -- 
> 2.43.0
> 
