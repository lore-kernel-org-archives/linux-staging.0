Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21FC2D7DC4
	for <linux-staging@lists.linux.dev>; Wed,  8 Apr 2026 13:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775656095; cv=none; b=lmljhg5S7LMCf6YJpVx1dg8sRxwpd1LQA2B3irPuqWc8pkuYW01cJSemFHnoURQruRWgVkTwYANE7qu1jVxfS4lczocKIsdUAbXIveOEpmTYzntxSPPo6bixESTNlryJ/OVGqDSHEmFb79mFMxHyPGotG46Adqv+0sKo41QWaO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775656095; c=relaxed/simple;
	bh=pmLg8Ynrnzn99i1OBfyJlnnntDwHsU23+NqD9dTM3jk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=inIuqZXhpRtx1AFj9Mx8ARoNuYlhzymYOUa+eprf31qda3y+V8eAumlc1qSZS1RdcHXxWq5+ZPq4+popSQokuR4JRnSQO2VxoWU5Pz5VZJad6m/5PgiuNwlcLZTd7nQKqvt5chhUm+7p6uzGzyiNGFUU/o4aQgINlmioJlVLCjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kQ6lB9zv; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kQ6lB9zv"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso6170684eec.1
        for <linux-staging@lists.linux.dev>; Wed, 08 Apr 2026 06:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775656093; x=1776260893; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VHAUSkDykTSZ19gg6L6AVzq+02nkCv+puFTeLx+hHC0=;
        b=kQ6lB9zv1fIeLWyv4W+A0sqLuQFc0uUlOiYsEcCdpgscePKbr+w8CdkpKdmdutw/YW
         jj2cL/p1VJfj1vynpwq27h+N5Xm8TfEucho6a+pYPDpLfDfjzlp/1oVCRPb4EKFsaxBG
         A5N0fPDnr+l9g/f6ol0ivnEYdffnkpxH+s+KdQppH8cG8Wa6a53MfHHkiwJNby3a6oqb
         EGKYlcOmMnZyaGMCeKj90S3/8+HNA8l7FZbrKTiNW7lSho84Ohaf9MVMV2wRWSXW4jeD
         NrjyrWA9wNYUhzPUUIAP7KPDyqj2PuN0sXHeTTxF98Z3mrBTtFkcgWnR8k2gCH621lt8
         zstg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775656093; x=1776260893;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VHAUSkDykTSZ19gg6L6AVzq+02nkCv+puFTeLx+hHC0=;
        b=EDG57zY0Xtq4gPYtE8llMZsN1HPmzdT2uzKf4heNhjMAt+9NwWimZyZpIjcecXvaE4
         mgnmTocMlkWx7kt6XQojwMTD382XvSkIXGQaC3ZIJBqnJg/RnzfkGa5DMxdls3mPmmab
         VlGq4jrwSkX0/qIucoJQuRzeIGu/l578AY5pY8IckmVkh5MSI6EpoDUQrUNY7riSKE3U
         d1V+p+x5EthaCtzKkoFF+5RWqvbI3rTEdDmytSt2NB7f2MjIDaC8cUEw87rvwKJhbpT4
         O5Gevr0OA7lwfNn/yO124nfJIfL03N6GSjPQVjuXekQ2wxsM9iXqVGQXRBCODvvQ0xCc
         TFLA==
X-Forwarded-Encrypted: i=1; AJvYcCUVJ6Ho7AfUhK4ZbUFWK4swl475n3JsXkA6OCNMQ4II2iDewk2XWY5c7bUX73Bfc8Yqy4En/shAMmUCLCOJ@lists.linux.dev
X-Gm-Message-State: AOJu0YzGVDuo/Ag4FcH6OPjXact9Db8V+kAa+wRhq9SnrQ09a89G7qUa
	Tp+6dCWtQJUiXNy+v4m/HfoSBSI3v8N2CpUQGcwSz6An/qefYYwEN5Qz
X-Gm-Gg: AeBDievYdjU/Z0KH3tpnZgkE4r4RvM5w6r2uZ3JDoUNkz23hrxs22DOlzPwdggrRlEw
	xzeLQwgxvsS7i/8u5mH5a+jXxFlvmlS+Rcj5AQyIve3IfsLsoH/pDE+Z7WaVbu44wTFY8cCKjfn
	bNakFuQPukB3txEqxbufTTKw46VqfFY7Xvc7Fypk6RZyv/SnpCO++Vwkw1n9tDoZLfgVohRTj6k
	w7GyI0EZ8Cdft3/GhY31vucG9NB9BoHCXsoNAU0yyD6WCXZteFKubtotY37ekQgEEIUNgneMQhs
	rB+zYoGX0Pa+PcUmQBRgGBJTzUfCnl9ls5XuJxuWc4o6rP1Qy//V2BCQgthrNVi5fUY8oP81tR9
	88CySpGOq59Clfh520rrZ6ZPnWoeOdqEI0b/BIDItXnA7JXDo2it+mHAdBZkOtRYsMdREG3oToR
	K744rkng+siB1HHshm
X-Received: by 2002:a05:7301:6093:b0:2c7:3a7:c7a6 with SMTP id 5a478bee46e88-2cbfa2d8089mr11047477eec.13.1775656092967;
        Wed, 08 Apr 2026 06:48:12 -0700 (PDT)
Received: from localhost ([172.216.11.43])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ce39d13decsm13684434eec.8.2026.04.08.06.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 06:48:12 -0700 (PDT)
Date: Wed, 8 Apr 2026 16:48:06 +0300
From: Dan Carpenter <error27@gmail.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: gregkh@linuxfoundation.org, dan.carpenter@linaro.org,
	ethantidmore@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/6] staging: rtl8723bs: convert xmit init path to
 errno
Message-ID: <adZclv5nv8W1cXNF@stanley.mountain>
References: <20260408111314.19329-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260408111314.19329-1-dennylin0707@gmail.com>

On Wed, Apr 08, 2026 at 11:13:08AM +0000, Hungyu Lin wrote:
> Convert the xmit initialization path to use standard kernel
> return conventions: 0 on success and negative errno on failure.
> 
> This replaces the use of _SUCCESS/_FAIL with proper error
> codes and improves error propagation.
> 
> The changes are split into smaller patches following review
> feedback from Dan Carpenter, converting one function at a time
> to make the series easier to review.
> 
> v5:
> - Fix trailing whitespace in os_intfs.c
> 
> v4:
> - Split into a series of smaller patches as suggested by Dan Carpenter
> - Convert functions step by step to improve reviewability
> - Ensure each patch builds independently
>

Thanks!

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

