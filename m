Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96F931197C
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 22:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773093620; cv=none; b=H/b8KU33KJtJjHKPvP4T1VHxudG6l9ZK4ZfgYE0ddRzENQVXID0gG3aaYlKaGLxq40pCUYWG0DxRtGiaT8n9WwFw4rFvbtLXlQJebdv/DctrWakJNpQ56wHa2scwriYrQdCj4QEqkHIwtCSjurqfOxhhdY6KMPCaKnf+g0w4pcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773093620; c=relaxed/simple;
	bh=485d0Gl1MSeE50DRb1+ZH7F4oEPp27ESPr7a2FcG+Ac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZBZ5Y0bPz7gLPX0lvEuqfUgwoTc24LUO1JlrCrTxM8sEqhLAt+6GEl0p7BhPzaRKwCbbjp5PUol1ZMA3ci6PVwpKRIMEJKOgdeQUtT7eiIKFCvewAC28SnmGzQrFNPwDFTHClrLbUQyIJZuj6Ls5oUBeGMiCVtj+X3JUVuNdNAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hDxpivmZ; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hDxpivmZ"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439baf33150so6573530f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 09 Mar 2026 15:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773093617; x=1773698417; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yah2gF6+W1TIdU4xCNRQ3niHn0+RAk+6w2pITp02sIg=;
        b=hDxpivmZHzioadlQn3VoI9U0GRHuUlAYQybaiJov1EaqtFPybX6OwRNqUss6xVbTPX
         eX0WKqEP0n0TdFHv6/TyqpGaIfhRSruNK6BrMrku160UJaIR0Td9vMwbgl2KzC0bjiPR
         /iyxAWYwpqYf+IfmVkmqapUzdejqgu5G+KKhHgHKz0OqTe95yKLeXwgNUWY4yFSZsciV
         HN0iN20ZWiZVbr/47kflJVqXqJjd8jNqRDnUKB/os4n6E2rMa9JSgL0tMA4/B43U9Tcn
         4oO2bEiKjH5yXLvJHP66qt3V2N7WwBBrIC4NZPkBbolfRtzen51M/HNWIYMZMo6yo+cM
         63gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773093617; x=1773698417;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yah2gF6+W1TIdU4xCNRQ3niHn0+RAk+6w2pITp02sIg=;
        b=w76BaqRkhZFT8iMDsSThnlHhG7OZKhbTZmLA9u63OW+RrTB6tuIh1ftOif3j9REF84
         0OC8YoEA2j6mK1v6/LqLIZJvbLQf86C15gAxCouIcl+4ENgU6N25zmXmWHzIRUYhvkUw
         jMS5FOr0O0JITeVlOgEPcElpNH9Hf/q+vziEXhK1/aoiQfxzPOGfX3QLtlnBncuwnSj/
         c1ninx2RSpCNq3q48UODRxJ1+7u37tgO3evaYOzWXYTD4OkRfkcMMnmn6+YhCJIM7Kjj
         j485NK456QIkRh6psG97Hv+qmmeUUZu1ByflC9nOvc3hLeg14H0IIQpKeq3R25w24PUu
         7W5w==
X-Forwarded-Encrypted: i=1; AJvYcCVEOwwnM6uWOssjuZOaSDRz3b+5THZ7bfE4NgCACYFnu3xgrRHp6Kpz202v9WLIz3l4F5iFkHATuu+j0FME@lists.linux.dev
X-Gm-Message-State: AOJu0YxtnbCWk56kHafplG5to/NtxbauiKakCQAz5bWONjsn7YNFxFGJ
	wXLjZh5XE7ssekvJ4cCu4y4rk5//luj6lmtbi7gqTJPKVGgHtRxlZ4kkGsWc0Lpgb00=
X-Gm-Gg: ATEYQzyMFmKweSt39blxZaVtN+ulQ2Ss1378h4O1IPbYh+O/WrO4/sicvmcqmDQvV+g
	vMDi1g8QO3scj5BY4ZQ8GMVURS9DC+2IKDieIPAdQTRDKPNgXdTdYzMt9qebn4FPbx/wB8jCIbE
	92G1LTiOtSA6ftiaU4aoxbNkg9Yin1qjE2SPvlwso54sc3PcteDBsjpMdt5Rp8Ivit+Y2hnEr/b
	H1JKDy1BB/xmkC47cbr1QQ6K4HJ6XduQYhQhr/Ouu9NbLFCNl+mCo145U+/bNXGfGKW6ur+lktJ
	tuC1nyP2lfdDVPh21xcGPkSrishRZLRCMCyTMgBoQay8TUGwnRYvUVpfFJBCj6MrCrFQY3ia0ou
	GK6p1BliI5Cc0QRIYpXHWLJhD9w9LLyJZqD8y1qB2QhzLB7xqS4l32s0EGzLvzN8sti1G9JsTqG
	cBHbgctdVfUNPED4QP6aJdvx7HdPV5
X-Received: by 2002:a5d:5f93:0:b0:439:a95b:3c47 with SMTP id ffacd0b85a97d-439eff1be54mr2238326f8f.10.1773093616826;
        Mon, 09 Mar 2026 15:00:16 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae49177sm28788604f8f.35.2026.03.09.15.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 15:00:16 -0700 (PDT)
Date: Tue, 10 Mar 2026 01:00:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Josh Law <hlcj1234567@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: Re: [PATCH] staging: axis-fifo: remove redundant goto end
Message-ID: <aa9C7YFy3bkfS1Kv@stanley.mountain>
References: <2026030908-destitute-rely-9997@gregkh>
 <532d31d1-0c06-4c8a-af80-86b6fdf07225@gmail.com>
 <67b71192-97e8-40f6-9b88-666526ccd16e@gmail.com>
 <2026030952-petroleum-osmosis-50df@gregkh>
 <356a52f4-84d0-4872-b713-9833f07e1a8e@gmail.com>
 <2026030928-smartly-spinster-ae05@gregkh>
 <e65d636a-325c-41f4-978a-6c09a967a923@gmail.com>
 <2026030931-quiet-crimp-e4aa@gregkh>
 <4219d437-d0d5-464e-8b92-095690bbbd98@gmail.com>
 <8e07f7f7-8019-4edc-9a33-99a66db12e49@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e07f7f7-8019-4edc-9a33-99a66db12e49@gmail.com>

On Mon, Mar 09, 2026 at 05:22:19PM +0000, Josh Law wrote:
> 
> If it's convenient for you you can ignore one and two since they have
> no descriptions, patch 5 is worth looking at maybe.

I was predicting that patch 5 wouldn't make a measurable difference but
I didn't know you owned the hardware.  Could you try measure it?

regards,
dan carpenter

