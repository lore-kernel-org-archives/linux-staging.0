Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E3B38DE5
	for <linux-staging@lists.linux.dev>; Thu, 29 Feb 2024 02:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709174621; cv=none; b=aW9jF0Um50Me3oOrIJYJyAb90kdG6hd5VaYC9F8AkrEG/sVS1qxvu7zSaM0QdjEbrv/I+GKHNQuIo7tkPG+G8GVZAuNL2kZsrR8Xb1vpT7zwXq5xI9Ol0xFu+P5zYcJhpgE0sA+ZtbYqXYFujVSdyFahT57stilGy3wIzUDHJ+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709174621; c=relaxed/simple;
	bh=Aphcsg+jCGb/G6Iku1F7m8eyfHQ8NCqN6UuzzT5jlXQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RwXpc4HyV6OY81krWgHqYAQsy6UicaE7lg+MtdE1lcq63uwKnf87pGynXJ9lqRSnQpCRvRVdm41No+doLXBJtg340y1RGk94nMAAJvGuhOuonO/7OoWwON/XjGD/xLk+gJDDSi9lQhgQnyUezM9trkSBMnwKP4CsyB4SHLXL4V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=igEL4wbd; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="igEL4wbd"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-608841dfcafso4664587b3.2
        for <linux-staging@lists.linux.dev>; Wed, 28 Feb 2024 18:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1709174619; x=1709779419; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6Dy5NYh5SGhramiBXVD6CBtpLYzXUVrIG3KwaM2w2o=;
        b=igEL4wbd7ud4Ny52DJtgroMnbl4AXiTLGkXoBsqDuOKoC3dqzWMHSk9aSGjWHhlW+f
         NTqhVpc/vkTNXT0fJcvEhknH5t5mHMitpWk35M7z5b0T/qPRQbnP068qJVkRVAXESpGP
         lCRJtxMzsCRutycI2zaU7oGhMw9UkMbDq5VB44pk5Zw6kiAQy7ZmAjrllliRtQUc+wB9
         NwnVMutcJbU7VrA25LSnRfER4NMUpgYqJdWPO1984fW0d1Lr2IaF0Xt6/tVsN86VrIat
         dqJ0WMaI2N/bYjVmweJpbgQOgYXWZpXsx0hPmaNTsf54+CVOTD+nNUNRNN6WDBNvD6UO
         0Fcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709174619; x=1709779419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E6Dy5NYh5SGhramiBXVD6CBtpLYzXUVrIG3KwaM2w2o=;
        b=LW3I5gt3hXWlPFiXmr6DKQ0PjlYRuXpYgMJYQs4v41/HTXsnKPmQeX9v8wMAlx24jw
         qygdA/+z1N40zgMxd7ZpeS87GUfMzwht4y7RzyY1WS1+n18pdxrd5DZMKsQuC+b9uDzp
         ECzmYQ4XzoGLwsjOVB37HZJ5nctN1wd/t8b3F/ZBrLVPaykjdBjZU4HwAoQG6YoqWEj5
         JNCWI0gqbao5fMY2WALseKU+3J93y0L6cgBZKGLXyjPjborStRi/Tz79GaP6HQ2NDZwF
         IfFSs+MKRgwwWNykYvzBOG8fr6JPtb5brEdqKtaE28QxuhYivKJ4VpurtbfHBm3681JE
         mDOw==
X-Gm-Message-State: AOJu0YwSqUhLNSUfrw1n7VqycocSpPM6GwNdvuPBX7D9n1ADSOSnD/Qe
	IHa93XLcw7TvPs4DUM/hQVqFse/nMAmZR03kS3r7lmPbq+DGrW7PAOs7RYoXCKs=
X-Google-Smtp-Source: AGHT+IFtGs97y0VMDfO2OhQB/ry3UAI4ptI/hO7uxjdRojwZWz8iiYnHMR7bQDffv5SgR7y3tY/Leg==
X-Received: by 2002:a0d:dd16:0:b0:608:91d2:e927 with SMTP id g22-20020a0ddd16000000b0060891d2e927mr999220ywe.30.1709174619073;
        Wed, 28 Feb 2024 18:43:39 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id u23-20020aa78497000000b006e5092fb3efsm141504pfn.159.2024.02.28.18.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 18:43:38 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 7/8] Staging: rtl8192e: Rename function rtllib_FlushRxTsPendingPkts()
Date: Wed, 28 Feb 2024 18:43:24 -0800
Message-Id: <20240229024325.453374-8-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240229024325.453374-1-tdavies@darkphysics.net>
References: <20240229024325.453374-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename function rtllib_FlushRxTsPendingPkts to
rtllib_flush_rx_ts_pending_pkts to fix checkpatch warning Avoid
CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: Fix commit message 75 char limit, and alignment warning
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h         | 4 ++--
 drivers/staging/rtl8192e/rtllib_rx.c      | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index 0581ed1e9ed1..04f3fb54d1b7 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -268,7 +268,7 @@ int rtllib_rx_add_ba_req(struct rtllib_device *ieee, struct sk_buff *skb)
 		goto on_add_ba_req_fail;
 	}
 
-	rtllib_FlushRxTsPendingPkts(ieee, ts);
+	rtllib_flush_rx_ts_pending_pkts(ieee, ts);
 
 	deactivate_ba_entry(ieee, ba);
 	ba->dialog_token = *dialog_token;
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index bbea287df535..9d9420f7a371 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1811,8 +1811,8 @@ bool rtllib_mgnt_disconnect(struct rtllib_device *rtllib, u8 rsn);
 /* For the function is more related to hardware setting, it's better to use the
  * ieee handler to refer to it.
  */
-void rtllib_FlushRxTsPendingPkts(struct rtllib_device *ieee,
-				 struct rx_ts_record *ts);
+void rtllib_flush_rx_ts_pending_pkts(struct rtllib_device *ieee,
+				     struct rx_ts_record *ts);
 int rtllib_parse_info_param(struct rtllib_device *ieee,
 			    struct rtllib_info_element *info_element,
 			    u16 length,
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 051371e0138c..06992450ef42 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -487,8 +487,8 @@ void rtllib_indicate_packets(struct rtllib_device *ieee,
 	}
 }
 
-void rtllib_FlushRxTsPendingPkts(struct rtllib_device *ieee,
-				 struct rx_ts_record *ts)
+void rtllib_flush_rx_ts_pending_pkts(struct rtllib_device *ieee,
+				     struct rx_ts_record *ts)
 {
 	struct rx_reorder_entry *pRxReorderEntry;
 	u8 RfdCnt = 0;
-- 
2.39.2

