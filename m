Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A054639BFF6
	for <linux-staging@lists.linux.dev>; Thu, 12 Mar 2026 11:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773314296; cv=none; b=O5SLfrMTO43ew4mi9sOATdx2qJaZIZUmOzs+wQ5GcYSIVrpINDm3afyyaA+dCzyvb6KQW1zIbZ11NL8nSM3Bjl3c4dhOy3fVPeMz/ZWxIudn4T4pSuVGShejqLSWEKUJ6I9AzMIiyJACq290VCCXyZagBf6q0wbEbNkoula9AW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773314296; c=relaxed/simple;
	bh=74+I7mn4n1ShOD/BMucw49pL2aSRjVV0BFDABLPXVNk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UNlieIPOKtscgST2GVaot8k9BCjkvpz1FqwnFeIStyUvaiRak9MFm5SXE/qbQUDP+hHKR2f+HetkCZJ3lYWB3A7odyljEcsTBDLpKP56dRgsQHM1bmY1haIYAMUFSRdKbdTXnB+SeJHvHVuJTZ5aDwbXWhSkimPkTp5p/iuvKWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YKuUfjSu; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YKuUfjSu"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-829afe24fb5so735613b3a.0
        for <linux-staging@lists.linux.dev>; Thu, 12 Mar 2026 04:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773314295; x=1773919095; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DnsElwt7VMv7UmravAhlKpCXV3D4/2WKIsiHSbwHPIg=;
        b=YKuUfjSue0MIk0NgcPc+e/1rKAYn+cFm/Ddf41avV5UlGCIk+HMGgYJrZyt7LdV8GT
         InQCFT5heUViRr9i/bHKQ0jhzgIv1cvjBixoSHpQNIXrpt3b4tF4H+33mSRLrNrlr2D4
         5g1rhwl3YKJhELCaTI+5LP2pJd8IaNdSJYl8jroh+YatMfZ+rp4tzMQZEBckqt7xbVIn
         +UeVts2Q4nGIlpO53jqlso1DiXE3kfgAXIQewrCQ4RUhm+0i+8V//bF7pbyJdSaf3Pn5
         eWUhLqqyOyBniMhJUQQhR4atuP051X0xUE+zIBFikZOC7xUl/kQQsi61SreqvQPAZze8
         h0tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773314295; x=1773919095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DnsElwt7VMv7UmravAhlKpCXV3D4/2WKIsiHSbwHPIg=;
        b=T5MYN2BwnqOQQEgrLaEx3jR4dWV3NGBHgk/XIfKld60Sj0CYF6lZ1qCm3lDzPsRZkW
         3EUgCwj2OifOcdklBPF0OVcK6b0cKr11jdUsnF+iUjtJwJdU1kCrv90QeQcR71OVHwiC
         F7HFFsaiN0oXVdSKsIFg4t5QbEcOrmH+2lXdZcNQ3G4Ja/Gih4A+24eU5q/OE4EdGSt4
         6g4W8HfWS8jG33h+D99MyYTPsUIqmhAhFLEzJ/5oYwwM+DBWo0dOWz+AqVVIJ25RDTt+
         4TJC37zPI0373/jKgFuIy1vhiZpEZ4jZnHTF7ANW4H2UEzpKaj3PI4BZAmTTpLKfo5b/
         IQ/A==
X-Forwarded-Encrypted: i=1; AJvYcCXkuCrvdJLGkavaFlt55bp7+ONzAN9WYv2h45e/KCT59PQNBgtCYepfeC4yVEfpNw3mNaXzs99JIBN5Lp3h@lists.linux.dev
X-Gm-Message-State: AOJu0YyM22W4jueTFQxPP4Kyq59OB0QXZfbHoYhIOE9CqYel02gDbQH5
	h5ThFt42pRKKJoFQAzOOQS5/dFYTcepwrObOETkLlm+2Gvap8QRZO0SQ
X-Gm-Gg: ATEYQzwmS/N5J+HSMlFJQln83PU+PMdakrtmdQy4SNdMLlWMM3qFE/5hXgzOqEFchRg
	esoNvRDeJQTaCw9MmKztiT3/31SkxKrMCE9r205VKqdLL3vK9tA5o9KHbLtZtCWOO+ez/3QYgB6
	wniobJxhAvSuGBR/JJEx0k+DDj/65YHFCkpQJymj5vf1RDyeecmBNd5lYHpMrFHQxhVy2O9ViK7
	rjoj+B/E2Xr4HrJznpiYSVZpE58OSbySYU8oHc+NT5yEPEi+FMxTGR5vKXAtZEEBIdRfgJ83ELL
	zd9+r/EHNHAl3zgsGEk83KcHGeR9kkpAkJDYRZZlI6/GbR1FY08TfvGBQbyzl6pgKsR7IzEGFGG
	A1TlsV4hWBT7PBSSven8c+eowh/Izc1Upnr6HanY1o5El8tQ42+NARizq9ahFpvInOIh4h3MEwa
	Rw0kWB5FAO81aymDFv+jT5okIKKErn0OpTFD/KCpZjnL9UxQpng57p6rIbmijHxW4IRhBm+lns5
	vEGbqgGO5U+SA==
X-Received: by 2002:a05:6a00:4298:b0:824:4a22:ec16 with SMTP id d2e1a72fcca58-829f708a071mr5592057b3a.34.1773314295052;
        Thu, 12 Mar 2026 04:18:15 -0700 (PDT)
Received: from CN4GKQDX76.bytedance.net ([61.213.176.57])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a0736edd2sm2663989b3a.52.2026.03.12.04.18.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Mar 2026 04:18:14 -0700 (PDT)
From: Zile Xiong <xiongzile99@gmail.com>
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: deller@gmx.de,
	abdun.nihaal@gmail.com,
	dan.carpenter@linaro.org,
	chintanlike@gmail.com,
	niejianglei2021@163.com,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zile Xiong <xiongzile99@gmail.com>
Subject: [PATCH] staging: fbtft: avoid empty macro argument in define_fbtft_write_reg
Date: Thu, 12 Mar 2026 19:18:07 +0800
Message-ID: <20260312111807.96789-1-xiongzile99@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the empty modifier argument with a simple identity macro.
This fixes the error reported by scripts/checkpatch.pl while keeping
the original semantics unchanged.

The generated code is equivalent and builds successfully.

Signed-off-by: Zile Xiong <xiongzile99@gmail.com>
---
 drivers/staging/fbtft/fbtft-bus.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 30e436ff19e4..380dd374a566 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -61,10 +61,10 @@ out:									      \
 	va_end(args);                                                         \
 }                                                                             \
 EXPORT_SYMBOL(func);
-
-define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
+#define fbtft_identity(x) (x)
+define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, fbtft_identity)
 define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
-define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
+define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, fbtft_identity)
 
 void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
 {
-- 
2.20.1

