Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A24834AAEB
	for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 13:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769606280; cv=none; b=B/ulZjnrQcL0Sf9sM7z90FPn9Rba30T66yVCxZ+IV1M7h9DPbQ4oYzPU1et0QlZtkIxLFAPnn6Oh11xkmT36MmxqhXdBG3qzjq8ln0bMI4cchgKOORO23SonPa3z/Lzp6mRU95PEhU7/Mh5ZOohMMYpj9EVdBHiJwA9WMDjErRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769606280; c=relaxed/simple;
	bh=sEkOSzcJRBD5qUHPfV+zxyl/snf4dfT8ROQ70Feotj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a5Py6qe7VamhVUEWU9fluDpUX5SPgI+gBVjqmpcqxlRLaOQ1rsGXo9/niQ+hFgJ0GxlrnUiAkR/U12xeKHupKS9xwkt5f0xk2831ZSDxEKAhQf0B2t23XwX284Ui7cFYVvQ3/w8Cm2crou6Ij04xpc4reh63vN0w7Bsaf1/iG3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mOZgQ2yw; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mOZgQ2yw"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4359a316d89so5091978f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 05:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769606278; x=1770211078; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dTzxzPwFK2IaKWTPk4B1x59zfTCDOhd3M9CX4TjpNYA=;
        b=mOZgQ2ywyteirAUcC1R1LzhtSfUzR/9KwLGjmLGS+7W7gBDsTsau0V0cIqWiyJGdnR
         086Hozr02oRePuDtUHkOCoLEcIIWfHayPjgbih3JVjffHa59A3S+Xtao1wrQY4B/C8dX
         VzIUm6LQ4duPAfmKq/8SvF/VlamR/IjZUhdvjgXaxpSUxRjGJl+87kjI3OsfQvdN9Ibb
         8cD+z7eoCzCxsImuemwhvXgSR49P4PnuBwqQm3ZTWXyKBkWCQlPJSzHPOTBRZdPUM84J
         sT6jZf4YOU2n6/XP3l13freFFqrvCco8byKXTpzfkJjf2t3sHVt+gNj6xxrWCSe6aC9O
         A22w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769606278; x=1770211078;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dTzxzPwFK2IaKWTPk4B1x59zfTCDOhd3M9CX4TjpNYA=;
        b=omi9ZtKSfyTvAHPlu0cxtZxPMtDAZv0KLjfJAFkvulLISa43ZYw0Hu1HvskbhBtPtV
         +ln+OaUGYCOd6RwtzFkFxNDKvWEUgAnI9mPnYAUerGmikDWXCN/Qiv47K98T9v//7gDh
         bTis91TUYI58XVhG27fBLfsg6Hn2ihuGT0RbRDXoDGBTmWTYc/byuvH2IbzgG6ZFMpC/
         FNfEEaBdkpHVrDTVeAzzH3l4wa02Pnm5as6zGoTTJr2rrl8DJQJwypJKvlDwvXM6xkfk
         2X/a/krRfaLIlSPfKVqNQ0YFTcoQMfZuqxIresW3g26Eq1Rm9oZjXIQOG5b5uX8G0MD2
         2WUg==
X-Forwarded-Encrypted: i=1; AJvYcCUqXlW4iSxf4isMcwt1ORE5qDbujX5Z/P0VbUdaC4/uTms1DI96tepZwgcaREf5epuoazUHgH2Ja/JxPcIs@lists.linux.dev
X-Gm-Message-State: AOJu0YwHa/NdD9cI/VE4d8Go9fZ59kIILtriMNd0J/Zgsa55mm1zlF7C
	mZ99bVO1tHU42i3KPRBnNBm+2hqxSLbNascVy/DU212lfEQ/5C3Rx3I22lUPKxWdZtg=
X-Gm-Gg: AZuq6aKOxe9hkqOIfjp/obUHhlCzXnjcmQFKaMBduitKVH0M2xvolxFpypG3t8OUeJd
	WR5J9cLsPYTXPqcNK1BdDCkiXWugv/XT9fqoVtN9tiptp0mLfzMEWtSdr/NJbIqDIe5E+Hs1Atp
	dxmGIMaDrOXOEsDKLr2hPUrYAWXfwcFkWWLtXGPFSk2Vp93x7/wZ08Zfzlqsf2PbWOmNFQhax7r
	rrxUp+xTpJuSZ0nP5Sj7nzfGhvC/cLeSONh6+/2CjHGd1r4uU+/boySQo082TIcCA/cb6WHXYes
	3VlbVFANLtTAXyOA7Y3MMh8FQVV1dyrsYS3rHkIxop6/NB4abi74mNVrXEw4JQlJM1ZpHxIJvCq
	C5yjsMQqrdfaxSPPoHq2DEsvLTgalc94gYDeoJxEWaczGSA/ItbJm49dvRuQHoFINCFYlTaMJBJ
	2aOoucejJXjjjDjRMJ
X-Received: by 2002:a5d:5c84:0:b0:42f:b581:c69a with SMTP id ffacd0b85a97d-435dd05ba25mr8085646f8f.5.1769606277437;
        Wed, 28 Jan 2026 05:17:57 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10edfe7sm6750747f8f.14.2026.01.28.05.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 05:17:56 -0800 (PST)
Date: Wed, 28 Jan 2026 16:17:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] staging: rtl8723bs: remove unused struct
 debug_priv and all counters
Message-ID: <aXoMgTvtGkJkcJmo@stanley.mountain>
References: <20260127224747.40305-1-ethantidmore06@gmail.com>
 <20260127224747.40305-4-ethantidmore06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127224747.40305-4-ethantidmore06@gmail.com>

On Tue, Jan 27, 2026 at 04:47:38PM -0600, Ethan Tidmore wrote:
> The struct debug_priv is a collection of diagnostic counters that are
> updated throughout the driver's hot paths (RX/TX, MLME, Power Control,
> and SDIO) but are never read, exposed via debugfs, or used for logic.
> 
> This cleanup removes:
> - The entire struct debug_priv definition and its instance in dvobj_priv.
> - All write-only counter increments across the core, hal, and os_dep.
> - Unused local pointers (psdpriv, pdbgpriv) that were only serving
>   the dead diagnostic logic.
> - Redundant logic blocks that only existed to update these counters.
> 
> Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>

So in the end we did remove the struct members, but I expected that to
happen in patch 1 and 2, and I spent some time figuring out if there
was a reason we didn't remove the struct members.

It's hard to know how to break up a patch like this.  I guess you
divided it up into patches which deleted whole functions and then
everything else.  Which is fine...  But you need to delete the struct
members as you go along.

regards,
dan carpenter

