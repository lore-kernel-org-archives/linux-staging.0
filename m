Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DA025C83E
	for <linux-staging@lists.linux.dev>; Mon, 28 Apr 2025 17:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745860013; cv=none; b=oZJ8d19Rtpep2VHTk78gNYEsRrfUtrs1gS2Mb6AAm3lSfRVYjFPxJ0pc1YyKaK0PiBbU47CZ6lUYbROzYxiuRHsbAvLn2n0o84vnuqbWNhTYVtfsh2rbvUEB8P0n4m3EFeiTrK1nSPRBvf26eqYsckDzQhSmuYGUghtBAJgwh/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745860013; c=relaxed/simple;
	bh=jfzsM62LzU24IAdPi6RiSZnE7tBTNT1DWjrm016n3/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KYjecQkfaP9yO4s2pMher9WV8mFMJUY0BpixSRVXC0PTFBkvEcpLDEFuS8mWLyGdNCRN7A06iipJGVI+jpelxRRHJE/PbX14069w7PYBGYanAJaoXzO618VD0xunTOy/Pradt9L0GYdsLnwp8JUt8qdAnU0r9/+fmxSPiUeJBdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BJrwZIx8; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BJrwZIx8"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so26315065e9.2
        for <linux-staging@lists.linux.dev>; Mon, 28 Apr 2025 10:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745860009; x=1746464809; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ttAPR2nnzr3O+nZdkkXAqM5OCqtTBjn7C3XdJ2LYctM=;
        b=BJrwZIx8ihVc5h7nRyCDioSvEtnlud9QuMk03PDFn29NOIuZWUoRk/DpLfemOBhmeQ
         UmzS6ldH1vX9MET5+tAqeamI+FGaFuOVBKVm6sbWHlM7mdwqDHaQX2rthZ0WVd8KwG2Y
         fTzinqkgYQ6c9f5Y8IwRNen509xPf1zR9ngVMZt18ZRjhFLrDliWW40K0FRMKo011zYc
         3pDbig86AnXA75VUdMluWNirL/oAKdWzsXtQNbefo0zo+Ei9nY6eel4j+tAAkBJreSNe
         HUGyN3MRYTAuTzIwkVymM91roVekT0wHiyyUnUtMTLpR7phqubyFz06RLvXVIybSstPe
         biKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745860009; x=1746464809;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ttAPR2nnzr3O+nZdkkXAqM5OCqtTBjn7C3XdJ2LYctM=;
        b=U7gKsCvvBcWcN9veDgGDzZkkKUo5kPdcltOUE80788mkwASaxFKUuXoHA7H4rRRabR
         VA7cfOTKKXhhezVX/KWbTmcZG8Jcg0C/BEemsGyZirEYW3yCuPe6eyPadt7bkI7y6m9H
         AzADdJGtZXwlp1xebizfvzKIMxJdkyzY4HSA+dR/LWTWj8HoaouMLDfRHAL5T9cMJMyX
         zw8eI4kbQc2EoBRmrsBAtGWfU9hGRAy3PeoIxaowdmMRdz9RacVofBZceGoMUNOtltHu
         lnVQF9OYdM7WYfHFuePr1uhw3RoZtrVcjEGbaNwYKVlpPRnZ9tMDoO3+aEODsJizPEFC
         kddQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWagJg1WChaQNm1iKADIb2fVPyLgLEmIWp3BLMFPBXP0KTzAMmxHvtR7p8lW1ZPAUXWzX4UWVB8kzLC7XS@lists.linux.dev
X-Gm-Message-State: AOJu0Ywx6/IkPe2RIFxO5Toi0bauL/SE+mu/6v2pxymi4sfDORnjvgUB
	jjmHKZtPGSWKG0d9HSh5Qb47qyZw90iS0NmzMgA2s+N6KgN/ZfSkPS7egE7F/Vo=
