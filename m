Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B97368943
	for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 17:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772126744; cv=none; b=trV6qVeBGHfhX81lHRx6IpK9M8CZIlH+3Fv3dlD9l/SEjMbcQxeLtVR7qzWkmhnqXaaJjn5abC9nzGB0LrKqYgyiKuRO1L829HB7nNyiuFuGwNShQaH6zWwHINrxwK+w3zXxgr90dC88RhS9LGZiAaox/WaGHDfLfOz1M/Wk1lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772126744; c=relaxed/simple;
	bh=paWklGpJmpSfsuZYbC3wJR/iurGqjmM8lMz88UioawE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e83/W1j0yWoCwJYo3tGDwpGZiZLnHC+wKxg8jlWUV2UEnzJpkZuQYDlItqvlzVDyNpiSOdPed8W8F4nHWKL5nvI21SQwzAg/GrjsH40bBDxzkVltk8iGrm3EuGAz5sOk/4A5K1OuRnaATX1lOTvdjSrkQbln97ec5M9SUo2FyfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=noL/xmri; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="noL/xmri"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-354c67da885so945472a91.3
        for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 09:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772126742; x=1772731542; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SNtQV6U7Rntro5/+pgriQkg2fm6u58xz5i9CJk9lKHQ=;
        b=noL/xmripmGv8q26eidCstOQpcSPGIqpJoE7HHucbxK3/Q4DcP7QeDLCgR0+RxMWlA
         weT09t8BkdAAYPGJMUPsxCVBtpWoEqwpxy2/fc5CiCGAiM1ggUJ7EkhecInfcnqY4rf8
         KTkBorUV3f2OQfuuwngzm3DtSJesCMa5qFLVtLb6cGhE4vytNVB87BAZNC8Tpod51yhf
         9t60w4TX1JNvcsfChXgM2QeYmYJDUUH5XnXpDarcKBg+X+IszBTjxJUeRuf9GS7Oq76e
         uBJWw37dxeCms88HNo2JIjwemh1Tf2Fk0ZcFTtGkeMOL8Uh4H33Rc6DJFcz90UiFVUt3
         hOfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772126742; x=1772731542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SNtQV6U7Rntro5/+pgriQkg2fm6u58xz5i9CJk9lKHQ=;
        b=s6wtnSHCloMX8FMrXB6WGGTUGLa+HuhfyxDZRMXcAEjVMbPOiV5dtjluMyxSyYzZAg
         BeLNV84Or0zkyJ/IVbl8W9hM1JczWgNqocuxRmNDkSZZMtMtPHt/6G3q0RWZLPlTGE5c
         uiEc4apoRoMTO4TrItxjyGf/kSSHDkHZh3MTtkKykdVsXmGJenfcjMO63J5fScGZYUdH
         hWJmV56wtDBlqr3wDBc1J2QbF+Z9a80J6H+Y02qWNAXXt6nMRYenPuITcn+2P56nBah+
         iztD8/re9r3moRYKEHyRxJioCFR68wADmzD9kCt+4HVae5RnzhXE/WIkdrtkLG55wb/u
         TmQw==
X-Forwarded-Encrypted: i=1; AJvYcCV/GQajVZRNVbMgdvS6P3r2WV9NIyMWXyXRSbI7pYQRUgpYy7nWATyHWh8f0UDO+u6xz9Z/9cjLFH/hCwHA@lists.linux.dev
X-Gm-Message-State: AOJu0YzagGBVzvxMnuG5CHTs0Y+o75llOhiTEXDnVYcNCLMrgonkK11u
	Y4bd+WKes0zRCa/fXaVM4N9ccJNrgBtZ6fxwNMqIZSne7Rl34cL7NN6y
X-Gm-Gg: ATEYQzzY5mLDEVrDlsSr0mEHFY6HiLogovM8ORQFNdKULBzTZbFMrSDM/GR6QoWPfFa
	drgo3zxolZhNd/AsacFF/iXDXieMFRcoDtWh6CYAYCrL7Aljn8RxGo2flBylMgZEZtCV0CzXbBD
	1z8jTgoxjTi88+0u5Dfs/S/WgrYYBClGaiAL0fmR/ME/kmTIus/NGTwcihZjH8DSya0U+j0eHAR
	OtYaSMWPGzF/wzVYX7wuYT6Gs1H/eHQyFlHTCUvBaLF80m6rMfcnZo4Bzvev2e+C5R9371eS34u
	SfyeDXgzw1Yrv6LUltK2UdFkkcbWbLWsc9bCgkiJ1GzRcGD2NnAKwrcbKBqb/2kc9yyRNP7215G
	YTcC7ZTM/MDD+ZUSjNeI26XWN6xxrt6ojrleQB9oQY3b3S7Qbgs79hHcYfnyiTDqpH7+hdsz6oZ
	laBOlA189eUY4Ys+eIpYwZEIKFKA==
X-Received: by 2002:a17:90b:33c3:b0:340:ca7d:936a with SMTP id 98e67ed59e1d1-35928b880demr4894986a91.18.1772126742205;
        Thu, 26 Feb 2026 09:25:42 -0800 (PST)
Received: from latitude ([2401:4900:aafd:b886:9ebf:3ac7:7a9f:63f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35912f5f29fsm3692895a91.1.2026.02.26.09.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 09:25:41 -0800 (PST)
From: dhyan19022009@gmail.com
To: Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jason Donenfeld <Jason@zx2c4.com>,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dhyan K Prajapati <dhyan19022009@gmail.com>
Subject: [PATCH] staging: fbtft: fix macro whitespace errors
Date: Thu, 26 Feb 2026 22:55:31 +0530
Message-ID: <20260226172531.13714-1-dhyan19022009@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dhyan K Prajapati <dhyan19022009@gmail.com>

Remove prohibited spaces before closing parentheses in macro calls in
fbtft-bus.c, reported by checkpatch.pl

Signed-off-by: Dhyan K Prajapati <dhyan19022009@gmail.com>
---
 drivers/staging/fbtft/fbtft-bus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 30e436ff1..409770891 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -62,9 +62,9 @@ out:									      \
 }                                                                             \
 EXPORT_SYMBOL(func);
 
-define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
+define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)
 define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
-define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
+define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16)
 
 void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
 {
-- 
2.53.0

