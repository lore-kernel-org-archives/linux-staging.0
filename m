Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795498648;
	b=aamJjGgVx6mR9jikVqqijlsfULWJlrlcylDqX+zp6NRJC8ltVrE1yT7JyMNVVgSQagem
	 kTZePKSk/21qEokgLh6VbJCNsoOaCLLeRFwxiAzFWXfZcgp18GdpzUCkYuY8ShBx/PZ/r
	 j0uLQQq62xN+1i8jZOA0oFpr91F7zFAbJYKKABoW4jlsIu/IWFz6nY/rjQyOYnvOialyq
	 sTxgKuOqpvwCqrCmHUiXIjKrZF/2aQqmAuGLkOOoktLr1ORw2rFkvlE+b/hRTbQc5Pnxy
	 ZbHsVKD4oMznTIzegpIvnnRSMy0KkRcw2hBuUgG89bmTvM3qS6ZuP2c6QUEnykRN98A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795498648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5aErT2kLIK2X/FxAJIiabzmuR8QnG936yvowVUxXauc=;
	b=libh5DICMzKVdaA5oIXqtERnp1lgEdtlHd7exiWbRxf+V1qznOTpoSj3wB5xdvyiCXCW
	 KEtAv4qx6c6k8y1EI0K6etDpeYQ5uBIN0NmLsVcVmPvJTs9rm89WPJg0TILeajwt24K4Y
	 MA/aC6SeKZ9GAArixj0TN/ykKDv2tkVW3COu0qsVS2R3XCsMJ3wQ6RODTI0CvpILGTWfN
	 wYLBcz1b3BNfyY3CD8lad4Y/roArE/d0XsbmylKm3HBK55Byo7ew/sgwxSZO6WJz2rG/8
	 7KPt1Xrvo3fT/y83sMCig1CauacB3RPf7ibw7Uzn78pXzU/39wcDxjeeINfKLmahHEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JHejZ3cn;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C347606A31E
	for <linux-staging@lists.linux.dev>; Tue, 24 Nov 2026 05:37:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C347606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JHejZ3cn
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a210470b49so39480925e9.2
        for <linux-staging@lists.linux.dev>; Mon, 23 Nov 2026 21:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795498646; x=1796103446; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5aErT2kLIK2X/FxAJIiabzmuR8QnG936yvowVUxXauc=;
        b=JHejZ3cnrCqSvKjh78RsU4o+Zyd3v30zhrYeqZzKvF60Mbvcu7STpLniEZM5bF9kOf
         rq2DKUqgsRp6aDoFT4jnEjn9z7Qh6gxw6eG3bpnzGPj8ciTF22YrUYxGnE4DR9Am286r
         xV5qMFeTpKftFka3r5zk3ZtGmoBViXhp1XBIbYpU07K7SyL6lltpgBk3Sf9SBKsdU0lm
         K/ZhvJknwWlhTdlIWQUgkUv/FEbQsDesixg6GFO4/1t4ekKQ9RYNmfuQ0AmhM+BJXYWc
         ilynMqvNt/cQmCHoQpvXEPv5v7HNph3ZEXq/3//i1mPWdyozigyxdHIIU3Svqr8tw8Qh
         91NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795498646; x=1796103446;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5aErT2kLIK2X/FxAJIiabzmuR8QnG936yvowVUxXauc=;
        b=pKQXFmsYbCTc57x5klcylt+b3aiNYkvC0o7R/KsNi+ZzPbUSmbst4XmoD+x9D5J+zZ
         kfMT7NPbCHTCIxlAQtd0gkljG9iBxi1KBhvnPMNqxDvvUnIkw4AIXDD9p9uNZewN/1Qm
         R2vsim5GeUMJAEodTULYXOVAWLyftACii87OTE93KRK904MtI896qcnRkDbc99DOliNT
         iLu2SghYmBVSE89MFhhcLAWnvA8loLjnB9xSYIRMRsQ0nvtZhw38MQfbvEhEJXq3MjJl
         t77Vg6Qusea7lJgJyC4cvAG8h1FaqUVscC1pXkVpQijkf6q0GH6L9T5HlWd8i4iILCbq
         nh9Q==