X-Gm-Gg: ASbGncsuq+YzTl1dRMl0txgKKnFTqav5uMRbGWjvZ1T2Wl55ssCSQNIW5Vv2XxVIPtu
	UEuKLJvWX8dnOjgcVQB+llIg/PklLUmqVTusAnS92fDmQwl+itPTurJCjHW6/LQt/af3tPIqltu
	RKA1XBEISf3WFPVUfrAz8LFGO+PUv8iMBANjtka3KhxyNebMAYTndqqQq97A1qFABdZEb3MBI5o
	zr3jmRfmtVl7jSn6ETdbGmOby38aw63hIp0qbjW1U4TupBYJLvnBW/oejjodR7mtx2FweMpSOsI
	NeqCZ6grOsj1Gpc09e7/Fwn0zy6hGeqkc1y5GGIAYXhuXA==
X-Google-Smtp-Source: AGHT+IFFtsUvOru4VFXTbio9Ytb7+BeHGQ/bBHpgQLhDKt8Mul1sfm/jNtuzIXtCpsCi5L7CbjPfDA==
X-Received: by 2002:a05:600c:1d97:b0:440:67f8:7589 with SMTP id 5b1f17b1804b1-440a66143f0mr133682935e9.16.1745860009202;
        Mon, 28 Apr 2025 10:06:49 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4409d2dfc2fsm160453095e9.33.2025.04.28.10.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 10:06:48 -0700 (PDT)
Date: Mon, 28 Apr 2025 20:06:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sridhar Arra <sridhar.arra@yahoo.com>
Cc: vireshk@kernel.org, johan@kernel.org, elder@kernel.org,
	gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] [PATCH v2 1/2] staging: greybus: fw-management:
 Add detailed mutex comment
Message-ID: <01975294-1073-4263-a201-0f68781fbb6a@stanley.mountain>
References: <20250428160837.664000-1-sridhar.arra.ref@yahoo.com>
 <20250428160837.664000-1-sridhar.arra@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428160837.664000-1-sridhar.arra@yahoo.com>

On Mon, Apr 28, 2025 at 09:38:36PM +0530, Sridhar Arra wrote:
> Added a detailed comment explaining the role of the mutex
> in serializing firmware management ioctl() operations.
> The mutex prevents concurrent access to firmware operations
> and protects the 'disabled' state flag during disconnection.
> 
> Signed-off-by: Sridhar Arra <sridhar.arra@yahoo.com>
> ---
>  drivers/staging/greybus/fw-management.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/staging/greybus/fw-management.c b/drivers/staging/greybus/fw-management.c
> index a47385175582..56725b711a17 100644
> --- a/drivers/staging/greybus/fw-management.c
> +++ b/drivers/staging/greybus/fw-management.c
> @@ -28,6 +28,19 @@ struct fw_mgmt {
>  
>  	/* Common id-map for interface and backend firmware requests */
>  	struct ida		id_map;
> +	/*
> +	 * Mutex to serialize firmware management ioctl() operations and
> +	 * protect against concurrent access.

"serialize" and "protect against concurrent access" are the same thing.

> +	 *
> +	 * Ensures that user-space cannot perform multiple firmware
> +	 * operations in parallel (e.g., updating interface firmware)

"Ensures that user-space cannot perform multiple firmware operations in
parallel" also is the same as serializing.

What does "updating interface firmware" mean in this context?  It's
not really even true...  There are other places poking at the firmware
that don't take the lock (so this lock on it's own doesn't ensure that).

> +	 * for the same Interface, avoiding race conditions and reducing
> +	 * code complexity.

"avoiding race conditions" also means serialize.  It doesn't "reduce
code complexity".

> +	 *
> +	 * Also protects the 'disabled' state flag, preventing new
> +	 * operations from starting when the firmware management
> +	 * connection is being disconnected.

Yep.  That's true.

I guess (from reading the code without much background) that we can
use the fw_mgmt_ioctl() to set some configuration options until
the FW_MGMT_IOC_MODE_SWITCH ioctl is called.  So this lock enforces
those rules.  You can only call fw_mgmt_ioctl() one at time until
either FW_MGMT_IOC_MODE_SWITCH is done or we disconnect, which
ever is first.

regards,
dan carpenter

