Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708A238C2C6
	for <linux-staging@lists.linux.dev>; Wed, 24 Jun 2026 07:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782287302; cv=none; b=mQOa0E5Z8xyDhdck8OxobTTuK/KpdkCoBctlz1nyqvLxwLLUMbjqRl/xLBPRTJd/y2XrU2q6KaIlC+TwpkVHQVHGWafCZ7lJHXpIgnT026+qmRlWDgcdrx2sCf7GK7XfIvsN2kJ0rd8/hHFU8aGCTzyI2heWGq/6Kacl3OmddEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782287302; c=relaxed/simple;
	bh=VuSzdW2MJov1ocYqkr6jypibzL/jxZdpgTXoZ4Ka2DA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oxxGVkQF1pY40lMJKdMuYXNFb5BZkW5RiqLBQ/LO7mfpcruAGn/pgA/e1XAYX8nFVu6Ox/8vq72Ovkhlk3XIAxokeM3K1Ms4U2Xo3y+vE4GipdySoj44wJF+fybWJJe4SmTBSA8f0g7N+aza3dt1uzoW88HxoW11GMzSwxsCbzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=HCOwpc7z; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="HCOwpc7z"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4631679f204so913519f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 24 Jun 2026 00:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1782287300; x=1782892100; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VuSzdW2MJov1ocYqkr6jypibzL/jxZdpgTXoZ4Ka2DA=;
        b=HCOwpc7zr8srRjqrbrsnDo5P77jLcIhiagFPOJrrquKb2e+G13mrqoU7xl0gTGle51
         iYY04x0EYdgVYGJpUhLILG9lp1JbT83C2sHW3R4Nrt7wkYdxpJbh4oEj62PLJ9SwQy+n
         TANmV1u7dERikJeBkfsG2RrcVo+YAYu+UyYtzKZFte/JIYINWlikp8QxwLuVPv5apkBy
         y6SuYKPV3EIu/TJGi09EweQki2/t+VhyE8fx8Wql54wBigyRx3PoVsT4QpLpe7RfzHqU
         zseotJMC3QWWnZKbQ899HG45LrpZrEPgqAZEl1ZRQ1PBACJgOzXvInWF7GSONg3abRSs
         X0oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782287300; x=1782892100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VuSzdW2MJov1ocYqkr6jypibzL/jxZdpgTXoZ4Ka2DA=;
        b=Q3LRZXS5129wDAVbCfmvElkT+m2W+shPkE8xzWXKQXvbc7iBHX3xaNyq5Ha92Uoqp4
         tJ68Ht1kiNz9vYpIGnlK5eYVGGYCoHZGbqQqyN9++6KQuF1kGJVBJe8im36W9JRloWbv
         NyVuzzTLktXyTWs1x8EhQPngk6D+EYhbe6Y5whMLhs/hwilVKJuVhhPQgPget/JbWyb1
         qZU8+e5wkqq07Ctag7M2p3wtoWHsO7SU5sFvLIki6wmSQNjn2LJ2mbDAFEApy2cEjqOr
         mMQZFMKBZ7MJZ3bsCckvj0G3jnUGlvTSJirOso2NkXW4kWRx47qvlFyiEOij7lGyMjYA
         LQxg==
X-Forwarded-Encrypted: i=1; AHgh+RpNnpO4W2bdO0Q0gwm2seF+Z4ULAmUFM55GsnWIlaf5nIrs5/9UycMxEDxjAuWTQ6x0psujKWZDKb5oUEaC@lists.linux.dev
X-Gm-Message-State: AOJu0YwoExxn97LRay1kU8vyJY3jr53NQoLKakGr4nC4ixpmtjcJ8Hkm
	SF/oJpdOE6P/JJgk3rk19FSiXWa7ufCKNIAa3G2qVJrLtlVeSKjlJarCKjCrGpyZL03Updp5sGg
	e38/zPPrq
X-Gm-Gg: AfdE7clD0OVXkR/05WZ8+PMJ8VNlcAW90waQ24uRxu/tgNsWP43Jk8qCX74TZQ8Z3MH
	vBuwfVTCSb7FExu1bq//ASIivpc08Cu0CSyqSDcADSUwAajXPK1vxZRyUCaEwffiO1CGldUaPcs
	RGhYsMDaGGTUGGYVU7xUKk9P8KCraJSETaWy5o1Q/waAkl42XO5PqlPFG9zv/WnDElApa2rGqGR
	/V9TfFR/TQ7FPJgNBEEoz6MnggqGio0vgwO6KKxEiBYlxs4Dd7RuOdTT0pOkclYg8poa2tbt2Ti
	mj7oqDwF6bMW5yrvCk4qmpkI9kmjZW/6o49kE9dR3Cp/Zzs1VKnUP+V3hE7YJWfZAToOIQzc7Da
	9llW5MtPyoAtN7jsA5ktVGLAU44giex+jkS64CDZYA+b8thattulgJOj5Wb3pD9oYPJrzEzULWE
	IPIFa9NMw+zseh0Lu0TBJf6/SPj6K2gvVavh840E6l4BZ5XtT0OmSvfB0NcjQMzybcMM7IJokWk
	BrkmYB7odEOQXfSIQRkeqPYfxHQWvjuc/k=
X-Received: by 2002:a05:6000:46cf:b0:461:a15f:7aa5 with SMTP id ffacd0b85a97d-46a806bd4e0mr6838960f8f.21.1782287299681;
        Wed, 24 Jun 2026 00:48:19 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee01c6csm4737620f8f.14.2026.06.24.00.48.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 24 Jun 2026 00:48:19 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: linux.amoon@gmail.com,
	neil.armstrong@linaro.org
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	hverkuil@kernel.org,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: meson: vdec: fix use-after-free of decode work in stop/close path
Date: Wed, 24 Jun 2026 09:48:17 +0200
Message-ID: <20260624074817.27801-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Anand,

Sounds great -- please carry it in your series. Glad it helps, and happy
to review when you post it.

Cheers,
Doruk