X-Forwarded-Encrypted: i=1; AL+hErEgpZMLt/Zt3g9R9WF4UbECCLWNoStZom/ZzibkoyUXSWmK3e2nRKmuVb/9rYKxsm99+0Kg5uVLxpYOvc6r@lists.linux.dev
X-Gm-Message-State: APuU4Z/zYosz3LFaw+Ppnmor9Hu1pVhKwqHAf0QfMhVpDIsZ4SkABYBX
	1O+eto12qdC+r9HSvHib/TEGpOpk3VPooreq9XqpKps8PX2+jh+6vbV4
X-Gm-Gg: AZFdTZfzBUcbZiU9pcO2edAbF3NAY1vNt+Ttv6TNU747n1aOjimRY+V+vPta1wu7zuz
	/LcrOaYyHymymesSHpY4CWhIW727TGRtyJ48ace77SsOG92i/3sf1VzG3XKNJxqpXHwDBAW1ZtZ
	x4HYfuHZ6/LMfMHjrg56WFSiEY/kwP2ZEb00kcSUoZjMFnDXUYfIdA/hWwpwxDrG1WALQMNPCYm
	o/8Cpzpn5PCXCnkh5kN2DWucjf4XGjjDisP5UxczHh+1gzMAe48SbjaHCjpv4H4cbvtld1jZksO
	zGfSE+8igOZrsFwcv2lIuA66FSiLtAvn9Mmf29xKzciundtCJuQSS/lv9jaWmi6+Oq94I6S83Sr
	JdAKqxRgACsR4ucPpC8NMGPp42IcVIk+uRhtgrzoHjkoZN75f6Igx8NAI8WQ8bTVEAXoUcR+X5X
	HhBpCSdOLhMQfISTWuJYPzhu3cBS8q/zRReL7WEYtUot6Dg7qzBjJMBYlAQUJwzoZX0eRftsDq4
	ywQqZqcM5YB9DoZiIjDemfflqs/qLWXY/84E4RZxI4PBDDiaTQzkd073QGDtqhAraAfqU16Sy3Z
	4+5apNSEjV2llXSr2J2p8PiSEoJvK7qaRirqOBBJD35NH2dqziIWzuJZZV0s8oboI8IzGyhhBZL
	xlsDPpOMeFkPL7Ab25+ynFSSZ1jG3QMG4O/YL2aM4BMEvHxTSzmbEndAtHHPteixgMUM=
X-Received: by 2002:a05:600c:4e43:b0:4bb:5bf3:8ee9 with SMTP id 5b1f17b1804b1-4bb8893c2d4mr277734055e9.31.1795498646496;
        Mon, 23 Nov 2026 21:37:26 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm323959585e9.0.2026.11.23.21.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 21:37:25 -0800 (PST)
Date: Tue, 24 Nov 2026 08:37:21 +0300
From: Dan Carpenter <error27@gmail.com>
To: Jiaqi Shi <shijiaqi_develop@163.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-staging@lists.linux.dev, slongerbeam@gmail.com,
	p.zabel@pengutronix.de, mchehab@kernel.org,
	gregkh@linuxfoundation.org, Frank.Li@nxp.com, kernel@pengutronix.de,
	festevam@gmail.com
Subject: Re: [PATCH v6 0/2] media: imx: staging cleanup and FIM export to
 v4l2-core
Message-ID: <awUika9V8utfgFXc@stanley.mountain>
References: <20261122114205.494704-1-shijiaqi_develop@163.com>
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
In-Reply-To: <20261122114205.494704-1-shijiaqi_develop@163.com>

Please wait 24 hours between resends...

regards,
dan carpenter

