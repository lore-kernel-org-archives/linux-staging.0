Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36901381708
	for <linux-staging@lists.linux.dev>; Tue, 20 Jan 2026 07:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768892790; cv=none; b=ZAwMplSUtxDBqSwxSURMtN8FEGS61eJHRWM+bJqfw0iPzl0o96kwPAxImih/JLp9HfGQIluAP069u7zkW/JfIBJPzBcYsAj8nlvLvXU5OqDhjp0r7YTT4Za5YZgR1d4FVRERkp4A1aNT+EVd4/X3/TR8djqxbvlLcQecpvLWyVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768892790; c=relaxed/simple;
	bh=ba6zY2XyrwqB2CPUushd7nLiDwvtvl9GQips3T4NSk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bZ5MxyTxQMmy5dOpe8PC2Oo8HwFlcOlwAEf4Y2i7FsIdqyGZ7lRSqkPtZYEVTTRvaHg+/LemC7pG587DmMnV2mVO5uw3s4SF9qh8MesX5yuUbx1w+lqkFLY8yhldJd4TFNEh6evDQF07UTu1nbzQ8rvXdI+DZ3Ax/UdFvQDmayw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K6RFFzTv; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K6RFFzTv"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47ee937ecf2so35712355e9.0
        for <linux-staging@lists.linux.dev>; Mon, 19 Jan 2026 23:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768892779; x=1769497579; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c/aaI4jFo0H96RNLVYivVXnfIHMNBzi8Il4iagJPrMA=;
        b=K6RFFzTvZCJdvP4Wd9SanZpwMrOVLRRJs0oxsZFt6zYS5d/6VtnbSFY3SVDI9JvuQK
         B2C9enDDyLQThr+qv08Vtx7g3TEq58gfo1qbDTNmRmFt/uDF4oLoD7gHwttgZORenSwl
         v/ut26GvcLiMV/BJ+Rvuzeh+YeyxWDMFJ1BiT0WF6RPHYL8q9a4mB02Qc3sTVWdrwlNM
         8WM3NuxW2QzIRFOa8xYQTTnY2fMlkYNd4WwoUDWP5kUmIh4qHsOn9tTsEVdylc1RVzD2
         /kj625MAAv8mGnh9YcoFZ5lIN+xH4d0147CK7dpXAZC3dGHpJ0qYu031OuLxhLm/8KWD
         qWQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768892779; x=1769497579;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c/aaI4jFo0H96RNLVYivVXnfIHMNBzi8Il4iagJPrMA=;
        b=gwvQslX1zD50k30Ft9WZL/LBBbt7wb+r0Hdpc9W0VEPZy6+pPir2WW+5Cthw3abdkk
         W11r+sMVYCO1H3SsaJcfZLBJRXg6J9dPMaw0MvUWxE1bx4xr2D9QhIGKl1ffrozkCBQZ
         mDkLesf4Okl4xAqsvHDEMPOXErOIEzTM73VqKVByQ8dh45lssdb6kAG6QXdX31SDW9Mb
         WzU15M9MbP+r+jfp/n110QTjBqN0UI1Qjjm6v1hpvVj08U+OYtvaB6jUVW0pAoGnzFVP
         Zwqk9yOoJkM5z00rk76JTNNo+7M8J8kaqldsqulJoC+3Vazr8TXit+gONMno+i+zfxQo
         Ykiw==
X-Forwarded-Encrypted: i=1; AJvYcCXb8zFCdcFWcUK716uxkw2qQ2FcQFC93iC6yxj+UlgLSJNiy6a9G8ST+B4GMT1urNZVehZPRjc0ADfqNs6R@lists.linux.dev
X-Gm-Message-State: AOJu0YzSwNvPESHIxuzJCANpiaRgT7wTkEpiace4SK+pxVJOlnXTMJM2
	uSn59s0MjXiAmTXwUYSOrfMn+K0ZEs2cjtKCb9WcTg8ZSzd2/e1n+p+4qBUhiBo/MfU=
X-Gm-Gg: AY/fxX7pBIQvzXmn7Qc661cTp6iwadNl/JF4OHI7lvdbIkI2fF3TY8OIkKgrLhuHnx2
	TKGkNfB+o9+/s6fIBysUQt2iv5zU0aPLzKtqpc5pOrOu0qXYwQvsjKitVjrdO3+u33A6J738NxS
	+5Y+SFPVgjIKKSOuuOlwpwJLUVRXZ7CF3as9Py3UMV3n7ba/GMa/SFMp5r6wiXfSIPIDV1XqcnX
	DsDYsrRKNN0XHg+GqNzG9q5pb5f0sPV95Af/Z/OEH55l1rb2492AV/yzWkt9MRJuwBNRXTLg7WD
	0KSkqQW1ydEpLXKAKnknMBAHk1eh9zCUj/N9rFSn7Ee3ztkJYZX4VfaIcf9WytXVAmj6xBjBsIR
	WFt2XILbpTF8LDAEmXEQQv59xYD0t/tJP0Ym1GfhPP0idcJpqdHnNr1fdtgbbfHCqo9FhLHYJ7f
	srq+4TIzpjOUHMkrdI
X-Received: by 2002:a05:600c:c09b:b0:477:3fcf:368c with SMTP id 5b1f17b1804b1-47f428f6d40mr154922375e9.9.1768892779280;
        Mon, 19 Jan 2026 23:06:19 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356996cf33sm28437893f8f.25.2026.01.19.23.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 23:06:18 -0800 (PST)
Date: Tue, 20 Jan 2026 10:06:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Minu Jin <s9430939@naver.com>
Cc: gregkh@linuxfoundation.org, andriy.shevchenko@linux.intel.com,
	abrahamadekunle50@gmail.com, zxcv2569763104@gmail.com,
	milospuric856@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix unchecked return value of
 skb_copy_bits
Message-ID: <aW8pZ51ia400yFW3@stanley.mountain>
References: <20260120025051.2843461-1-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120025051.2843461-1-s9430939@naver.com>

On Tue, Jan 20, 2026 at 11:50:51AM +0900, Minu Jin wrote:
> diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
> index 944b9c724b32..0720aa7cad62 100644
> --- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
> +++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
> @@ -28,8 +28,10 @@ uint _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, uint rlen)
>  	len =  rtw_remainder_len(pfile);
>  	len = (rlen > len) ? len : rlen;
>  
> -	if (rmem)
> -		skb_copy_bits(pfile->pkt, pfile->buf_len - pfile->pkt_len, rmem, len);
> +	if (rmem) {
> +		if (skb_copy_bits(pfile->pkt, pfile->buf_len - pfile->pkt_len, rmem, len) != 0)
> +			return 0;

Zero normally means success.  Propagate the negative error code from
skb_copy_bits().

	ret = skb_copy_bits();
	if (ret)
		return ret;

I understand that this driver already does a lot of crazy stuff, but
it's not a model to follow when we're writing new code.

regards,
dan carpenter

