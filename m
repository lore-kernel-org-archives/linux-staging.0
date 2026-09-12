Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E50477298
	for <linux-staging@lists.linux.dev>; Sat, 12 Sep 2026 13:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789219543; cv=none; b=hQhhN/JS91SP5Nm1kDLxUxaum51GLbkjwOJBvFnRCa+UqXqGb6aQQkfhf+tGWenmawAWnwsz/vQRK5iUptA1Z7aVFx572iRFJAkEypu7Hf8U4EjhDe8vLeaGEgNSjW+TCjH6wAQ8GokUOpezC/8Ol0+gxBvJuouF6DjvuaGjvks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789219543; c=relaxed/simple;
	bh=ra+nBxwYJ9Dt1/cxvZ0GNQZEo/hQ3YnP/tmoVkrBeEE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xo0aAQpp7Hd6h9I0tEIKtUBPYCJnekl+O4goymEKnnKaNK5tTsfHblkihm5QBPw43mwwomO7Gg238c6b22NtWYpNy488PtNeWUO6Y2ICu9hrZF5u53bAdYM59P5pse0b2QmUb5CVJaSG92fw2/TKcGyhZ11rzZWL1b2YEAjAEXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PbQsD9Y4; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PbQsD9Y4"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49e6e69d528so3908965e9.2
        for <linux-staging@lists.linux.dev>; Sat, 12 Sep 2026 06:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789219540; x=1789824340; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kW/Q8SPmIwY6gpgjSddoHsXSzmBQy2ZAVo1h1jIxSwM=;
        b=PbQsD9Y4aKXKjUGaBcECN2iJr+5UkDNFWDGnvJLbcgrpf59ECNahtnRQlHi+tdUEEY
         hUGNDK2SZWuz30u6qVjE6Sqg3urwzKK583LL43dnh/2YJ1yi1VWCT4sjjxcK//JBuJ2R
         8xzrc+6WLm8AK285cg1eNcT5fuQgaGljI00nlW9+xOqP0l1MvFeGIPLr0RPoE4A676Ss
         PS5n7hGhjkZFlzNuQRjajxR1OtRpUVJ1TcMc1u20DiwLt83oImUB3XpJltMLPtDL76rW
         mR91yIGltnwUtZZYt1AQAjOhDZRFKqrb+2SIPUjhJqKsZeE6Ai6U2MJnXQfxbQptHht5
         /6MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789219540; x=1789824340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kW/Q8SPmIwY6gpgjSddoHsXSzmBQy2ZAVo1h1jIxSwM=;
        b=JFpJzz0AZK7yb9lObETNoO4YPmL89xbDXQl/OwsO0uKN2KE5WngW0KfA16E0mbRxva
         BY6ZOJyBIYWiqwR4jloLJQkwqS2dKWjQikN2TVxr8quzsY+nDmYyUU7HsG0wAaMmozV2
         dLyZIEbpFMBi8P6PHpGp+YSD986t2PqsJYsYwydLVztGvds0mOGJquW7UVQcsdNeR+8i
         ddY/FbZH8hwTDG6YrYhXpj9CrD0Kqk5RQ2DLLTV3Q+OMP177bi7Kx3hviOMn7t4AjbJQ
         P6FeYwWfFvh0HL4KGsi9oDKPcOGCwOfhg5PiB0VZrqHyXCaAKbqwCSFXGVdecqzyjuId
         iupg==
X-Forwarded-Encrypted: i=1; AKwUvByn6QZIsKCd31e7sLSTZG7UZ4llYwsmK5VlsvFRXOGVrmano/HU7g9woAFKwAuGmbmLisy8yjOQcM5Xpqm0@lists.linux.dev
X-Gm-Message-State: AFuF++lSQZMGuWNSOEkmqjO5TvxnF7ZnXp6C8G6Ug1Y6Q9UcHWPPL+Q1
	t/pxDfznMttCzynEDe8fi1DSuJCbVMjgMAqPAjnXxmLxoUkRN4uw2dan
X-Gm-Gg: AYBFou1cANcz8KM62hoKg4YYh8zxH81Fh+rDaH6C1ze3KV7VWw7Zpjo7aJOHuuGc8/E
	8UrrzOxqajLQclGH0tXq1BBwdpObHxquwWNvmGoabyWmDm8iI46WmTzOZ42AADEMrWf1dBgMeLt
	W/BXZb8a+8faJEP16cbK9Xu10QaHszdmZaa+CSE60mDftm+NKucH8JaAnxsZK68e7gy7ikdVjWA
	UX+T/G2vsqG/uDGBH6rsdAmTESyDj5Pn66dDQTjLF4BKKIaZoL8qHXV+2FAL30WCpszb9eBKLib
	sEuNnFgBlPaUnUqRks3MhrW1Nx2nM7gZ6qr3Fp/3WFFc9yjPTcuqRBlOH+pU8R19yUmKi9uBLTK
	QNvSnAF5gLibGlbXG4RbyKPiCxgSqLs8sFkvHzWDm3wgyBbjk4pE7lJOuFavLYtd5V0eu4OdUfj
	Q6dZyY1isJ21keh6mcAc8GVcsK6r/SuPG+VR5jsHDq6TitPFiZ595vz7aMYa9aF1rR5rqpdFPOe
	gaFe0Nsq9YRH5zxlg==
X-Received: by 2002:a05:600c:4714:b0:49c:c96a:d36b with SMTP id 5b1f17b1804b1-49e61988ce5mr95438225e9.12.1789219540215;
        Sat, 12 Sep 2026 06:25:40 -0700 (PDT)
Received: from fedora ([154.182.88.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ee8bsm12684503f8f.15.2026.09.12.06.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 06:25:39 -0700 (PDT)
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
Subject: [PATCH v6 0/3] staging: iio: adc: ad7816: Fix SPI read race condition and DMA safety
Date: Sat, 12 Sep 2026 16:25:14 +0300
Message-ID: <20260912132517.55686-1-abdelnasserhussein11@gmail.com>
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

Changes in v6:
- Separated the alphabetical sorting of include headers into a dedicated
  precursor patch (Patch 1).
- Kept the mutex addition strictly focused on serializing the read
  operations without modifying the sizeof() argument (Patch 2).
- Moved the sizeof() argument fix to the DMA-safe buffer patch where
  it logically belongs (Patch 3).

Changes in v5:
- Split the changes into separate patches for bisectability.
- Replaced stack buffer with a dedicated rx_buf aligned with
  IIO_DMA_MINALIGN.
Abdelnasser Hussein (3):
  staging: iio: adc: ad7816: Sort headers alphabetically
  staging: iio: adc: ad7816: Serialize SPI read operations
  staging: iio: adc: ad7816: Use DMA-safe buffer for SPI read

 drivers/staging/iio/adc/ad7816.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

-- 
2.54.0

