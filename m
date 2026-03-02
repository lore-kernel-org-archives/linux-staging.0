Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105D0383C9E
	for <linux-staging@lists.linux.dev>; Mon,  2 Mar 2026 08:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772441404; cv=none; b=sBDLljW98W7DQcLxQsGELRu9RfNcGoy8PEYBq0//bwfuA0uNCCUcPObLi+vEl+h8RTmYO16/EJDNa0cDTpemXrng1VlDsucrT52f05eetAeR5ohzkeqMmg8PNDG62URy1yinBcEQ6aI2/QpxGE1JcrZ4/anpJi9HyUjAdyvybn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772441404; c=relaxed/simple;
	bh=zEdHXsjY1+dI0EjoUWuYeK86LYd/AxJTBNI9Mj5cnhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ijNGyOendpyHOtdvmjKLg10YzlovcXDeUONlKVb6KCuqxX6GYwm9Y+4f6aqUAxLx79UENjo0lUA1OlwpBF0XtBdaMuqSWXll7dk3nGlBOdUchJfMB7yGKWgydnBLd/afTFlY2VTkB88Zsngi3zzHVuddFMSuC8NU9zyIaAhTGDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pe5Dm4u1; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pe5Dm4u1"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-483abed83b6so33677455e9.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Mar 2026 00:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772441401; x=1773046201; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FxhAp4H6cEz72xSxRHXwjPspMWvyGnSCMhnih33RDzU=;
        b=pe5Dm4u17FNtWUofnci8yLGhncabz56tuIzslSt5uK3bx9FJHm3v3ViclYE9J4or1h
         83DtwXzwG7reJNiKsHSwhICmKx66sLRLvNxcv1eWkN2faBlZlyBh5GFRDzeyzo2kGGTH
         1Nz5xFWMZn7jdxSHUlIa9aBE1eulaXykhbvz9TvDQAEbATYVaET+xiUC2QzIDH4CcVa/
         H7TRZq7zrfuTS0T+JhCrcagpEVO/nChRP2p9Ac4qRyn2HI0Sar4H08UTZRcbR/hSnQC6
         IPT65LMXU3iADEbuvNTesQfFArBfHhw/Jb2EGRoSnnoov25Cy39rKSWhhLvTXfScPeaG
         L8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772441401; x=1773046201;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FxhAp4H6cEz72xSxRHXwjPspMWvyGnSCMhnih33RDzU=;
        b=VwPEY5xT/YoxkTJMGPdeo2HRgBZNlDZC2hg+3gukzn0uI8J6oK8sK8LZtIgwcfIrbu
         Pj1bOufNNs+i1AcWAVNI/HmITbbkw3EqaAaI9Sgp7Ewk3UbPDG9r/ZSk6y1lxF/5LPdH
         uEQPJSyltWr3QvQh8U1XStuQfoZp8PI28/+p+W/8OeroiO2e2zUPXqxer/nXLZRmjKH9
         FUR0RCRkO/00+I0Q9A0/IsDZTpC4QUTt5sCrWjHWosG1EeW7CQE8jYvbe8dd4Uw3MePU
         EjPNQQwrgn7tP7bUAZTrSBdz2Ye9rTuqFlKyb0lKnmqd/GDo1pNhyfFerUYdzy0cICGP
         S9Mw==
X-Forwarded-Encrypted: i=1; AJvYcCX/ndAAAXd7Sy2iONPqOmLuSL5hi833X6gG028Z+6FcdiUyodGU3G23Z5VSfFO0F8aOdEj07GYfaKZDSqLm@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1GaOPbdqq7Z16uIyDd+zfKz7xKTTrOm005eZzJSmF0Egy6rU9
	9OOY3Ldfe6qmKu3ehpZhcVFVixAVludkmdCLSczWIC3l/r2HyWiWU+Cx1UuJnBtGECM=
X-Gm-Gg: ATEYQzy400cuEM5m9yCs7Ri8lYqv6uKWSccs5YqnRQLeJV1oocexFyuP5iLmfvXkPGh
	hubxoqgqyc08G6aBltmYmiRYobPAX+lT1qdA2/z7NduKAHIeai94BOnpM1O8d/G87h6Iay/s1Y2
	MvG3CnOLIYpvi/X2Pmi0xsd9FrYQ0cuhZxS6/ZX9rPbMisCNWuR8y6qOYcu0fGeem0cpn49pPG/
	RTPgM/HAqcZ4Xw+j10BEwcFVx+qdqJ9de++MBIlC4n0YTy6Txeu1PLkwYwj4uxk4La/5GstmZwc
	lftpHJbcRbG8156KvZyA9XTA1bRemtPDi0/klViG6osEsM4TFlj9KWs1hnmPje/683xAPjnxA3+
	ED2kWVSSxUYLXrts9J5SJXA1hUm/wYvfU+fuYx6JWYCwzqRWkGitjtifagNph8CrCYnpBFL7G2h
	KWzJbctS3ZYKRnbOycmmvTh53LBXGJ
X-Received: by 2002:a05:600c:1f91:b0:47e:e2eb:bc22 with SMTP id 5b1f17b1804b1-483c9ba3769mr194715375e9.5.1772441401183;
        Mon, 02 Mar 2026 00:50:01 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcb9b97sm205649805e9.7.2026.03.02.00.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 00:50:00 -0800 (PST)
Date: Mon, 2 Mar 2026 11:49:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Afkari Zergaw <afkarizergaw12@gmail.com>
Cc: marvin24@gmx.de, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: KVM: fix punctuation for e.g. and i.e.
Message-ID: <aaVPNNUL_IdbkX4a@stanley.mountain>
References: <20260302013610.3815-1-afkarizergaw12@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302013610.3815-1-afkarizergaw12@gmail.com>

On Mon, Mar 02, 2026 at 01:36:09AM +0000, Afkari Zergaw wrote:
> Add missing commas after "e.g." and "i.e." in the KVM API
> documentation to improve readability and follow standard
> punctuation usage.
> 
> Signed-off-by: Afkari Zergaw <afkarizergaw12@gmail.com>
> ---
>  Documentation/virt/kvm/api.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index fc5736839edd..c8500f0e913a 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -6346,12 +6346,12 @@ A KVM_MEM_GUEST_MEMFD region _must_ have a valid guest_memfd (private memory) an
>  userspace_addr (shared memory).  However, "valid" for userspace_addr simply
>  means that the address itself must be a legal userspace address.  The backing
>  mapping for userspace_addr is not required to be valid/populated at the time of
> -KVM_SET_USER_MEMORY_REGION2, e.g. shared memory can be lazily mapped/allocated
> +KVM_SET_USER_MEMORY_REGION2, e.g., shared memory can be lazily mapped/allocated
>  on-demand.

Google says this is an America vs Britain thing.

regards,
dan carpenter

