Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6343B27E3
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 09:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773911353; cv=none; b=WJvOTuQDtIjno0dx4tKDHokPF3Um1cPcAh+BfUacUSXHlLL5B8bcijKjwfnGvjcNFteYTIuo41c7LoNdakruECSHCuOJVQFWpyRfpWKTtWm/HUyry90DNS/Hw+XyM3rlVIK3HJLJ0avgY2ssPReSZ5DwrRsWAoQ60tq+26ICBXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773911353; c=relaxed/simple;
	bh=kgywvHISNOqD/7o8Fg8VTT7nuQEyVY/szB44H138+Mo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DKGMgUbio/wXZL7ex/BlKmjioJ4flFsa4f2Av6B9oExXt4K7ejSVsggbcY58bREv87LrAeP+fw5LMcHwJRGD47ZeKBMbkDLuzXQRRkAjHvvliyxqafGVty+9X0lirRULvmDhW+IFY+NDG1yIPW2qmsDBsOhGp/Zfaz8Hj7ACIwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pa1U0KjV; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pa1U0KjV"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso7252845e9.0
        for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 02:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773911351; x=1774516151; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bQJKsd+eKfmRDUAbjk55/Pma3L/HAKkTQQJgRlCh8JU=;
        b=Pa1U0KjVX5BtpE8q+uWt9tP3wQVvEAIdtY0gotTGWsyXaiF+Ryv8HLE9xpHFODPeOs
         Zsm+vpfBmYZcNFD7FL/BNBZW1JtnpJrxO5tjNoqD0zx1THJh35j4w90reO9gBe0x8YFG
         q2hrhijZdMBXKPOWRFIemjtEpPveeYot6Pj4rrDXM9AjLgH7Z6y70bKTvqKedtT5GSmd
         g6qdIEtEVN79o8h73YEEF8EFWQkJgwSbn5obZot6hPJv8UTpaISqwaNUUkh1qlyyhfLa
         bZWwzuiblVF1z9qhMYbT85ju9jr9+L9KgFDJtMYlFEpV8x4lyehZOzilTtKYgvzkq/AJ
         khPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773911351; x=1774516151;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bQJKsd+eKfmRDUAbjk55/Pma3L/HAKkTQQJgRlCh8JU=;
        b=gPOtqNr1/dnpiddQ1vFJIR/fFsEXtILDc+ksrp/Rr/fWaOpd16YCeYXkG09w3Srx8f
         zYbpPMF3YqPFbArfx1rmhWHWXsvQZMOyk5vbzMD0Hv8pwqQxlI8fRvnmCK13Id9PMbwK
         TS7QF6tvWkHgwsyteUXcXelHlODB/D9w04wtrTK+iI9nAn9LGd6wbQqleVVuGCg50imF
         gsHNrilZpAvhwqBrIFW8G7Rx/lmpm5oGuSCXre5pCor0BZhghxEgnbLew7QKrSo6n66V
         ahHrSh84R+ivIa1yUZQSX9W6b7aeZ+coMcVJl6BEOLWeIr7omGsMMLaPs6jgSshy86Iv
         5DRQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9s+uhuDrOGTMMuEFfjmFeiDkmo+C01qZghD0q9+vGuvnwjnbWcsssyRpFky51+llsK9GEr4KLil+PzY/8@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5m0z6oObDq9pwz9+WqFlbBgEHeQeEA6B1P/ZGKI1ztHKfP/iY
	IF7HUc4UgQ45vY1aPx46TFnIVbYUdTL7FUuR1nca4CfNQcFOvo7P4/LUkA0a6jMmW9s=
X-Gm-Gg: ATEYQzzmU4IkgLixWKYkuniFsFPNAdGIuhR99XGeZ6n3Qtv6ns6y7trw9oN0ul03VFL
	xf0xtUI1psbLkcgzq4C/dNngp/w1VIKtW2yTnvNtqH8LyGr+edqnvvNKukQAvjAIEX8gofD/4UC
	Nh+sXx3LnDIsqWJQ6MjK3f+x1bxehs82Hc4/4p6CwI2aS/30w2oazq11hbrZl8vbxJa6PqTtxWj
	8HzQeo7X5M3t0+MpTe7HxE9TKXXPE8K/bv4Bc/aqWJ24pCQqLwL3oToamknjN6PALjXD/JnR2JS
	aAgGp7Z2kbsDIWpkM5ehnNT9GXralLHF9tngkU2vQhEYfJm9QjFXpN50exE6JHpfbZp5oamr7Wi
	6Vo/txedJ4KJRyl1IerQpT6q2wWgB1BpQxbd4TSt10ESqACGrH4fTxGCviU9HZ1qz00F82lqgAg
	3vp2OzffICVZZCh3B+xeA91MWitPAc
X-Received: by 2002:a05:600c:5742:b0:483:703e:4ad9 with SMTP id 5b1f17b1804b1-486f446d066mr77326135e9.19.1773911350524;
        Thu, 19 Mar 2026 02:09:10 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8aacc73sm49396395e9.0.2026.03.19.02.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 02:09:09 -0700 (PDT)
Date: Thu, 19 Mar 2026 12:09:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Omer El Idrissi <omer.e.idrissi@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtl8723bs: replace _SUCCESS/_FAIL with standard errno
Message-ID: <abu9MkTs2ETRzDk0@stanley.mountain>
References: <20260318214104.16971-1-omer.e.idrissi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318214104.16971-1-omer.e.idrissi@gmail.com>

On Wed, Mar 18, 2026 at 10:41:03PM +0100, Omer El Idrissi wrote:
> Replace non-standard return values with descriptive
> linux kernel error codes in probe path.
> Also replace the variable name 'status' with 'ret'
> to be more consistent with other kernel code
> 
> Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>

This doesn't apply.  I don't think you're working against staging-next.

regards,
dan carpenter

