Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992595;
	b=oC3ng3XvTfs/+zQSNfspM2nQSmwlPRhTqM1TMRfbfM6au+LKRZJZHmU77IL+9Me2Ssvg
	 4TKHkXPhJe17MJcQE2F1paNmPbPLW9i5vKefzS0Y/1/b2LkEmTEorkWtgFRe/NWcyq+1m
	 7U2QjyzjVbEGnoPWMpNOAw/6pcUnFy9j5xrshT1ePRfDn1GVtyloAT/tS9uG5yh23YSpf
	 ycCh34OqhJRn/ng3ykiTC1uv+bzYXqrLHxDnoVDGzcujo0IrfF5uj3zKgsN41zGwTYQf6
	 166FlZ5omAfkvSBxD04NQYsqGk/wqLe7+jzlGei0BB+ex/WAAwx772/5HZLE2XjId4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992595;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=95twHbzeA00heL+oAogGUGCTEC8PNHef6y6dTCesOqY=;
	b=D+MIy6qsebQhN+0c0E7HYGh+4Nq1mEfF6NK7S7Q+2EQf2saDN7QKqhxW7ifabzEVPkLP
	 lMtIgOV0AeqLeaqm1+YGFoqpx9gdS980ewRY3oINLoB0861mQ3YFB5KBCF7kB+WjUYZaM
	 /uy1veLOg1AIgqI7AqWQQjzGvPfpMo9zEeoztPh/m0sAcaY6bTyKhEz4bDgjdeg2pwEJr
	 tJuSiPmrYs3/sLP8EPx/P/kaYwJHdikdO3pW/jTVGNJ5QOCZoOAHC/XripaBKABXFRkmE
	 6DzeoJsn4ehsyzh+8aO4nufNTY8/sEERuNQHqVAWId2Lna1GL9Y4iMaem4hzWK/ShQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y8NWHG3O;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9844606A31C
	for <linux-staging@lists.linux.dev>; Wed, 18 Nov 2026 09:03:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9844606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y8NWHG3O
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so6006175e9.1
        for <linux-staging@lists.linux.dev>; Wed, 18 Nov 2026 01:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794992593; x=1795597393; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=95twHbzeA00heL+oAogGUGCTEC8PNHef6y6dTCesOqY=;
        b=y8NWHG3OHQ2iTXwMG+8lQk6o5vMmArWIerKRH/sQSW0kUcGooZWzP/S01ejOhFdYYr
         +9qNt5+0Iyn0zdGqo54zy/yOXkGDq3u8u41nwjTph8WHC1/HRzyL0AaPuj6XKzzTafUm
         xGs0Uo2aUFbPluLcdFoUW2qtJ3HaPDgmm/qDhDMifAhbd3ExGrcFBotEmUz2baiojXit
         aVsi+db208FvAt4XlAa8qw9+tZr4HtSBzBVPnVUQgWChMwWA7vndqsQCB0An7MgW3rpc
         T9sNIzGImx0836s4n5hYRq2XYp4VRifSCqBIZrrNw9dCZ8TmNluSmak38Yp1oBjnvyse
         CFoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794992593; x=1795597393;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=95twHbzeA00heL+oAogGUGCTEC8PNHef6y6dTCesOqY=;
        b=aW7x7AcqAZCeSVVZxgYIjqCFai5YIsn4YklVBQ7snmxLHmVX8b/Chgyz1dsSBYzoCh
         DcCreJBInhK5+wxRUXWunlKkvXXE/NOn6ktnmZ1J5m0sQkssuDFnue9AWMASGMSnOaJv
         XcY+MCqh4xlOZ5asweynOleyK70zNC5+0xWYax877SPibWYw+F58A1ZHnwo6Tx025fDI
         tUL/3chlOTplP1UUeYEmpAZsEMAcEifFoS2bf/myNDXr2fi4r4KtxFUEJK8zuO0cAmJN
         eJtZ18I2Wxz89y3Zae1pwYZwFMdNbdKMAEXza3tSyozE6C9iukuTdaGooy9rdfnXhrbG
         iiAQ==
