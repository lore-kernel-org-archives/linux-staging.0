Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C609586331
	for <linux-staging@lists.linux.dev>; Sun, 15 Feb 2026 21:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771191110; cv=none; b=LIw3YyChM3tItvEqDOpJyd7J8VOC8rI2cu8hGGyiCLA+Hbzd+94uafzfG5d37vJ2Jt8sfIs1kZ6Qgj9zuj+vXtqGU5w5yZOKCeRQQkVNr4JKF6LzU2EuINHOVIhBHd2uTmXGZ8SzxN8bJDyDToyJ4c7G0UxbFEaCZqVmEy7qz6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771191110; c=relaxed/simple;
	bh=gQy/b/1egfYrwgYZ0DBKSUt3Ls40PsNAWB70tfNtCoY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BENGaEpMarmzRoqOoZSFonews4i28viy8ZGfVGH+weGkclKyKPnLq34HtwEIizN129SqKYvSbR9dA4LADbOJW/lCd0Ycw34GAdL6Bk+bM7sS1sFZxiy3hO2BDWFBOx3/I1D9wycJwitU5krYrwX9RWQPNMQ7KcUnf03rNjg2KB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dq92rkG+; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dq92rkG+"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-483770e0b25so20044665e9.0
        for <linux-staging@lists.linux.dev>; Sun, 15 Feb 2026 13:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771191107; x=1771795907; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wtamjpb08URGw51gXUILK0bCRXlO9PLQJCpvmJ54odg=;
        b=Dq92rkG+PHoah4HYdj2hXxXJZukVeZTRIjCTl/tYVejnRJMblEF0L4gzu09A/3gNvk
         WGI7sMB7KcE8nIpONTWABDC62fHXtN4vsGHysKAeLuu4oc//5jOw3Mi1wkYcamVRJ8Bd
         ftTUiLVXkhYcA2fD5Av2xtFhxdLb+8fcIqgCUSBOAyybEMzuibhiBO1I6o9ZHQx4f6Xy
         JQ7amjl3DcfxlA+LPmClPwiaqKsaJeWQHffI+xxREfs20rd/EgOVHk77nsWLvBeGlJBq
         0K7T7S5Pa7R1koiScAzA86G46rBNGlzbXeh8yvxoS+Up8bLeIDFTJjPzALumMJFtO0KQ
         EBsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771191107; x=1771795907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wtamjpb08URGw51gXUILK0bCRXlO9PLQJCpvmJ54odg=;
        b=SBGX1KV04hQr+cPiFBQs5x/jl8xhVTfvfaBSX3NjjM3TE6CotarBAVdYXarGL7+Upb
         WiPrGzjll+ctMmdLEHO67LBdvzpti/HoIV9WSqYIsDGXbLtv+5T379xdsN8/MLezxwS3
         M5EBcmT+OAzeYtepeqpCAbOmtORVbTLKQ2CpBM9UbRjiH8m3eQ//NFWmmuGTgtnx7B5h
         SLabJQe4O2I/6MI4XBpWJwv3VSfSs4TEub8yPyqSbxrJXd7K63DN0kQsEH+FP9kGuQBH
         o6Dco8NXOmt4LlkFLRWdyf9S39tD49C7hLP6QmnxgWTPD9yhwBEyUb1r5Tq4SRYyBQ1Q
         CqRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAUW8fKqjt+zg2KTu+dRx0eXi6jImf4XeOLJ+FE6lsA3ebyxq/T8zJR7fMI/M7FMe61zUFf6ypznlCHH4E@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2dRHrnDfN4tx7CFz4xJB/Uv60kJoHYgGbBNG/XMqGvlHQHcoq
	nMf8ISViu4Uquo3UJXQbgRoh3i1G16BzEUo1XrB4sRDBiNzQPWdP9Ea/
X-Gm-Gg: AZuq6aIUhe2nJe+qxtRqQyF+OHPEggvMOZoLflgB+FWTi4FoohLcamLH5pxq7+njEOr
	03luZ7f1R9JPT1DtLi/V0oQRSvqQvZn74l2baTJ8L4+cjIAYBk1d1vl4Qx/NOWAT0nxXYT48Snd
	75LCeA9zHJx2skJgZUckGRY+0BSugbOevbwuJvcuBnY6CJoH5H86Mvb+X9Uq9IEgFmSKE2nzIZL
	VLQ0ke9exHgMQZJUyFPuBSUPdJOHdH+6VMaRA5J0wibMXRuhF84CGBxUU0rD+ce967QjKruedmc
	KARNtS/vG//oRLWYlvp4L8an/ykddT7sLja3SCITFAdu/XCTkml1ggalmuUE9b0lmsmUYgXyw1I
	xvJbvkKcpfz3Vb7sISaEYgDnynXirmDI6xhKOeJQsiKwkG/e4BuiQsz7MdMAu2TLUr4xYex4ZeU
	2q7zxcgGHpOTQIUMLJvv4z3vFszSJORazT3w==
X-Received: by 2002:a05:600c:3e14:b0:480:4a8f:2d5c with SMTP id 5b1f17b1804b1-483710904ecmr139760855e9.29.1771191106908;
        Sun, 15 Feb 2026 13:31:46 -0800 (PST)
Received: from eyup.ktu.edu.tr ([193.140.169.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5e11f5sm418778915e9.4.2026.02.15.13.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 13:31:46 -0800 (PST)
From: =?UTF-8?q?Ey=C3=BCp=20Kerem=20Ba=C5=9F?= <baseyupkerem@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ey=C3=BCp=20Kerem=20Ba=C5=9F?= <baseyupkerem@gmail.com>
Subject: [PATCH] staging: sm750fb: add missing const to g_fbmode array
Date: Mon, 16 Feb 2026 00:31:02 +0300
Message-ID: <20260215213102.111117-1-baseyupkerem@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Checkpatch reported a warning that the static const char * array should probably be static const char * const. This patch adds the missing const keyword to g_fbmode array, moving it to read-only memory.

Signed-off-by: Eyüp Kerem Baş <baseyupkerem@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index fecd7457e615..15b5de33b8d9 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -33,7 +33,7 @@
 static int g_hwcursor = 1;
 static int g_noaccel;
 static int g_nomtrr;
-static const char *g_fbmode[] = {NULL, NULL};
+static const char * const g_fbmode[] = {NULL, NULL};
 static const char *g_def_fbmode = "1024x768-32@60";
 static char *g_settings;
 static int g_dualview;
-- 
2.43.0

