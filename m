Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F7E352927
	for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 11:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768217839; cv=none; b=JdGettP3FhXeTIIOMwnK0Pmb3myCwjoshirIfsLrc0fccCyfuCYFVchxdGhwSSFlLafuOmzMExRmbtpdyLISrx4rvo/buEuU9ABq2Ld0JCFcj6H5jhuTI8LhttZSaei5RNAWE2QHjeYcPcvqTMjKWG11Wd5Z4+MkfLwA9R2uKmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768217839; c=relaxed/simple;
	bh=Gn/u0KUaYWGeciTH7RGvkna6CBLLsD3y2e+rrefF94E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lqAR7BF6OrDB60n0KrTmp/lcdNn0H0abOkSrpNwDF9ThbUr9Qkq5ILPiFKzpTNPfs7VtoILsl39lMoXc4cUzPtG0RmwynDa/41NeDaE4Xd/l7JvRv2YzImTkelE7tGjME4jbpJi1o7NfnrgKQrRGWbDX0jjDfIu6gygHLKcRObk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tnXzOqVA; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tnXzOqVA"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47d182a8c6cso37141685e9.1
        for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 03:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768217836; x=1768822636; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dVBzeGCZ2s4+0kyqnfcPzb5PWxvvuY6KEB2hiRiwIF4=;
        b=tnXzOqVA/T+of7EUUXMMkEFZn2uJV3dl5Lizue0eGAK5UEY8w/B+j6O/n3stVrzHls
         s3u6HKA9oo6pxAKdZ9LwwkTBr/xLnkeVcNU774JIjJ4IM5phCPQGAUksWV/flCR5sft6
         1z7AYFkCRsm+8os4E1g6PScDMWuzBEf2DuXcnInuSzEKwVaXzyqa3xHMVUjCYlLT96Pi
         imF8m9yVy8VFLaw+9Tioj0qp8XG5f0+Ck1X9m9NZSNqlU6tvSz8yQVZoRcl4F/KBE8Ym
         p2jVhvmC500pPh1PXM9ZUazLo7Vh2HSfb2oDa9a1uauLAw6r07loYHdAggKjKjwQp9zt
         w8gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768217836; x=1768822636;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dVBzeGCZ2s4+0kyqnfcPzb5PWxvvuY6KEB2hiRiwIF4=;
        b=MzQA4uE8AnM7EUNrByUs2R265CpsPL5L+ondfnM/EE97L7ARdpakHlPmNf4/bvkmP9
         wXFH5VBVghpGBEO6Cg3UwgEbdTJy5t8g90XlnCmgFhoJxeEDmr1Qff32jSKWrrT+yl/z
         nhujroymoxeF7DSvayoSCHWVOyWih0+pjONBEZI2xI4J0onuT1LrXJ463T7H2D1zsxFN
         ySIdck4TLrugk9itI6qX6xZ6WKtykFzf1b7MPSW027IMDonCmJrrZG6oaMzLHsSRaQhA
         fVe4ADUjhbRZy1NviJxT0Mlix/bmYqgEzQGKmMIi0mdWi6pcT4vGD0C83EFNXEJd0GLR
         OTXw==
X-Forwarded-Encrypted: i=1; AJvYcCX94p/q2D7R2lix9aj8FH8525ygrJorELpBaK8H1leyPIJVKyT5zf+9AqcBm8lrnj3FIzQRHnGAgnR4bmPI@lists.linux.dev
X-Gm-Message-State: AOJu0YxhYoifSnPwu+LXtSIkCHKySZrkMNgcCt2cy3INr3pk44sadDS2
	g0AFfFc5vNJP3GVbP4/8YuPsytKMaYzPOg4QJXP9IguQYE7Ib2oFIqf92O5k75ly2s8=
X-Gm-Gg: AY/fxX58SSIMKaXbI2ZZvs4Bcw0RTeZVsyccQPalG026FnLsmkmmcnK0OxSbFZENbB6
	j2ur8Y39PMSPTqDvuA5K6JXKyQsMcbA+IlgaoMVsuN/fI4xto44DILB+M5IT7sb5C0nXNpgn/eF
	ld9jZ3uGFGIEIDf9z2A0DEwBuA/zhVdYtVHPGlcaQNOLRpPosAJ4F2YzDWuNaWHu6pIlpdWLWZU
	u2EA/xNDTd23QlWBSK0edCcsAgnQkS33VwNOlgoEmnr8ciMLy2VHm0DbBkabruNn4TYQ9a3lmg+
	eXUbE+Zo2U2WPe6AzxoqvP84AGWqsePKBU0AGeA8sNCRIJS7k9eo6zCi865rAhePnqeTuSZBmqz
	LVTG7YBBOHUeNzz5aQBJjOTxadPXCGsNAYDHJq4zRaGt75rzqlrLDWD94Eq5kiJMMp0CMnzLW0I
	dZJ89FB9bbB0ZTqymQ
X-Google-Smtp-Source: AGHT+IEmfqiC54I6qd0jQc/4Kly0SFVVTUAef9H+jzt7pKUlQ0kktLvIUQ+BrDrJRh9j4nsCeyX78g==
X-Received: by 2002:a05:600c:4fd0:b0:477:7925:f7fb with SMTP id 5b1f17b1804b1-47d84b200d1mr201062605e9.10.1768217835995;
        Mon, 12 Jan 2026 03:37:15 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f69e13bsm352761855e9.7.2026.01.12.03.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 03:37:15 -0800 (PST)
Date: Mon, 12 Jan 2026 14:37:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Nayana Mariyappa <nayana.mariyappa@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v4 0/4] staging: rtl8723bs: coding style fixes
Message-ID: <aWTc6FOEpvKpEsWM@stanley.mountain>
References: <20260112104654.45175-1-nayana.mariyappa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112104654.45175-1-nayana.mariyappa@gmail.com>

Please wait for a day between resends.  Potentially other people
will want to give feedback on a patch if we give them time.

regards,
dan carpenter

