Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA7A33A6F1
	for <linux-staging@lists.linux.dev>; Thu,  7 May 2026 18:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778179254; cv=none; b=iQOGt2+HiBNzsIwY06jSQ+VcQjjjLjPBqtNPG3OSFnUtKRQoAbe7YVd+jQxdqUetC88K0lu2RNdsIoZszYi41ADedqL167YZ8RigmAKkgmXdPkFt635its++E8f3/Cgijnn9+4pArOOau0ICrLQAiNFrM96BJSjmMGvlB3HBCkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778179254; c=relaxed/simple;
	bh=zmafqsITRwVb8Ypx4+2QdxprJN/VilDRmivHo6MhRvA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kuWhJ10ujaY5NoLTeQzwh/7XBq0xMGcMMtsf0rBA0iYz7i0Ms9Tk9gAGTo6TOsvEK0hM+NZpH11kfPpKkK1P6dOggTu5nhWWp7FQdRlR7c5K2Qecq5kKH1gqxjmmBpBxS/TXgYBcWMYT8mUTIysSyaiv13+kSqtexoSn+QphoV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mIh4NY+y; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mIh4NY+y"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3650a628473so1100007a91.3
        for <linux-staging@lists.linux.dev>; Thu, 07 May 2026 11:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778179251; x=1778784051; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WbQrEbBnAzbdHlsiSM850l+AD/jOjT4wyJFXRvfpY1s=;
        b=mIh4NY+yqazpA3LHyJKn6lxZPSmvDbGM+WlW3/vtngvV3jEfmJ3wPljjSm4+asE2lx
         79j5Y5CC49BETQrIiqS7t+dkTkQVKSYG/n3OXknKORnIkmrbrBZkAuw8PQ0CG2qvW79Q
         8nkyh3sf34Cgi7V+S76UiqIf8zjF4VVtMCRVL5Y5LkD63N5BravAgOa1LqpqZWpFLCzR
         eRQ6+aWeMG43dWAAjvmyWN8xTHNAmBGyKWFr84W0fM4sftuDYOm0OoGAQrTIVKVFgWTZ
         F6wJIZUBX79NGXIEx6tFqDhwmxvEe4J9O2c9b+k8jTqRNJtYiyhKztMPxKr5JE8MMLOB
         SPPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778179251; x=1778784051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WbQrEbBnAzbdHlsiSM850l+AD/jOjT4wyJFXRvfpY1s=;
        b=WAgA1pI+36Hz5st3UfDEt57fQZn+R1PgK3ltnztOAMiG/7YKN4uLN1EpmP37LWdXZt
         uR14gb5PePT6Cb1JhYjAo+KP5LIDdwJEKHNwclDIRSTOOKElxBfWfatbZUeqZu3pfZbB
         Se2CfSN4FKa1fHp/POE4DWf8tmM0aLugCQvDXUKkgUoSEkr0q3R1LAiEviaSD3swDoD6
         a3Z6D/N0V9OecZpTVY1Im1wXPmjDe7ojeOVOwspCsJt6nH36jzUC5Lkd+ygLmOBNyYYb
         VWUIbe3+E68KhY0WOS2WZbwBgXuMObzBw/PjvvX5VUq4VgOsNxmO8mw96EUu7U/DDS3a
         W6bQ==
X-Forwarded-Encrypted: i=1; AFNElJ+8LLwzCBozvbIYDdVdVFyGaEtaq9e30SgQJeHXaN4Q3byB7ixRh96Xqqb6ITFycId1B5K/M4VVDEdMQqNs@lists.linux.dev
X-Gm-Message-State: AOJu0YwnqmZ4yW3qwyqPSL/3rl9P9ltfxSewSZzrAyimHGId/ZkKhdTG
	+9B7WW6H6YKCMZE8bb/2+GNZvriNQmBmkDgAwcuz3oqAtaVDOrMLSLbe
X-Gm-Gg: Acq92OGX4pJw8lGKwIFdI99elx3eJhiQuUv6jOeymplF86wgHuc7mBCOWw7ZTm0tu5D
	IExYOnTp98Gf6ArKgYDeeEijkHfWCxsdmPcUpLO10WKBDqC6pyyox1B433xmKZFk6PnQgHcN2js
	NLAqRh7ZXtCVkXgiOOHZVALB8QLnqA3EyUt29pI3a2YoHO3Ei1g2eRCK0nBEUsr0C4SOn/reQv7
	p1WAV9y5dmmpf2AmFeXEQ3Z1PBVJWdibXpREspRcTjyOFXD7AP24K6CKhdZjvUWCQm/4Qqmzvc4
	r8MLlEsUS94zYfaJmJHVP1vZsioDgqz9TUbxuhFbjjo6dor7vr4Vk8+VDwC6ChtVaWv0R2yc5Dj
	5HRLFPh8hqNka4YiL/q6AfWSMYP6OqkI2UdpnmRi0MTgBgtGxsCTNXjefY0QXuxcwFJaB0LbDxA
	1TBgEK4uc6bxhuZedPoZR+i6KtQc2FWeqQYDf9ox/7L4h4cR4SjDffOn4QLO52Mpvxzxbz1VnTi
	dLKjADDwwYMZSGaX1iAIHU=
X-Received: by 2002:a17:90b:3a8b:b0:364:8f64:49ea with SMTP id 98e67ed59e1d1-365ac795084mr9273835a91.27.1778179251041;
        Thu, 07 May 2026 11:40:51 -0700 (PDT)
Received: from Win10-6700K.localdomain (softbank060114050097.bbtec.net. [60.114.50.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365fb243c38sm4044126a91.16.2026.05.07.11.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 11:40:50 -0700 (PDT)
From: Daisuke Iwasa <iwadjp@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ovidiu Panait <ovidiu.panait.oss@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Daisuke Iwasa <iwadjp@gmail.com>
Subject: [PATCH] staging: axis-fifo: fix alignment in wait_event_interruptible()
Date: Fri,  8 May 2026 03:40:37 +0900
Message-Id: <20260507184037.43613-1-iwadjp@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a checkpatch warning for alignment in the
wait_event_interruptible() call in axis_fifo_write().

Adjust the indentation of the condition argument to align with
the opening parenthesis and wrap lines to satisfy line length
constraints.

This is a whitespace-only change with no functional impact.

Signed-off-by: Daisuke Iwasa <iwadjp@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 3aa2aa870ea9..0ec9b6c5e7d2 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -246,7 +246,8 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 		mutex_lock(&fifo->write_lock);
 
 		ret = wait_event_interruptible(fifo->write_queue,
-			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >= words_to_write);
+					       ioread32(fifo->base_addr + XLLF_TDFV_OFFSET)
+					       >= words_to_write);
 		if (ret)
 			goto end_unlock;
 	}
-- 
2.34.1

