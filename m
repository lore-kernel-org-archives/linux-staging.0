Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263AD43CED4
	for <linux-staging@lists.linux.dev>; Thu, 22 Jan 2026 05:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769061480; cv=none; b=Y77I4QHFKwAzSLvZpdn6FIve7K7Ae4hZVlyC2XTD0vg8lraJjLMhV87b10QK8jvgIDr6/PSWLeVL0MTnLpjIrV39GUYK6c3eyrl6asJHrajCReWC3v5xv9ZWU4z8fxhsjgFqTcU413Fj9yn2jOBcIKMnZJcpIDzsNKVWuaNduzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769061480; c=relaxed/simple;
	bh=AeiDLSUWKCvYC3HchANUIctJW+gnKkwCdMRkVrhBQQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QPqtY/lIUuWbqk3HM7GvSrcGE4I+ll2IDG2frceEZ7orHFrvfKfjuGCfE2JIbcW/GMLMJEjwiKjeSDLNwZREeIoNx8og/Wa5Ql03MwvhDBDqXDy7A+Z7ggGY1bDs9NsrGf/5dEW5DIyWYKOnrAIrAVQGeHs2aDTJG2fbQ0CwS3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RghzEtfI; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RghzEtfI"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47ee4539adfso5850755e9.3
        for <linux-staging@lists.linux.dev>; Wed, 21 Jan 2026 21:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769061476; x=1769666276; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j62zNg0FbK4iuXSa0zlFDS7DWnoWxhzLXUjr8M2qWMw=;
        b=RghzEtfIeSuIcjwzSAsZzV0sAihH7Ghms8rdOzXaz3ZIY3DLjO61RgzIvPb6rmS4pg
         3zzqHraoQ3Ii11YPscLtKLgXmXym/F1mM4gRTLS1hLlUT+i0j/QrpPcrUoWbqJ/qTpDz
         CA4VwNkv73xTAvSo+LB8gdZHMuXV+dFURNReFRyGryAFLwlncvO9uTU20MWAtl9TW0BV
         JuN3m5qMqrfPjDelcxFam7BaUkWHBarHD1gU2Smg7UEqrHjQdXQFihxeBEuFcH6LPf4k
         QUdYM9unP5jUzFNlM4ZiH8XtnkPSEqdpA8cHkhI+AE6pQzffV1sMqC5dMC0KOeHGFyrJ
         aBCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769061476; x=1769666276;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j62zNg0FbK4iuXSa0zlFDS7DWnoWxhzLXUjr8M2qWMw=;
        b=DSpmCsFCvnO2JqBaW/0mjxNtHb3fJE4EvkGguu4gQJf2eI1/QxC3P8x96l5YcgRV0p
         ljhlDTm5EZJKXrFNZNfsP5ZYtQEdB4sSNd8n65wTxyc3Cz51gCmdCssjG1loQWzdIrdJ
         JG315U9IESf5M/FOKPOOnm07plICbR2K5uR91je4EHRK7A/2qngmlk99kJy9H+gwzLYK
         lR66fkaMQ82yR7q/FUBo6sWtRQKpbm8xircGrLNEfPrxJjPI9+XgCS25MB+PXktq/QzF
         TRk3p25evVrv7HuUsjWs9Ma3Ni815JnyIac+SnNVXH1LjZno7J2MD39LXD9iOphQ3cZM
         wOTw==
X-Forwarded-Encrypted: i=1; AJvYcCXXPq5rZrOoM4+W1DD2M54nJtM2tv6JYcpn8j1B08DtB6ou2ObY4NNjTEs2ZRo/ztVmhst5kPlMcPpqd2JN@lists.linux.dev
X-Gm-Message-State: AOJu0YxJMww75gg2sUmRXV/KIvOqSopmQ9HkDsRicpVHHwIMEKjF9asJ
	VrcZlVIe3Qq4HxB7EQ2GobTfGsVrVUUNdyJ3dRdNEAUSo8AS/OIPZbivsiWZ/9HNXKM=
