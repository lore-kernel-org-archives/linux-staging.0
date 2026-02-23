Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DD236167C
	for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 11:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771846939; cv=none; b=kHC9cYNtKDviheQ+dh04NaT0yEkpYxKaizFcg/BZh1b5ioaJ19/qEfm//0of7Qigtv556c4T3VwozO/ln3ovGI6cPA7QirrtrzOmzziqz11sPAWQd91KdMe2xh3wE1PcGt/9uWOdGSdrkASdkQsyBTm/QSWhHLsxzW2i3lNBf6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771846939; c=relaxed/simple;
	bh=49mLHYpE3xo37+dedDCvILDIMu2GFEX7lt1YX0WHVxo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qr02MAtdEQl4qt+F1QYTAsYg8X/rh9eGm9nqbP3g/nHZ3iPB2X50uBf4u6Ycjo/+yQTwb3nhKsz4itJeF+pTcBs5L+Ccl4rbz4Tqd0pRK9Y03bgJTvZi/MuI8L8QecqkqTs3bNSuT42o6ZkrKk+kC9hj5pUGJHaXtRVzXNv/dqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D3XjoQay; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D3XjoQay"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5670ea44187so3332970e0c.0
        for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 03:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771846938; x=1772451738; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Chi2mOdt0m6vA4F+3/uWzGc42z7Nmf2xKIl2+90856c=;
        b=D3XjoQayxP9d//jMcRN44EdLBDrTIVTP4TXJScXFGWjrIRVY5l3dQ++ScBf3WmgC7K
         8gOmwuDv+p24azpNFXFkwVDlK5diYcxkm2mRLIAeyHEZnctnZ9R9WFLfn5rTwb778XAd
         4fFVoQdPe9C8yq930sU7kJNXKe2VvA0bkqkWCq8k+xlWMkZheD0LoAcX34xYH/xvEE+j
         0ul5J6dhnpQJHQYeQRY4Au6laN79NLN9k92+8f838ydsFkj1JUel/ULCKd0ShQEtEtjE
         n/WkA6X8NDOp1xVLG4O220zrytoBm5SPZHNFUqVgvsuy8Yv87dSkWdvooMShcNRViJ7S
         GceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771846938; x=1772451738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Chi2mOdt0m6vA4F+3/uWzGc42z7Nmf2xKIl2+90856c=;
        b=WKfZUB+nbOFNEvaxhOIVwqB+FndmR/ALqIukjmIW049YYS/v1pBiF/qqWP774OE8Bb
         I0swZgeX92r+KPQ21rHvLEfq91eF1I+RE/MCxEP6iseplaIVYSrH8HHkLv86mPy7dtkO
         tfl2rSzpLMDeRgrGok7iSxAabsO1YrWrngiEoHG3W/GyUxUQh4RHE01ppkuO50ImE5ZV
         7sAUdvVnhMRtvuMTgq6k1TTTwvj3Uqpzqgh74UfA2ZAwavmJsQIc8Xbz88dtvJr6NNct
         OVF+x4G1lOSjzrFKd+7f6ywLwE+ThrwgYe/Ugn77aEcw8d6xBks4IfDI3PVAL1SQgcuT
         VOqA==
X-Forwarded-Encrypted: i=1; AJvYcCV8R4cBXhTGaIvo7uV4R1W81bRnc5JhkOPa21+0lLvrd4r4ql+d2TX+R2Q5Lju632T2LuG6sjuZGCecj7Xp@lists.linux.dev
X-Gm-Message-State: AOJu0YyfpBMXpRTOfkcyyLcv4gOdi8mRudjRfY+UFVgUTVX2mrcazMO7
	2BzDc94wWyWaL05f7wHnqN7Vmhqu/gwHI+in9niZ5z+5rrY2GENN1wUp
X-Gm-Gg: AZuq6aKVf2fXTgwd7btHRoZo6+UMB4bKwkaPqZr/IQNPvULIvJsEWKFk865QPSuMLfj
	874LVCKb8+XTH699zaeNBzHKzyughgD9JaGgvpM5cv4d6PrTRgObNeL+ONDy1v9dzWC54LKidTY
	nXZQMlJvvWmOyH6P43xNH9V8zNRlRHCxyd0yS/BTblsRhxFOZiPfnxydCln3EgE5U3HT7ABUeAY
	+PcIMmCbLoMEnOSPjP0A1IwwTBZpLdHyt1UNEuDuyCPeMnM5GjZ9Bxl0rhQk5shV2Wv0zyqsUO7
	1bzGnovyB56eclMxtLhWXAqz6qbmHdBaHFvyjk5YLT4YTCou49TV9kz/KsgotHKHK2EvSP/i+IO
	Z68JZFLuNLeSYiiBFwa4ISlc8PqpPgGWhPiVv2F7VbDno2RnvamSSwcdSs1Y+6k918Y3fTKftY/
	2aH37qCNK8g5GUVttG16CGJQscV398YMvnkOGq3c+z/aaX0GBTCFweZsvTiHG5xV1grKQKP+Ni2
	b6H
X-Received: by 2002:a05:6122:530a:b0:568:e716:5faa with SMTP id 71dfb90a1353d-568e71661femr2754358e0c.13.1771846936798;
        Mon, 23 Feb 2026 03:42:16 -0800 (PST)
Received: from gustavo-arch ([2804:14c:f25a:845f:5b8d:2e7c:d238:2d28])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-568e593a666sm8285024e0c.17.2026.02.23.03.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 03:42:16 -0800 (PST)
From: Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
To: gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org
Cc: ovidiu.panait.oss@gmail.com,
	gshahrouzi@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
Subject: [PATCH v9 0/2] staging: axis-fifo: clean up probe logic
Date: Mon, 23 Feb 2026 08:42:05 -0300
Message-ID: <20260223114207.3639-1-gustavopiazdasilva2102@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up the axis-fifo driver probe function logic.

Changes in v9:
 - Rebased on top of staging-next branch to resolve conflicts 
   with recent structure changes (pointed out by Ovidiu Panait).
 - Added Reviewed-by tag from Dan Carpenter to Patch 2.

Changes in v8:
 - Reverted line wrapping changes to keep the diff focused strictly 
   on logic refactoring and avoid unrelated whitespace noise.

Changes in v7:
 - Rewrote Patch 1 description for better clarity and acknowledged 
   that the original code works.
 - Reverted variable name and type back to 'unsigned int value' to 
   minimize diff noise.
 - Removed unnecessary whitespace and extra blank lines between 
   function calls and error checks.

Changes in v6:
 - Removed axis_fifo_get_u32() helper function entirely.
 - Removed all dev_err() calls in parse_dt.
 - Kept 'node' local variable in parse_dt to avoid checkpatch 
   line length warnings.
 - Added missing "---" line after Signed-off-by.
 - Fixed checkpatch style warning (missing blank line after declarations).
 - Ensured newline at the end of the file.

Changes in v5:
 - Added missing newline at the end of axis-fifo.c file in Patch 2.

Changes in v4:
 - Removed extra blank lines in commit messages.
 - Added "rx" and "tx" prefixes to error messages (removed in v6).

Changes in v3:
 - Split the original monolithic v2 patch into two separate patches.

Changes in v2:
 - Fixed checkpatch.pl coding style issues.
Gustavo Piaz da Silva (2):
  staging: axis-fifo: use u32 for fifo depth flags
  staging: axis-fifo: refactor device tree parsing

 drivers/staging/axis-fifo/axis-fifo.c | 59 +++++++++------------------
 1 file changed, 19 insertions(+), 40 deletions(-)

-- 
2.53.0

