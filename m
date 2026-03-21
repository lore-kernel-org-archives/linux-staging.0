Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF073451CD
	for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 07:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774079883; cv=none; b=bH+5L5HGL9EwpX0tGtYWvMYGajaT9eGgNKi0k/VWMFgEDFtD2gCRRmIrJX+lHQIu56/6rKvJQv5HDZx5IwMTzxTSLIneQ5dwwWi9n9nYZ8efj3wNGLq4w1JfRb+ERNylFzxhouE2+rqQFQcV9gyjbynfPWL6RJitBZh7iCFBpwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774079883; c=relaxed/simple;
	bh=xC6TFvSRt5n+yCR5ZAsOK5Kj1fNNYaM8HoB22Mmr47A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZArEUr7FBCVmp2lbChlywEnQ0ZtANW1ZsT5HkkFEIpvftvV3yKS+0vEqFur+vtw6H04DNp2M0Mq2nwLfhs+x3QF3aM2dUi2eNavnhChC7hLV6TSZw3NrVbr3JyFo7j2vqE63DrA4pt2ykRixBka01dLe6cU2cpGd2H0UWJ8dzhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dRxy0VSc; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dRxy0VSc"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-487035181a7so2571495e9.2
        for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 00:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774079881; x=1774684681; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/feQgsbf2sd9ZVef0q1kRuYMHLLA9XdF8QHnZq52BVc=;
        b=dRxy0VScgG4ODC84P2jiliKh1gZwZIJ/UvGL6ziFsiFd0yPdmcRgrodUOG40OPtOnA
         kKuQ+wGqkBSzLqQi3SX8apg1/a+mfQ7JMT9iE0RV/34rhRtJRNUqOYeRc4nAR85k7Y2k
         MuPAN0xo74g8ahhjuxNov2sHsV33N820PchYmTKR26gp95xh6rnDHi1X3KP/3w5aRVIN
         s6jwtY5JAnTF5NiWeMBRxbMF4b+ok1ZgV981KVJ9KbOUSp3PrY7RIn3wM2qcsh+32xIC
         yxj6lpM1tbxkWS+OyOvMkXvyldH2WA0aVdfbo9gFQ9zVGYF7u4UqQnkFYVKLf2IivxJ8
         +FjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774079881; x=1774684681;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/feQgsbf2sd9ZVef0q1kRuYMHLLA9XdF8QHnZq52BVc=;
        b=cCYDIeXQtxlfY/UZvLLnC9ywZin/q61PbrYTcvvhKxJfBBw5UXrsRA+5Ba0axI1QUt
         xYAaiujjRbckPb7611InDhuZqzL9RigE/RLQNtbMxEn33H5Yxa/NLLkdMZgjEaTNwBKt
         ayQxrnKw86t2HoWPy76MJPRRiZoASXQ2zmlUsM0k1875iSAWEeUxgw+pkI2yroW6Wd5n
         EU+KeqwvNlK7jakK9kMRlCKkmuoHrdtO9KScn6w17AnCk2+0zJrBEAAheR4JAbGDFp9B
         2mNyN+j3EoCyQMc95vv/2osHRBHfgyv9g8EAiD1Wpqmc4reWoJ6w2dE4M1UI+oTUT3+q
         PxMg==
X-Forwarded-Encrypted: i=1; AJvYcCX/eZXMtu4hlGlmfIGDVgevbkrVqQ0XWs5Pzh0kZRWp9DHwNGJCEvpzzU5g9Qx123SuZOySM5hRPqi4LJv5@lists.linux.dev
X-Gm-Message-State: AOJu0YxUPtO6offIaE3+GgrZv2G53rcSJcD91krRRS2LtKp1WxFVJ+ar
	Fg25Y+/x/lz0t+EkpjxlqDq950dp/Rph43af/MJWHqw0xCehdUPdN5ntIdOGgYVx71I=
X-Gm-Gg: ATEYQzxyjdVpJCJHkAogLFt+RzxQ7ANNXOuWUg+RESrb6Qpx1NsU1Msn5HVG+Gp16Dh
	1vdgnB00iZTpJWDL3qe08oYVf3jNiybjBH+QKKrsO45KHnCpGX0UNNdV468K5kiifuIRxnT+WdA
	BrN8/wuG3TeSFqrda0huWouTE6spXuclUbmAJr+/SxfDzECzJe4h7TYeGkJE8RUhlltSZ8AZ2/t
	XBb2Mtel+X5CAkWW++mrFZoRP+wGCHtO2WiBeF51VqHi/s1Z40EplOxkXd8Glam//erwg/eu5Bo
	cYO+2mvIyaTk8FxY6jXQPN00Tv7bXh1lJrt9/BQ55Vahg7nYAzdMY2R4GbH+FqSLcw3DSU4a53i
	p4/z+dmlBu+PNYVDHo++IeO9dE68pTvk/bx9V60ChOnv9Uz+VXC4PDPIfQcjj9zNmUCOs1wl/Mx
	4/ospZB/u4kl/0f+7AgaeFXrwp94Nm
X-Received: by 2002:a05:600c:a43:b0:486:fbd1:9dc0 with SMTP id 5b1f17b1804b1-486fee0d52fmr75025545e9.22.1774079880894;
        Sat, 21 Mar 2026 00:58:00 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b949e1sm322295655e9.9.2026.03.21.00.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 00:58:00 -0700 (PDT)
Date: Sat, 21 Mar 2026 10:57:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Lin YuChen <starpt.official@gmail.com>, straube.linux@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: initialize le_tmp64 in
 rtw_BIP_verify()
Message-ID: <ab5Phf6yF9Tw9-1W@stanley.mountain>
References: <20260320172502.167332-1-starpt.official@gmail.com>
 <2026032035-opulently-cupbearer-820b@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026032035-opulently-cupbearer-820b@gregkh>

On Fri, Mar 20, 2026 at 06:29:13PM +0100, Greg KH wrote:
> On Sat, Mar 21, 2026 at 01:25:02AM +0800, Lin YuChen wrote:
> > Initialize le_tmp64 to zero in rtw_BIP_verify() to prevent using
> > uninitialized data.
> > 
> > Smatch warns that only 6 bytes are copied to this 8-byte (u64)
> > variable, leaving the last two bytes uninitialized:
> > 
> > drivers/staging/rtl8723bs/core/rtw_security.c:1308 rtw_BIP_verify()
> > warn: not copying enough bytes for '&le_tmp64' (8 vs 6 bytes)
> > 
> > Initializing the variable at the start of the function fixes this
> > warning and ensures predictable behavior.
> 
> Which makes me wonder how this ever worked at all, if random data was in
> those 2 bytes.

These days, everyone sane zeroes their stack variables, but this driver
is older than the zeroing code so it's a puzzling thing.

I could imagine a couple different ways that the code might be able to
work even with uninitialized data...  It wouldn't surprise me if the
check for:

	/* BIP packet number should bigger than previous BIP packet */

is some kind of work around for bug?

regards,
dan carpenter

