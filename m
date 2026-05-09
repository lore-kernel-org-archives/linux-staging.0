Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4CF262D0B
	for <linux-staging@lists.linux.dev>; Sat,  9 May 2026 17:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778346966; cv=none; b=Tz7qMyFE0ZVrTDOtvgquyO6/CFbSrpGSTX7sxdg2y+5c9ihSXNe9Tv2QRV/YCU9Wb4mDzSx6zLp8xiluSMBQJlKay33vXv1Iy8vPpweOWimCvxN8PD5bm54e+ZltZfinZaDx5D7seCXU0RV7rQHF3oL8K3HHU3D78YD3TqG3mng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778346966; c=relaxed/simple;
	bh=IcGOyTmLRGu7gZmiijMzPNtc7H2UhPCYKm8NOyo4lu8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qvoS9a15qoIjiyMw7la0yO9PYE4ZtQyyW2mUb0hi0tmGacyymHuKb/A73LXydiIMTLGOfpdDoHWCLvpafGUns1F1HgXERTj8Vd0iA5h3nl9azvQZZ/1s7QqZvNGUf5RoMhDZ/g+Sxm8xS7NqXjKCLAXTwGaG+5m2+HM8UrHzz5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UZNVtjwZ; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UZNVtjwZ"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c80291e6237so2072190a12.0
        for <linux-staging@lists.linux.dev>; Sat, 09 May 2026 10:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778346964; x=1778951764; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DRTN+RHqMoaCUUiRCW8MKBD9GjsMxoDdYFLzjJW3gq0=;
        b=UZNVtjwZ5L1NrDMLmx8pbpfTK6U/bJTl/xJ2QtNl5JKx3kleD3d/zjWlttq7SYEzn9
         MDGkqLncZsaBMdsG1kpjJyolMeRBr9j7ZjiufslSIMkAEGyf0oB64NtLz9lB6+qgXur+
         bOONBl9Hr6N8Ta1I9xv6g784IlcSHkUprUnVfqBdYUKiCdO+bpSdYeIwVrHdPx2DNf8M
         s9BaRpvdoTjhV4Ywil98oMheEjAftVRQlc0ATpslseroBdWQVmSd7Ecz5wrss6xE3Gvz
         dueSQkob6LiS/a3RUjOfZqSOXdlrVL2yIm+KV3fOrAujIG0gWfyockGxLLX9wYaHMrd5
         mVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778346964; x=1778951764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DRTN+RHqMoaCUUiRCW8MKBD9GjsMxoDdYFLzjJW3gq0=;
        b=pbSxqwIedqYEVsLqh/LXaKP1gV3EyHRsvnytqhRh1xfsRP+xO5P+A8U+S4JXFfCC1Z
         df5en2Y0pgp4OQNoaOJ7cfwo/ovley96u+g7IVlCwkhQdJvVwdtKZKKgS1ZMDEyYpY8H
         WQM+kTS4hoZA0CIxkePPQQNSCOz0bcywjw9AnuMb86OmrX8NHwhV9hor/1nXYLIjGl9z
         Lcd5LyqgIyz6HGrQ9KjKBxwL5fxk9eHy+JsIeVti1oxPf1w7mlBO/7KiQTd7QO5GaqL0
         /oTP2dbHOuWXWygvesc1Z7zOTaqaVBM1RUpvuaHk2AfbEaj0cgE7bZN/BN/u0GgUNVHK
         rK5g==
X-Forwarded-Encrypted: i=1; AFNElJ/lQxy0E3xZfOU1zap+nOGpn61Nxor8oPBjczqvTXC3/nvsQGmKK8Ow+kYmLcuPk9lBq942x2KN3z1ryiJ6@lists.linux.dev
X-Gm-Message-State: AOJu0YxwADMfvcKUmgsfWK1AvDU9WE7Duz3X+VOQmxOnY1CriMPsCGlt
	Ssi1z3eDi1VHc18BdXYezQq6+7QiGTuKbqC0t6ySh4mXx1wYOCgZg969
X-Gm-Gg: Acq92OEKe4ADb5vafMtS4SSqFpKhcfaGkZPLQgTFAmhYAjOcg73oZSSuakgbqfba0ZZ
	HnMJep6c9dALQRmF84r1YhN9ijYSu0foy4LgE9+hpT88sEJeRcDSUj7vEZVruVqeLyey8tE6yaN
	Vzm4tafodrWyKJ07HoShxxJ8lB+apjJZiqYunigUi4oStf7bINu9HxhcIBEdhSen/ost6HwRVCq
	HVa4oJNWuyxRuZOfIFk42wsxzsDgVpzqcVAyv+K2Vk9hLaNcD0fsrzxsisH6wdhrvOTeYobVYBE
	3Z4r3YDefKHW7YPtmu7kMgCEnQVNEeKTaAXk4xyClufXUwUSHLZgusPHFoW1Q7NF0W0WFO1Q9UW
	Wrkr3CO0jschc/lU3ct7OE2YhOCCOvPkcfX1sTMpbFweWfSrBxfT8xCo4x4E52BEuw+xaiiZAx6
	0pabDeGHZVejaIa0V1MGnjA21zuzcIYg8+SZBZ7ABs
X-Received: by 2002:a17:903:1a6b:b0:2b2:4029:d781 with SMTP id d9443c01a7336-2ba798d56c9mr194251615ad.20.1778346964392;
        Sat, 09 May 2026 10:16:04 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d008:80b:a00:27ff:feb6:42dd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1ec7d35sm57164895ad.83.2026.05.09.10.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 10:16:03 -0700 (PDT)
From: Pramod Maurya <pramod.nexgen@gmail.com>
To: gregkh@linuxfoundation.org
Cc: pramod.nexgen@gmail.com,
	Jacob Feder <jacobsfeder@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: axis-fifo: Fix alignment of wait_event_interruptible arguments
Date: Sat,  9 May 2026 13:15:38 -0400
Message-ID: <20260509171538.46396-1-pramod.nexgen@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The second argument to wait_event_interruptible() was indented with a
single tab instead of being aligned to the opening parenthesis. Since
the full aligned form exceeds 100 columns, break the condition at the
comparison operator and align both continuation lines to the opening
parenthesis.

Fixes the following checkpatch.pl warning:
  CHECK: Alignment should match open parenthesis

Signed-off-by: Pramod Maurya <pramod.nexgen@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 3aa2aa870ea9..1c34de020cf8 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -246,7 +246,8 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 		mutex_lock(&fifo->write_lock);
 
 		ret = wait_event_interruptible(fifo->write_queue,
-			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >= words_to_write);
+					       ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >=
+					       words_to_write);
 		if (ret)
 			goto end_unlock;
 	}
-- 
2.52.0

