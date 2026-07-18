Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94BB2EFDA6
	for <linux-staging@lists.linux.dev>; Sat, 18 Jul 2026 04:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784348090; cv=none; b=So079+GJFGnbDklBJwwriaqoHX74hHVrikcPiSe+439CLxBLDl897mZ/Qbikpy5e/y8MIs2UQRrs6viwbfKstt5RLETwG2kFKC/rqy+Cakk8d5qPE1utuuRk9Cad7P+6gvG40wrlj27rm07pClKfhplWzs4pAqgA1704I82+dmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784348090; c=relaxed/simple;
	bh=P/yds99ncv+vGWBd2g2IxnrtyK7nOxe1gwwzzsDBwT8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L/k7Rlt0T1KRvp5mcHKZ58powZ5mhvsvTnhedbA357SQQjUIVJ3Q+pMdLhAxHuFkCiVxGwiZXjMi22mSNjRxxsM++t3ILVEh2hfg1hhPAAu9e/pYlEq0G3zno3rRhRQNly++KD8RPAfkYBp6n+tyaX7afofd2ig7xnrwePEDbGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lfAB8GrD; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lfAB8GrD"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b018fe8318so4249887e87.3
        for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 21:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784348083; x=1784952883; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rry3Q3934vkuW0N7Cxkw49koc8f1vUUZW4sXDQlFnhA=;
        b=lfAB8GrDlxhslxzHzsoTNb3yaQ/Jukkta+gtUObtFzfWvz2qKtc5/wTMuzsrtAhwZk
         BaO4R0XXUr1xj7k38QaHNvEr+/vyqB8H0hG22il1IksdrKVbL8x+S/Bf1XD6xhFI42Cr
         W88IU5xxwFSM+su4ZF8nkygpcXhiTpKDrrA5KDHh3Px+oO/ELOE14vg5AioL91XEWVJP
         JRGEdECEU4CyQkdNMYjPnB9rTgPl5wdk/9YewntbE/gt2y+8vEwarj+fqFS2x4bVJWJi
         Tthc4vpGQnnt/1viIdXNUz/cYHFxDJr1PNCSmcqtnawRmQ9ybBfJvBJqf5nn3fxlPv0L
         86ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784348083; x=1784952883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rry3Q3934vkuW0N7Cxkw49koc8f1vUUZW4sXDQlFnhA=;
        b=JEW/GyzeRF/++BQXw+ITAXL4oV9YSWrIW1dP/8NejeM0YVq5YG6Ck/b6AZIh+ai3z6
         cnVFJVLbRBp+GL7kdlhvo38zxXLgtrMBT734NVQXd4EBo429ECb3hr38+yE4dd6xZKeP
         20stKym+JNbS1jddZzPwljAXZCjm+pgwntl0q1yhgSnivk1BJL19zIHboCADiB1ZcU2L
         Nk5H/w0XsTEZ2V2HhD1SI2J32VMvSrUDhwE2UxzOtooryEBFj4KJmV1xfBAu1IMsnj8A
         +OniBK4EXNvr6wwoJyuhH3KLRajnbvd+Lx7H30SS6c6ToR+IPmZQm31cY285OzEn2LU/
         3c+Q==
X-Gm-Message-State: AOJu0Yx+6OUut7D2ldARLSVTtNNGLFW9SzUQOx2BqOHTXIIkPubPXcsr
	DtvOF3KflimY60B1dtODwD3fR1CWU828VlywL5qsM/h7gcBrChVpygkzO0pTZ+MzdYP0xw==
X-Gm-Gg: AfdE7cm5l8T8WEWOQIcztuFU7kWO25U3RuqM/MGgWd6Pct8+L0iga8gJcq91J0ZKO0z
	xMqfu+xgLzwub3bZTunJVFNyUmvRXTk2l+u6KaXN8bD409qk6Fg7Q9tYu6HKwQHk1vaVRuHJmp8
	3BmuchYRaezy2IUyoCfewdS0re4gRHtgp/mEKuys5t8j9CvNt1L8TWoLpoP5f1c2mjPK0YcY416
	AGzppwC3egsicvkwmM1AfbBc9X5vHM7wAdkIA0+sUxEawFwMaWkCXMnXZ9WS5naL3PD/V0qzLHs
	lrXpKgiM1TvrswFjK07YbvH0/11+JKPg+5DCCHcp+NBV7EcWx0hdFY/dHV2f0mW0hx3cPAwQsLc
	LjYUmb9GO9/mNw0JlVbDBB6aG4QtDwoUZrr3FrQBhIk/waaeL5YwuA6gVypWiQMTO5D5w60X1Tb
	we0x1cUzSs21+sWWfkHpqXBgTiH/J+qvBi1CNnnNZUtRsne20HPTK3dQIjsgah36rMXX3E3ZnLQ
	Q==
X-Received: by 2002:a05:6512:3128:b0:5ae:c56c:7f75 with SMTP id 2adb3069b0e04-5b28f8930damr768377e87.25.1784348082428;
        Fri, 17 Jul 2026 21:14:42 -0700 (PDT)
Received: from archlinux ([94.180.76.19])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291e298casm740314e87.83.2026.07.17.21.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 21:14:41 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH v5] staging: rtl8723bs: remove redundant ReadChipVersion8723B wrapper
Date: Sat, 18 Jul 2026 11:14:31 +0700
Message-ID: <20260718041431.9174-1-ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Collapse the static CamelCase helper function ReadChipVersion8723B()
directly into the main rtl8723b_read_chip_version() function.
This removes unnecessary code nesting and cleans up the CamelCase
naming violation in a single atomic change.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
Changes in v5:
  - Edit patch as text, because b4 drop my diffs (no code changes). 

Changes in v4:
  - Format patch via b4 as suggested by Greg (no code changes). 


Changes in v3:
  - Merged the previous 2-patch series into a single patch as suggested
    by Nikolay. Completely removed the redundant helper instead of
    renaming it with '__' prefixes.

Changes in v2:
  - Resent the series due to submission issues with v1 (no code changes).

 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 1b8ae3d57..53f6cd708 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -820,7 +820,7 @@ void Hal_ReadEFuse(
 		hal_ReadEFuse_BT(padapter, _offset, _size_byte, pbuf);
 }
 
-static void ReadChipVersion8723B(struct adapter *padapter)
+void rtl8723b_read_chip_version(struct adapter *padapter)
 {
 	u32 value32;
 	struct hal_com_data *pHalData;
@@ -843,11 +843,6 @@ static void ReadChipVersion8723B(struct adapter *padapter)
 	pHalData->PolarityCtl = ((value32 & WL_HWPDN_SL) ? RT_POLARITY_HIGH_ACT : RT_POLARITY_LOW_ACT);
 }
 
-void rtl8723b_read_chip_version(struct adapter *padapter)
-{
-	ReadChipVersion8723B(padapter);
-}
-
 void rtl8723b_InitBeaconParameters(struct adapter *padapter)
 {
 	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
-- 
2.55.0

