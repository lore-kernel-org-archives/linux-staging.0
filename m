Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB17B41B37D
	for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 09:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781601179; cv=none; b=OxrE+Dn0S1j4Iye4xK7wHspVBNEu9qDsjphMd4GZn8TtOfe2ybERL7juogFZQ1EH4gLcOuZdZtU5wEa+Sko9nrTZk9AmUj9CCLG1wkZsTmW64NiHLuQBMaWBpM6TEtsHY4bwWkmBz0qQwB+/mhuFunC7jlfaERrBFyVRiI6GYTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781601179; c=relaxed/simple;
	bh=uhbsH8mL9+WFqNTiDxoFCj8ylZnEhwXgTD0JGTHSXvA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h02c9lEFBa/+IVt+FUmHuRBWmwRuP54+7F1s59DAXU+cA/OyE//WInqw6uLPml0BBVXc5WyuhNIF/GE/6umrJXBPVUPKw9rG64oTeuY/TaAgUFX88lkFFuqrKzmyLGZXQBzH5DMJdRjU9iCVs48PYVjJcsBC1d/ZuQjV0tDx+KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oqwbK5rQ; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oqwbK5rQ"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c86214eead7so1803170a12.0
        for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 02:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781601178; x=1782205978; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q7t7XocSD1QNoHXuiPcPUy9o04LgSr4zZaoadg/cyoA=;
        b=oqwbK5rQiqQ/BAE751ItygK5xOr195kA5h1cCtDGW7IdoP6zieUIW0ZzrRqBJlNVO3
         iLijFWH0AyTXrQmBrUZMAyGctVfxVcMT7zKPTxhQTWELKF8hEMwThqrgqiKzEKL9L+Qn
         Jlj0rfO71BC0u4+jF6wdB0C8bEAvAcrrrryet+9+lfr6qd9RbK3EtLxcl8a0w99ffCdP
         XEfHkP3bSGeWpobJpy9TpCD3cIMG9rbqe2Oe8N57LgwV8Eh4FkEaj4EUiHYcf2ioKK93
         +tuychym4rqCI9PRRhUdbij3JPwj0JXzcKLpqTo1WHgFNwDRb7etdotrZUWeYq/Ccm27
         7zVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781601178; x=1782205978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q7t7XocSD1QNoHXuiPcPUy9o04LgSr4zZaoadg/cyoA=;
        b=agT3x2nDXGh+0nyWkhw58mOMIWKimyUK1LJtpPmOxGG1gGSAlI/jmZKA/GSFF5Llxg
         IazJGWRhiAqH6VWdjmIhdjRpeNeNmBQqpkF6BnEPXht8wzJafE3x7tGquo/ecDp3uPHL
         Mui1qIenfQSZAI+UItzArZ4C79h09H3UulgYIVK+m8elmOfC4MSHxK4L0r4tIK0ITEXD
         rNA3cjBi8IUMhZ30IxnyH1pvWwz/x3713g33pmCw6vDGN8Dx2jhSfjyuYWEyzXoSqYBO
         3iAz7LMyG9wAnwENolmEx41NJEtbrtiHRPQmsG757KLaINHnTWxpSdd3Z9tFsvL2Ur3g
         3tWA==
X-Gm-Message-State: AOJu0YwlWEYwyg4ojTihSUrqWnsfqUKgzN9ljahqVQL0xJmetH1k/6u0
	6m1gDCKO4vCF/8aKD98w0y1nB6AiQ+8RBIo1SaVkVW25jVY/ahri5Wh4Y7lqBH2dugg=
X-Gm-Gg: Acq92OF99jR0Wi5c9ddSUkCNwQ/9VrsRCYYvh4qNidFCVC14w54cg2ufdUcBRDV6lse
	IMsPgVHV9+QGk1hwkG56ZP9pNhEj6sxe0rBFVOQUEusgA7VgY661HrIddHMxTyIGnyIvcxzfue3
	GClIGNu+CM0s7jce9wl0c/gEnXEKFcAKhxnT1J8NGyYbOp9XeaPgMPsFZLA8GUamtXMOCzExmX8
	qdtsDGLet+z7nRWqfguanLbM0r6P9dC3c8kWzViVw8FdTijMcLaeETcS9Z4B3ZDJHVski1WKEi6
	c+tCnTXsmn/uGz62SS1nzj7hgI6imG3qUD0cnxh29NbioCtjvy5S9LQfHBEWEM5Lm23lJVsTsy9
	BG+drsTxl0HTh0/F7W/1p5NFzrNjtrFrr/ZQlqMUWnYv0diMgKVsuHAJcm7Gl70w90nEPh0QVjY
	DBSbbRZ/x4vI+1mf5dHq7z8J0=
X-Received: by 2002:a05:6a20:d492:b0:3b4:6f45:d8ed with SMTP id adf61e73a8af0-3b7e249580emr2748520637.21.1781601178150;
        Tue, 16 Jun 2026 02:12:58 -0700 (PDT)
Received: from fedora ([103.51.149.90])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8661b5ccafsm11189617a12.2.2026.06.16.02.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 02:12:57 -0700 (PDT)
From: Subhrojyoti Bala <subhrojyoti0609@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Subhrojyoti Bala <subhrojyoti0609@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Fix multi-line comment style in wlan_bssdef.h
Date: Tue, 16 Jun 2026 14:42:00 +0530
Message-ID: <20260616091200.29282-1-subhrojyoti0609@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix block comments that were not following the kernel's multi-line
comment style. Comments should use the following format:

/*
 * text
 */

No functional change.

Signed-off-by: Subhrojyoti Bala <subhrojyoti0609@gmail.com>
---
 drivers/staging/rtl8723bs/include/wlan_bssdef.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/wlan_bssdef.h b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
index 812a68394268..25ac996e73e3 100644
--- a/drivers/staging/rtl8723bs/include/wlan_bssdef.h
+++ b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
@@ -31,10 +31,9 @@ enum ndis_802_11_network_type {
 	Ndis802_11NetworkTypeMax    /*  not a real type, defined as an upper bound */
 };
 
-/*
-	FW will only save the channel number in DSConfig.
-	ODI Handler will convert the channel number to freq. number.
-*/
+/* FW will only save the channel number in DSConfig. */
+/* ODI Handler will convert the channel number to freq. number. */
+
 struct ndis_802_11_conf {
 	u32 length;             /*  Length of structure */
 	u32 beacon_period;       /*  units are Kusec */
@@ -138,7 +137,8 @@ struct wlan_phy_info {
 
 struct wlan_bcn_info {
 	/* these infor get from rtw_get_encrypt_info when
-	 * * translate scan to UI */
+	 * translate scan to UI
+	 */
 	u8 encryp_protocol;/* ENCRYP_PROTOCOL_E: OPEN/WEP/WPA/WPA2/WAPI */
 	int group_cipher; /* WPA/WPA2 group cipher */
 	int pairwise_cipher;/* WPA/WPA2/WEP pairwise cipher */
@@ -150,8 +150,8 @@ struct wlan_bcn_info {
 };
 
 /* temporally add #pragma pack for structure alignment issue of
-*   struct wlan_bssid_ex and get_wlan_bssid_ex_sz()
-*/
+ * struct wlan_bssid_ex and get_wlan_bssid_ex_sz()
+ */
 struct wlan_bssid_ex {
 	u32  length;
 	u8 mac_address[ETH_ALEN];
-- 
2.54.0

