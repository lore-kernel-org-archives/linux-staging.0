Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477D131ED63
	for <linux-staging@lists.linux.dev>; Mon, 15 Dec 2025 19:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765825702; cv=none; b=jLiCQTadHBCmgflQpo3LQqKPS8/aW+0p7pldJdrYtBmKDPiJewVqdXr76jCSpUDBRZG8eEWNU6GVnuVCKGTy90I4viEOKBDAAdn6PCv5ah2l7csKluQKI0pQIFdkbMGtJUs5Tfi05NeGV2Yv+fj1bJPn3/u+26kp77zTb4XnU6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765825702; c=relaxed/simple;
	bh=uU7OENtzXKECTKQSkAzvF0eLB9qTkElZq5tAR8cyNRc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I5xfCU612Hqoz+7kJCLq0h1bwCt5f4kY25z+SwgMSOhjerApBimj29g79IiQxCxFgz3QMyECOg9TQlUOs8GhyzVoMn2e65a9WSuO+YiNpkVTbppsQX6slob/4yNaTahKZEGw+RFtjpk5Pun1hTEn2JExHWNMeXgwGTyzH78NyrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dMDaoVVp; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dMDaoVVp"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-34c363eb612so2215253a91.0
        for <linux-staging@lists.linux.dev>; Mon, 15 Dec 2025 11:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765825701; x=1766430501; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZf1cPmp+HYv/PsDFv+aHzx5S8bO5A1kue00pJ63iq0=;
        b=dMDaoVVp8ePNWqP/UHvMvbx167G/EjT5d57UalszBHvv+6XBnNIF6yLlkJrAG556Ab
         0p0E2oSFG1oqrfaYkTA7LbrKAcj+d+82UuSNMCELPe7Y/roO7qrlQsTVseMOXaIIhs/L
         oWMo21jiFAI2WRLnMimEpzrPFuMOCuzAu19ytnvCiB6+sbb+vx0a+6o9Onga9lv+iuSC
         QPCpezrRmMYjksy3Vt52HRTa7Jm+ZKqr8jdAxlc9mxs7xUq6xyNyUTT6sNkk3d+WliEO
         Vud2GsW7mBuauFVguh0t7aqrdchPbLRglmMF24U7guB1usnBkBx/gb0P56YdvO2zjzTy
         vmzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765825701; x=1766430501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nZf1cPmp+HYv/PsDFv+aHzx5S8bO5A1kue00pJ63iq0=;
        b=rXfiWAOCAQLKUZbycWraEUXi9ML7nsUJ0vi9ceaB1G3p2TW/xFMlFzUjVUJQlTDcQW
         YRRo9DyjEFvMpz09GnJXiw4o+pC6BlUyCFvZsT/UJJx1IJhy3RlxLEYZ8j2S/jf3ZZBb
         63WOdDD1LjiqpoHTqZrk+NJ/Kr6WiF5R59rk8k3eSXGcoCVaMI2DlUdC0/AYA4cxnfxJ
         dB+mRmYPvP5yElBoatl1Ka8tvPzrkN0+BXwK28Ql0FZ+SoLAtY8moz2r31JKOlaekCPE
         i7XF2/m7mOLJS9DdnPWj+Ao+eFrGsMRRMswmpW6IH8G9e68vY1nYK/Lqe5kQcY6UQVU1
         /+rQ==
X-Forwarded-Encrypted: i=1; AJvYcCUy0n0L/7p2RtHDA9t0n9Lnia/o5dCu04bJX/Ia/agLGQBub/2qPu2sYbXcC8MUAMm2h59MhEKkvyDIleoz@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0fpjDQ/T1WIc6TssixDoj54WnH8VXz4a1AyOOEca7hmSR3RJA
	ACnKf49C2r6mmHhk74clWTkllfDmE6cMiwSPh5OvKq7XNqbpzFGolLn8
