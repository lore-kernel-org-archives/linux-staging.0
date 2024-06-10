Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7425954673
	for <linux-staging@lists.linux.dev>; Mon, 10 Jun 2024 05:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717998550; cv=none; b=taEMh8UuYyMvdE3KpqQfOOknjY2Rpap5nmgoS1zKtrlNJuOl1Zp0Xa+yTesvyPrMxShZdsjyF+MDR/6G/bb4y2ziD6N9VFnb4kHKMpWbMy5QrXEZM9HqIwKnb69d+Yg1yWIGXJ3f8jEFHmIDq8zturyX7cplGzDnq2pnZcnUbHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717998550; c=relaxed/simple;
	bh=DAYO1UkoTEwRYzPKZeP2B6xOig5Qbj9NtQUJIxmkDFQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qDJgkUcUBcy+gyKwLOBpKYJeLlP8aAKFv1ldWUqVbRRKiAGwJerTM0XzA1RPCMi9ayopSW1cId51Psp5EM74j04E3u0zp4ipbASbP2DRlDUbgjx86ouaGkTmXLJIeULTsKGu8DKqsNNSvz4Nn1jpT0DnLkqLh3Spu1zy06fevwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=JBGm3T6b; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="JBGm3T6b"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-6818e31e5baso3392128a12.1
        for <linux-staging@lists.linux.dev>; Sun, 09 Jun 2024 22:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1717998548; x=1718603348; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w5EeJFmlN6fZbFYCrboW8TSJ/n4ASdI3Z95ifsP8Epc=;
        b=JBGm3T6bkg8EGqtBWWG1BjyTEKpmdLL/DMQYMCX2MEiNHUJ1sUGa45c9sGHDGOM87c
         1UCXp03xmOmO8LkfDtRROVjNTs3ptKC9jWRAfgjMo69rL/TAO5VfZTfcygeto6AxeYqn
         Ry+m9espFmMzgr5ZpQ/NTzROYLJj7+O0QLc2tBr6HSYQN24qsZKsY9aHUYc58ptnwRyb
         Wz4kovtnahsqRW8ahJyehYcteNcEZxV9KG29GtwWS5/Mv1KpIypGyYRk53Zc86ApzYro
         j7okJV1OA1IZ+fcXNM6/Pv1mA3r+R1b2J//DTTUzsgLSAnV/uzRyT2YlbhA2sLkMWRMz
         As3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717998548; x=1718603348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w5EeJFmlN6fZbFYCrboW8TSJ/n4ASdI3Z95ifsP8Epc=;
        b=ZLehYwnKAzGr2L2mvPMjncYz2+A8q/VXkM0TTU/zejcHtDmm9Kyw0Q6CKWLBf50T41
         jSKnDtxnQrxcO2YIH9LSMgwIcMfndgCLLoFHXV9kbhLPVjcM26Pt2pmem8GN5B2i2iWI
         EXQp0avKooPYbEHBXA9vuRMObvFIfNaiaFCpd7is9JmPp0HjcrSFtj/6YbLSHN/24Fgf
         q1gd2UwOgQBF0N//K0wnWD4EXJldk7NqjlJZk7Pm79AO5mSLxsk0eVmyMGVIrB82MkkR
         pm9BLOIslvEZ0qImmYknaqMH24dq0A0bdv3aJJDS/cG9iHob+D1t2zCpgir9KCBLftsQ
         nBzQ==
X-Gm-Message-State: AOJu0YzJQR+iUnW2out0Lmosr5wQa+WXwlGKjEBP9M9EgiTCoceLFhGo
	7qsdEiGUTmLuCv1aO+htva98Z/krhOjaNjzErRILZxXWRXmJwCcFgqu41gCofHM=
X-Google-Smtp-Source: AGHT+IEDdY0qdi2qtgDOmmQ+9TcA0sx7tqqRpsWnHXQHxWfoNbdXcIi1a47EyGFvp2zlA8CL2juLUw==
X-Received: by 2002:a17:902:d504:b0:1f7:1931:6123 with SMTP id d9443c01a7336-1f719316628mr13099925ad.38.1717998547875;
        Sun, 09 Jun 2024 22:49:07 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6f1aced64sm35653725ad.9.2024.06.09.22.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 22:49:07 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 14/24] Staging: rtl8192e: Rename function TsStartAddBaProcess()
Date: Sun,  9 Jun 2024 22:44:39 -0700
Message-Id: <20240610054449.71316-15-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240610054449.71316-1-tdavies@darkphysics.net>
References: <20240610054449.71316-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable TsStartAddBaProcess to
rtllib_ts_start_add_ba_process to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h         | 2 +-
 drivers/staging/rtl8192e/rtllib_tx.c      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index 7cdeca7ed8c2..ed6a488bc7ac 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -431,7 +431,7 @@ void remove_all_ts(struct rtllib_device *ieee)
 	}
 }
 
-void TsStartAddBaProcess(struct rtllib_device *ieee, struct tx_ts_record *pTxTS)
+void rtllib_ts_start_add_ba_process(struct rtllib_device *ieee, struct tx_ts_record *pTxTS)
 {
 	if (pTxTS->add_ba_req_in_progress == false) {
 		pTxTS->add_ba_req_in_progress = true;
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 33bb1cbb525a..0029e4ab4394 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1770,7 +1770,7 @@ void rtllib_reset_ba_entry(struct ba_record *ba);
 bool rtllib_get_ts(struct rtllib_device *ieee, struct ts_common_info **ppTS, u8 *addr,
 	   u8 TID, enum tr_select tx_rx_select, bool bAddNewTs);
 void rtllib_ts_init(struct rtllib_device *ieee);
-void TsStartAddBaProcess(struct rtllib_device *ieee,
+void rtllib_ts_start_add_ba_process(struct rtllib_device *ieee,
 			 struct tx_ts_record *pTxTS);
 void remove_peer_ts(struct rtllib_device *ieee, u8 *addr);
 void remove_all_ts(struct rtllib_device *ieee);
diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index 56510365f1a9..369fd26180fa 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -301,7 +301,7 @@ static void rtllib_tx_query_agg_cap(struct rtllib_device *ieee,
 			} else if (tcb_desc->bdhcp == 1) {
 				;
 			} else if (!ts->disable_add_ba) {
-				TsStartAddBaProcess(ieee, ts);
+				rtllib_ts_start_add_ba_process(ieee, ts);
 			}
 			return;
 		} else if (!ts->using_ba) {
-- 
2.30.2

