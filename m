Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94148313E14
	for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 10:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772100280; cv=none; b=BbhumD+bcoyR4h1DInjADfXaRqo0PajhJwr/0jfZVTdwKJfLg0yHMAy6MDjquKTUg0XZY+M8Uk2CdJ7R/qhZ5C8Eb9dOxqncMtZrFJg+dmH2hWhjmgs1vijzS/XMYgDJZ1dPP3l/OyAXZfGkmPH+NVtq33WO+lF/taWDffbMUaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772100280; c=relaxed/simple;
	bh=02yvhOFZnmevnxytNnwhd7fyeEsQNidQZ7+JVkqmRIk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VC4FOAALK71he93ORcA1V+GqKQgbUAFmwCVC12dWdeEpCzXIC9N0t6bTXnL1ImqJ2r5l4Wm+DsGkpyja9r8eKk0KKj4Y2U7r11bVHDSj919lrMoPvNKcJPfMtKLA7KrGe8MIGsFzrj7elvbMGafrinJM08FX3uVztlcKHtw0PCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G0N+hz+R; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G0N+hz+R"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439962ecfb5so34354f8f.2
        for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 02:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772100273; x=1772705073; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wUa9D/90131rmttFWHshy9mbl6aSXLXXq/gzUyx9aIo=;
        b=G0N+hz+RldE6dV1HsZYFaQ9M91QMyALLhEOzwqDPOfHVvVnN6dwlhWfGKwHUYaKYxX
         IeL/WjBf9mkm8AXcc+sJxJg5scD/bLC390iLxgRR3CQdwa+lrSPisM7B67cE/I7fxW6n
         sRkvQ2WmJAnSRiFMaJp8uCzk2vcaGhtOELBXcXDdimtr2X8fPYpocSBIZq9XIKuJOSxe
         cQzL7EmmtnZK4qvGY0YoKnM8facHrqXvU5+kgJKX5NUz3gNvPjDNNtfwCWNFAv3efMpj
         Q8b8Q53wis97Hs9SGgrSiRraWTUNwZ9hM4QsY0mKVSxcn72irMZp6DLq5tdUIOvyTVbs
         VeoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772100273; x=1772705073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wUa9D/90131rmttFWHshy9mbl6aSXLXXq/gzUyx9aIo=;
        b=LYnAgVrG5fjlsKEnJDW04rEoPKUShWobcRf665mzpWQfvSKvCTcAmCwnXOLzSXsthg
         vB/WsDA27Su+4XHns1i6TxZDvvFovOv+qXGpmzRFsIq1CKYdOqMkFNNj/8x9u5hGxDeA
         u8IjQQCOW+bFKMi9JSLnJRAk0egddWTwfExU8v1Q+fBViCbBrF3gdynnf0UK5+y1H2Q/
         xoyRcqI/TGDNPopLzDW0vIRYtnxudAhxqNDWXj+PBAp1BF1VaGJoHm/SfklnL6mhq3v6
         VS3z13HxbGkb/eQwUiVdZk1hDaZDEk5yhl6JDh50BYS8jrn/xvc4W/MZB36nOkREQA94
         RYaQ==
X-Gm-Message-State: AOJu0YwGMHlkkNFXOdXT8pqLY6NgRgMoJhnx1BoCd5NlEwcVKORo/xKh
	rp2rr4c8oA9ZJiJ9oqTtY0wu3rCa3Q2NN8pF/eV5EsmoZ5Tmg4ZMnjYduYLVk1pSvKU=
X-Gm-Gg: ATEYQzyu/UTiicvQ6k/SGflPRZtubHHgyEQ4CCWBGuDNaZQPoY1YsQyoAsVj/vnuNvt
	YshIQiXW7/kWPT2rLZR5CjA0EOWCKPYP5g8SMTjItTPol523Hsi8Pvje9D3xcpaWGMZ2PSqmgJV
	zjV6H9CgrdQGwD/jdrrHSdY+wJg/xIEUXBoPj22Y0UdxJFIiJ72RcUqD2Zll/uEt9O4EVxJioCn
	uW1CtE3PEZhWKypJzrm1W8HPLofFjci1yjtD7G1R2BQFweLVCvbYGPjwq7U9xhQZR2Rsxoof4TV
	Kc+ai6bUZL6SwDysuk5FCs4GJzeL8RN9AiQcnLHJhUs8bc/s6lwro3Zzw2brkD4kg0nIv1y+hGC
	Rqy8lRFBSodxYA9pQI2RicU1YR3vZme5NOdfnBxqLMKbnF7ZDkziELV0mkwKNRLiFpHMrWJtXyt
	NukPynGe+ufdXuBRSowLafEqHQxeFIYf22Jg6jdFAqQ0kvbHT7Abe5Um0DwcXQubdCOOiY0ZonO
	BWHHEOhXZonuGtzTphB289xsKjW3M42zMBLxgCRNF52YvUGBrDy
X-Received: by 2002:a05:6000:3109:b0:42b:2deb:829 with SMTP id ffacd0b85a97d-4396f194113mr18504697f8f.3.1772100272653;
        Thu, 26 Feb 2026 02:04:32 -0800 (PST)
Received: from fedora ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43994da2584sm7127026f8f.12.2026.02.26.02.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 02:04:32 -0800 (PST)
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: [PATCH 07/12] staging: rtl8723bs: remove unnecessary casts in rtw_sta_mgt.c
Date: Thu, 26 Feb 2026 14:02:51 +0400
Message-ID: <20260226100255.167059-9-giorgitchankvetadze1997@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary pointer casts in memset(), memcpy(), and memcmp()
calls. These functions accept void * arguments, so explicit casts
are not needed.

No functional change. Object code verified identical before and after.

Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
index bdd4b6d8fd2e..0301898a20f9 100644
--- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
+++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
@@ -9,7 +9,7 @@
 void _rtw_init_stainfo(struct sta_info *psta);
 void _rtw_init_stainfo(struct sta_info *psta)
 {
-	memset((u8 *)psta, 0, sizeof(struct sta_info));
+	memset(psta, 0, sizeof(struct sta_info));
 
 	spin_lock_init(&psta->lock);
 	INIT_LIST_HEAD(&psta->list);
-- 
2.52.0