X-Gm-Gg: AY/fxX6m8FoQuFE6dS0ZNYTrNJ+X7AzTV6uvuLK8U4hsojUHZKO314ePFeFh1ZZJyNC
	2UvLoFYxLMPdrmBpvN8Q8rynHUyDibJXJl6UpMPg0tGRyKbM2eMkYoZn8+XnfsOgU4NtROnQJud
	+KdZpNzyIivGhgzpeVVjkmV6HsvarhtabVAf7rrmg04IZ7A9ZVchW3ccuAuCgZbnN0q49sT3gGd
	rf317+cmmWAkfmty0U09YkPRyfI0vqmNLgDl2O06cwjb8cKyMpzi8tTTJ2RMKmVap/WofiMVZAh
	dyaPUggqY9J3VD817CKuqRPXU+Mnqn+gduSLmUviekrbCsLRt1swzKLDUu525WgT1TRahVP8nP6
	krBP9l/fJqgKUw/isRLdj1gfRIHVfmYexZgc9dbBK5c+mG8J/SRpUzZK1kyZ92XKxZC6E8srDcU
	ML1SrY3AHybAqN0rM3B70sFOrzHrKIY1swr2/3h4mXSPxQfKkEVJSfJS69vA0wVwatQC5SyLKmT
	3nAVi8pCgOy2wDzDK4eS1ZasMlkmOq/sC6//I8mc1YNxD7/gTMF4NOh5juznL/gPW1VT9QX
X-Google-Smtp-Source: AGHT+IE1WHBGKS5Crjv50TkhZLgC5nwsvUgWqEC2DP/ihf+BGAvru2jl2wS75dfjHzuo+OIWArU9NA==
X-Received: by 2002:a17:90b:5292:b0:330:6d2f:1b5d with SMTP id 98e67ed59e1d1-34abd77ecd1mr9894199a91.26.1765825700591;
        Mon, 15 Dec 2025 11:08:20 -0800 (PST)
Received: from Lewboski.localdomain ([181.191.143.42])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34abe2948d1sm9958875a91.9.2025.12.15.11.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 11:08:20 -0800 (PST)
From: Tomas Borquez <tomasborquez13@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Tomas Borquez <tomasborquez13@gmail.com>
Subject: [PATCH 1/5] staging: iio: ad9832: clean up whitespace
Date: Mon, 15 Dec 2025 16:08:02 -0300
Message-ID: <20251215190806.11003-2-tomasborquez13@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251215190806.11003-1-tomasborquez13@gmail.com>
References: <20251215190806.11003-1-tomasborquez13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary blank lines between comment sections to improve
readability.

Signed-off-by: Tomas Borquez <tomasborquez13@gmail.com>
---
 drivers/staging/iio/frequency/ad9832.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index e2ad3e5a7a..00813dab7c 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -26,7 +26,6 @@
 #include "dds.h"
 
 /* Registers */
-
 #define AD9832_FREQ0LL		0x0
 #define AD9832_FREQ0HL		0x1
 #define AD9832_FREQ0LM		0x2
@@ -50,7 +49,6 @@
 #define AD9832_OUTPUT_EN	0x13
 
 /* Command Control Bits */
-
 #define AD9832_CMD_PHA8BITSW	0x1
 #define AD9832_CMD_PHA16BITSW	0x0
 #define AD9832_CMD_FRE8BITSW	0x3
@@ -90,7 +88,6 @@
  * @phase_data:		tuning word spi transmit buffer
  * @freq_data:		tuning word spi transmit buffer
  */
-
 struct ad9832_state {
 	struct spi_device		*spi;
 	struct clk			*mclk;
@@ -327,7 +324,6 @@ static int ad9832_probe(struct spi_device *spi)
 	indio_dev->modes = INDIO_DIRECT_MODE;
 
 	/* Setup default messages */
-
 	st->xfer.tx_buf = &st->data;
 	st->xfer.len = 2;
 
-- 
2.43.0

