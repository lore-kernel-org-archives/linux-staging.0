Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A479C2253EB
	for <linux-staging@lists.linux.dev>; Thu,  5 Mar 2026 05:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772689897; cv=none; b=i5RFTfOwVdZEMOCX4q2T0bOK/veAvbp622ToWd12HuJe/DOoGwl8r0OTe0eT1v7bZAAVyRRC5AISdFXb8/B8FTtlTcDaIYNe9l/Gct0FbzBdmBaR+iayt+IhbAr0tnRXFO3IG7y1gW9eEtOwS/lwDxTwPbuRsoWREzSCZyFM+KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772689897; c=relaxed/simple;
	bh=XpT+4mClh9KDy3KmIhOdA2p+xis/Hm/w4vJupFwmYhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TVJVHBY6NcLEcjQoErchP9TOFkB7pkIPCIDOA5vRooXn6yZ4eTOQLnO3a043YM2b6S+JocszKXG42pvEzg+J4M65bMnmCbCfd1/sNIq3I9wZWE5WeZnwzkq1taJ0D4GaH5znIgLFs36z04db4BlU5nBuLMlIHSkEgyrOLUNPmO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xjLfnruW; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xjLfnruW"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439b9cf8cb5so3562498f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 21:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772689894; x=1773294694; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xC3MPuwXTtW5386fVJjonKTkR2NFkirsNB+NgUfOWiw=;
        b=xjLfnruWJfmGPlJfOkVu6ZJFaz0BP+cWv/JfFxecgei+xYLDG9IsIAP4SonkdFgUNR
         ol2/oHmnrfY0TLKKRSVwqgAp2VVz0DJzdZ3jU3KcqFEiOkqSzhxc4LpqH12TWR6MXJDC
         y+qNH0MD6XgcjiLCDJpVsKPsvEavHr9V4Y+bASVhGwqAAaXofp/xbxj7FOGW904cZ4di
         PouoiQ2liBAN/s4yIKBxIS8IJp2ANUpoIj1vPOM/skLdKK+83w9Yc1X5fGj/IA0taeCO
         CJXhkrcx7Fz9YqwnTfQdIRh2GwGch2ad4fQdqUQ/PAEb+bcH2ODheCRe8H6IEExprK5e
         zY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772689894; x=1773294694;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xC3MPuwXTtW5386fVJjonKTkR2NFkirsNB+NgUfOWiw=;
        b=XtaAp0oTsSwL8Oy8X1CgXWEDr6UdUqM/BJSDryGn2m8eX8AY2chFCVxnsgz/LxZW0c
         wAK0OKB1VPfZL2k1w6zNpcQM/UE0G7yNAmngtXZWmaopx5flyXQwWVadYSQV0zErQmgK
         xpn2Q8ILkxHPj6ULyvt31rJ+MpKT00q9ufIKMNfl1l6PEOGCiqCE69S8y3pJnQS/crhb
         THtOlBAv5eYiFA5jVJw942GpRpShW+IRQEl6KmU/PpTQNJkBML8WwJ4F+0z1emfuq693
         E7NoePuYYgLA67P0u8EFZ2tchKlyVa002vynQAdF0wcMBpZsUqFpAx2npX7q/VzMgeeL
         3N9Q==
X-Forwarded-Encrypted: i=1; AJvYcCW6JHmzw1OkX+THWRNeHbEpvGn9eB8tsiKLuHYER+0f528D7JVkmsa/4Jp1ck2QeaeIu1b5+RHnhpcOiOz7@lists.linux.dev
X-Gm-Message-State: AOJu0YzB06nMYj7XBGZrwoeYzg1YztHA6ENVbnuXNt9/pUGSs2bj1AAh
	hjM7Mb31/01JyW326/dgJtWKL7b6s+0LGRNJ08rNmSctp7EoU+T2PzyV3Cg2Ce43B1o=
