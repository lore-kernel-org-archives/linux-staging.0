Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F3461FCE
	for <linux-staging@lists.linux.dev>; Sun,  6 Sep 2026 11:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788694876; cv=none; b=t5398hxKuCJvdKDfEV6wfOe/cNnYCmi4p2+P4S+RO8xLX9ISPYVBoHQuL9PXlQOmmX7LKb+7HRyoAWOdBJB7AJ3BuV7xbf3f6YJfstE6Dxa74wH1qvFQUHp4mwBXiVzcTLJ9EL7feGfCpP1neCbvBIY+Srnca0xQ/eUC5Dj4aKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788694876; c=relaxed/simple;
	bh=L7WuRDtKownGDfemfPtuBDAiWjwoIi+XSLXQ2oaKJoA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hmwCC3H46qdLY4hk2BQ+d6N8A+YQ4UDBfo7ePahwYlSZgeGKamc/9kLKSnx8LfFCyTGYS3pj0U9jaudUPtOHo5zpbawCS1QNK6ibU6Ec1qg+lTogUAh4g5KZZP6zu4lQo+ef+wugJ7fL/EAlGRcgNw5ZG0WxgBLbvF63yf4pNBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C3mxTEBL; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C3mxTEBL"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso25877745e9.0
        for <linux-staging@lists.linux.dev>; Sun, 06 Sep 2026 04:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788694870; x=1789299670; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ARf7a0QuDmnTVS4e664PeRczUd5kEyLkns5J9FozqNA=;
        b=C3mxTEBL5O76OMy5EMmrvgfEodCyoSST4w78XUQK3tAmP42XYG3noZpvsoxJlFke+h
         lDTo2szZPlZ6NeWnrNnav8+vsjtAxIaKD/RmGeATWY7LP4VohlQy4u3eq0++e9L/S+5w
         Pze9RpH7qGdSazNciCRBu4fZC619Db0LGc+yZ1nipkGPbqK2Zp4bQesaHrq6SiRIvKDi
         4lXbl54iAHJr27t4f+i6GJHtzlo0oT1QXPNVVnkhG9H2fAQ9a1vTSzuaWT14i+/m0R//
         Lu2psUx4voBpOWOqF708m6SF4mce3u8dLppFyybzp+ZRlTndcexU7cTk5ki8bRwfLAog
         ES1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788694870; x=1789299670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ARf7a0QuDmnTVS4e664PeRczUd5kEyLkns5J9FozqNA=;
        b=pNvDSOkYrA8j4JpCqa0TxU4zNf85W8Op5xoGPZ5Esl4ps5bCADuB/f0eGvu27ubEzh
         JlqmCCW5X5suMl1jMbdr01BoQ3OcQjjAFPXSIyZrmPkKjFenl8YOjEGEYG7a/grN3hUT
         GEKSEi6zk0z6HNBDg7zoj2xBgx1mgM9+94iD2ecenbE83mPXazq5YEQlPhicy4Bu1huV
         mnS495Y+78PaJWFhL47TbzbCCNPQgszH9lEJ5aEFmBnqaxeN2xwmcFUvV4JlestLWawm
         uKIJxB4ViXxbey6MNE0k8Qkkg1tzlS4hbt8PHXNkyDqisJyZ44rr62f7giM97Tqh40zC
         8MpA==
X-Forwarded-Encrypted: i=1; AKwUvBy1C41gqsYBWR2uLzKvPAVQbzeoOVcVuvH/d/piDK+vGOdgbQG/meBGZOoN0ksjSsSemUANl+QzNuSenHBS@lists.linux.dev
X-Gm-Message-State: AFuF++nE7OMF6JTlM1Z4I4yo0u5sCRfweFYIcrrfd42nPlzEu2etJxd/
	CEAd/t+k8oUATofA4Shek3eBWETPPjtNN0l1N2GgTU+gbob0Zk3qzlzE
X-Gm-Gg: AYBFou1IOFFCosGfwwuGJlljnSrH11sxyASBnwGFFjkrOroJjwOm5/lEeAsB7qD7jrG
	Jaz37aEo8fFblUKJOwCt9OLi3II1FTJpYfVxOWXipIjHTOyT4Gk8vSedGiUGORHqyXXF0g9GTeK
	oX2nzXIi+4xIHx6hBUdF1z4Jlp7tt9eGWZQn5533L2MBxviUmWr3F8N7ouXxBhG4m7hLIZRR8B3
	RduD+Eyf+WCq9s+n/CODZb9S6nvRm5Q0mFk6JVec+eEvCV51GmxPsr5SFXHez9IHwzTT0ZyolZw
	RcIKRQSmY53JKFVUUOukbBuzSyXCt6y2s55tvUcSbXiMneig5TpMD5k3xCS2aW85+6V4ZDLj1rZ
	gGfUSeG5Xp9mhxWA2sS5y7sWG1sEBwwKtad7lm0NVlYgDAbRVGO6hpupTIE6Txh5lE0oEKZf+5F
	oxol8Zi2mJwbXX+yLcHO+DuvCSAv1SKsjXJgJtxYY8FrudkcZ4p98JlCiZFmj1m2lv6qD9BATxc
	Tl0Te8q
X-Received: by 2002:a05:600c:322a:b0:49c:f13d:ffef with SMTP id 5b1f17b1804b1-49d0089db4fmr67572685e9.19.1788694869655;
        Sun, 06 Sep 2026 04:41:09 -0700 (PDT)
Received: from fedora ([154.182.82.204])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ab73c2bsm19356223f8f.22.2026.09.06.04.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 04:41:09 -0700 (PDT)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: gregkh@linuxfoundation.org,
	jic23@kernel.org,
	nuno.sa@analog.com,
	Michael.Hennerich@analog.com
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v4 0/2] staging: iio: adc: ad7816: Fix SPI read operations and VMAP_STACK issue
Date: Sun,  6 Sep 2026 14:40:47 +0300
Message-ID: <20260906114049.32912-1-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v4:
- Separated changes into two logical patches.
- Patch 1: Used guard(mutex) and devm_mutex_init() instead of manual lock/unlock and mutex_init().
- Patch 2: Used __aligned(IIO_DMA_MINALIGN) instead of ____cacheline_aligned.
- Patch 2: Fixed the sizeof() argument in spi_read().

Abdelnasser Hussein (2):
  staging: iio: adc: ad7816: Serialize SPI read operations
  staging: iio: adc: ad7816: Use DMA-safe buffer for SPI read

 drivers/staging/iio/adc/ad7816.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)


base-commit: 3d6d817622b0a9721e3cc404df3469171582be13
-- 
2.54.0

