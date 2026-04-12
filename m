Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BE6280CE5
	for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 16:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776012601; cv=none; b=cZ8ZyvUXq+qZ5Ljeunc8DJz0xhCHqrwWsfbcHlN65R5Evfx7fdiGmqt+UR6Ytphzv61OCP5PC6x//mtYcgm9V+1/2T/X0yeod4YftGgsL2aKvvOprqT47oSJw9QFMcPldKBr6rfIvB9A0VxDba26e8cSfJZHsRRIsMkBw/Oyd/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776012601; c=relaxed/simple;
	bh=/fq4vDr56CO2k+npiEa+6hwzqLAU9ijIhxkJrtFIYjY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eBGlSL16/UkTT1AvNukkXSbLFzJR8ijzO3HD1vcyme2TktTuGZZo/r9/4zpooKWxwE5b1oUI0kaWsmnVwNQ557g+ku8raVUOfvytRZNhGAKAJHed+I+mEaGLP0ynf1HBBv0/qush0uh9MvkISPGcCyrX857KQil6bMR3GnlctM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sNCIdQn2; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sNCIdQn2"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43cfce3a195so2247775f8f.2
        for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 09:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776012599; x=1776617399; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zY6yfZkHIbKAhpXHmyMs2cR3FIwM5tf4pW3ivO5AZFE=;
        b=sNCIdQn2RABWssKJ2oZBTbjJsoRJPfZHcS/HIWVycW2FRP2A1Nc+Q8fGqNjDhKCU5/
         ZD63i6OF5cbCM6tiND6Bc366IOLm7fmh9+4pi7gbuQ0F4KwR7MErqHDbzA2FSlmOvH5x
         XwkNI/5wsg4GDzDVrWT1Dm0XMNx3l8zpMh8gIbJfDUf3uGzwkW+TUp3zfqXC47tdvyiy
         EuU3yCO0pxs0glpaU28R49Wl9rbF6yMP9brXUlWOeNANKIc6akpIg2ff9Etl6e79Kmnm
         R6A5npVi2wypMYpKhb7v7CiARBbewUrZMdqSt1xsujtIdgV8b4jXnJnNrCjCCluKNQwW
         ux8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776012599; x=1776617399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zY6yfZkHIbKAhpXHmyMs2cR3FIwM5tf4pW3ivO5AZFE=;
        b=qQcZMX3+wmGYVaav58OUJGpNKgrqFURdTgYzXvE5ZrGP28/QQujs27QR3tl3tlAem9
         7NuUWSuGLVJScd48hJ8ZskDNIBjdAsk+ztihj/ZKCrJtZ7WTTmwGCM529PLk3jjUMAgc
         avnNxtva1bMSdAEPGrkOhPjtBh0wXSxX86F+k0qFL75vGJA/xrWuuNKGfDAyyTMUdQfx
         CFLl+bxNh0vu4KfBijUv9qaR8/ha4HNOMX3T1EqyUNpZDyhArD3OQ+qjNAGHFzpefkJN
         YA/nwNw70zvnFLlYOjLN0iE/zdVwvuN5mb5eniy0khsnZ8RnPABualsdYW3BTONwjTgo
         swjA==
X-Forwarded-Encrypted: i=1; AFNElJ/PbUecjQd3s5jS6iyjWZvji7k5iWmOvYLB/P1b3XXMkzKW14QDvpfueWb+05nojT9gs+GAiLXtL99yiKja@lists.linux.dev
X-Gm-Message-State: AOJu0YzjEqxrSNwNoqQfXN84OVQ7JPmIJq/H8DIZe1yI69gniJqDgnJx
	8EJ4kVnRZyJkjdmShfNWWXHyL4yEXFc1iejqapycXHDFswe5dPSdfE4O
X-Gm-Gg: AeBDiet+F561WRut5g6IB2fErIwhK+gAn+rQo7sa3y28fFFCkEGhDAvuuurUTWkacyi
	AeaRD6VKoBdYTo2cswM+SKBD8LTn9Gmzu0MKcbLUdDkdhorC7esHpDg31WcM/Cswyy6n1IxJNCs
	2tiV21Ex3zAu7p8GGrYscpLi25MHhc65ZsEzYajswjDLBMepI2s2vOqw9q/GlWC7Yh5fmmmNtiS
	zyI5wlo89OBJyxMsBnWFOiZHQQif6ThK0vzJGl3CofWJoHALznk7SnbfSP3o09siUNxFc6SuhPL
	Q4pOxQqTNicIH3DsdaANR/BfdVfC+96ZWQIc4Zut379skBvSmoRoj+ZTpO9SFnKmBI76a9rQ+c9
	hP4vmMDKKk5PaAnlt3gbCKBT3vWPSIU9g+jJ2sC5k6ns7nNhLP8zZGfdh9cpIIYDi8LWbo4bJ08
	XeE64fTriAnRE3Qm2XSs/H
X-Received: by 2002:a05:6000:238a:b0:43d:7883:87ce with SMTP id ffacd0b85a97d-43d788389c8mr903275f8f.34.1776012598717;
        Sun, 12 Apr 2026 09:49:58 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac6:d6c7:2682::3d6:8f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63de2999sm24999175f8f.6.2026.04.12.09.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 09:49:58 -0700 (PDT)
From: Baker <mzndmzn@gmail.com>
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baker <mzndmzn@gmail.com>
Subject: [PATCH] staging: fbtft: fix coding style issue in fbtft-bus.c
Date: Sun, 12 Apr 2026 11:49:53 -0500
Message-ID: <20260412164953.1470-1-mzndmzn@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove trailing space and comma before closing parenthesis ')' in
define_fbtft_write_reg macro as reported by checkpatch.pl.

Signed-off-by: Baker <mzndmzn@gmail.com>
---
 drivers/staging/fbtft/fbtft-bus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 30e436ff19e4..409770891c54 100644
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
2.47.3