X-Gm-Gg: ATEYQzya/sWhiyvY3qog25/oQEl0JRFU1vqleLq7xlzWXvcf8enydgFd7zE89ZoUYee
	jIrfF4KTbLflslLebbtSVd2cRGNSCIxVoG/u83wLqQiDY9t1PctwJuJwaaOQCj7dKXBD4TEk+BU
	HI7bpe2GMVHVi02oMQh0AFzyk2JNF1wmoU3AyyCE3Q5OnY5KBiLZyjPqNpIS9w+66c7vvQBN4YV
	of8/gmJfelkH0TOx9DvdSZaC4iPVFnONeP/i5ns2Vzpa3K53Do8GSda68GfVdP+FtNYy6iJHYg+
	TfG/nmTrneZ5VGbjNjP0qvAIj1WdAqBnii1zsjjR7l6lZLrxgbs7CsTW0u/R4mjMtiAP53AgI84
	tZH9aLAY+WJPhiTF7uYRhhRVw+3qMwH9+aAqoKON8QeJggNBzR9ezrNtB3CeMRi7nYRkWrC6rIr
	3Z274IBq2lUklyO6LDLN16+OQjkv46
X-Received: by 2002:a5d:5f94:0:b0:439:beee:43be with SMTP id ffacd0b85a97d-439c7fadf94mr8866940f8f.24.1772689893946;
        Wed, 04 Mar 2026 21:51:33 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c60f764sm50610655f8f.3.2026.03.04.21.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 21:51:33 -0800 (PST)
Date: Thu, 5 Mar 2026 08:51:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] staging: rtl8723bs: replace alloc+memcpy with kmemdup
Message-ID: <aakZ4s2sPtROzmpr@stanley.mountain>
References: <20260304130706.37347-1-hossu.alexandru@gmail.com>
 <20260305010917.40320-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305010917.40320-1-hossu.alexandru@gmail.com>

On Thu, Mar 05, 2026 at 02:09:17AM +0100, Alexandru Hossu wrote:
> Replace open-coded alloc+memcpy patterns with kmemdup().
> 
> This simplifies the code and avoids manual size/copy handling.
> 
> Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
> ---
> v5:
>   - Move version history below the --- line (per submitting-patches).
> 
> v4:
>   - Drop unrelated DT binding changes from earlier attempts.
>   - Include both rtl8723bs changes in one staging-only patch.
>   - Wrap long line reported by checkpatch.
> 
>  drivers/staging/rtl8723bs/hal/sdio_ops.c          | 3 +--
>  drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 3 +--
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
> index c9cb20c61..6e03d3d8a 100644
> --- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
> +++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
> @@ -583,11 +583,10 @@ s32 sdio_local_write(
>  	)
>  		return sd_cmd52_write(intfhdl, addr, cnt, buf);
>  
> -	tmpbuf = kmalloc(cnt, GFP_ATOMIC);
> +	tmpbuf = kmemdup(buf, cnt, GFP_ATOMIC);
>  	if (!tmpbuf)
>  		return -ENOMEM;
>  
> -	memcpy(tmpbuf, buf, cnt);
>  

Delete the extra blank line.  Also this doesn't apply to linux-next
but I haven't investigated further.

>  	err = sd_write(intfhdl, addr, cnt, tmpbuf);
>  
> diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> index 7cb0c6f22..0ae7b6389 100644
> --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> @@ -1430,13 +1430,12 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
>  		goto exit;
>  	}
>  
> -	buf = kzalloc(ielen, GFP_KERNEL);
> +	buf = kmemdup(pie, ielen, GFP_KERNEL);
>  	if (!buf) {
>  		ret =  -ENOMEM;
>  		goto exit;
>  	}
>  
> -	memcpy(buf, pie, ielen);
>  

Extra blank line.

regards,
dan carpenter

>  	if (ielen < RSN_HEADER_LEN) {
>  		ret  = -1;
> -- 
> 2.43.0
> 
