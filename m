Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792952354;
	b=eLJSCanqlLxliiiR5qRBk4vMB9195VZhokFVRSiFlFLclgj2Q250V9Zpc0QoHDdzgajD
	 UrJyZYEp9AHswjKRyiSFMQkpYR/1ZHnJyI8snuXt1b/3fCgPmA9fEQvo0x2t08KiAquPw
	 9d0+XOmjlNTpWiIo63KpPVF11tQJuyL5IPdnlR2HTVU6++vdKEeKUTTH5hFz/Hvc3E/DI
	 MvjUNUY4I1dBA70qeDUCwSDbDjdO6Jo2rt1zHD32x2g94sVV7qOqXn1mhn04Vb3Vxy5rF
	 E1xYF5jNsmWui6pPY++s9hsYGxP+z4i90r7J5nQNn6Xii9xEhbl60BWD2Dx9G2Q5mwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792952354;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=zm2aYmxX6SYlgH0yTM3NHAOca1bMdwRynpuDzR86ld0=;
	b=blIfF9GhjLx3/It/VOqoY6NvkBFsa69u37emZWQBhefh3Vg05up8IQZhzrr0BsxMZ5aK
	 q7TuO92qe8RHevPXxCsMsQrWkLibKrbfGqEdhFpOj6boN/94yQUpKVMm7wWu7/RFLA2vh
	 WZz3tJzDy5g/r1Lc7GTCsKdaXiNEIQPWa/YWtm1W/tnlxxQH97CQpEQ9ZgbWnSnI3hvo7
	 7LRZilEUyJ3ESP139m88hOBaBX24no/wJcMx4nrKdt5uPF4jte9+0biQzz1ZOM+n0qNpD
	 lnY3eQI8IvSE5zN3WLWY4O8WDen64XdMmkShDWyvGFcAogYSKS7zXdReAnuK4V9KILw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dtwJjjAK;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74A2606A31D
	for <linux-staging@lists.linux.dev>; Sun, 25 Oct 2026 18:19:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E74A2606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dtwJjjAK
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so16936435e9.3
        for <linux-staging@lists.linux.dev>; Sun, 25 Oct 2026 11:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792952352; x=1793557152; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zm2aYmxX6SYlgH0yTM3NHAOca1bMdwRynpuDzR86ld0=;
        b=dtwJjjAK53l1m6Q6jWK24cmje7arRaPmpV68rhfVSVm7StBH4RFUbEq6JIa5yWCCna
         pCnVA2+7C3EVXX3h0RdUNiliHufYOMqBzowxbn4oclnbpsw2Z2+ehhRZ5ONedO7zHGNL
         o6OFeceatRANr4z5KHhAUUWVRV0Cv3x7TshMmVF8P/N7Qsw0Mqvn/AKeGv4jyEVjJfKh
         Ujo6A8MjinSu0F27782ZszZHF969/UqmsDTiDU7LMmSpLdVDIcEYjST1adzuWKgLKCjN
         JULc9NDL8ZestPPgJw7EIPq7YRP6anv6+DdDXhqcH5gC0wopW8TOgobxJZL4f0s/c8Y7
         uykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792952352; x=1793557152;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zm2aYmxX6SYlgH0yTM3NHAOca1bMdwRynpuDzR86ld0=;
        b=KsNzsGJ/9x43Gwk9eJD+U5/K6aQmUkom0FS7To8RBXudVNsR9Zz6bafyUodPoGrWCV
         mThl5Dh4ZMdAjVSkYJ7j/rxibNnzEfaESF/FAffrWfQMAgTXKTRJRa9iwQ3m9sPfilhy
         ROANzQtJ5DQanjp00imSyv4VABb/41CUmLJY/WFXLtcAMTaBTZCII4IhhD4xZAVREWQP
         X5/pWYJ4sQ4hd860E4rokVV9wH4GktJhee6CV8jJaao3ic31u5DBFkmg1Sd12Fi0Bddg
         4kZO2fWh+N+u5JZGJEGbATA0EvbC6OItuonR2VBp9Rn+FBqR8f3sffe49IChwid29N3L
         1CLw==
X-Forwarded-Encrypted: i=1; AKwUvBxvKD195v1QvlBovIsdR23rLjZc47cTESse8gmqw0oVsX6D+Y7RBf5BkVFGZ4H8olldlndnYWM8AeGpH9co@lists.linux.dev
X-Gm-Message-State: AFq9FYLaEgP7ndEO5FPEUMBDnWJDVpAoepJLrpY+AwvGhe2cyHFCrzF+
	x4yp4f0FDU3myppcuxjeXxvSYjPdTtl2tQO9nX1K0jHFEgE8yIWO3C2P
X-Gm-Gg: AYBFou0977PoOyRQaz3L+vFSthygiqqsFARn3t0qad2RABchDt38fvnwuyeYWB7IA30
	8dIH4+fa11ASzJAhx6x9Cf2ABoOTAPp452+XbL6mUZJnUC6Esa3A4JD5bQwANty1r80brbIPXDZ
	ChwT5TTQy6uqawdNX0hlyP3/ylmND72cqk2jO1UmK4dIGe2rwdfPMAtjSilbqJZV6grl9d5MBjO
	CMOPzHnzpBmiqiauhoEkWhA9gjDqIIAedjverqHGzlwccaWepmQ7eQfIlG1di8vTw9yUQ8tde6c
	Dn/zrUJOCdIQFSCG5CgT+kUii5jvzJzivdy7yYkVZJdkyaPwvFPTDi6+UFTetQCouI40kjK6Wo4
	R0jlvsrxJC06VLRIbQWTaWmUel/fudfbZmdgQFoR6RqGU8r6sVoDhKPjgUx65BqsgfD9Y4uftaq
	BKJ1aMwc9g3zKqabFAJYR8+iOCsi5JU5DGr84/Bty3b8QCOr7PDpDjv9Ihk4AqXt49v1yViu7eS
	DE0ChbVYyS6dXI1ql88WhoMq2nuOOLuZ8YfCJDs77dwwgjA1pXR
X-Received: by 2002:a05:600c:4704:b0:4a2:190f:cf6a with SMTP id 5b1f17b1804b1-4a35acc2ea1mr76729215e9.35.1792952352084;
        Sun, 25 Oct 2026 11:19:12 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a58a293sm137475645e9.12.2026.10.25.11.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 11:19:11 -0700 (PDT)
Date: Sun, 25 Oct 2026 21:19:07 +0300
From: Dan Carpenter <error27@gmail.com>
To: Haasham Khan <haasham93@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: sm750fb: remove unnecessary goto
Message-ID: <at5IG8sRxSA1AFC8@stanley.mountain>
References: <20261025130258.10747-1-haasham93@gmail.com>
 <20261025162632.7186-1-haasham93@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261025162632.7186-1-haasham93@gmail.com>

On Sun, Oct 25, 2026 at 04:26:32PM +0000, Haasham Khan wrote:
> Return directly when setting the mode timing fails, rather than
> jumping to a label that only returns ret. Return 0 on the successful
> path.
> 
> Signed-off-by: Haasham Khan <haasham93@gmail.com>
> ---
> 
> Changes in v2:
> - Return 0 on the successful path, as suggested by Dan Carpenter.

Thanks!

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

