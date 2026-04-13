Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7163DEAD2
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 14:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776090814; cv=none; b=TDpDwiySLsYapxT6SI/PGFS3eDRzkvsu0ygnUf8a872wc0TMOEkzHKbRl9apS66NyF+3XQe0RG2NBsVlDG76266JMf2tPJ8lHSSjpsifr8Jcjy80onk3GVHxmRaFOaI2STsUjiURPl1eKzztUF8jNw95O7Ezf15Hh4Bufqmc4Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776090814; c=relaxed/simple;
	bh=XoeKV1k65lPq+i0RZVFoRzGccRckmHKiU3P7AUtwugA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O2gqWqtnRPgnNOmGQU+ylGA+suanOdcxMTnwR5pgn0XMZQ292uRtHL8qHf5I50nocmW+yc1/Co32PwCO2hPL0471KlprkBaTPtz/W9aPsdlLCW8q9HSjfwO4jbUZJB/XInHGhsJlkW+SfU1rJLnHuVSB0i8eYZQcxD+VPHCOs+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=crimson.net.eu.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=crimson.net.eu.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so71861875e9.2
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 07:33:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776090812; x=1776695612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pw6Skg/ynt9f8nojntO5SeXxLyCS+pV0ZNPg5Uwg8QE=;
        b=JvM2xtbw57jFrgVGpkXQKmfokBtMtW+s7OFWzujHgXidH2OO+SM0taXvCTZlbxJNzR
         Ext/NWvJNmQPcq1+fRoA24e89lrSwhPZ7ZrbZfyr13PIekVeaUrF2gMwl9IcsyioP0mo
         TB195sK9dxssxkfo7octMgV24LdZcuMaus6BX4O5VvxGwnzotASby+ztMH8eVQlbGAPW
         bzJ4aQGNnMmxBYN5CvXbPPmhR3EewVrdaez8RSCsJwnST5gKNiy5cdlvocCdIWaVhOfz
         JFJUJoCwyeNK/oymb4A8cR4FbKszPiesvXXcUKWcZXHfSjHQEvzQsUH+1YaPZNXqEaol
         03VQ==
X-Gm-Message-State: AOJu0Yzywcmh5HH82W8iLgLouX8SSGA/wjZWS7357Wk5eVjRVFxFXhCv
	ica4qf7C57GFXf+LMS2811l+Tno9sx38UCJApWNpHoENQ9zOQbBo5XIc
X-Gm-Gg: AeBDieuxECjajXtZjM9BUQz4JaTz8sRz5nwzlQbaISgw2LVySTKIKbhyd+cO5C52Bth
	V42wwljEEhcmaMul44sSYAjJJ2cBL0cH3ACDvHA0abMj+8lp1a/fV3wqE6MhiSjVlqkMRz6kZB/
	tS+VGLBDfUPfaaOFrcp1Oes7oWKeNjivPgHJgqNE3lL4UKnvGS1xo4Gy/EZqlYelA7YdWY49tuT
	pnXeRBSGz3uIkJtI0Rkf9z/gRsH1YBjWOdVHPa+uT0mlJ9S+O5FfOlrho0tnpm/bIhNKFYZSw7s
	HGP68V+XwCh8YwfMM+SzL8R/IdwgBj0mBc+6RuZGCOz+pCQ04KVoCwX4NCG3+Ul2BEC5wNS0y2z
	TEk2pHFrx3jT726/INDmEqYN/8zEbpYqOH2QtMJDxnzxl33Qzykbvrk2n0T2X9gtoyNyVZIBEcv
	bskJvSLreqLtShbQjglktz8pVQeFiaOjUAiPGOzijmBESwD5M3cGj6n0/jowm+XawN0bIsx3QCG
	i60b4qN
X-Received: by 2002:a05:600c:a109:b0:488:b187:3c with SMTP id 5b1f17b1804b1-488d68431ebmr136076525e9.14.1776090811466;
        Mon, 13 Apr 2026 07:33:31 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac1:3920:50::27:ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5347ea5sm340840695e9.8.2026.04.13.07.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 07:33:31 -0700 (PDT)
From: deep@crimson.net.eu.org
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kenet Jovan Sokoli <deep@crimson.net.eu.org>
Subject: [PATCH] staging: rtl8723bs: convert int16_t to s16
Date: Mon, 13 Apr 2026 16:33:20 +0200
Message-ID: <20260413143320.1246385-1-deep@crimson.net.eu.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kenet Jovan Sokoli <deep@crimson.net.eu.org>

The TODO list for the rtl8723bs driver mentions the conversion of
unusual variable types to the preferred kernel style. Convert the
"power_limit" variable in include/wifi.h from int16_t to s16.

Signed-off-by: Kenet Jovan Sokoli <deep@crimson.net.eu.org>
---
 drivers/staging/rtl8723bs/include/wifi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/wifi.h b/drivers/staging/rtl8723bs/include/wifi.h
index 230b2c4ffd3b..8ab0cb6ba344 100644
--- a/drivers/staging/rtl8723bs/include/wifi.h
+++ b/drivers/staging/rtl8723bs/include/wifi.h
@@ -457,7 +457,7 @@ struct rtw_regulatory {
 	u32 tp_scale;
 	u16 current_rd;
 	u16 current_rd_ext;
-	int16_t power_limit;
+	s16 power_limit;
 	struct regd_pair_mapping *regpair;
 };
 
-- 
2.43.0