X-Forwarded-Encrypted: i=1; AL+hErENfzBGB+812uayGTIDUYqtzrr4KMxzW74PmlU/D3UgnbUqRPjdz/I/llN2lWUvOWlHEvra3MUP7NDtP4K4@lists.linux.dev
X-Gm-Message-State: APuU4Z8MCxvcpuapssg6VDOO4tuK1YODw4e0kHneFq4zQ/O1XLM0dTVs
	8BMtrrzZPWthJ5MgKFh7nBDzGA8DguOHKzI7+sVxBHPZf79II4IfrOVn
X-Gm-Gg: AYBFou3TLe36eqEJn2XeOCp43hWjfWEjQk10Sz/8tdqONYcltgj0f9+ykls7EWBXJIS
	b8hmxRxzbSbc93gOPcIAbn0EYxBdLN26TjnU2u0j2+fbYzqoW64ZDUnnUPgOsAbrjzZlVKQ1+A7
	Xzo6vD3uga1ut3GRodIpQdBrQDZBvHm6+dHO1E1S3HuTWzxjPenqSuxOWmBvzW+6X4xs54+RMuG
	25umHOUMtrb9ilGsUJ8rLX0eB68AyrcNVXRt8QPkseXSA6N0p6Wz4Wq+cQD/mImsoZKsRYd//wK
	lUlxshhV2bfizuC+AwULoIXKJLSLGoWU5Do9A95WFO6rRhbYKq5pI58Nueibb9dXhiT85aSQPym
	a7oXCYG9ODeyaMQvCg42r1YiJ09FJqICNlx+ebhWVbPfK9/DVipQ6TB7fem06sCQvD+O4mq4GPA
	stVhpim2JS5ht0sKJYtFz/pxW9RrsY8wXWhcpBreDd+PYQ4UyeBtSxvA2RQ49GUMPFC8inZ3bUX
	XtXLhSAurIkRsdZzvMJgmy9NXcPhERijwwPNvwnHn3ulNlnRHDC4i5c4eEBe0W7WlUk78AvlgrN
	63ly4G5NsGmc/32fMn0c7ovtxMv3d5LGc2szPifjrZVMQ/Q85OkidIR6RVjEOayD5+AwzjmYeC3
	owwiZcJxFMjYR0AXbMFgCaTr8Wp9gbrmBz9p8k5vfATtZebsh/N1EhJTLJv460t/iJyMXd8j64h
	CUu+izSj/zebIE
X-Received: by 2002:a05:600c:4fc5:b0:4a2:392:9de2 with SMTP id 5b1f17b1804b1-4bb7da3ad9fmr32336225e9.28.1794992592998;
        Wed, 18 Nov 2026 01:03:12 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2b979bsm50596605e9.11.2026.11.18.01.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:03:12 -0800 (PST)
Date: Wed, 18 Nov 2026 12:03:06 +0300
From: Dan Carpenter <error27@gmail.com>
To: DelaySystem@tubot.lat
Cc: slongerbeam@gmail.com, mchehab@kernel.org, linux-kernel@vger.kernel.org,
	p.zabel@pengutronix.de, gregkh@linuxfoundation.org,
	imx@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: imx: ic-prpencvf: add FORMAT_TRY
 frame interval support
Message-ID: <av1pyqEEPqwG8gz5@stanley.mountain>
References: <20261117-batch1-m2-prpencvf-try-v2-1-dd331ab13137@tubot.lat>
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
In-Reply-To: <20261117-batch1-m2-prpencvf-try-v2-1-dd331ab13137@tubot.lat>

On Tue, Nov 17, 2026 at 04:06:10PM -0800, Maximo Manriquez Lizarraga via B4 Relay wrote:
> From: Maximo Manriquez Lizarraga <DelaySystem@tubot.lat>
> 
> Implement frame interval handling for V4L2_SUBDEV_FORMAT_TRY
> by storing and retrieving per-pad intervals from the subdev state,
> following the same pattern the driver already uses for TRY formats:
> ACTIVE intervals stay in priv->frame_interval while TRY intervals live
> in the subdev state.  Add a PRPENCVF-specific init_state callback to
> initialize TRY intervals from the active default, and move default
> interval initialization to prp_init(), which runs before any state can
> be initialized.
> 

AI is great at writing monkey see, monkey do commits but it sucks at
writing commit messages.

What difference does this make in terms of the users?

regards,
dan carpenter

