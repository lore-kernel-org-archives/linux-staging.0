Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D732143DEB5
	for <linux-staging@lists.linux.dev>; Fri, 11 Sep 2026 11:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789124821; cv=none; b=DZOGvtt+/ZlGu5ABwM3rRxu5yR/5q3a49oYQH9V/ugD40+stXRi0qnn0pAKk4lx+RBMxpGiVSDUESwsbhHtRvQl5Ffyatx4E+wSnJEK9N/MvPhgR49OiDJdUiilwrtRmwOqlkpArP3IUbNBxBZ7mP24fgERMBJ9gEVFswKY6Guc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789124821; c=relaxed/simple;
	bh=EzMqYzDCfAQK5VpIKxY1rBROjxfO+C/FptcZy2zwSMo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EKOr5uwSkus24mjpa+TWIo2OwrrmIM1QRaGKY7ZvyQuWrt92LvpI4+YyUyrFciWASQebM/uB6wPU8FgSV+jV6YM0A70jfk3NuKSU0GlmkpNrAVixQINMwnDQKHp4CuVacaViOBdUcRlMaunjdXli7qaEpTCc4u1Itsy4HFTEqq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i+U6p+if; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i+U6p+if"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso11942895e9.2
        for <linux-staging@lists.linux.dev>; Fri, 11 Sep 2026 04:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789124818; x=1789729618; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3n3/zWk0l02hYrsGBXj2MvCkxdWvZK6d8q8d4YMlMfo=;
        b=i+U6p+ifKYYXLvc4sDtQPiinSGMHIyUhQHJL0R7EEEMQSirJFPmPpfAz+SN3QEozAH
         HlIP8dn8lwHjgvfAtZ5zOBXs9aWgjCFRuD98Z0H3NErp8z6Pvgk4j2ZBTVSTpi6dvthh
         GhFaqBkWa0P8zNUpA5UC4791q1O7hlfN2BGA8+lV1oZknM1Zl345HWsRfJ5LmFCEewMf
         7GwPHjzqGAKxsAb958LWqyFOftc0ZQrwVTalY6x7bgKZAjpmGAvaj5rpu3NURA4bOX8H
         aNu0QnJkDFcUS5FyoKR0t3CMoJFas+6VA8MZREHt5bcWDnaL1hI336MqIS/eQnTC4r0T
         L/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789124818; x=1789729618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3n3/zWk0l02hYrsGBXj2MvCkxdWvZK6d8q8d4YMlMfo=;
        b=rHtxGDtIfhMARqQW09MnwPdar6EXrm1n3k7ZuaADnNQoTE70xCkn4M7XlkTeIR2Aox
         8bgenNYZJjU8CAeIKvLk/0RLHIOz1sIxk3OBl5Uv3f0kA5pZf0OEaELm9qAYcS7NF5yO
         kNuwIeEKD5qBWw00WT7gz9IkaayEXKlZlXFa+PQ7A/YDZQhH1N3oGcUnDzSqatFlrWB0
         B0PB+tt/cSmzYZwTyJXF4+Eo9/MGKDI4RSr7Swr50cJQKQ3JvJhtcUyAQBe3o9yb4wp2
         KYEljJo6zThd4OUEsWVsRBZtiotk71yJ8+hPLcUEw4blxvUQBLBo7+XmaHLZo7woqSGN
         S8uQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZrB8rMf3rlKyqosWPepwckeoryBz8LopcuMSGPNZu5zsQRo/+LfR4cUqrlxaeRo35JRM2+vtrRvBM4iqQ@lists.linux.dev
X-Gm-Message-State: AFuF++mnBr+yDaRxMc3m3c9fEQzY0mTvV6vaiVeAdXWWkGEdNbi4V3Gx
	H+vhDRBND1DMjxzlcbL//3SrxaVpq6qJp9qqai87+gbFnoQI5atmuy2u
X-Gm-Gg: AYBFou3Ks/JiD065sEhFjAzR+RaLbOlwcXugDepUKektfVu7oMk79UsDn4Idc7J2Wqz
	B07oYMFOA7tHsa+PSmeKOpw0ykYk0yW0H1Ysb+Dc5FxSzFCu+OcfghVkj9kbdT9iALXqQKuEug5
	D+kVcfaDkBOnIzxh0+JGncAE3qSsdnUfAVDCMpdOux0xG4MuRmiv3qZ0IhL8o3y/L9kRkN4mCEK
	lt9BoDB/rfap+JV/HJPH0Glb6GclsAuD5MHVpLI25IwEV3+u32gKyxGUdX/QovBRTWY1AIa10O+
	OSKTyDywt7Eqr+fpL4YOOsa5ch+cu+68T378Hx/IK1bi7iWizK7FmsCRZV9LOdAnWPTNv+o0fFb
	2hQrQXkoI6SSSiDIt7cqABTqtVMRypdfQaM806jn8+ejQnalW66+LEWdCD17SVlxNvmiE5EOWYG
	9ZW+5dlj3ajtPVsMP9hNVh1YBZFQmTGVY02kAU1h3dq/on5D96PG9j9BSmcmSzIaV5J+wlxYbjv
	INSJxyA8nLl9+lulUE=
X-Received: by 2002:a05:600c:c491:b0:49d:827:e5b6 with SMTP id 5b1f17b1804b1-49e619bb949mr43669075e9.20.1789124817713;
        Fri, 11 Sep 2026 04:06:57 -0700 (PDT)
Received: from fedora ([154.182.82.204])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60ac411asm66109065e9.8.2026.09.11.04.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 04:06:57 -0700 (PDT)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: jic23@kernel.org,
	gregkh@linuxfoundation.org,
	nuno.sa@analog.com,
	Michael.Hennerich@analog.com
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	joshua.crofts1@gmail.com,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v5 0/2] staging: iio: adc: ad7816: Fix SPI read race condition and DMA safety
Date: Fri, 11 Sep 2026 14:04:54 +0300
Message-ID: <20260911110456.24873-1-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series addresses two separate issues in the ad7816 driver:
1. A race condition during SPI reads where multiple threads could
   disrupt the GPIO state.
2. A DMA safety issue caused by using a stack-allocated buffer for
   SPI transfers.

Changes in v5:
- Split the changes into two separate patches for bisectability, as
  requested by reviewers.
- Patch 1 focuses only on serializing the SPI read operations using
  guard(mutex) and devm_mutex_init().
- Patch 2 focuses only on replacing the stack buffer with a dedicated
  rx_buf aligned with IIO_DMA_MINALIGN.
- Updated commit messages to better describe the architectural issues.

Abdelnasser Hussein (2):
  staging: iio: adc: ad7816: Serialize SPI read operations
  staging: iio: adc: ad7816: Use DMA-safe buffer for SPI read

 drivers/staging/iio/adc/ad7816.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

-- 
2.54.0

