Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770B2343887
	for <linux-staging@lists.linux.dev>; Sat, 10 Oct 2026 07:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791618960; cv=none; b=V9qhIp0RWeucZEQQarYKpB5L1zPN2tNenrVyribmBv/uo/WbuSRs0S2c5LWYc03hAnEbwhweLjPGMKl6lXSvQUM5R0EUuvVOxdgXtTSL0cBdnCsNYL1meBctCiVD01cqIdsmcZj/jSsSZ4ThKWBKCmXg7BIeW+8bgdVyj2p0irc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791618960; c=relaxed/simple;
	bh=Cafm1R3+L2oUTrGOudgtt9cCYD/nT/nJTwjhiLYVvUc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cg/LO15z8NeniBi4QCR8330Iq0ccarf6hpHMQozk/QYeYkKtCUkkbVuJ+2qghV7vqCGaRmnq3gNIdJcmK5ZxPvYcX+MAv3u7k9Iy11s0T6+vxxhzS1IdeUtKdChYY3PviyZQG6ioYYpKAEDM3W6Zk+PNx0j1IbvYbZBCJ2fUK50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cme3VyH4; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cme3VyH4"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1923f15afso371905e9.3
        for <linux-staging@lists.linux.dev>; Sat, 10 Oct 2026 00:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791618956; x=1792223756; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cafm1R3+L2oUTrGOudgtt9cCYD/nT/nJTwjhiLYVvUc=;
        b=Cme3VyH4ypgiNdVqnPhwuHgWG9OyNa73cyicmfM5b8nRuu3BAYBpHlYQE2SZ3pTstF
         LwzGCA6py7gzU015EbcdlVefnPmX2zLMb7oH/Edam8UmXAHF+PXDJMnwZIJfpGri0pC8
         fvWgC85MKKzCaHHZybgTlodDDghflgjz9TpQQkWY+BySw3fgRjqbXDH1oDoB06u4h/Nq
         qHzpW9/yQJYt8Ouzku+Ru+tJ626zSJu5AXxrx3j0KdGYpB0nZrrQzWxWbmtP9g0vGEUP
         FFfgJEI97jXod2YE8ZRIT1ElPfV6byYVLN1F1gW+r3UB730RfQthCFgb+lWvOzaEC1HG
         cOlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791618956; x=1792223756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cafm1R3+L2oUTrGOudgtt9cCYD/nT/nJTwjhiLYVvUc=;
        b=ytSqNtTPDDRQhDobQgpyQwcxwV+NPHqlFBfwGXFpKEHSI8vfewSSW0y1d/pTqkX0Fs
         MPtDL8ySVA+/YFYnfqKjajszU/WAfiSlMaNQxL4Mx9UTgPRiOi9RDOWYVZkJaL5UccJh
         enrZhx1v4XCWn9JzbrRPSoWnzubmCIfwK4uCzn1yQkOBoIv4ZDdpE6EUslOlGIFrGCQg
         uVd485T3YYURMEJ/YD12ROKr6jbFb0KCzsOTUxtGm3+w9iFjFWnDedPG7noEbzrbMgh6
         bCB6FeKfPZpbtAuXwlhaEpvmPC/nDMOJPkZZzKtHBXCbkD3Dqchi9LqVkr6IVYYCa95Y
         4c1g==
X-Forwarded-Encrypted: i=1; AKwUvByYT12wUzrgCqBbYJ4Q2RE5NMj7esz1jbvZ/yVb8fiIlOAQDm6GIosJPTKHo/MJ2W06DFhI7UW9253r4i/w@lists.linux.dev
X-Gm-Message-State: AFq9FYL3HwxHwnWPSJFjcnx7XsEPT6sTuI5kcHs74tDCm0udrx+uzql8
	9EX2q+T8/1QRKLVI9BGwO38e2e5J6G8snj+JGp39zmre4SUXk5ldUoux
X-Gm-Gg: AYBFou0Mtf1fQwostCWa0Vi13nhYUH2DPdpttZ/SYA4OydMjp/hYJ5toSxLg+XkGd85
	nGGm+uo4itYXQ/uAbBfjjyQlxFBJMlfd1PlRR8p+i4KnPGSXl16myHXSphpcQOs4kSxRmYtuq7J
	f1NVz8fkXiTjsq0vFMT8pzQ/TEcKBjIJdPzONVdwSf3NsC1lBfaLyss1vF91aOLp/rKgyHzi8N+
	9oqfXArjpJeHbYxAlyOxNwhIsKFGyQvZ1lMG0JOlp0yVKqT8X2cf0EDtKNYcZFK0Bs0eHExb0SS
	Trlpb/eiq5cCuxfddUxPiTkv6tDN0OiiyEO3p3gVud2hD1h6hzEna5q0EcToZuNWX1OHmc5diuW
	qJWtpTu3ry2xgGFgNBDhpfXi1x2ZWZiiC7aqMQ2id+g1nwXpT3iCZSVafIRcvLt+BxKYplaBra9
	wpzpUsrkn0nXb9HmoT47HrCQydLjZMJMGMrFQySDMgxzj8oxD4i4Bz91sBSYgUDuYPpSJNP35QD
	B9NGeVEc0f6K78/X/kJJ6owTg+zn0fXe8LE8NF229STGKk=
X-Received: by 2002:a05:600c:4e91:b0:4a1:7ec7:a479 with SMTP id 5b1f17b1804b1-4a18e4f56bcmr86747895e9.33.1791618956290;
        Sat, 10 Oct 2026 00:55:56 -0700 (PDT)
Received: from Cachy-OS (159.red-83-38-226.dynamicip.rima-tde.net. [83.38.226.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18e48db03sm159234285e9.3.2026.10.10.00.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 00:55:56 -0700 (PDT)
From: German Pablo Lindo <germanpapulindez@gmail.com>
To: lsa.uz@pm.me
Cc: antti.laakso@linux.intel.com,
	bingbu.cao@amd.com,
	germanpapulindez@gmail.com,
	gregkh@linuxfoundation.org,
	hverkuil@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Subject: Test for [PATCH] media: staging/ipu7: snoop ISYS writes to capture buffers
Date: Sat, 10 Oct 2026 09:55:07 +0200
Message-ID: <20261010075507.19629-1-germanpapulindez@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007183311.24637-1-lsa.uz@pm.me>
References: <20261007183311.24637-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As Sergey Lebedev, i experienced the same error in the same hardware regarding the IR camera, for some reason, the image displayed had horizontal lines from the previous frame, ruining the image

I have tested this patch and i havent seen the error again in qcam, i have also tested the patch on howdy (wich after the needed configuration and tweaking, now seems more precise or at least more responsive in detecting the user even in positions different from the original one configured) and if it had affected the other IPU7 cameras of the device (The other two cameras stayed as previous versions without the patch)

Reported-by: German Pablo Lindo <germanpapulindez@gmail.com>
Tested-by: German Pablo Lindo <germanpapulindez@gmail.com>