X-Gm-Gg: AZuq6aL8tX7R+HSHDMIFoDer96oEKKwuWN5G3z1QtAiJZ9J95rMexTPxTss2HjBioVW
	QtigdwIzp38/lkd8mKF2N/gnIQcQh/exdSTxyIhE/YH5O5Y4fq0tCactZJ6R6rVW66UZyEqRA0Z
	6HM7DszY+FnqEFsA4TbBb9c6InBYaT4rKNOuHhqzgwSPpolIYKuncaQt86KduWK/5P1hChO55LO
	E/h7Vpq5CqvJw7shL3Vh8VVCezucv3xzIn5RJ9QwjCrxNQGlB9HW+TcKzZYtMUXlNid8lTmxt3l
	TsLw9s8HzHxNhl1C5KRGOvO5AiXznvj1a9Rxl4dG4R0Fnv8c9+qy7I7i6AKkJ66xZg2utmIGFU0
	Xvz2DKzkmdKMPXjaDABiPTI8mn2L5uBPyV2GFA0QN5oWE6lbekuJtaSz0w0FlopajaiHl548PKS
	qIzDxrvlcK8lxau04p
X-Received: by 2002:a05:600c:1c0f:b0:477:9986:5e6b with SMTP id 5b1f17b1804b1-480416867bemr87816905e9.28.1769061476342;
        Wed, 21 Jan 2026 21:57:56 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48042b806besm44892735e9.2.2026.01.21.21.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 21:57:55 -0800 (PST)
Date: Thu, 22 Jan 2026 08:57:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Minu Jin <s9430939@naver.com>
Cc: gregkh@linuxfoundation.org, andriy.shevchenko@linux.intel.com,
	abrahamadekunle50@gmail.com, zxcv2569763104@gmail.com,
	milospuric856@gmail.com, karanja99erick@gmail.com,
	weibu@redadmin.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] staging: rtl8723bs: prevent partial reads in
 _rtw_pktfile_read
Message-ID: <aXG8YWkFlfiOSSHD@stanley.mountain>
References: <20260122041450.2325560-1-s9430939@naver.com>
 <20260122041450.2325560-4-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122041450.2325560-4-s9430939@naver.com>

On Thu, Jan 22, 2026 at 01:14:50PM +0900, Minu Jin wrote:
> The current implementation of _rtw_pktfile_read() allows reading less
> data than requested if there isn't enough data remaining.
> 
> This is problematic because callers usually request a fixed size (like
> a header size) and expect that full amount. Reading only part of the
> data means the caller gets incomplete information, which can lead to
> errors in packet processing.
> 
> To fix this, update the function to:
> 1. Return -EINVAL if the remaining data is smaller than the requested
>    length.
> 2. Check the return value of skb_copy_bits() and propagate errors.
> 3. Only update the internal pointers (cur_addr, pkt_len) if the read
>    is fully successful.
> 
> Callers have already been updated in previous patches to handle these
> negative error codes.
> 
> Signed-off-by: Minu Jin <s9430939@naver.com>
> ---
>  drivers/staging/rtl8723bs/os_dep/xmit_linux.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
> index ea54a573e025..72cf8cd5f7c6 100644
> --- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
> +++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
> @@ -23,21 +23,20 @@ void _rtw_open_pktfile(struct sk_buff *pktptr, struct pkt_file *pfile)
>  
>  int _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, unsigned int rlen)
>  {
> -	unsigned int len;
>  	int ret;
>  
> -	len =  rtw_remainder_len(pfile);
> - 	len = (rlen > len) ? len : rlen;

The rest of this looks okay.  But just drop patch 1 since you
delete the len variable in the end anyway.  Leave the type alone and
leave the whitespace alone.  Your subjects are too vague.

patch 1: update _rtw_pktfile_read() to return error codes
patch 2: clean up _rtw_pktfile_read()

regards,
dan carpenter


