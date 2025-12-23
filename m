Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F9E2D3221
	for <linux-staging@lists.linux.dev>; Tue, 23 Dec 2025 19:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766517115; cv=none; b=WnK4pwezNibTdT2ziyfQJdF7chyjSsCLwU0u8L1CUaMMIB6h/mlZLialQoiqPd1RNvl1nOIc+I8UD69qYoP2QAMKY0c6u/abuChwtPXYEuOf4vo4seH87iFOAzuf+wT8GK2SYx9LZH/mCowxT6wMnKJjFCdUlht54OBp5VnVGMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766517115; c=relaxed/simple;
	bh=xmCrjaqyaABNHnrmNxiMMpVEhoqh23q2bG1gMisEM3o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MCIbVt8vzTVDD96ZWZSMzh2ydDQOfy1I710Tsxcx8Q09TOBUY3ucMEUYGaOGpGzSycblrpQRw+8MwM6XwEYDdEgSz0ps49IyRKZ91iHw16/VhDfAxIjxFCwD6hb/onPB+t60vdc50NHOF7kTw+RolWeXLtVELgj0UT8kFG2z1HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FWcScHKf; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FWcScHKf"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a099233e8dso45173275ad.3
        for <linux-staging@lists.linux.dev>; Tue, 23 Dec 2025 11:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766517113; x=1767121913; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/gpB+cRHxjPZOPxdkNzpOyE/YKlTlYotkRf4EGRknIE=;
        b=FWcScHKfuoatstodcdqcJlhc6RyEbq1icZ7v3D9YhOdQWuDTouRcH6j+j+JnWE8Jae
         s9HH5LlVX18OFuSfb9rSm/tPC0EHECJ4eDONCpLgYMqm4YSNEtPuotwIx+jdCFKuHUT0
         gtTpvKsrBYO2ox1KlPBlBC7ynWO5J+NRy+VnCQtbQnAppGItFgQWLD2UjxsGeMMjemjs
         iLtwQLD41EK+o21bSz4ubzBYgDkJS0yvkeicT2NA7Ckt8O9nvZyFYT9BgXqqcXCriV4Q
         59d5w9CR3FkAo6tVVXMO31kU8NADUGSYjjpK9iCCwIRTi8LdI5poSAoY2G+77IdNl/xq
         g9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766517113; x=1767121913;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/gpB+cRHxjPZOPxdkNzpOyE/YKlTlYotkRf4EGRknIE=;
        b=sAFJHhzsT9kIdVBDfvulpGe660UScGp1t+2rBYnbGxFBBYoDX5ZJT2daKezDeqprF+
         mS0e8iW6BONWi8OUdtHD5B4QE/V0MISfwPuKiip/I3QsMmAByf/5bfg8J7o/BkTKccdL
         2qEjo8JCKcX1Bi1Gc31+Nv9mBJ+KBzpC7rS0FfFRFRmuqLoP7cnt0O4zCRsgcCuVR82w
         iPBpAK7S7s0wBjU53SLbxjQQcoqzbeh0hcpsQcu+qsbSZZJmbY+fq7Vmg6eddVn83qel
         co9ptWb55FofTNCTx6mctvEHRoZT6ED12dfh2CFrw31/IqtIA5RMSybkpyOw9b9HbTGW
         GdEw==
X-Gm-Message-State: AOJu0Yx+EpGyXGHH9tCon7CCe2ATByuydPy8lZEmMvrEi4Ria8TXGPoK
	MEINjvKT2PgqpmgmaVSe81PMOwFX/ptOM943hoQIKdw9HlFGSBS2y70XLOM3HA==
X-Gm-Gg: AY/fxX64jRS1rKaFZcgZaYrU/cNiIohOyXQZXYPhhzpSylnZKAKbcfyj+xoV2XqpvJE
	LJsffInmTV9gydT0+54f9/HGHUzyUsEzb06S9Hu90DmdfZKBNl/9xwEfYP4DSeqO3tdxpe4L3bw
	7OZtO5mGYLQA93yqiov0CB0rBiBewRwBhWmA3whZGDEvNf8YVPpd3BbEuoSyXoR8fGRu/mk3gV9
	DDzw5TioGhr+CJVzRmtU0P9dwkVatQZM/LG3UXNdtx4NEJm1hehQ2NT5HsnR5rSwpecc9/j9c+q
	6XWw5lIMJ263X3sjzZkmfGHrYIsu30Q1k7pq62b6ntZCMX33MwuhTnuhUKDA5mDLsND0U8CnycR
	JeibOuX/EuYVVKU2lK90txromJshLLxcbUb++1TDuyMdiFeOrvohH19a3wOSAfEcs051v8gv1Pj
	Z6Z4Wbe3xyqtjcOCShLpjo295BBajsM3Glpgnpc0OCVmdjvb1j5gFSWhw=
X-Google-Smtp-Source: AGHT+IGiYJNYY6pGna2vDisp5PVEaup6D7AXa/kJEizKbmM+NJsAinOKqe71+1YtwveQ5KvI2qGGtQ==
X-Received: by 2002:a17:903:2347:b0:295:6e0:7b0d with SMTP id d9443c01a7336-2a2f2a3fca5mr126882655ad.56.1766517113483;
        Tue, 23 Dec 2025 11:11:53 -0800 (PST)
Received: from localhost.localdomain ([2409:40c2:1052:c28c:d56c:4c53:fd22:65f7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c8a8e3sm132680325ad.41.2025.12.23.11.11.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 23 Dec 2025 11:11:53 -0800 (PST)
From: Tejas Chaudhari <tejaschaudhari038@gmail.com>
To: linux-staging@lists.linux.dev
Cc: linux-fbdev@vger.kernel.org,
	sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org,
	Tejas Chaudhari <tejaschaudhari038@gmail.com>
Subject: [PATCH] staging: sm750fb: make g_fbmode array fully const
Date: Wed, 24 Dec 2025 00:41:41 +0530
Message-Id: <20251223191141.14206-1-tejaschaudhari038@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a checkpatch warning by marking the g_fbmode array itself
as const, since its contents are not modified.

No functional changes.

Signed-off-by: Tejas Chaudhari <tejaschaudhari038@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index fecd7457e..15b5de33b 100644
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
2.39.5 (Apple Git-154)

